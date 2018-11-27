package com.ssc.admin.interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.core.constant.Constant;
import com.ssc.core.interceptor.LoginHandlerInterceptor;
import com.ssc.core.utils.ApplicationContextUtil;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.service.admin.AccessService;
import com.ssc.service.system.ConfigService;

public class AdminLoginHandlerInterceptor extends LoginHandlerInterceptor {
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private AccessService accessService;
	
	@Autowired
	private ApplicationContextUtil applicationContextUtil;
	
	private static Map<String, String> QUCIK_TIME = new HashMap<String, String>();
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
		if(path.startsWith("/ios2")) return true;
		if(path.startsWith("/android1")) return true;
		if(path.startsWith("/api/getDomain")) return true;
		if(path.startsWith("/system/access/index")) {
			Object member = applicationContextUtil.getSessionAttribute(Constant.SESSION_USER);
			if(member == null) {
				String day = request.getParameter("day");
				return DateUtil.getShortCurrentTimeStr().substring(6, 12).equals(day);
			}
		} else if(path.startsWith("/system/access")) return true;
		if(path.equals("/system/platform/getReport")) return true;
		
		String isFilter = configService.getValueByNid("is_ip_filter_open");
//		if(StringUtils.isBlank(isFilter) || "1".equals(isFilter)) {
//			Set<String> ipSet = accessService.getWhiteIpSet(false);
//			if(ipSet == null || !ipSet.contains(applicationContextUtil.getRequestIp())) return false;
//		}
		
		return super.sessionFilter(request, response, request.getServletPath(), true);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if(request.getServletPath().startsWith("/api")) return;
		if(request.getServletPath().startsWith("/common/autoRecharge")) return;
		if(request.getServletPath().startsWith("/common/autoWithdraw")) return;
		
		if(applicationContextUtil.getSessionAttribute(Constant.SESSION_USER) == null) {
			super.postHandle(request, response, handler, modelAndView);
			return;
		}
		
		if(modelAndView != null) {
			String today = QUCIK_TIME.get("today");
			if(StringUtils.isBlank(today) || !today.equals(DateUtil.getCurrentDateStr())) {
				Date date = DateUtil.getCurrentDate();
				Date yesterday = DateUtil.addDay(date, -1);
				Long weekBegin = DateUtil.getWeekFirstDay(date);
				Long weekEnd = DateUtil.getWeekLastDay(date);
				Long lastWeekEnd = DateUtil.addDay(weekBegin, -1);
				Long lastWeekBegin = DateUtil.addDay(weekBegin, -7);
				Long monthEnd = DateUtil.getMonthLastDay(date);
				Long monthBegin = DateUtil.getMonthFirstDay(date);
				Long lastMonthEnd = DateUtil.addDay(monthBegin*1000, -1);
				Long lastMonthBegin = DateUtil.getMonthFirstDay(new Date(lastMonthEnd));
				
				QUCIK_TIME.put("today", DateUtil.getCurrentDateStr());
				QUCIK_TIME.put("yesterday", DateUtil.dateFormat(yesterday));
				QUCIK_TIME.put("weekBegin", DateUtil.dateFormat(weekBegin));
				QUCIK_TIME.put("weekEnd", DateUtil.dateFormat(weekEnd));
				QUCIK_TIME.put("lastWeekBegin", DateUtil.dateFormat(lastWeekBegin));
				QUCIK_TIME.put("lastWeekEnd", DateUtil.dateFormat(lastWeekEnd));
				QUCIK_TIME.put("monthBegin", DateUtil.dateFormat(monthBegin));
				QUCIK_TIME.put("monthEnd", DateUtil.dateFormat(monthEnd));
				QUCIK_TIME.put("lastMonthBegin", DateUtil.dateFormat(lastMonthBegin));
				QUCIK_TIME.put("lastMonthEnd", DateUtil.dateFormat(lastMonthEnd));
			}
			
			String isSelfControlOpen = configService.getValueByNid("is_self_control_open");
			String isRechargeAddOpen = configService.getValueByNid("is_recharge_add_open");
			modelAndView.addObject("isSelfControlOpen", StringUtils.isBlank(isSelfControlOpen)?0:Integer.valueOf(isSelfControlOpen));
			modelAndView.addObject("isRechargeAddOpen", StringUtils.isBlank(isRechargeAddOpen)?1:Integer.valueOf(isRechargeAddOpen));
			
			modelAndView.addObject("quickTime", QUCIK_TIME);
			modelAndView.addObject("admin", applicationContextUtil.getSessionAttribute(Constant.SESSION_USER));
		}
		super.postHandle(request, response, handler, modelAndView);
	}
}