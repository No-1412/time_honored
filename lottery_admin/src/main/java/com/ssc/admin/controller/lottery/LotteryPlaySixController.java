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
import com.ssc.entity.Room;
import com.ssc.entity.custom.LotteryPlayForm;
import com.ssc.service.lottery.LotteryPlayService;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.lottery.RoomService;

@Controller
public class LotteryPlaySixController extends AdminBaseController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private LotteryPlayService lotteryPlayService;
	
	@RequestMapping(value="/system/lotteryPlaySix/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		return createSuccessModelAndView("lotteryPlaySix/table", dataMap);
	}
	
	@RequestMapping(value="/system/lotteryPlaySix/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer num) throws Exception {
		Page<LotteryPlayForm> playPage = new Page<LotteryPlayForm>();
		
		List<LotteryPlayForm> playList = lotteryPlayService.getLotteryBigPlay(LotteryTypeService.XGLHC);
		if(playList != null && playList.size() > 0) {
			//特码A返水
			for(LotteryPlayForm form : playList) {
				if(form.getPlayNum1() == 1) {
					form.setPlayNum2(2);
					form.setPlayName2("特码B");
					break;
				}
			}
			
			LotteryPlayForm form = new LotteryPlayForm();
			form.setPlayName1("特码");
			form.setPlayName1("特码A");
			form.setPlayNum1(1);
			form.setPlayNum2(1);
			Room room = roomService.getRoomMap(1).get("0");
			form.setBonus(room.getReward().doubleValue());
			playList.add(0, form);
			
			playPage.setItems(playList);
			playPage.setPageNo(1);
			playPage.setTotalPage(1);
			playPage.setPageSize(playList.size());
			playPage.setTotalSize(playPage.getPageSize());
		}
		
		return createSuccessModelAndView("lotteryPlaySix/page", playPage);
	}
	
	@RequestMapping(value="/system/lotteryPlaySix/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(String id) throws Exception {
		String[] ids = id.split("-");
		int playNum1 = Integer.valueOf(ids[0]);
		Integer playNum2 = ids.length >= 2 ? Integer.valueOf(ids[1]) : null;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		setPlayDetailBonus(resultMap, LotteryTypeService.XGLHC, 0L, playNum1, playNum2);
		
		resultMap.put("playNum1", playNum1);
		resultMap.put("playNum2", playNum2);
		if(playNum1 == 1 && playNum2 == 1) {//特码A
			resultMap.put("reward", roomService.getRoomMap(1).get("0").getReward().doubleValue());
		}
		
		return createSuccessModelAndView("lotteryPlaySix/dtl/" + getViewName(playNum1, playNum2), resultMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/lotteryPlaySix/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(String reward, Integer playNum1, Integer playNum2) throws Exception {
		Long roomId = 0L;
		Integer lotteryType = LotteryTypeService.XGLHC;
		
		Map<String, Object> playMap = new HashMap<String, Object>();
		setPlayDetailBonus(playMap, lotteryType, roomId, playNum1, playNum2);
		
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
		
		//更新特码A返水
		if(playNum1 == 1 && playNum2 == 1) {
			Room room = roomService.getRoomMap(1).get("0");
			if(StringUtils.isNotBlank(reward) && !new BigDecimal(reward).equals(room.getReward())) {
				room.setReward(new BigDecimal(reward));
				roomService.editRoom(room);
			}
		}
		
		//更新赔率
		lotteryPlayService.updateLotteryPlayBonus(lotteryType, roomId, playNum1, playNum2, bonusList);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/lotteryPlaySix/updateCache", method=RequestMethod.POST)
	public CustomResponse updateCache() throws Exception {
		lotteryPlayService.updateLotteryPlayCache(LotteryTypeService.XGLHC);
		return createSuccessJsonResponse(null);
	}
	
	private String getViewName(int playNum1, Integer playNum2) {
		if(playNum1 == 1 && playNum2 == 1) return "tma";
		if(playNum1 == 1 && playNum2 == 2) return "tmb";
		if(playNum1 == 2) return "sm";
		if(playNum1 == 3) return "sb";
		if(playNum1 == 4) return "tx";
		if(playNum1 == 5) return "hx";
		if(playNum1 == 6) return "tws";
		if(playNum1 == 7) return "zm";
		if(playNum1 == 8) return "zmt" + playNum2;
		if(playNum1 == 9) return "zm16";
		if(playNum1 == 10) return "wx";
		if(playNum1 == 11) return "ptyxws";
		if(playNum1 == 12) return "zx";
		if(playNum1 == 13) return "sb7";
		if(playNum1 == 14) return "zongxiao";
		if(playNum1 == 15) return "zxbz";
		if(playNum1 == 16) return "lxlw" + playNum2;
		if(playNum1 == 17) return "lm";
		
		return null;
	}
	
	//玩法赔率
	private void setPlayDetailBonus(Map<String, Object> resultMap, int num, Long roomId, int playNum1, Integer playNum2) {
		List<LotteryPlayForm> playList = lotteryPlayService.getLotteryPlayBonusForAdmin(num, roomId, playNum1, playNum2);
		if(playList == null || playList.size() <= 0) return;
		
		for(LotteryPlayForm play : playList) {
			resultMap.put("n"+play.getPlayNum3(), play);
		}
	}
}