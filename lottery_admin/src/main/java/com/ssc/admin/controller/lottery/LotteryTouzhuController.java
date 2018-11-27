package com.ssc.admin.controller.lottery;

import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
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
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.LotteryTouzhu;
import com.ssc.entity.Member;
import com.ssc.entity.custom.CountEntity;
import com.ssc.entity.custom.RechargeForm;
import com.ssc.entity.custom.TouzhuSearchForm;
import com.ssc.mapper.ReportMapper;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.member.MemberService;

@Controller
public class LotteryTouzhuController extends AdminBaseController {
	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LotteryTypeService lotteryTypeService;
	
	@RequestMapping(value="/system/lotteryTouzhu/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("date", DateUtil.getCurrentDateStr());
		dataMap.put("lotteryTypeList", lotteryTypeService.getAllLotteryType());
		
		return createSuccessModelAndView("touzhu/table", dataMap);
	}
	
	@RequestMapping(value="/system/lotteryTouzhu/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer pageSize, Integer dateType, Date dateFrom, Date dateTo,
			Integer lotteryType, String period, Integer status, String orderNo, String memberCode, Integer memberType, Integer sort) throws Exception {
		if(dateFrom == null && dateTo == null) {
			String date = DateUtil.getCurrentTimeStr();
			dateFrom = DateUtil.dateParse(date);
			dateTo = DateUtil.timeParse(date + " 23:59:59");
		}
		
		TouzhuSearchForm form = new TouzhuSearchForm();
		form.setDateFrom(dateFrom);
		form.setDateTo(dateTo);
		form.setDateType(dateType);
		form.setStatus(status);
		form.setLotteryType(lotteryType);
		form.setPeriod(period);
		form.setOrderNo(orderNo);
		form.setMemberType(memberType);
		form.setSort(sort);
		if(StringUtils.isNotBlank(memberCode)) {
			Member member = memberService.getMemberByCode(memberCode);
			form.setMemberId(member == null ? 0L : member.getId());
		}
		
		page = page == null ? 1 : (page + 1);
		CountEntity count = reportMapper.getTouzhuCount(form);
		
		int totalSize = count.getTotalSize();
		form.setBegin((page-1)*20);
		form.setEnd(20);
		Page<LotteryTouzhu> tzPage = new Page<LotteryTouzhu>();
		tzPage.setPageSize(20);
		tzPage.setPageNo(page);
		tzPage.setParams(count);
		tzPage.setTotalSize(totalSize);
		tzPage.setTotalPage(totalSize/20 + (totalSize%20 == 0 ? 0 : 1));
		tzPage.setItems(reportMapper.getTouzhuList(form));
		
		return createSuccessModelAndView("touzhu/page", tzPage);
	}
	
