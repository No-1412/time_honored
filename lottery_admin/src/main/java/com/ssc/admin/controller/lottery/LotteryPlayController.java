package com.ssc.admin.controller.lottery;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.LotteryPlayBonus;
import com.ssc.entity.LotteryType;
import com.ssc.entity.Room;
import com.ssc.entity.custom.LotteryPlayForm;
import com.ssc.service.lottery.LotteryPlayService;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.lottery.RoomService;

@Controller
public class LotteryPlayController extends AdminBaseController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private LotteryTypeService lotteryTypeService;
	
	@Autowired
	private LotteryPlayService lotteryPlayService;
	
	@RequestMapping(value="/system/lotteryPlay/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		List<Room> roomList = roomService.getRoomList();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("roomList", roomList);
		dataMap.put("roomSize", roomList.size()+2);
		
		List<LotteryType> lotteryTypeList = new ArrayList<LotteryType>();
		List<LotteryType> resultList = lotteryTypeService.getAllLotteryType();
		for(LotteryType lotteryType : resultList) {
			if(lotteryType.getNum().equals(LotteryTypeService.XGLHC)
					|| lotteryType.getNum().equals(LotteryTypeService.JSLHC)) continue;
			
			lotteryTypeList.add(lotteryType);
		}
		dataMap.put("lotteryTypeList", lotteryTypeList);
		
		return createSuccessModelAndView("lotteryPlay/table", dataMap);
	}
	
	@RequestMapping(value="/system/lotteryPlay/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer num) throws Exception {
		Page<LotteryPlayForm> playPage = new Page<LotteryPlayForm>();
		
		List<LotteryPlayForm> playList = lotteryPlayService.getLotteryBigPlay(num);
		if(playList != null && playList.size() > 0) {
			playPage.setItems(playList);
			playPage.setPageNo(1);
			playPage.setTotalPage(1);
			playPage.setPageSize(playList.size());
			playPage.setTotalSize(playPage.getPageSize());
		}
		ModelAndView view = createSuccessModelAndView("lotteryPlay/page", playPage);
		List<Room> roomList = roomService.getRoomList();
		view.addObject("roomList", roomList);
		view.addObject("roomSize", roomList.size() + 2);
		
		setSessionAttribute("search-lottery", num);
		
		return view;
	}
	
	@RequestMapping(value="/system/lotteryPlay/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(String id) throws Exception {
		String[] ids = id.split("-");
		long roomId = Long.valueOf(ids[2]);
		int lotteryType = Integer.valueOf(ids[0]);
		int lotteryPlayType = Integer.valueOf(ids[1]);
		String[] viewName = lotteryPlayService.getPlayDetailPage(lotteryType, lotteryPlayType);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		setPlayDetailBonus(resultMap, lotteryType, roomId, lotteryPlayType);
		
		resultMap.put("roomId", roomId);
		resultMap.put("lotteryType", lotteryType);
		resultMap.put("lotteryPlayType", lotteryPlayType);
		
		return createSuccessModelAndView("lotteryPlay/" + viewName[0] + "/" + viewName[1], resultMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/lotteryPlay/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Long roomId, Integer lotteryType, Integer lotteryPlayType) throws Exception {
		Map<String, Object> playMap = new HashMap<String, Object>();
		setPlayDetailBonus(playMap, lotteryType, roomId, lotteryPlayType);
		
		HttpServletRequest request = getRequest();
		Set<String> paramSet = request.getParameterMap().keySet();
		
		String value = null;
		Date date = new Date();
		LotteryPlayBonus bonus = null;
		LotteryPlayForm playForm = null;
		String user = getSessionUser().getCode();
		List<LotteryPlayBonus> bonusList = new ArrayList<LotteryPlayBonus>();
		for(String key : paramSet) {
			if(!key.startsWith("n")) continue;
			playForm = (LotteryPlayForm)playMap.get(key);
			
			bonus = new LotteryPlayBonus();
			bonus.setRoomId(roomId);
			value = request.getParameter(key);
			if(StringUtils.isBlank(value)) bonus.setBonus(BigDecimal.ZERO);
			else bonus.setBonus(new BigDecimal(value));
			bonus.setPlayId(playForm.getId());
			bonus.setAddBy(user);
			bonus.setUpdBy(user);
			bonus.setAddTime(date);
			bonus.setUpdTime(date);
			
			bonusList.add(bonus);
		}
		
		//更新赔率
		lotteryPlayService.updateLotteryPlayBonus(lotteryType, roomId, lotteryPlayType, null, bonusList);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/lotteryPlay/updateCache", method=RequestMethod.POST)
	public CustomResponse updateCache() throws Exception {
		Integer lotteryType = (Integer) getSessionAttribute("search-lottery");
		if(lotteryType != null && lotteryType > 0) {
			lotteryPlayService.updateLotteryPlayCache(lotteryType);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	//玩法赔率
	private void setPlayDetailBonus(Map<String, Object> resultMap, int num, Long roomId, int playNum1) {
		List<LotteryPlayForm> playList = lotteryPlayService.getLotteryPlayBonusForAdmin(num, roomId, playNum1, null);
		if(playList == null || playList.size() <= 0) return;
		
		for(LotteryPlayForm play : playList) {
			resultMap.put("n"+play.getPlayNum3(), play);
		}
	}
}