package com.ssc.admin.controller.withdraw;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.custom.WithdrawForm;
import com.ssc.mapper.WithdrawMapper;

@Controller
public class WithdrawExportController extends AdminBaseController {
	@Autowired
	private WithdrawMapper withdrawMapper;
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/system/withdraw/exportCount", method = RequestMethod.POST)
	public CustomResponse exportCount(BigDecimal amountFrom, BigDecimal amountTo, Integer exportType, String fileType) throws Exception {
		int result = 0;
		try {
			if(StringUtils.isBlank(fileType)) fileType = "txt";
			File file = new File(this.getClass().getResource("/").getFile() + "excel/" + getExportTemplateFileName(exportType, fileType));
			if(!file.exists()) result = 2;
		} catch (Exception e) {
			result = 2;
		}

		if(result == 0) {
			List<Integer> levelList = getChoiceList(3, false);
			int totalSize = 0;
			List<Long> idList = (List<Long>) getSessionAttribute("admin_withdraw_id_list");
			if(levelList != null && levelList.size() > 0 && idList != null && idList.size() > 0) {
				totalSize = withdrawMapper.getMemberWithdraw(idList, 0, levelList, null,null, null, null, null, null, 1);
			}

			result = totalSize > 0 ? 0 : 1;
		}

		return createSuccessJsonResponse(result);
	}

	private String getExportTemplateFileName(int exportType, String fileType) {
		String template = "";
		if(exportType == 1) {// 民生银行
			template = "min_sheng." + fileType;
		} else if(exportType == 2) {// 招商银行
			template = "zhao_shang." + fileType;
		}

		return template;
	}

