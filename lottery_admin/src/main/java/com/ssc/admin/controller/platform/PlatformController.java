package com.ssc.admin.controller.platform;

import java.util.Collections;

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
import com.ssc.entity.Platform;
import com.ssc.entity.domain.PlatformDomain;

@Controller
public class PlatformController extends AdminBaseController {
	@RequestMapping(value="/system/platform/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("platform/table", null);
	}
	
	@RequestMapping(value="/system/platform/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<Platform> platFormPage = baseService.getPage(
			Platform.class,
			Collections.singletonList(Where.ge(PlatformDomain.ID, 0)),
			1,
			Parameter.pageSize(9999)
		);
		return createSuccessModelAndView("platform/page", platFormPage);
	}
	
	@RequestMapping(value="/system/platform/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("platform/edit", baseService.getById(Platform.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/platform/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(Platform platform) throws Exception {
		if(platform.getId() == null || platform.getId() <= 0L) {
			baseService.insert(platform);
		} else {
			baseService.updateById(platform, platform.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/platform/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		baseService.deleteById(Platform.class, id);
		
		return createSuccessJsonResponse(null);
	}
}