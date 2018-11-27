package com.ssc.admin.controller.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.entity.ActivityLog;
import com.ssc.entity.Config;
import com.ssc.entity.domain.ActivityLogDomain;
import com.ssc.service.member.SpreadService;
import com.ssc.service.system.CountService;
import com.ssc.service.system.JobService;

@Controller
public class JobController extends AdminBaseController {
	@Autowired
	private JobService jobService;
	
	@Autowired
	private CountService countService;
	
	@Autowired
	private SpreadService spreadService;
	
	@RequestMapping(value="/system/job", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("system/job", null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/job/submit", method=RequestMethod.POST)
	public CustomResponse jobSubmit(String jobCode, String countDate) throws Exception {
		boolean result = false;
		if("count".equals(jobCode)) {
			result = countService.doCount(countDate);
		} else if("report".equals(jobCode)) {
			result = countService.doReport(countDate);
		} else if("spread".equals(jobCode)) {
			result = spreadService.doCount(countDate);
		} else if("clean".equals(jobCode)) {
			result = jobService.doClean();
		}
		if(!result) return createErrorJsonResponse("执行失败！");
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/job/activityExcuteSubmit", method=RequestMethod.POST)
	public CustomResponse activityExcuteSubmit() throws Exception {
		
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("recharge_activity3_set");
		String type="";//活动类型
		if(setConfig.getValue()!=null){
			if(setConfig.getValue().contains("-0")){
				return createErrorJsonResponse("活动已关闭！");
			}else{
				String[] temp = setConfig.getValue().split("-");
				type = temp[0];
			}
		}else{
			return createErrorJsonResponse("活动已关闭！");
		}
		
		//判断是否有赠送，活动只能赠送一次
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(ActivityLogDomain.ACTIVITY_TYPE, type));
		List<ActivityLog> activityLogList = baseService.getList(
			ActivityLog.class,
			whereList,
			Parameter.limit(1),
			Parameter.queryId()
		);
		if(activityLogList != null && activityLogList.size() > 0) return createErrorJsonResponse("活动已执行赠送！");
		
		boolean result = false;
		result = jobService.doActivity();
		if(!result) return createErrorJsonResponse("执行失败！");
		
		return createSuccessJsonResponse(null);
	}
}