package com.ssc.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssc.core.constant.Constant;
import com.ssc.core.controller.BaseController;
import com.ssc.core.dao.query.Where;
import com.ssc.entity.Admin;
import com.ssc.entity.AdminChoice;
import com.ssc.entity.AdminType;
import com.ssc.entity.custom.AdminMenu;
import com.ssc.entity.domain.AdminChoiceDomain;
import com.ssc.entity.domain.AdminTypeDomain;
import com.ssc.service.admin.AdminService;
import com.ssc.service.system.ConfigService;

public class AdminBaseController extends BaseController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	protected ConfigService configService;
	
	public Admin getSessionUser() {
		return (Admin)getSessionAttribute(Constant.SESSION_USER);
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> getChoiceList(int type, boolean refresh) throws Exception {
		List<Integer> resultList = (List<Integer>) getSessionAttribute("choice_list_" + type);
		if(refresh || resultList == null || resultList.size() <= 0) {
			Admin admin = getSessionUser();
			if(admin == null) return resultList;
			
			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.eq(AdminChoiceDomain.TYPE, type));
			whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
			List<AdminChoice> choiceList = baseService.getList(AdminChoice.class, whereList);
			
			resultList = new ArrayList<Integer>();
			if(choiceList != null && choiceList.size() > 0) {
				for(AdminChoice choice : choiceList) {
					resultList.add(Integer.valueOf(choice.getValue()));
				}
			}
		}
		
		return resultList;
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> getMenuList(Long id, int type) throws Exception {
		AdminType adminType = baseService.getById(AdminType.class, id, new String[]{AdminTypeDomain.MENUS});
		if(type == 1 && adminType == null) return null;
		
		List<AdminMenu> menus = adminService.getMenus(id);
		menus.add(null);
		
		Map<String, Object> map = null;
		Map<String, Object> subMap = null;
		Set<Long> pids = new HashSet<Long>();
		List<Map> menuList = new ArrayList<Map>();
		List<Map> subMenuList = new ArrayList<Map>();
		String cdqx = adminType == null ? "" : adminType.getMenus();
		for(AdminMenu menu : menus) {
			if(menu == null || !pids.contains(menu.getPid())) {
				if(map != null) {
					if(subMenuList != null && subMenuList.size() > 0) {
						map.put("subMenuList", subMenuList);
						menuList.add(map);
					}
					
					subMenuList = new ArrayList<Map>();
				}
				if(menu == null) continue;
				
				pids.add(menu.getPid());
				
				map = new HashMap<String, Object>();
				map.put("name", menu.getPmc());
				map.put("image", menu.getImage());
			}
			
			subMap = new HashMap<String, Object>();
			subMap.put("id", menu.getId());
			subMap.put("name", menu.getMc());
			subMap.put("url", menu.getUrl());
			subMap.put("checked", cdqx.contains("," + menu.getId() + ",") ? "checked" : "");
			if(!isAdmin() && !"1".equals(configService.getValueByNid("is_reward_set_open"))) {
				if("system/lotteryPlay/index".equals(menu.getUrl()) || "system/lotteryPlaySix/index".equals(menu.getUrl())) {
					continue;
				}
			}
			
			if(type == 2 || (type == 1 && "checked".equals(subMap.get("checked")))) {
				subMenuList.add(subMap);
			}
		}
		
		return menuList;
	}
	
	public boolean isAdmin() {
		return getSessionUser().getIsAdmin() == 1;
	}
}