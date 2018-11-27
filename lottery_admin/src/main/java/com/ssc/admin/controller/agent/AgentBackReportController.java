package com.ssc.admin.controller.agent;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.MonthlyReport;
import com.ssc.entity.domain.MonthlyReportDomain;

@Controller
public class AgentBackReportController extends AdminBaseController {
	@RequestMapping(value="/agent/back/current", method=RequestMethod.GET)
	public ModelAndView toCurrent() throws Exception {
		return createSuccessModelAndView("agent/currentTable", null);
	}
	
	@RequestMapping(value="/agent/back/getCurrentList", method=RequestMethod.GET)
	public ModelAndView getCurrentList() throws Exception {
		return createSuccessModelAndView("agent/currentPage", getMonthlyReportList(null));
	}
	
	@RequestMapping(value="/agent/back/history", method=RequestMethod.GET)
	public ModelAndView toHistory() throws Exception {
		String yearMonth = DateUtil.getCurrentDateStr().replace("-", "").substring(0,6);
		int year = Integer.valueOf(yearMonth.substring(0, 4));
		int month=0;
		if(yearMonth.substring(4).equals("0")){
			month = Integer.valueOf(yearMonth.substring(5));
		}else{
			month = Integer.valueOf(yearMonth.substring(4,6));
		}
		
		
		List<String> resultList = new ArrayList<String>();
		for(int i=0;i<=10;i++) {
			resultList.add(year + StringUtils.leftPad(""+month, 2, "0"));
			
			month = month - 1;
			if(month <= 0) {
				month = 12;
				year = year - 1;
			}
		}
		
		resultList.remove(0);
		return createSuccessModelAndView("agent/historyTable", resultList);
	}
	
	@RequestMapping(value="/agent/back/getHistoryList", method=RequestMethod.GET)
	public ModelAndView getHistoryList(String yearMonth) throws Exception {
		return createSuccessModelAndView("agent/currentPage", getMonthlyReportList(yearMonth));
	}
	
	private List<MonthlyReport> getMonthlyReportList(String yearMonth) throws Exception {
		if(StringUtils.isBlank(yearMonth)) {
			yearMonth = DateUtil.getCurrentDateStr().replace("-", "").substring(0,6);
		}
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(MonthlyReportDomain.MONTH, yearMonth));
		return baseService.getList(MonthlyReport.class, whereList, Parameter.orderBy(OrderBy.desc(MonthlyReportDomain.REAL_WIN_AMOUNT)));
	}
}