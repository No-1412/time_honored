package com.ssc.admin.controller.system;

import java.util.ArrayList;
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
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.entity.Menu;
import com.ssc.entity.domain.MenuDomain;

@Controller
public class MenuController extends AdminBaseController {
	@RequestMapping(value="/system/menu/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("menu/table", null);
	}
	
	@RequestMapping(value="/system/menu/getList", method=RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		List<Menu> menuList = baseService.getAll(
			Menu.class,
			Parameter.orderBy(OrderBy.asc(MenuDomain.SORT1))
		);
		
		Map<String, Object> dataMap = null;
		List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
		for(Menu menu : menuList) {
			dataMap = new HashMap<String, Object>();
			dataMap.put("id", menu.getId());
			dataMap.put("mc", menu.getName());
			dataMap.put("url", menu.getUrl());
			dataMap.put("sx", menu.getSort());
			if(menu.getPid() == null || menu.getPid() <= 0L) {
				dataMap.put("cdlx", "菜单组");
			} else {
				dataMap.put("cdlx", "菜单");
				dataMap.put("mc", "----" + menu.getName());
			}
			dataMap.put("cjsj", DateUtil.dateTimeFormat(menu.getAddTime()));
			dataMap.put("xgsj", DateUtil.dateTimeFormat(menu.getUpdTime()));
			
			dataList.add(dataMap);
		}
		
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		page.setItems(dataList);
		page.setPageNo(1);
		page.setPageSize(page.getItems().size());
		page.setTotalPage(1);
		page.setTotalSize(page.getPageSize());
		return createSuccessModelAndView("menu/page", page);
	}
	
	@RequestMapping(value="/system/menu/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		//获取一级菜单
		List<Menu> topMenuList = baseService.getList(
			Menu.class,
			Collections.singletonList(Where.isNull(MenuDomain.PID)),
			Parameter.queryColumn(new String[]{MenuDomain.ID, MenuDomain.NAME}),
			Parameter.orderBy(OrderBy.asc(MenuDomain.SORT))
		);
		
		Menu menu = null;
		if(id != null && id > 0L) {
			menu = baseService.getById(Menu.class, id, null);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("menu", menu);
		dataMap.put("topMenu", topMenuList);
		
		return createSuccessModelAndView("menu/edit", dataMap);
	}
	
	@Validation(
		args={
			@Arg(index=3, text="名称", minLength=3, maxLength=15),
			@Arg(index=4, text="菜单类型"),
			@Arg(index=6, text="顺序")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/menu/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(Long id, Long pid, String name, Integer lx, String url, Integer sort) throws Exception {
		Menu menu = baseService.getById(Menu.class, id, null);
		if(menu == null) menu = new Menu();
		
		menu.setId(id);
		menu.setPid(pid);
		menu.setName(name);
		menu.setUrl(url);
		menu.setSort(sort);
		menu.setSort1(sort);
		if(lx == 0) {
			menu.setPid(null);
			menu.setSort1(menu.getSort()*100);
			menu.setImage("fa-bar-chart-o");
			
			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.eq(MenuDomain.PID, menu.getId()));
			Menu subMenu = new Menu();
			subMenu.addExpression(MenuDomain.SORT1, (sort*100)+"+sort");
			baseService.update(subMenu, whereList, false);
		} else {
			Menu pMenu = baseService.getById(Menu.class, pid, new String[]{MenuDomain.SORT});
			menu.setSort1(menu.getSort() + pMenu.getSort()*100);
		}
		
		menu.setUpdTime(new Date());
		menu.setUpdBy(getSessionUser().getCode());
		if(id != null && id > 0L) {
			baseService.updateById(menu, id, true);
		} else {
			menu.setAddBy(menu.getUpdBy());
			menu.setAddTime(menu.getUpdTime());
			baseService.insert(menu);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/menu/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		baseService.deleteById(Menu.class, id);
		
		return createSuccessJsonResponse(null);
	}
}