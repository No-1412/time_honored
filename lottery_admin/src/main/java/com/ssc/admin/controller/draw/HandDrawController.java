package com.ssc.admin.controller.draw;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.bet.service.BetService;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.draw.service.DrawApiService;
import com.ssc.draw.service.DrawService;
import com.ssc.entity.LotteryDraw;
import com.ssc.entity.Member;
import com.ssc.entity.domain.LotteryDrawDomain;
import com.ssc.mapper.DrawMapper;
import com.ssc.period.service.PeriodService;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.member.MemberService;

@Controller
public class HandDrawController extends AdminBaseController {
	@Autowired
	private BetService betService;
	
	@Autowired
	private DrawMapper drawMapper;
	
	@Autowired
	private DrawService drawService;
	
	@Autowired
	private PeriodService periodService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DrawApiService drawApiService;
	
	@Autowired
	private LotteryTypeService lotteryTypeService;
	
	@RequestMapping(value="/system/handDraw/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("lotteryTypeList", lotteryTypeService.getAllLotteryType());
		dataMap.put("isAdmin", getSessionUser().getIsAdmin());
		
		return createSuccessModelAndView("handDraw/table", dataMap);
	}
	
	@RequestMapping(value="/system/handDraw/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer num, String period, Integer status, Integer status1) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(LotteryDrawDomain.NUM, num));
		if(StringUtils.isNotBlank(period)) {
			whereList.add(Where.eq(LotteryDrawDomain.PERIOD, period));
		}
		whereList.add(Where.lt(LotteryDrawDomain.PERIOD, periodService.getCurrentPeriod(num).getIssue()));
		
		List<Where> orWhereList = new ArrayList<Where>();
		orWhereList.add(Where.le(LotteryDrawDomain.STATUS, 0, true));
		orWhereList.add(Where.eq(LotteryDrawDomain.STATUS1, 0, true));
		whereList.add(Where.list(orWhereList));
		
		Page<LotteryDraw> drawPage = baseService.getPage(
			LotteryDraw.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(LotteryDrawDomain.PERIOD))
		);
		if(drawPage != null && drawPage.getItems() != null) {
			for(LotteryDraw draw : drawPage.getItems()) {
				if(draw.getStatus() != 1) {//未开奖
					draw.addExpand("zhudan", drawMapper.getTouzhuCount(num, draw.getPeriod()));
				} else {
					draw.addExpand("zhudan", 0);
				}
			}
		}
		
		ModelAndView view = createSuccessModelAndView("handDraw/page", drawPage);
		view.addObject("isAdmin", getSessionUser().getIsAdmin());
		view.addObject("lotteryTypeName", lotteryTypeService.getLotteryTypeByNum(num).getName());
		
