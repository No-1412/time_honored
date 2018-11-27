package com.ssc.admin.controller.zodiac;

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
import com.ssc.core.service.BaseService;
import com.ssc.entity.ConfigLhcAnimals;
import com.ssc.entity.domain.ConfigLhcAnimalsDomain;
import com.ssc.service.system.ConfigLhcAnimalsService;

@Controller
public class ZodiacManagementController extends AdminBaseController{
	
	@Autowired
	private ConfigLhcAnimalsService configLhcAnimalsService;
	@Autowired
	private BaseService baseService;
	
	@RequestMapping(value="/system/zodiac/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("zodiac/table", null);
	}
	
	@RequestMapping(value="/system/zodiac/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer idx, String value, Integer status) throws Exception {
		Page<ConfigLhcAnimals> ipPage = baseService.getPage(
			ConfigLhcAnimals.class,
			Collections.singletonList(Where.gt(ConfigLhcAnimalsDomain.ID, 0L)),
			page == null ? 1 : page + 1,
			Parameter.orderBy(OrderBy.desc(ConfigLhcAnimalsDomain.ID))
		);
		return createSuccessModelAndView("zodiac/page", ipPage);
	}
	
	@RequestMapping(value="/system/zodiac/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("zodiac/edit", baseService.getById(ConfigLhcAnimals.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/zodiac/editSubmit", method=RequestMethod.POST)
	public CustomResponse zodiacSubmit(ConfigLhcAnimals configLhcAnimals) throws Exception {
		if(configLhcAnimals.getLhcYear() == null
				|| "".equals(configLhcAnimals.getLhcYear())) {
			return createErrorJsonResponse("年份不能为空！");
		}
		if(configLhcAnimals.getLhcAnimals() == null
				|| "".equals(configLhcAnimals.getLhcAnimals())) {
			return createErrorJsonResponse("生肖不能为空！");
		}
		String result = configLhcAnimalsService.edit(configLhcAnimals);
		if(result!=null&&result.equals("update")){
			return createErrorJsonResponse("已存在相同的年份设置，请修改年份！");
		}
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/zodiac/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		return createSuccessJsonResponse(configLhcAnimalsService.delete(id));
	}

}
