package com.ssc.admin.controller.member;

import java.util.Collections;

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
import com.ssc.core.entity.Page;
import com.ssc.entity.MemberIpFilter;
import com.ssc.entity.domain.MemberIpFilterDomain;
import com.ssc.service.member.MemberIpFilterService;

@Controller
public class MemberIpFilterController extends AdminBaseController {
	@Autowired
	private MemberIpFilterService memberIpFilterService;
	
	@RequestMapping(value="/system/memberIpFilter/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("memberIpFilter/table", null);
	}
	
	@RequestMapping(value="/system/memberIpFilter/getList", method=RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		Page<MemberIpFilter> page = baseService.getPage(
			MemberIpFilter.class,
			Collections.singletonList(Where.gt(MemberIpFilterDomain.ID, 0)),
			1,
			Parameter.pageSize(9999)
		);
		return createSuccessModelAndView("memberIpFilter/page", page);
	}
	
	@RequestMapping(value="/system/memberIpFilter/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("memberIpFilter/edit", baseService.getById(MemberIpFilter.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/memberIpFilter/editSubmit", method=RequestMethod.POST)
	public CustomResponse submit(MemberIpFilter memberIpFilter) throws Exception {
		return createSuccessJsonResponse(memberIpFilterService.edit(memberIpFilter));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/memberIpFilter/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		return createSuccessJsonResponse(memberIpFilterService.delete(id));
	}
}