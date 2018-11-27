package com.ssc.admin.controller.withdraw;

import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.NumberUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Admin;
import com.ssc.entity.AdminChoice;
import com.ssc.entity.Member;
import com.ssc.entity.MemberWithdraw;
import com.ssc.entity.RechargeWithdrawTimes;
import com.ssc.entity.WithdrawThird;
import com.ssc.entity.custom.WithdrawForm;
import com.ssc.entity.domain.AdminChoiceDomain;
import com.ssc.entity.domain.MemberWithdrawDomain;
import com.ssc.mapper.WithdrawMapper;
import com.ssc.service.member.MemberService;
import com.ssc.service.withdraw.WithdrawService;
import com.ssc.third.BaseThridTransfer;
import com.ssc.third.TransferResult;

@Controller
public class WithdrawController extends AdminBaseController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private WithdrawMapper withdrawMapper;
	
	@Autowired
	private WithdrawService withdrawService;
	
	//手动扣款
	@RequestMapping(value="/system/member/handWithdraw", method=RequestMethod.GET)
	public ModelAndView handWithdraw(Long id) throws Exception {
		Member member = memberService.getMemberById(id);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", member == null ? null : member.getId());
		return createSuccessModelAndView("member/handWithdraw", dataMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/handWithdrawSubmit", method=RequestMethod.POST)
	public CustomResponse handWithdrawSubmit(WithdrawForm withdrawForm) throws Exception {
		Long lastTime = (Long)getSessionAttribute("hand-withdraw");
		if(lastTime != null && (System.currentTimeMillis()/1000-lastTime) < 3) {
			return createErrorJsonResponse("请勿重复提交！");
		}
		setSessionAttribute("hand-withdraw", System.currentTimeMillis()/1000);
		
		withdrawForm.setUpdBy(getSessionUser().getCode());
		String errorMsg = null;
		try {
			errorMsg = withdrawService.handWithdraw(withdrawForm);
		} catch(Exception e) {
			if(e.getCause() != null && e.getCause().getCause() != null
					&& "AMOUNT_LIMIT".equals(e.getCause().getCause().getMessage())) {
				return createErrorJsonResponse("余额不足！");
			} else {
				return createErrorJsonResponse(JsonUtils.object2JsonString(e));
			}
		}
		if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(errorMsg);
		
		return createSuccessJsonResponse(null);
	}
	
	//审核提款
	@RequestMapping(value="/system/withdraw/verify", method=RequestMethod.GET)
	public ModelAndView verify() throws Exception {
		Admin admin = getSessionUser();
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.TYPE, 5));
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		List<AdminChoice> choiceList = baseService.getList(AdminChoice.class, whereList, Parameter.orderBy(OrderBy.asc(AdminChoiceDomain.ID)));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("isOpen", "1".equals(configService.getValueByNid("is_auto_withdraw_open")));
		if(choiceList != null && choiceList.size() == 2) {
			dataMap.put("moneyTo", choiceList.get(1).getValue());
			dataMap.put("moneyFrom", choiceList.get(0).getValue());
		}
		dataMap.put("thirdList", withdrawService.getWithdrawThridList());
		
		return createSuccessModelAndView("member/withdraw/table", dataMap);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/system/withdraw/verifyList", method=RequestMethod.GET)
	public ModelAndView verifyList(Integer page, BigDecimal amountFrom, BigDecimal amountTo, Integer isBatch,String verifyUser) throws Exception {
		List<Long> idList = null;
		WithdrawForm totalSize = new WithdrawForm();
		List<Integer> levelList = getChoiceList(3, false);
		if(levelList != null && levelList.size() > 0) {
			if(isBatch != null && isBatch == 1) {
				idList = (List<Long>) getSessionAttribute("admin_withdraw_id_list");
				if(idList != null && idList.size() > 0) {
					totalSize = withdrawMapper.getMemberWithdrawAmount1(idList, 0, levelList, null,verifyUser, null, null, amountFrom, amountTo, 1);
				}
			} else {
				totalSize = withdrawMapper.getMemberWithdrawAmount1(null, 0, levelList, null,verifyUser, null, null, amountFrom, amountTo, 1);
			}
		}
		
		page = page == null ? 1 : (page + 1);
		Page<WithdrawForm> wiwthdrawPage = new Page<WithdrawForm>();
		wiwthdrawPage.setPageSize(20);
		wiwthdrawPage.setPageNo(page);
		wiwthdrawPage.setTotalSize(totalSize.getTimes());
		wiwthdrawPage.setTotalPage(totalSize.getTimes()/20 + (totalSize.getTimes()%20 == 0 ? 0 : 1));
		if(totalSize.getTimes() > 0) wiwthdrawPage.setItems(withdrawMapper.getMemberWithdrawList(idList, 0, levelList, null,verifyUser, null, null, 1, amountFrom, amountTo, 1, (page-1)*20, 20));
		
		List<Long> withdrawIdList = new ArrayList<Long>();
		List<String> withdrawOrderList = new ArrayList<String>();
		if(page != null && wiwthdrawPage.getItems() != null) {
			Integer[] timesArr = null;
			RechargeWithdrawTimes times = null;
			Map<Long, Integer[]> timesMap = new HashMap<Long, Integer[]>();
			for(WithdrawForm withdraw : wiwthdrawPage.getItems()) {
				timesArr = timesMap.get(withdraw.getMemberId());
				if(timesArr == null) {
					times = memberService.getLastRechargeWithdrawTimes(withdraw.getMemberId());
					timesArr = new Integer[]{times.getWithdraw(), times.getTotalWithdraw()};
				}
				timesArr[0] = timesArr[0] + 1;
				timesArr[1] = timesArr[1] + 1;
				timesMap.put(withdraw.getMemberId(), timesArr);
				
				withdraw.setTimes(timesArr[0]);
				withdraw.setTotalTimes(timesArr[1]);
				
				withdrawIdList.add(withdraw.getId());
				withdrawOrderList.add(withdraw.getOrderNo());
			}
		}
		
		setSessionAttribute("admin_withdraw_id_list", null);
		setSessionAttribute("admin_withdraw_order_list", null);
		if(isBatch != null && isBatch > 0) {
			setSessionAttribute("admin_withdraw_id_list", withdrawIdList);
			setSessionAttribute("admin_withdraw_order_list", withdrawOrderList);
		}
		
		String value = configService.getValueByNid("is_auto_withdraw_open");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("isOpen", "1".equals(value));
		params.put("amount", totalSize.getAmount());
		wiwthdrawPage.setParams(params);
		return createSuccessModelAndView("member/withdraw/page", wiwthdrawPage);
	}
	
	@RequestMapping(value="/system/withdraw/verifyEdit", method=RequestMethod.GET)
	public ModelAndView verifyEdit(Long id) throws Exception {
		List<Long> idList = new ArrayList<Long>();
		idList.add(id);
		List<WithdrawForm> withdrawList = withdrawMapper.getMemberWithdrawList(idList, 0, null, null,null, null, null, 0, null, null, 1, 0, 1);
		WithdrawForm withdraw = (withdrawList == null || withdrawList.size() <= 0) ? null : withdrawList.get(0);
		
		ModelAndView view = createSuccessModelAndView("member/withdraw/edit", withdraw);
		view.addObject("dml", memberService.getMemberDml(withdraw.getMemberId()));
		return view;
	}
	
	//正在审核
	@ResponseBody
	@RequestMapping(value="/system/withdraw/lockVerify", method=RequestMethod.POST)
	public CustomResponse lockVerify(Long id) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(MemberWithdrawDomain.ID, id));
		whereList.add(Where.eq(MemberWithdrawDomain.STATUS, 0));
		MemberWithdraw withdraw = new MemberWithdraw();
		withdraw.setUpdBy(getSessionUser().getCode());
		withdraw.setUpdTime(new Date());
		withdraw.setStatus(2);
		int result = baseService.update(withdraw, whereList, false);
		if(result <= 0) return createErrorJsonResponse("该笔出款已有人在审核！");
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdraw/verifyEditSubmit", method=RequestMethod.POST)
	public CustomResponse verifyEditSubmit(WithdrawForm withdrawForm) throws Exception {
		if(withdrawForm.getStatus() == null) return createErrorJsonResponse("请先选择审核结果！");
		
		withdrawForm.setUpdBy(getSessionUser().getCode());
		String errorMsg = withdrawService.verifyWithdraw(withdrawForm);
		if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(errorMsg);
		
		return createSuccessJsonResponse(null);
	}
	
	//已审核提款记录
	@RequestMapping(value="/system/withdraw/verifyLog", method=RequestMethod.GET)
	public ModelAndView verifyLog() throws Exception {
		return createSuccessModelAndView("member/withdraw/logTable", DateUtil.getCurrentDateStr());
	}
	
	@RequestMapping(value="/system/withdraw/verifyLogList", method=RequestMethod.GET)
	public ModelAndView verifyLogList(Integer page, String memberCode,String verifyUser, Integer status, Date dateStart, Date dateEnd) throws Exception {
		page = page == null ? 1 : (page + 1);
		WithdrawForm form = withdrawMapper.getMemberWithdrawAmount(null, status, null, memberCode,verifyUser, dateStart, dateEnd, null, null, 2);
		int totalSize = form.getTimes();
		Page<WithdrawForm> wiwthdrawPage = new Page<WithdrawForm>();
		wiwthdrawPage.setPageSize(20);
		wiwthdrawPage.setPageNo(page);
		wiwthdrawPage.setTotalSize(totalSize);
		wiwthdrawPage.setTotalPage(totalSize/20 + (totalSize%20 == 0 ? 0 : 1));
		wiwthdrawPage.setItems(withdrawMapper.getMemberWithdrawList(null, status, null, memberCode,verifyUser,dateStart, dateEnd, 2, null, null, 2, (page-1)*20, 20));
		
		wiwthdrawPage.setParams(form.getAmount() == null ? 0.0 : form.getAmount());
		return createSuccessModelAndView("member/withdraw/logPage", wiwthdrawPage);
	}
	
	//------以下第三方出款--------
	@ResponseBody
	@RequestMapping(value="/system/withdraw/viewBalance", method=RequestMethod.POST)
	public CustomResponse viewBalance(Long id) throws Exception {
		if(id == null) return createErrorJsonResponse("请先选择第三方！");
		WithdrawThird third = withdrawService.getWithdrawThridMap().get(id);
		BaseThridTransfer baseThird = getThirdTransfer(third == null ? null : third.getType());
		if(baseThird == null) return createErrorJsonResponse("该第三方已经停用，请选择其他第三方！");
		
		TransferResult result = baseThird.getAccountBalance(third);
		if(StringUtils.isNotBlank(result.getErrorMsg())) return createErrorJsonResponse(result.getErrorMsg());
		
		return createSuccessJsonResponse(result.getAmount());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdraw/updateStatus", method=RequestMethod.POST)
	public CustomResponse updateStatus(Long id) throws Exception {
		if(id == null) return createErrorJsonResponse("请先选择第三方！");
		WithdrawThird third = withdrawService.getWithdrawThridMap().get(id);
		BaseThridTransfer baseThird = getThirdTransfer(third == null ? null : third.getType());
		if(baseThird == null) return createErrorJsonResponse("该第三方已经停用，请选择其他第三方！");
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(MemberWithdrawDomain.STATUS, 2));
		whereList.add(Where.eq(MemberWithdrawDomain.UPD_BY, "system"));
		whereList.add(Where.eq(MemberWithdrawDomain.THIRD_ID, third.getId()));
		List<MemberWithdraw> withdrawList = baseService.getList(MemberWithdraw.class, whereList);
		if(withdrawList != null && withdrawList.size() > 0) {
			TransferResult result = null;
			WithdrawForm withdrawForm = null;
			for(MemberWithdraw withdraw : withdrawList) {
				third.addExpand("tradeNo", withdraw.getThirdOrderNo());
				result = baseThird.queryTransferResult(third, withdraw.getOrderNo(), withdraw.getAmount());
				if(result.getIsSuccess()) {
					withdrawForm = new WithdrawForm();
					withdrawForm.setStatus(1);
					withdrawForm.setId(withdraw.getId());
					withdrawForm.setThirdRemark(third.getName());
					withdrawForm.setUpdBy(getSessionUser().getCode());
					withdrawService.verifyWithdraw(withdrawForm);
				} else {
					if(StringUtils.isNotBlank(result.getErrorMsg())) {
						withdraw.setThirdRemark(third.getName() + ":" + result.getErrorMsg());
					} else {
						withdraw.setThirdRemark(third.getName() + ":" + result.getDesc());
					}
					baseService.updateById(withdraw, withdraw.getId(), false);
				}
			}
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdraw/third", method=RequestMethod.POST)
	public CustomResponse thirdWithdraw(HttpServletRequest request,Long id, Long thirdId) throws Exception {
		if(id == null) return createSuccessJsonResponse(null);
		if(thirdId == null) return createErrorJsonResponse("请先选择第三方！");
		WithdrawThird third = withdrawService.getWithdrawThridMap().get(thirdId);
		BaseThridTransfer baseThird = getThirdTransfer(third == null ? null : third.getType());
		if(baseThird == null) return createErrorJsonResponse("该第三方已经停用，请选择其他第三方！");
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(MemberWithdrawDomain.ID, id));
		whereList.add(Where.eq(MemberWithdrawDomain.STATUS, 0));
		
		MemberWithdraw withdraw = new MemberWithdraw();
		withdraw.setUpdBy("system");
		withdraw.setUpdTime(new Date());
		withdraw.setStatus(2);
		withdraw.setThirdId(third.getId());
		withdraw.setThirdRemark(third.getName());
		int uresult = baseService.update(withdraw, whereList, false);
		if(uresult <= 0) return createErrorJsonResponse("该笔出款已有人在审核！");
		
		withdraw = baseService.getById(MemberWithdraw.class, id, null);
		if(!"system".equals(withdraw.getUpdBy()) || withdraw.getStatus() != 2) return createErrorJsonResponse("该笔出款已有人在审核！");
		
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("businessId", withdraw.getOrderNo());
			paramMap.put("cardHolder", withdraw.getAccountName());
			paramMap.put("cardNo", withdraw.getAccountCode());
			paramMap.put("tradeMoney", NumberUtils.format(withdraw.getAmount(), new DecimalFormat("#0.00")));
			paramMap.put("bankName", withdraw.getBankName());
			paramMap.put("remark", "");
			TransferResult result = baseThird.singleTransfer(request,third, paramMap);
			if(StringUtils.isNotBlank(result.getErrorMsg())) {
				withdraw.setThirdId(0L);
				withdraw.setThirdRemark(result.getErrorMsg());
				withdraw.setUpdBy(getSessionUser().getCode());
				baseService.updateById(withdraw, withdraw.getId(), true);
				return createErrorJsonResponse(result.getErrorMsg());
			} else if(StringUtils.isNotBlank(result.getTradeNo())) {
				withdraw.setThirdOrderNo(result.getTradeNo());
				baseService.updateById(withdraw, withdraw.getId(), true);
			}
		} catch(Exception e) {
			withdraw.setThirdId(0L);
			withdraw.setThirdRemark("提交失败");
			withdraw.setUpdBy(getSessionUser().getCode());
			baseService.updateById(withdraw, withdraw.getId(), true);
			e.printStackTrace();
			return createErrorJsonResponse("自动出款提交失败，请手动出款！");
		}
		
		return createSuccessJsonResponse(null);
	}
	
	private BaseThridTransfer getThirdTransfer(Integer type) throws Exception {
		Class<?> clazz = type == null ? null : BaseThridTransfer.THIRD_CLAZZ_MAP.get(type);
		return clazz == null ? null : (BaseThridTransfer)clazz.newInstance();
	}
	@ResponseBody
	@RequestMapping(value = "/system/withdraw/verifyLog/exportCount", method = RequestMethod.POST)
	public CustomResponse verifyLogExportCount(Date dateStart, Date dateEnd,Integer status,String verifyUser,String memberCode) throws Exception {
		WithdrawForm form = withdrawMapper.getMemberWithdrawAmount(null, status, null, memberCode,verifyUser, dateStart, dateEnd, null, null, 2);
		
		int totalSize = form.getTimes();
		if(form == null || totalSize <= 0) return createErrorJsonResponse("没有需要导出的数据！");
		if(totalSize > 10000) return createErrorJsonResponse("数据太多，请缩小查询范围(最多导出10000笔)！");
		
		return createSuccessJsonResponse(null);
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/system/withdraw/verifyLog/export", method = RequestMethod.GET)
	public void verifyLogExport(HttpServletResponse response,Date dateStart, Date dateEnd,Integer status,String verifyUser,String memberCode) throws Exception {
		OutputStream output = null;
		HSSFWorkbook workbook = null;
		try {
			
			List<WithdrawForm> resultList =withdrawMapper.getMemberWithdrawList(null, status, null, memberCode,verifyUser,dateStart, dateEnd, 2, null, null, 2,0,10000);
			
			if(resultList != null && resultList.size() > 0) {
				Date date = DateUtil.addSeconds(new Date(), -21600);
				for(WithdrawForm temp : resultList) {
					if(temp.getStatus() != -1) continue;
					if(temp.getAddTime().compareTo(date) > 0) temp.setStatus(-11);
				}
			}
			
			workbook = new HSSFWorkbook();
			HSSFCellStyle headstyle = workbook.createCellStyle();
		    headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			if(resultList != null && resultList.size() > 0) {
				HSSFSheet sheet = workbook.createSheet();
				sheet.setColumnWidth(0, 5000);
				sheet.setColumnWidth(1, 2500);
				sheet.setColumnWidth(2, 2500); 
				sheet.setColumnWidth(3, 2500); 
				sheet.setColumnWidth(4, 5000); 
				sheet.setColumnWidth(5, 5000); 
				sheet.setColumnWidth(6, 2500); 
				sheet.setColumnWidth(7, 2500); 
				sheet.setColumnWidth(8, 2500); 
				HSSFRow row = sheet.createRow(0);
				HSSFCell cell = row.createCell(0);
				cell.setCellValue("编号");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(1);
				cell.setCellValue("会员账号");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(2);
				cell.setCellValue("姓名");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(3);
				cell.setCellValue("开户行");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(4);
				cell.setCellValue("卡号");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(5);
				cell.setCellValue("时间");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(6);
				cell.setCellValue("金额");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(7);
				cell.setCellValue("代理商");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(8);
				cell.setCellValue("操作者");
				cell.setCellStyle(headstyle);
				
				int idx = 1;
				for(WithdrawForm withdraw : resultList) {
					row = sheet.createRow(idx);
					cell = row.createCell(0);
					cell.setCellValue(withdraw.getOrderNo());
					
					cell = row.createCell(1);
					cell.setCellValue(withdraw.getMemberCode());

					cell = row.createCell(2);
					cell.setCellValue(withdraw.getMemberName());
					
					cell = row.createCell(3);
					cell.setCellValue(withdraw.getBankName());
			    
					cell = row.createCell(4);
					cell.setCellValue(withdraw.getAccountCode());
					
					cell = row.createCell(5);
					cell.setCellValue(DateUtil.dateTimeFormat(withdraw.getUpdTime()));
					
					cell = row.createCell(6);
					cell.setCellValue(withdraw.getAmount().toString());
					
					cell = row.createCell(7);
					cell.setCellValue(withdraw.getAgentName());
					
					cell = row.createCell(8);
					cell.setCellValue(withdraw.getUpdBy());
					
					idx++;
				}
			}

			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("已审核提款记录.xls"));

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

			if (output != null) {
				try {
					output.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}