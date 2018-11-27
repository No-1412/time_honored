package com.ssc.admin.controller.blanklist;

import java.util.Collections;

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
import com.ssc.entity.AdminBlankIp;
import com.ssc.entity.domain.AdminBlankIpDomain;
import com.ssc.service.blanklist.BlankListService;
@Controller
public class MemberBlankListController extends AdminBaseController{
	
	@Autowired
	private BlankListService blankListService;
	
	@RequestMapping(value="/system/blanklist/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("blanklist/table", null);
	}
	
	@RequestMapping(value="/system/blanklist/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer idx, String value, Integer status) throws Exception {
		Page<AdminBlankIp> ipPage = baseService.getPage(
			AdminBlankIp.class,
			Collections.singletonList(Where.gt(AdminBlankIpDomain.ID, 0L)),
			page == null ? 1 : page + 1,
			Parameter.orderBy(OrderBy.desc(AdminBlankIpDomain.ID))
		);
		return createSuccessModelAndView("blanklist/page", ipPage);
	}
	
	@RequestMapping(value="/system/blanklist/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("blanklist/edit", baseService.getById(AdminBlankIp.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/blanklist/editSubmit", method=RequestMethod.POST)
	public CustomResponse blankListSubmit(AdminBlankIp adminBlankIp) throws Exception {
		return createSuccessJsonResponse(blankListService.edit(adminBlankIp));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/blanklist/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		return createSuccessJsonResponse(blankListService.delete(id));
	}
}
