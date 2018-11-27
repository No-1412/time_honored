package com.ssc.admin.controller.system;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.annotation.Arg;
import com.ssc.core.annotation.Validation;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Admin;
import com.ssc.entity.AdminType;
import com.ssc.entity.domain.AdminDomain;
import com.ssc.entity.domain.AdminTypeDomain;

@Controller
public class AdminTypeController extends AdminBaseController {
	@RequestMapping(value="/system/adminType/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("adminType/table", null);
	}
	
	@RequestMapping(value="/system/adminType/getList", method=RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		Page<AdminType> page = baseService.getPage(
			AdminType.class,
			Collections.singletonList(Where.gt(AdminTypeDomain.ID, 0)),
			1,
			Parameter.pageSize(9999)
		);
		return createSuccessModelAndView("adminType/page", page);
	}
	
	@RequestMapping(value="/system/adminType/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		AdminType adminType = null;
		if(id != null && id > 0L) {
			adminType = baseService.getById(AdminType.class, id, null);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("adminType", adminType);
		dataMap.put("menus", getMenuList(adminType == null ? null : adminType.getId(), 2));
		
		return createSuccessModelAndView("adminType/edit", dataMap);
	}
	
	@Validation(
		args={
			@Arg(index=2, text="名称", minLength=3, maxLength=15)
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/adminType/editSubmit", method=RequestMethod.POST)
	public CustomResponse submit(Long id, String name, String[] menuId) throws Exception {
		String errorMsg = validateExist(
			AdminType.class, AdminTypeDomain.ID, id, AdminTypeDomain.NAME, name, "名称", null);
		if(StringUtils.isNotEmpty(errorMsg)) return createErrorJsonResponse(errorMsg);
		
		AdminType adminType = new AdminType();
		adminType.setName(name);
		adminType.setUpdTime(new Date());
		if(menuId != null && menuId.length > 0) {
			StringBuffer menuIds = new StringBuffer(",");
			for(String temp : menuId) {
				menuIds.append(temp).append(",");
			}
			adminType.setMenus(menuIds.toString());
		}
		
		adminType.setUpdTime(new Date());
		adminType.setUpdBy(getSessionUser().getCode());
		if(id == null || id <= 0L) {
			adminType.setUpdBy(adminType.getUpdBy());
			adminType.setAddTime(adminType.getUpdTime());
			baseService.insert(adminType);
		} else {
			baseService.updateById(adminType, id, false);
		}
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/adminType/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		List<Admin> adminList = baseService.getList(
			Admin.class,
			Collections.singletonList(Where.eq(AdminDomain.TYPE_ID, id)),
			Parameter.limit(1)
		);
		if(adminList != null && adminList.size() > 0) {
			return createErrorJsonResponse("该管理员类型已经有绑定管理员，无法被删除！");
		}
		
		baseService.deleteById(AdminType.class, id);
		return createSuccessJsonResponse(null);
	}
}