		return view;
	}
	
	@RequestMapping(value="/system/handDraw/edit", method=RequestMethod.GET)
	public ModelAndView edit(Integer type) throws Exception {
		ModelAndView view = createSuccessModelAndView("handDraw/edit", null);
		view.addObject("type", type);
		view.addObject("lotteryTypeList", lotteryTypeService.getAllLotteryType());
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/system/handDraw/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(LotteryDraw draw, Integer type, String memberCode) throws Exception {
		if(type == 1) {
			baseService.insert(draw);
		} else {
			Member member = memberService.getMemberByCode(memberCode);
			if(member == null) return createErrorJsonResponse("会员账号不存在");
			
			drawService.doCancel(draw.getNum(), draw.getPeriod(), member.getId(), getSessionUser().getCode(), null);
		}
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/handDraw/third", method=RequestMethod.GET)
	public ModelAndView toThird(Long id) throws Exception {
		LotteryDraw lotteryDraw = baseService.getById(LotteryDraw.class, id, null);
		lotteryDraw.addExpand("lotteryTypeName", lotteryTypeService.getLotteryTypeByNum(lotteryDraw.getNum()).getName());
		return createSuccessModelAndView("handDraw/third", lotteryDraw);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/handDraw/thirdSubmit", method=RequestMethod.POST)
	public CustomResponse thirdSubmit(Long id, String content) throws Exception {
		String result = drawApiService.doDrawByHand(id, content);
		if(StringUtils.isNotBlank(result)) return createErrorJsonResponse(result);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/handDraw/platFormSubmit", method=RequestMethod.POST)
	public CustomResponse platFormSubmit(Long data) throws Exception {
		LotteryDraw lotteryDraw = baseService.getById(LotteryDraw.class, data, null);
		if(lotteryDraw == null) return createSuccessJsonResponse(null);
		
		int limit = drawService.getMaxDrawRecords(0);
		if(limit <= 0) {
			boolean result = drawService.doPlatformDraw(lotteryDraw, 2, limit);
			
			//更新缓存
			if(lotteryDraw.getNum().intValue() == 18){
				String dayFrom = DateUtil.getCurrentDateStr();
				String dayTo =dayFrom;
				updateDrawHistory(18, dayFrom, dayTo, 4);
			}
			if(result) return createSuccessJsonResponse(null);
		} else {
			int times = drawService.getMaxDrawTimes();
			for(int i=0;i<times;i++) {
				Boolean result = drawService.doPlatformDraw(lotteryDraw, 2, limit);
				if(result == null) {
					System.out.println(DateUtil.getCurrentTimeStr() + "-" + lotteryDraw.getNum() + "-wait for 1000 milliseconds.");
					Thread.sleep(1000);
				} else {
					if(!result) return createErrorJsonResponse("开奖失败，清稍后再试！");
					if(lotteryDraw.getStatus1() != 0){
						return createSuccessJsonResponse(null);
					}
				}
			}
		}
		
		return createErrorJsonResponse("开奖失败，请稍后再试！");
	}
	
	@ResponseBody
	@RequestMapping(value="/system/handDraw/cancel", method=RequestMethod.POST)
	public CustomResponse cancel(String data) throws Exception {
		try {
			String[] temp = data.split("-");
			String errorMsg = betService.doCancel(Integer.valueOf(temp[0]), temp[1], null, getSessionUser().getCode(), null);
			if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(null);
		} catch(Exception e) {
			e.printStackTrace();
			return createErrorJsonResponse("操作失败:"+e.getMessage());
		}
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/handDraw/delete", method=RequestMethod.POST)
	public CustomResponse cancel(Long data) throws Exception {
		try {
			baseService.deleteById(LotteryDraw.class, data);
		} catch(Exception e) {
			e.printStackTrace();
			return createErrorJsonResponse("操作失败:"+e.getMessage());
		}
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/handDraw/updateDrawHistory", method=RequestMethod.POST)
	public CustomResponse updateDrawHistory(Integer num, String dayFrom, String dayTo, Integer type) throws Exception {
		if(StringUtils.isBlank(dayFrom)) return createErrorJsonResponse("更新日期从不能 为空！");
		if(StringUtils.isBlank(dayTo)) return createErrorJsonResponse("更新日期到不能 为空！");
		if(dayFrom.compareTo(dayTo) > 0) return createErrorJsonResponse("更新日期从不能大于更新日期到！");
		
		List<String> dayList = new ArrayList<String>();
		while(true) {
			if(dayFrom.compareTo(dayTo) > 0) break;
			
			dayList.add(dayFrom);
			dayFrom = DateUtil.dateFormat(DateUtil.addDay(DateUtil.dateParse(dayFrom), 1));
		}
		
		try {
			StringBuffer result = new StringBuffer();
			for(String day : dayList) {
				String errorMsg = drawApiService.doDrawFromKaiCaiApiByDay(num, day, type);
				if(StringUtils.isNotBlank(errorMsg)) {
					result.append(day + "：" + errorMsg).append("</br>");
				} else if(type == 1){
					Thread.sleep(5000);
				}
			}
			
			if(StringUtils.isNotBlank(result.toString())) return createErrorJsonResponse(result.toString());
		} catch(Exception e) {
			e.printStackTrace();
			return createErrorJsonResponse("操作失败！");
		}
		
		return createSuccessJsonResponse(null);
	}
}