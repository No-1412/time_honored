package com.ssc.admin.controller.access;

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
import com.ssc.entity.AdminWhiteIp;
import com.ssc.entity.domain.AdminWhiteIpDomain;
import com.ssc.service.admin.AccessService;

@Controller
public class AccessController extends AdminBaseController {
	@Autowired
	private AccessService accessService;
	
	@RequestMapping(value="/system/access/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("access/table", null);
	}
	
	@RequestMapping(value="/system/access/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer idx, String value, Integer status) throws Exception {
		Page<AdminWhiteIp> ipPage = baseService.getPage(
			AdminWhiteIp.class,
			Collections.singletonList(Where.gt(AdminWhiteIpDomain.ID, 0L)),
			page == null ? 1 : page + 1,
			Parameter.orderBy(OrderBy.desc(AdminWhiteIpDomain.ID))
		);
		
		return createSuccessModelAndView("access/page", ipPage);
	}
	
	@RequestMapping(value="/system/access/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("access/edit", baseService.getById(AdminWhiteIp.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/access/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(AdminWhiteIp adminWhiteIp) throws Exception {
		return createSuccessJsonResponse(accessService.edit(adminWhiteIp));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/access/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		return createSuccessJsonResponse(accessService.delete(id));
	}
}