	// 导出
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/system/withdraw/export", method = RequestMethod.GET)
	public void export(HttpServletResponse response, BigDecimal amountFrom, BigDecimal amountTo, Integer exportType)
			throws Exception {
		OutputStream output = null;
		FileInputStream fios = null;
		HSSFWorkbook workbook = null;
		try {
			List<Integer> levelList = getChoiceList(3, false);
			List<WithdrawForm> resultList = withdrawMapper.getMemberWithdrawList(null, 0, levelList, null,null, null, null,
					1, amountFrom, amountTo, 1, 0, Integer.MAX_VALUE);

			File file = new File(this.getClass().getResource("/").getFile() + "excel/"
					+ getExportTemplateFileName(exportType, "xls"));
			fios = new FileInputStream(file);
			workbook = new HSSFWorkbook(fios);

			if (resultList != null && resultList.size() > 0) {
				HSSFSheet sheet = workbook.getSheetAt(0);
				HSSFRow row = null;
				HSSFCell cell = null;
				boolean isMinShengBank = false;
				int idx = exportType == 1 ? 2 : 1;
				for (WithdrawForm withdraw : resultList) {
					if (exportType == 1) {// 民生银行
						isMinShengBank = withdraw.getBankName().contains("民生");
						// 账号
						row = sheet.createRow(idx);
						cell = row.createCell(0);
						cell.setCellValue(withdraw.getAccountCode());

						// 账户类型
						cell = row.createCell(1);
						cell.setCellValue(isMinShengBank ? "民生卡" : "他行");

						// 名称
						cell = row.createCell(2);
						cell.setCellValue(withdraw.getAccountName());

						// 金额
						cell = row.createCell(3);
						cell.setCellValue(withdraw.getAmount().doubleValue());

						// 用途
						cell = row.createCell(4);
						cell.setCellValue("");

						// 汇路
						cell = row.createCell(5);
						cell.setCellValue(isMinShengBank ? 0 : 11);

						// 开户行号
						cell = row.createCell(6);
						cell.setCellValue(isMinShengBank ? "00000" : getBankCode(withdraw.getBankName()));

						// 手机号
						cell = row.createCell(7);
						cell.setCellValue(withdraw.getPhone());
					} else if (exportType == 2) {// 招商银行
						row = sheet.createRow(idx);

						// 账户
						cell = row.createCell(0);
						cell.setCellValue(withdraw.getAccountCode());

						// 名称
						cell = row.createCell(1);
						cell.setCellValue(withdraw.getAccountName());

						// 金额
						cell = row.createCell(2);
						cell.setCellValue(withdraw.getAmount().doubleValue());

						// 备注
						cell = row.createCell(3);
						cell.setCellValue("");

						// 收款银行
						cell = row.createCell(4);
						cell.setCellValue(withdraw.getBankName());

						// 支行
						cell = row.createCell(5);
						cell.setCellValue("");

						// 省
						cell = row.createCell(6);
						cell.setCellValue(withdraw.getProvice());

						// 市
						cell = row.createCell(7);
						cell.setCellValue(withdraw.getCity());
					}

					idx++;
				}
			}

			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("审核提款_" + DateUtil.getShortCurrentTimeStr() + ".xls"));

			output = response.getOutputStream();
			workbook.write(output);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (fios != null) {
				try {
					fios.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (output != null) {
				try {
					output.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	// 导出
	@RequestMapping(value = "/system/withdraw/exportTxt", method = RequestMethod.GET)
	public void exportTxt(HttpServletResponse response, BigDecimal amountFrom, BigDecimal amountTo, Integer exportType)
			throws Exception {
		OutputStream output = null;
		FileInputStream fios = null;
		try {
			File file = new File(this.getClass().getResource("/").getFile() + "excel/"
					+ getExportTemplateFileName(exportType, "txt"));
			fios = new FileInputStream(file);

			StringBuffer info = new StringBuffer();
			List<Integer> levelList = getChoiceList(3, false);
			List<WithdrawForm> resultList = withdrawMapper.getMemberWithdrawList(null, 0, levelList, null,null, null, null,
					1, amountFrom, amountTo, 1, 0, Integer.MAX_VALUE);
			if (resultList != null && resultList.size() > 0) {
				boolean isMinShengBank = false;
				for (WithdrawForm withdraw : resultList) {
					isMinShengBank = withdraw.getBankName().contains("民生");

					info.append(withdraw.getAccountCode()).append(",").append(isMinShengBank ? "民生卡" : "他行").append(",")
							.append(withdraw.getAccountName()).append(",").append(withdraw.getAmount().doubleValue())
							.append(",").append("实时转出,").append(isMinShengBank ? "0" : "12").append(",")
							.append(isMinShengBank ? "00000" : getBankCode(withdraw.getBankName())).append(",")
							.append(withdraw.getPhone() == null ? "" : withdraw.getPhone()).append("\r\n");
				}
			}

			response.reset();
			response.setCharacterEncoding("gbk");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=min_sheng_" + DateUtil.getShortCurrentTimeStr() + ".txt");

			output = response.getOutputStream();
			output.write(info.toString().getBytes("gbk"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fios != null) {
				try {
					fios.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (output != null) {
				try {
					output.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	private String getBankCode(String bankName) {
		if (bankName.contains("中国银行"))
			return "104100000004";
		else if (bankName.contains("中信"))
			return "302100011000";
		else if (bankName.contains("交通"))
			return "301290000007";
		else if (bankName.contains("建设"))
			return "105100000017";
		else if (bankName.contains("平安"))
			return "307584007998";
		else if (bankName.contains("招商"))
			return "308584000013";
		else if (bankName.contains("邮政"))
			return "403100000004";
		else if (bankName.contains("农业"))
			return "103100000026";
		else if (bankName.contains("工商"))
			return "102100099996";
		else if (bankName.contains("平安银行"))
			return "307602029018";
		else if (bankName.contains("兴业"))
			return "309391000011";
		else if (bankName.contains("光大"))
			return "303100000006";
		else if (bankName.contains("广发"))
			return "306581000003";
		else if (bankName.contains("浦发"))
			return "310100000010";
		else if (bankName.contains("华夏"))
			return "304100040000";
		else if (bankName.contains("桂林银行"))
			return "313617000026";
		else if (bankName.contains("农村信用社萍乡市支行"))
			return "402423100015";
		else if (bankName.contains("浙江农信"))
			return "402331000007";
		else if (bankName.contains("深圳农村商业"))
			return "402584009991";
		else if (bankName.contains("福建省农村"))
			return "402391000068";
		else if (bankName.contains("东莞农村商业银行"))
			return "402602000018";
		else if (bankName.contains("广州农商"))
			return "314581000011";
		else if (bankName.contains("顺德农村商业银行"))
			return "314588000016";
		else if (bankName.contains("云南省农村信用社"))
			return "402731057238";
		else if (bankName.contains("广东广州省农村"))
			return "314581000011";
		else if (bankName.contains("广东南粤银行"))
			return "313591001001";
		else if (bankName.contains("广西农村信用社"))
			return "402611099974";
		else if (bankName.contains("哈尔滨"))
			return "313261000018";
		else if (bankName.contains("宁波银行"))
			return "313332082914";
		else if (bankName.contains("南京银行"))
			return "313301008887";
		else if (bankName.contains("北京银行"))
			return "313100000013";
		else if (bankName.contains("深圳发展"))
			return "307584007998";
		else if (bankName.contains("广西农村"))
			return "402611099999";
		else if (bankName.contains("浙江省农村信用社"))
			return "402331000007";
		else if (bankName.contains("信用社"))
			return "";

		return "";
	}
}