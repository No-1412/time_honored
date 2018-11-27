package com.ssc.admin.controller.lottery;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.ssc.entity.Room;
import com.ssc.entity.domain.RoomDomain;
import com.ssc.service.lottery.RoomService;

@Controller
public class RoomController extends AdminBaseController {
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value="/system/room/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("room/table", null);
	}
	
	@RequestMapping(value="/system/room/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<Room> roomPage = baseService.getPage(
			Room.class,
			Collections.singletonList(Where.gt(RoomDomain.ID, 0)),
			1,
			Parameter.pageSize(9999)
		);
		
		ModelAndView view = createSuccessModelAndView("room/page", roomPage);
		return view;
	}
	
	@RequestMapping(value="/system/room/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		Room room = null;
		if(id != null && id > 0L) {
			room = baseService.getById(Room.class, id, null);
		}
		
		return createSuccessModelAndView("room/edit", room);
	}
	
	@Validation(
		args={
			@Arg(field=RoomDomain.NAME, text="名称"),
			@Arg(field=RoomDomain.REWARD, text="返点", minValue="0")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/room/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Room room) throws Exception {
		roomService.editRoom(room);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/room/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		roomService.delRoom(id);
		
		return createSuccessJsonResponse(null);
	}
}