package com.ssc.admin.controller.lottery;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.draw.service.LhcDrawService;
import com.ssc.entity.LotteryDraw;
import com.ssc.entity.domain.LotteryDrawDomain;
import com.ssc.period.service.PeriodService;
import com.ssc.service.lottery.LotteryTypeService;

@Controller
public class LhcOpenPlanController extends AdminBaseController {
	@Autowired
	private LhcDrawService drawService;
	
	@Autowired
	private PeriodService periodService;
	
	@RequestMapping(value="/lottery/lhc/plan", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("lotteryType/lhc/plan", null);
	}
	
	@RequestMapping(value="/lottery/lhc/getPlanList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, String period) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(StringUtils.isNotBlank(period)) {
			whereList.add(Where.eq(LotteryDrawDomain.PERIOD, period));
		}
		whereList.add(Where.eq(LotteryDrawDomain.STATUS, 0));
		whereList.add(Where.eq(LotteryDrawDomain.NUM, LotteryTypeService.XGLHC));
		whereList.add(Where.gt(LotteryDrawDomain.OPEN_TIME, DateUtil.getCurrentTimeStr()));
		Page<LotteryDraw> resultPage = baseService.getPage(
			LotteryDraw.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.orderBy(OrderBy.asc(LotteryDrawDomain.PERIOD)),
			Parameter.queryColumn(new String[]{LotteryDrawDomain.ID, LotteryDrawDomain.PERIOD, LotteryDrawDomain.OPEN_TIME})
		);
		
		if(resultPage != null && resultPage.getItems() != null) {
			for(LotteryDraw draw : resultPage.getItems()) {
				draw.setPeriodDay(DateUtil.getWeekOfDate(DateUtil.dateParse(draw.getOpenTime())));
			}
		}
		
		return createSuccessModelAndView("lotteryType/lhc/planPage", resultPage);
	}
	
	@RequestMapping(value="/lottery/lhc/planEdit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		LotteryDraw draw = null;
		if(id != null && id > 0L) {
			draw = baseService.getById(
				LotteryDraw.class,
				id,
				new String[]{LotteryDrawDomain.ID,LotteryDrawDomain.PERIOD,LotteryDrawDomain.OPEN_TIME});
		}
		
		return createSuccessModelAndView("lotteryType/lhc/planEdit", draw);
	}
	
	@Validation(
		args={
			@Arg(index=2, text="期数"),
			@Arg(index=3, text="开奖时间")
		}
	)
	@ResponseBody
	@RequestMapping(value="/lottery/lhc/planEditSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(Long id, String period, String openTime) throws Exception {
		Date date = null;
		try {
			date = DateUtil.timeParse(openTime);
		} catch(Exception e) {
			return createErrorJsonResponse("日期格式错误，必须先是yyyy-MM-dd hh:mm:ss");
		}
		if(date.compareTo(new Date()) < 0) return createErrorJsonResponse("日期不能小于当前时间！");
		
		LotteryDraw draw = new LotteryDraw();
		draw.setId(id);
		draw.setOpenTime(openTime);
		draw.setPeriod(period);
		draw.setPeriod1(period.substring(4));
		draw.setPeriodDay(openTime.replace("-", "").substring(0, 4));
		drawService.editPlan(draw, false);
		
		periodService.getCurrentPeriod(LotteryTypeService.XGLHC, true);
		
		return createSuccessJsonResponse(null);
	}
}