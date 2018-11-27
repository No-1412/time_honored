package com.ssc.admin.controller.content;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.annotation.Arg;
import com.ssc.core.annotation.Validation;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.entity.Activity;
import com.ssc.entity.domain.ActivityDomain;
import com.ssc.service.content.ActivityService;

@Controller
public class ActivityController extends AdminBaseController {
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping(value="/system/activity/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("activity/table", null);
	}
	
	@RequestMapping(value="/system/activity/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<Activity> activityPage = baseService.getPage(
			Activity.class,
			Collections.singletonList(Where.gt(ActivityDomain.ID, 0)),
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.asc(ActivityDomain.ORDER))
		);
		return createSuccessModelAndView("activity/page", activityPage);
	}
	
	@RequestMapping(value="/system/activity/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		Activity activity = null;
		if(id != null && id > 0L) {
			activity = baseService.getById(Activity.class, id, null);
		}
		if(activity == null) {
			activity = new Activity();
			activity.setObject("所有会员");
		}
		
		ModelAndView modelAndView = new ModelAndView("activity/edit");
		modelAndView.addObject("activity", activity);
		
		return modelAndView;
	}
	
	@Validation(
		args={
			@Arg(field=ActivityDomain.TITLE, text="活动标题", maxLength=25),
			@Arg(field=ActivityDomain.OBJECT, text="活动对象", maxLength=25),
			@Arg(field=ActivityDomain.CONTENT, text="活动内容", maxLength=25),
			@Arg(field=ActivityDomain.DETAIL, text="活动详情")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/activity/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Activity activity) throws Exception {
		activity.setUpdTime(getCurrentDate());
		if(activity.getId() != null && activity.getId() > 0L) {
			activityService.updateActivity(activity);
		} else {
			activityService.addActivity(activity);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/activity/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		return createSuccessJsonResponse(activityService.deleteActivityById(id));
	}
}