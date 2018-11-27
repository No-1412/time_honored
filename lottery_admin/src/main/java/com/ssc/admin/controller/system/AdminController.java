package com.ssc.admin.controller.system;

import java.util.ArrayList;
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
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Option;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.SecurityUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Admin;
import com.ssc.entity.AdminType;
import com.ssc.entity.domain.AdminDomain;
import com.ssc.entity.domain.AdminTypeDomain;

@Controller
public class AdminController extends AdminBaseController {
	@RequestMapping(value="/system/admin/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("admin/table", null);
	}
	
	@RequestMapping(value="/system/admin/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(isAdmin()) {
			whereList.add(Where.gt(AdminDomain.ID, 0));
		} else {
			whereList.add(Where.notEq(AdminDomain.IS_ADMIN, 1));
		}
		
		Map<Long, String> adminTypeMap = new HashMap<Long, String>();
		List<AdminType> adminTypeList = baseService.getAll(AdminType.class);
		if(adminTypeList != null && adminTypeList.size() > 0) {
			for(AdminType type : adminTypeList) adminTypeMap.put(type.getId(), type.getName());
		}
		
		Page<Admin> adminPage = baseService.getPage(
			Admin.class,
			whereList,
			1,
			Parameter.pageSize(9999)
		);
		if(adminPage != null && adminPage.getItemsCount() > 0) {
			for(Admin admin : adminPage.getItems()) admin.addExpand("type", adminTypeMap.get(admin.getTypeId()));
		}
		
		return createSuccessModelAndView("admin/page", adminPage);
	}
	
	@RequestMapping(value="/system/admin/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		Admin admin = null;
		if(id != null && id > 0L) {
			admin = baseService.getById(Admin.class, id, null);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("admin", admin);
		dataMap.put("adminType", getAdminTypeOptions());
		dataMap.put("adminStatus", optionUtil.getAdminTypeStatus());
		
		return createSuccessModelAndView("admin/edit", dataMap);
	}
	
	@Validation(
		args={
			@Arg(field=AdminDomain.CODE, text="账号", minLength=3, maxLength=15),
			@Arg(field=AdminDomain.NAME, text="名称", maxLength=15),
			@Arg(field=AdminDomain.TYPE_ID, text="管理员类型"),
			@Arg(field=AdminDomain.STATUS, text="状态")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/admin/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(Admin admin) throws Exception {
		if(admin.getId() == null || admin.getId() <= 0L) {
			if(StringUtils.isEmpty(admin.getPassword())) return createErrorJsonResponse("密码不能为空");
		}
		
		String errorMsg = validateExist(Admin.class, AdminDomain.ID, admin.getId(), AdminDomain.CODE, admin.getCode(), "账号", null);
		if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(errorMsg);
		
		if(StringUtils.isNotBlank(admin.getPassword())) {
			admin.setPassword(SecurityUtil.md5(SecurityUtil.sha1(admin.getPassword())));
		}
		admin.setUpdTime(new Date());
		admin.setUpdBy(getSessionUser().getCode());
		if(admin.getId() == null || admin.getId() <= 0L) {
			admin.setAddBy(admin.getUpdBy());
			admin.setAddTime(admin.getUpdTime());
			baseService.insert(admin);
		} else {
			baseService.updateById(admin, admin.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/admin/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		baseService.deleteById(Admin.class, id);
		
		return createSuccessJsonResponse(null);
	}
	
	private List<Option> getAdminTypeOptions() {
		return optionUtil.generateOption(AdminType.class, null, AdminTypeDomain.ID, AdminTypeDomain.NAME, OrderBy.asc(AdminTypeDomain.NAME));
	}
}