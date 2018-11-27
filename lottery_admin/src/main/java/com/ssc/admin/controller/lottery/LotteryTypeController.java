package com.ssc.admin.controller.lottery;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.LotteryType;
import com.ssc.entity.Room;
import com.ssc.entity.domain.AdminDomain;
import com.ssc.entity.domain.LotteryTypeDomain;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.lottery.RoomService;

@Controller
public class LotteryTypeController extends AdminBaseController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private LotteryTypeService lotteryTypeService;
	
	@RequestMapping(value="/system/lotteryType/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("lotteryType/table", null);
	}
	
	@RequestMapping(value="/system/lotteryType/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<LotteryType> lotteryTypePage = baseService.getPage(
			LotteryType.class,
			Collections.singletonList(Where.gt(LotteryTypeDomain.ID, 0)),
			1,
			Parameter.pageSize(9999),
			Parameter.orderBy(OrderBy.desc(LotteryTypeDomain.STATUS), OrderBy.asc(LotteryTypeDomain.SORT))
		);
		
		if(lotteryTypePage != null && lotteryTypePage.getItems() != null) {
			Map<String, Room> roomMap = roomService.getRoomMap(0);
			Room roomA = roomMap.get("1");
			
			Room room = null;
			Room defaultRoom = null;
			StringBuffer rooms = null;
			for(LotteryType type : lotteryTypePage.getItems()) {
				if(StringUtils.isBlank(type.getRooms())) {
					type.addExpand("defaultRoom", roomA.getName());
					type.addExpand("roomInfo", roomA.getName() + "，无返水");
				} else {
					defaultRoom = roomMap.get(type.getDefaultRoom()+"");
					if(type.getDefaultRoom() == null || type.getDefaultRoom() <= 0
							|| !(","+type.getRooms()+",").contains(","+type.getDefaultRoom()+",")) {
						defaultRoom = roomA;
					}
					rooms = new StringBuffer();
					for(String roomId : type.getRooms().split(",")) {
						if(StringUtils.isBlank(roomId) || !roomMap.containsKey(roomId)) continue;
						
						room = roomMap.get(roomId);
						if(defaultRoom == null) defaultRoom = room;
						if(room.getReward() == null || BigDecimal.ZERO.compareTo(room.getReward()) >= 0) {
							rooms.append("<br>").append(room.getName()).append("，无返水");
						} else {
							rooms.append("<br>").append(room.getName()).append("，返水").append(room.getReward()).append("%");
						}
					}
					type.addExpand("defaultRoom", defaultRoom == null ? roomA.getName() : defaultRoom.getName());
					type.addExpand("roomInfo", rooms.toString().replaceFirst("<br>", ""));
				}
			}
		}
		return createSuccessModelAndView("lotteryType/page", lotteryTypePage);
	}
	
	@RequestMapping(value="/system/lotteryType/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		LotteryType lotteryType = null;
		if(id != null && id > 0L) lotteryType = baseService.getById(LotteryType.class, id, null);
		
		if(lotteryType == null) lotteryType = new LotteryType();
		String rooms = lotteryType.getRooms();
		if(StringUtils.isBlank(rooms)) rooms = ",";
		else rooms = "," + rooms + ",";
		
		Room room = null;
		List<Room> roomList = new ArrayList<Room>();
		Map<String, Room> roomMap = roomService.getRoomMap(0);
		lotteryType.setRooms(","+lotteryType.getRooms()+",");
		for(String roomId : roomMap.keySet()) {
			if("1".equals(roomId)) continue;
			
			room = roomMap.get(roomId);
			if(rooms.contains(","+roomId+",")) {
				room.addExpand("checked", "checked");
			}
			roomList.add(room);
		}
		
		lotteryType.addExpand("roomList", roomList);
		lotteryType.addExpand("defaultRoom", roomMap.get("1"));
		
		return createSuccessModelAndView("lotteryType/edit", lotteryType);
	}
	
	@Validation(
		args={
			@Arg(field=LotteryTypeDomain.PRE_CLOSE_TIME, text="提前封盘时间", minValue="5"),
			@Arg(field=AdminDomain.STATUS, text="状态")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/lotteryType/editSubmit", method=RequestMethod.POST)
	public CustomResponse lotteryTypeSubmit(LotteryType lotteryType, String[] roomId) throws Exception {
		String rooms = "1";
		boolean isDefaultRoomExist = false;
		if(roomId != null && roomId.length > 0) {
			for(String room : roomId) {
				if("1".equals(room)) continue;
				
				rooms = rooms + "," + room;
				if(room.equals(lotteryType.getDefaultRoom()+"")) {
					isDefaultRoomExist = true;
				}
			}
		}
		lotteryType.setRooms(rooms);
		if(!isDefaultRoomExist) lotteryType.setDefaultRoom(1);
		
		if(lotteryType.getId() == null || lotteryType.getId() <= 0L) {
		} else {
			if(StringUtils.isBlank(lotteryType.getApiUrl())) lotteryType.setApiUrl("NULL");
			lotteryType.setUpdTime(new Date());
			lotteryType.setUpdBy(getSessionUser().getCode());
			lotteryTypeService.editLotteryType(lotteryType);
		}
		
		return createSuccessJsonResponse(null);
	}
}