	@ResponseBody
	@RequestMapping(value = "/system/lotteryTouzhu/exportCount", method = RequestMethod.POST)
	public CustomResponse lotteryTouzhuExportCount(Integer dateType, Date dateFrom, Date dateTo,Integer lotteryType, String period, Integer status, String orderNo, String memberCode, Integer memberType, Integer sort) throws Exception {
		TouzhuSearchForm tzform = new TouzhuSearchForm();
		tzform.setDateFrom(dateFrom);
		tzform.setDateTo(dateTo);
		tzform.setDateType(dateType);
		tzform.setStatus(status);
		tzform.setLotteryType(lotteryType);
		tzform.setPeriod(period);
		tzform.setOrderNo(orderNo);
		tzform.setMemberType(memberType);
		tzform.setSort(sort);
		if(StringUtils.isNotBlank(memberCode)) {
			Member member = memberService.getMemberByCode(memberCode);
			tzform.setMemberId(member == null ? 0L : member.getId());
		}
		CountEntity count = reportMapper.getTouzhuCount(tzform);
		int totalSize = count.getTotalSize();
		if(tzform == null || totalSize <= 0) return createErrorJsonResponse("没有需要导出的数据！");
		if(totalSize > 50000) return createErrorJsonResponse("数据太多，请缩小查询范围(最多导出50000笔)！");
		return createSuccessJsonResponse(null);
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/system/lotteryTouzhu/export", method = RequestMethod.GET)
	public void lotteryTouzhuExport(HttpServletResponse response,Integer dateType, Date dateFrom, Date dateTo,Integer lotteryType, String period, Integer status, String orderNo, String memberCode, Integer memberType, Integer sort) throws Exception {
		OutputStream output = null;
		HSSFWorkbook workbook = null;
		try {
			TouzhuSearchForm tzform = new TouzhuSearchForm();
			tzform.setDateFrom(dateFrom);
			tzform.setDateTo(dateTo);
			tzform.setDateType(dateType);
			tzform.setStatus(status);
			tzform.setLotteryType(lotteryType);
			tzform.setPeriod(period);
			tzform.setOrderNo(orderNo);
			tzform.setMemberType(memberType);
			tzform.setSort(sort);
			if(StringUtils.isNotBlank(memberCode)) {
				Member member = memberService.getMemberByCode(memberCode);
				tzform.setMemberId(member == null ? 0L : member.getId());
			}
			tzform.setEnd(50000);
			List<LotteryTouzhu> resultList = reportMapper.getTouzhuList(tzform);
			workbook = new HSSFWorkbook();
			HSSFCellStyle headstyle = workbook.createCellStyle();
		    headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		    headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			if(resultList != null && resultList.size() > 0) {
				HSSFSheet sheet = workbook.createSheet();
				sheet.setColumnWidth(0, 4500);
				sheet.setColumnWidth(1, 4500);
				sheet.setColumnWidth(2, 4500); 
				sheet.setColumnWidth(3, 3000); 
				sheet.setColumnWidth(4, 3000); 
				sheet.setColumnWidth(5, 3000); 
				sheet.setColumnWidth(6, 5000); 
				sheet.setColumnWidth(7, 4500); 
				sheet.setColumnWidth(8, 2000); 
				sheet.setColumnWidth(9, 2000); 
				sheet.setColumnWidth(10, 5000); 
				
				HSSFRow row = sheet.createRow(0);
				HSSFCell cell = row.createCell(0);
				cell.setCellValue("期数");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(1);
				cell.setCellValue("单号");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(2);
				cell.setCellValue("下注时间");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(3);
				cell.setCellValue("会员ID");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(4);
				cell.setCellValue("会员账号");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(5);
				cell.setCellValue("彩种");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(6);
				cell.setCellValue("开奖时间");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(7);
				cell.setCellValue("玩法");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(8);
				cell.setCellValue("下注金额");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(9);
				cell.setCellValue("净利润");
				cell.setCellStyle(headstyle);
               
				cell = row.createCell(10);
				cell.setCellValue("返水额");
				cell.setCellStyle(headstyle);
				
				int idx = 1;
				for(LotteryTouzhu touzhu : resultList) {
					row = sheet.createRow(idx);
					cell = row.createCell(0);
					cell.setCellValue(touzhu.getPeriod());
					
					cell = row.createCell(1);
					cell.setCellValue(touzhu.getOrderNo());

					cell = row.createCell(2);
					cell.setCellValue(DateUtil.dateTimeFormat(touzhu.getAddTime()));
					
					cell = row.createCell(3);
					cell.setCellValue(touzhu.getMemberId());
			    
					cell = row.createCell(4);
					cell.setCellValue(touzhu.getMemberCode());
					
					cell = row.createCell(5);
					cell.setCellValue(touzhu.getTypeName());
					
					cell = row.createCell(6);
					cell.setCellValue(DateUtil.dateTimeFormat(touzhu.getOpenTime()));
					
					cell = row.createCell(7);
					cell.setCellValue(touzhu.getPlayName()+"-"+touzhu.getContent());
					
					cell = row.createCell(8);
					cell.setCellValue(String.valueOf(touzhu.getAmount()));
					
					String temp1="";
					if(touzhu.getStatus().intValue() ==0){
						temp1 ="未结算";
					} else if(touzhu.getStatus().intValue() ==-1){
						temp1 ="已取消";
					} else if(touzhu.getStatus().intValue() ==1){
					temp1 =String.valueOf(touzhu.getWinAmount());
					}
					
					cell = row.createCell(9);
					cell.setCellValue(temp1);

					cell = row.createCell(10);
					cell.setCellValue(String.valueOf(touzhu.getFdAmount()));
					idx++;
				}
			}

			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("注单记录.xls"));

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