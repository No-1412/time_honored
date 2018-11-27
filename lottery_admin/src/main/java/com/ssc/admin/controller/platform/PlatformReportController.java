package com.ssc.admin.controller.platform;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ssc.core.utils.NumberUtils;
import com.ssc.core.utils.SslHttpClient;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.DailyReport;
import com.ssc.entity.Platform;
import com.ssc.entity.PlatformReport;
import com.ssc.entity.domain.PlatformReportDomain;
import com.ssc.mapper.ReportMapper;

@Controller
public class PlatformReportController extends AdminBaseController {
	public static final BigDecimal P5 = new BigDecimal("0.05");
	public static final BigDecimal P6 = new BigDecimal("0.06");
	public static final BigDecimal P7 = new BigDecimal("0.07");
	
	public static final BigDecimal W2 = new BigDecimal("20000");
	public static final BigDecimal W200 = new BigDecimal("2000000");
	public static final BigDecimal W300 = new BigDecimal("3000000");
	public static final BigDecimal W500 = new BigDecimal("5000000");
	
	@Autowired
	private ReportMapper reportMapper;
	
	@RequestMapping(value="/system/platformReport/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		Date date = new Date();
		List<String> monthList = new ArrayList<String>();
		for(int i=0;i<12;i++) {
			monthList.add(DateUtil.dateShortFormat(DateUtil.addMonth(date, -i)).substring(0, 6));
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("monthList", monthList);
		resultMap.put("platform", baseService.getAll(Platform.class));
		return createSuccessModelAndView("platformReport/table", resultMap);
	}
	
	@RequestMapping(value="/system/platformReport/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Long platformId, String reportMonth, Integer status) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.gt(PlatformReportDomain.ID, 0));
		if(status != null) whereList.add(Where.eq(PlatformReportDomain.STATUS, status));
		if(platformId != null) whereList.add(Where.eq(PlatformReportDomain.PLATFORM_ID, platformId));
		if(StringUtils.isNotBlank(reportMonth)) whereList.add(Where.eq(PlatformReportDomain.REPORT_MONTH, reportMonth));
		Page<PlatformReport> reportPage = baseService.getPage(
			PlatformReport.class,
			whereList,
			page == null ? 1 : (page+1),
			Parameter.orderBy(OrderBy.desc(PlatformReportDomain.REPORT_MONTH), OrderBy.asc(PlatformReportDomain.PLATFORM_ID))
		);
		if(reportPage != null && reportPage.getItems() != null) {
			Map<Long, String> pNameMap = new HashMap<Long, String>();
			List<Platform> pList = baseService.getAll(Platform.class);
			for(Platform p : pList) pNameMap.put(p.getId(), p.getName());
			
			for(PlatformReport r : reportPage.getItems()) r.addExpand("platformName", pNameMap.get(r.getPlatformId()));
		}
		
		PlatformReport totalAmount = baseService.getOne(
			PlatformReport.class,
			whereList,
			Parameter.querySingle("sum(final_amount) final_amount")
		);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("page", reportPage);
		resultMap.put("totalAmount", totalAmount == null ? BigDecimal.ZERO : totalAmount.getFinalAmount());
		
		return createSuccessModelAndView("platformReport/page", resultMap);
	}
	
	@RequestMapping(value="/system/platformReport/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		PlatformReport report = baseService.getById(PlatformReport.class, id, null);
		if(report != null) {
			Platform p = baseService.getById(Platform.class, report.getPlatformId(), null);
			report.addExpand("platformName", report == null ? "" : p.getName());
		}
		return createSuccessModelAndView("platformReport/edit", report);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/platformReport/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(PlatformReport report) throws Exception {
		report.setUpdTime(new Date());
		report.setUpdBy(getSessionUser().getCode());
		BigDecimal tmpAmount = BigDecimal.ZERO;
		BigDecimal finalAmount = BigDecimal.ZERO;
		StringBuffer expression = new StringBuffer();
		if(report.getReportAmount().compareTo(W500) > 0) {
			tmpAmount = report.getReportAmount().subtract(W500);
			expression.append("2000000*0.07+3000000*0.06+").append(tmpAmount).append("*0.05");
			finalAmount = W200.multiply(P7).add(W300.multiply(P6)).add(tmpAmount.multiply(P5));
		} else if(report.getReportAmount().compareTo(W200) > 0) {
			tmpAmount = report.getReportAmount().subtract(W200);
			expression.append("2000000*0.07+").append(tmpAmount).append("*0.06");
			finalAmount = W200.multiply(P7).add(tmpAmount.multiply(P6));
		} else {
			if(report.getReportAmount().compareTo(BigDecimal.ZERO) < 0) {
				expression.append("0.00*0.07");
				finalAmount = BigDecimal.ZERO;
			} else {
				expression.append(report.getReportAmount()).append("*0.07");
				finalAmount = report.getReportAmount().multiply(P7);
			}
		}
		
		if(report.getServiceFee() != null && report.getServiceFee().compareTo(BigDecimal.ZERO) > 0) {
			expression.append("+").append(report.getServiceFee());
			finalAmount = finalAmount.add(report.getServiceFee());
		}
		if(report.getSubFee() != null && report.getSubFee().compareTo(BigDecimal.ZERO) > 0) {
			expression.append("-").append(report.getSubFee());
			finalAmount = finalAmount.subtract(report.getSubFee());
		}
		report.setFinalAmount(finalAmount);
		report.setCountExpression(expression.toString());
		
		baseService.updateById(report, report.getId(), false);
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/platformReport/genReport", method=RequestMethod.POST)
	public CustomResponse adminSubmit(String reportMonth, Long platformId) throws Exception {
		String tmp = "";
		StringBuffer errorMsg = new StringBuffer();
		String[] dateFromTo = getDateFromTo(reportMonth);
		String currentMonth = DateUtil.getShortCurrentDateStr().substring(0, 6);
		if(platformId != null) {
			tmp = genReport(baseService.getById(Platform.class, platformId, null), reportMonth, currentMonth, dateFromTo[0], dateFromTo[1], dateFromTo[2].substring(0, 6));
			if(StringUtils.isNotBlank(tmp)) return createErrorJsonResponse(tmp);
		} else {
			List<Platform> pList = baseService.getAll(Platform.class);
			for(Platform p : pList) {
				tmp = genReport(p, reportMonth, currentMonth, dateFromTo[0], dateFromTo[1], dateFromTo[2].substring(0, 6));
				if(StringUtils.isNotBlank(tmp)) errorMsg.append(tmp).append("");
			}
		}
		if(StringUtils.isNotBlank(errorMsg.toString())) {
			return createErrorJsonResponse(errorMsg.toString());
		}
		
		return createSuccessJsonResponse(null);
	}
	
	private String[] getDateFromTo(String reportMonth) {
		String dateFrom = reportMonth.substring(0, 4) + "-" + reportMonth.substring(4) + "-01";
		long dateTo = DateUtil.getMonthLastDay(DateUtil.dateParse(dateFrom));
		return new String[]{dateFrom, DateUtil.dateFormat(dateTo), DateUtil.dateShortFormat(DateUtil.addMonth(dateTo, -1))};
	}
	
	private String genReport(Platform platForm, String reportMonth, String currentMonth, String dateFrom, String dateTo, String lastMonth) {
		if(platForm == null) return null;
		try {
			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.eq(PlatformReportDomain.PLATFORM_ID, platForm.getId()));
			whereList.add(Where.eq(PlatformReportDomain.REPORT_MONTH, reportMonth));
			PlatformReport report = baseService.getOne(PlatformReport.class, whereList);
			if(report != null && !currentMonth.equals(reportMonth)) {
				if(0 == report.getStatus()
						&& DateUtil.dateShortFormat(DateUtil.addMonth(new Date(), -1)).substring(0, 6).equals(reportMonth)) {
				} else {
					return platForm.getName()+"第"+reportMonth+"期报表已生成过，不能重新生成！";
				}
			}
			
			int month = Integer.valueOf(reportMonth.substring(4, 6));
			boolean isServiceMonthly = month == 2 || month == 5 || month == 8 || month == 11;
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("dateFrom", dateFrom);
			paramMap.put("dateTo", dateTo);
			String amount = SslHttpClient.post(platForm.getAdminUrl()+"/system/platform/getReport", null, paramMap, null);
			if(StringUtils.isBlank(amount)) return platForm.getName()+"第"+reportMonth+"期报表生成失败！";
			
			if(report == null) report = new PlatformReport();
			report.setPlatformId(platForm.getId());
			report.setReportMonth(reportMonth);
			report.setReportAmount(new BigDecimal(amount));
			report.setUpdBy(getSessionUser().getCode());
			report.setUpdTime(new Date());
			if(report.getId() == null) {
				report.setAddBy(report.getUpdBy());
				report.setAddTime(report.getUpdTime());
			}
			
			boolean isSubFee = false;
			BigDecimal tmpAmount = BigDecimal.ZERO;
			BigDecimal finalAmount = BigDecimal.ZERO;
			StringBuffer expression = new StringBuffer();
			if(report.getReportAmount().compareTo(W500) > 0) {
				isSubFee = true;
				tmpAmount = report.getReportAmount().subtract(W500);
				expression.append("2000000*0.07+3000000*0.06+").append(tmpAmount).append("*0.05");
				finalAmount = W200.multiply(P7).add(W300.multiply(P6)).add(tmpAmount.multiply(P5));
			} else if(report.getReportAmount().compareTo(W200) > 0) {
				isSubFee = true;
				tmpAmount = report.getReportAmount().subtract(W200);
				expression.append("2000000*0.07+").append(tmpAmount).append("*0.06");
				finalAmount = W200.multiply(P7).add(tmpAmount.multiply(P6));
			} else {
				if(report.getReportAmount().compareTo(BigDecimal.ZERO) < 0) {
					expression.append("0.00*0.07");
					finalAmount = BigDecimal.ZERO;
				} else {
					expression.append(report.getReportAmount()).append("*0.07");
					finalAmount = report.getReportAmount().multiply(P7);
				}
			}
			report.setSubFee(isSubFee ? W2 : BigDecimal.ZERO);
			report.setSubFeeRemark(isSubFee ? ("扣除"+reportMonth+"月维护费") : "");
			
			BigDecimal serviceFee = null;
			if(report.getServiceFee() != null && report.getServiceFee().compareTo(BigDecimal.ZERO) > 0) {
				expression.append("+").append(report.getServiceFee());
				finalAmount = finalAmount.add(report.getServiceFee());
			} else {
				if(isServiceMonthly) {
					serviceFee = platForm.getMonthlyFee().multiply(new BigDecimal(3));
					expression.append("+").append(serviceFee);
					finalAmount = finalAmount.add(serviceFee);
				}
			}
			if(report.getSubFee() != null && report.getSubFee().compareTo(BigDecimal.ZERO) > 0) {
				expression.append("-").append(report.getSubFee());
				finalAmount = finalAmount.subtract(report.getSubFee());
			}
			report.setFinalAmount(finalAmount);
			report.setCountExpression(expression.toString());
			if(serviceFee != null) {
				report.setServiceFee(serviceFee);
				if(month == 11) report.setServiceFeeRemark("12、1、2月维护费");
				else report.setServiceFeeRemark((month+1)+"、"+(month+2)+"、"+(month+3)+"月维护费");
			} else {
				report.setServiceFee(report.getServiceFee() == null ? BigDecimal.ZERO : report.getServiceFee());
			}
			if(report.getId() == null) baseService.insert(report);
			else baseService.updateById(report, report.getId(), false);
		} catch(Exception e) {
			return platForm.getName()+"第"+reportMonth+"期报表生成失败！";
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/system/platform/getReport")
	public String getList(String dateFrom, String dateTo) throws Exception {
		String day = "1";
		Date dateStart = null, dateEnd = null;
		String currentDate = DateUtil.getCurrentTimeStr();
		String today = currentDate.substring(0, 10);
		String yesterday = DateUtil.dateFormat(DateUtil.addDay(new Date(), -1));
		if(yesterday.compareTo(dateTo) > 0) {
			day = "0";
		} else {
			boolean isContainToday = dateFrom.compareTo(today) <= 0 && dateTo.compareTo(today) >= 0;
			boolean isContainYesterday = dateFrom.compareTo(yesterday) <= 0 && dateTo.compareTo(yesterday) >= 0;
			if(isContainYesterday && "00:15:00".compareTo(currentDate.substring(11)) > 0) {
				dateStart = DateUtil.timeParse(yesterday + " 00:00:00");
			} else if(dateStart == null && isContainToday) {
				dateStart = DateUtil.timeParse(today + " 00:00:00");
			}
			if(dateStart != null) dateEnd = DateUtil.timeParse(dateTo + " 23:59:59");
			else day = "0";
		}
		
		DailyReport report = new DailyReport();
		List<DailyReport> reportList = reportMapper.getReport(day, dateStart, dateEnd, dateFrom.replace("-", ""), dateTo.replace("-", ""));
		if(reportList != null && reportList.size() > 0) {
			report.setRealWinAmount(BigDecimal.ZERO);
			for(DailyReport temp : reportList) {
				report.setRealWinAmount(NumberUtils.round(NumberUtils.add(report.getRealWinAmount(), temp.getRealWinAmount()), 2));
			}
		}
		return NumberUtils.format(report.getRealWinAmount(), new DecimalFormat("#0.00"));
	}
}