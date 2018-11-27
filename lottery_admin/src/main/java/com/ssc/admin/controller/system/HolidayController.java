package com.ssc.admin.controller.system;

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
import com.ssc.entity.Holidays;
import com.ssc.entity.domain.HolidaysDomain;
import com.ssc.service.system.HolidayService;

@Controller
public class HolidayController extends AdminBaseController {
	@Autowired
	private HolidayService holidayService;
	
	@RequestMapping(value="/system/holiday/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("holiday/table", null);
	}
	
	@RequestMapping(value="/system/holiday/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<Holidays> holidayPage = baseService.getPage(
			Holidays.class,
			Collections.singletonList(Where.gt(HolidaysDomain.ID, 0)),
			1,
			Parameter.pageSize(9999)
		);
		
		ModelAndView view = createSuccessModelAndView("holiday/page", holidayPage);
		return view;
	}
	
	@RequestMapping(value="/system/holiday/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		Holidays holiday = null;
		if(id != null && id > 0L) {
			holiday = baseService.getById(Holidays.class, id, null);
		}
		
		return createSuccessModelAndView("holiday/edit", holiday);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/holiday/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Holidays holiday) throws Exception {
		holidayService.editHoliday(holiday);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/holiday/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		holidayService.delHoliday(id);
		
		return createSuccessJsonResponse(null);
	}
}