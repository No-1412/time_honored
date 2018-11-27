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
import com.ssc.entity.SystemNotice;
import com.ssc.entity.domain.SystemNoticeDomain;
import com.ssc.service.content.SystemNoticeService;

@Controller
public class SystemNoticeController extends AdminBaseController {
	@Autowired
	private SystemNoticeService noticeService;
	
	@RequestMapping(value="/system/notice/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("notice/table", null);
	}
	
	@RequestMapping(value="/system/notice/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<SystemNotice> noticePage = baseService.getPage(
			SystemNotice.class,
			Collections.singletonList(Where.gt(SystemNoticeDomain.ID, 0)),
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(SystemNoticeDomain.ADD_TIME))
		);
		
		return createSuccessModelAndView("notice/page", noticePage);
	}
	
	@RequestMapping(value="/system/notice/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		SystemNotice notice = null;
		if(id != null && id > 0L) {
			notice = baseService.getById(SystemNotice.class, id, null);
		}
		
		return createSuccessModelAndView("notice/edit", notice);
	}
	
	@Validation(
		args={
			@Arg(field=SystemNoticeDomain.TITLE, text="公告标题", minLength=2, maxLength=25),
			@Arg(field=SystemNoticeDomain.CONTENT, text="公告内容", minLength=2, maxLength=1000)
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/notice/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(SystemNotice notice) throws Exception {
		return createSuccessJsonResponse(noticeService.editNotice(notice));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/notice/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		return createSuccessJsonResponse(noticeService.deleteNotice(id));
	}
}