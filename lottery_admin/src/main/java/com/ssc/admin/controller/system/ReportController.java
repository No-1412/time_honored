package com.ssc.admin.controller.system;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.NumberUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.ActivityLog;
import com.ssc.entity.AgentBack;
import com.ssc.entity.Config;
import com.ssc.entity.DailyReport;
import com.ssc.entity.LotteryTouzhu;
import com.ssc.entity.LotteryType;
import com.ssc.entity.Member;
import com.ssc.entity.constant.RechargeConstant;
import com.ssc.entity.custom.RechargeActivity;
import com.ssc.entity.domain.ActivityLogDomain;
import com.ssc.entity.domain.LotteryTouzhuDomain;
import com.ssc.mapper.ReportMapper;
import com.ssc.service.agent.AgentBackService;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.member.MemberAccountService;
import com.ssc.service.member.MemberService;

@Controller
public class ReportController extends AdminBaseController {
	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LotteryTypeService lotteryTypeService;
	
	
	@Autowired
	private AgentBackService agentBackService;
	
	@Autowired
	private MemberAccountService memberAccountService;
	
	
	@RequestMapping(value="/system/report/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("report/table", DateUtil.getCurrentDateStr());
	}
	
	@RequestMapping(value="/system/report/getList", method=RequestMethod.GET)
	public ModelAndView getList(String dateFrom, String dateTo) throws Exception {
		String day = "1";
		Date dateStart = null, dateEnd = null;
		String currentDate = DateUtil.getCurrentTimeStr();
		String today = currentDate.substring(0, 10);
		String yesterday = DateUtil.dateFormat(DateUtil.addDay(new Date(), -1));
		if(yesterday.compareTo(dateTo) > 0) {
			day = "0";
		} else {
			boolean isContainToday = dateFrom.compareTo(today) <= 0 && dateTo.compareTo(today) >= 0;
			boolean isContainYesterday = dateFrom.compareTo(yesterday) <= 0 && dateTo.compareTo(yesterday) >= 0;
			if(isContainYesterday && "00:15:00".compareTo(currentDate.substring(11)) > 0) {
				dateStart = DateUtil.timeParse(yesterday + " 00:00:00");
			} else if(dateStart == null && isContainToday) {
				dateStart = DateUtil.timeParse(today + " 00:00:00");
			}
			if(dateStart != null) dateEnd = DateUtil.timeParse(dateTo + " 23:59:59");
			else day = "0";
		}
		List<DailyReport> reportList = reportMapper.getReport(day, dateStart, dateEnd, dateFrom.replace("-", ""), dateTo.replace("-", ""));
		if(reportList != null && reportList.size() > 0) {
			DailyReport report = new DailyReport();
			report.setZdl(0L);
			report.setTzMembers(0);
			report.setAgentCode("总计");
			report.setAmount(BigDecimal.ZERO);
			report.setWinAmount(BigDecimal.ZERO);
			report.setFdAmount(BigDecimal.ZERO);
			report.setRealWinAmount(BigDecimal.ZERO);
			for(DailyReport temp : reportList) {
				report.setZdl(report.getZdl() + temp.getZdl());
				report.setTzMembers(report.getTzMembers() + (temp.getTzMembers() == null ? 0 : temp.getTzMembers()));
				report.setAmount(NumberUtils.round(NumberUtils.add(report.getAmount(), temp.getAmount()), 2));
				report.setWinAmount(NumberUtils.round(NumberUtils.add(report.getWinAmount(), temp.getWinAmount()), 2));
				report.setFdAmount(NumberUtils.round(NumberUtils.add(report.getFdAmount(), temp.getFdAmount()), 2));
				report.setRealWinAmount(NumberUtils.round(NumberUtils.add(report.getRealWinAmount(), temp.getRealWinAmount()), 2));
			}
			
			reportList.add(report);
		}
		return createSuccessModelAndView("report/page", reportList);
	}
	
	@RequestMapping(value="/system/report/dailyIndex", method=RequestMethod.GET)
	public ModelAndView toDailyIndex() throws Exception {
		return createSuccessModelAndView("dailyReport/table", DateUtil.getCurrentDateStr());
	}
	
	@RequestMapping(value="/system/report/getDailyList", method=RequestMethod.GET)
	public ModelAndView getDailyList(String date, String code, Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(StringUtils.isBlank(date)) date = DateUtil.getCurrentDateStr();
		whereList.add(Where.between(LotteryTouzhuDomain.ADD_TIME, DateUtil.dateParse(date), DateUtil.addDay(DateUtil.dateParse(date), 1), true, false));
		if(StringUtils.isNotBlank(code)) {
			Member member = memberService.getMemberByCode(code);
			if(member == null) {
				return createSuccessModelAndView("dailyReport/page", null);
			}
			whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_ID, member.getId()));
		}
		whereList.add(Where.eq(LotteryTouzhuDomain.STATUS, 1));
		whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_TYPE, 0));
		
		Page<LotteryTouzhu> touzhuList = baseService.getPage(
			LotteryTouzhu.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.queryColumn(new String[]{
				LotteryTouzhuDomain.MEMBER_CODE,
				"count(1) type_num", "sum(amount) amount", "sum(win_amount) win_amount",
				"sum(fd_amount) fd_amount", "sum(win_amount+fd_amount-amount) bonus"
			}),
			Parameter.groupBy(new String[]{LotteryTouzhuDomain.MEMBER_ID}),
			Parameter.orderBy(OrderBy.desc(6))
		);
		
		if(touzhuList == null || touzhuList.getItems() != null && touzhuList.getItems().size() > 0) {
			LotteryTouzhu total = baseService.getOne(
				LotteryTouzhu.class,
				whereList,
				Parameter.queryColumn(new String[]{"count(1) type_num", "sum(amount) amount", "sum(win_amount) win_amount", "sum(fd_amount) fd_amount", "sum(win_amount+fd_amount-amount) bonus"})
			);
			touzhuList.setParams(total);
		}
		
		return createSuccessModelAndView("dailyReport/page", touzhuList);
	}
	
	
	//盈亏活动统计
	@RequestMapping(value="/system/report/yingKuiIndex", method=RequestMethod.GET)
	public ModelAndView toYingKuiIndex() throws Exception {
		return createSuccessModelAndView("dailyReport/ykTable", DateUtil.getCurrentDateStr());
	}
	
	@RequestMapping(value="/system/report/getYingKuiList", method=RequestMethod.GET)
	public ModelAndView getYingKuiList(String date, String code, Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(StringUtils.isBlank(date)) date = DateUtil.getCurrentDateStr();
		whereList.add(Where.between(LotteryTouzhuDomain.ADD_TIME, DateUtil.dateParse(date), DateUtil.addDay(DateUtil.dateParse(date), 1), true, false));
		if(StringUtils.isNotBlank(code)) {
			Member member = memberService.getMemberByCode(code);
			if(member == null) {
				return createSuccessModelAndView("dailyReport/ykPage", null);
			}
			whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_ID, member.getId()));
		}
		whereList.add(Where.eq(LotteryTouzhuDomain.STATUS, 1));
		whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_TYPE, 0));
		
		Page<LotteryTouzhu> touzhuList = baseService.getPage(
			LotteryTouzhu.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.queryColumn(new String[]{
					LotteryTouzhuDomain.MEMBER_ID,LotteryTouzhuDomain.MEMBER_CODE,
				"count(1) type_num", "sum(amount) amount", "sum(win_amount) win_amount",
				"sum(fd_amount) fd_amount", "sum(win_amount+fd_amount-amount) bonus"
			}),
			Parameter.groupBy(new String[]{LotteryTouzhuDomain.MEMBER_ID}),
			Parameter.orderBy(OrderBy.desc(6))
		);
		
		if(touzhuList == null || touzhuList.getItems() != null && touzhuList.getItems().size() > 0) {
			LotteryTouzhu total = baseService.getOne(
				LotteryTouzhu.class,
				whereList,
				Parameter.queryColumn(new String[]{"count(1) type_num", "sum(amount) amount", "sum(win_amount) win_amount", "sum(fd_amount) fd_amount", "sum(win_amount+fd_amount-amount) bonus"})
			);
			touzhuList.setParams(total);
			
			RechargeActivity rc = getAllActivity();
			for (LotteryTouzhu lotteryTouzhu :  touzhuList.getItems()) {
				BigDecimal temp = allActivity(rc,lotteryTouzhu.getBonus());
				lotteryTouzhu.setSpecBonus(temp==null? "0":temp.toString());
			}
		}
		return createSuccessModelAndView("dailyReport/ykPage", touzhuList);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public BigDecimal allActivity(RechargeActivity rc,BigDecimal amount) throws Exception {
		BigDecimal giftAmount = BigDecimal.ZERO;
		if(rc.getIsOpen() != 1) return giftAmount;
		if(rc.getAddList() == null || rc.getAddList().size() <= 0) return giftAmount;

		for(int i=0;i<rc.getAddList().size();i++) {
			AgentBack ab = rc.getAddList().get(i);
			if(amount.compareTo(BigDecimal.ZERO)<0){
				if(ab.getMinAmount().compareTo(BigDecimal.ZERO)<0){
					if(ab.getMinAmount().compareTo(amount) >= 0 && ab.getMaxAmount().compareTo(amount) <= 0) {
						giftAmount = ab.getPercent();
						break;
					}
				}
			}else{
				if(ab.getMinAmount().compareTo(BigDecimal.ZERO)>0){
					if(ab.getMinAmount().compareTo(amount) <= 0 && ab.getMaxAmount().compareTo(amount) >= 0) {
						giftAmount = ab.getPercent();
						break;
					}
				}
			}
		}
		return giftAmount;
	}
	public RechargeActivity getAllActivity() throws Exception {
		RechargeActivity rc = new RechargeActivity();
		Map<String, String> configMap = configService.getAllConfigValueMap();
		String setConfig = configMap.get("recharge_activity4_set");
		String[] temp = setConfig.split("-");
		String type = temp[0];
		String isOpen=temp[1];
		rc.setActivityType(type);
		rc.setIsOpen(Integer.valueOf(isOpen == null ? "0" : isOpen));
		rc.setAddDmlTimes(Double.valueOf(configMap.get("recharge_activity4_dml_times") == null ? "0" : configMap.get("recharge_activity4_dml_times")));
		
		Page<AgentBack> addPage = agentBackService.getAgentBack(null, Integer.valueOf(type));
		rc.setAddList(addPage == null ? null : addPage.getItems());
		if(rc.getAddList() != null && rc.getAddList().size() > 0) Collections.reverse(rc.getAddList());
		return rc;
	}
	
	@ResponseBody
	@RequestMapping(value="/system/report/activityExcuteSubmit", method=RequestMethod.POST)
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public CustomResponse activityExcuteSubmit(Long memberId,Date addTime) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("recharge_activity4_set");
		String type="4";//活动类型
		if(setConfig.getValue()!=null){
			if(setConfig.getValue().contains("-0")){
				return createErrorJsonResponse("活动已关闭！");
			}else{
				String[] temp = setConfig.getValue().split("-");
				type = temp[0];
			}
		}else{
			return createErrorJsonResponse("活动已关闭！");
		}
		Date endTime = DateUtil.addDay(addTime, 1);
		
		//当前时间
		Date currentDate = DateUtil.getCurrentDate();
		if(endTime.getTime() !=currentDate.getTime()){
			return createErrorJsonResponse("当前日期,只能赠送["+DateUtil.dateFormat(DateUtil.addDay(currentDate, -1))+"]的盈亏彩金！");
		}
		//判断是否有赠送，活动一天只能赠送一次
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(ActivityLogDomain.ACTIVITY_TYPE, type));
		whereList.add(Where.eq(ActivityLogDomain.MEMBER_ID, memberId));
		whereList.add(Where.between(ActivityLogDomain.GIVE_TIME, currentDate, DateUtil.addDay(currentDate, 1), true, false));
		List<ActivityLog> activityLogList = baseService.getList(
			ActivityLog.class,
			whereList,
			Parameter.limit(1),
			Parameter.queryId()
		);
		if(activityLogList != null && activityLogList.size() > 0) return createErrorJsonResponse("今日已赠送，每天只能赠送一次！");
		
		//计算会员赠送彩金
		List<Where> whereList2 = new ArrayList<Where>();
		whereList2.add(Where.between(LotteryTouzhuDomain.ADD_TIME, addTime, endTime, true, false));
		whereList2.add(Where.eq(LotteryTouzhuDomain.MEMBER_ID, memberId));
		whereList2.add(Where.eq(LotteryTouzhuDomain.STATUS, 1));
		whereList2.add(Where.eq(LotteryTouzhuDomain.MEMBER_TYPE, 0));
		LotteryTouzhu lotteryTouzhu = baseService.getOne(
			LotteryTouzhu.class,
			whereList2,
			Parameter.queryColumn(new String[]{"count(1) type_num", "sum(amount) amount", "sum(win_amount) win_amount", "sum(fd_amount) fd_amount", "sum(win_amount+fd_amount-amount) bonus"})
		);
		
		if(lotteryTouzhu !=null){
			RechargeActivity rc = getAllActivity();
			BigDecimal temp = allActivity(rc,lotteryTouzhu.getBonus());
			BigDecimal dml = temp.multiply(BigDecimal.valueOf(rc.getAddDmlTimes()));
			//是否赠送
			if(temp.compareTo(BigDecimal.ZERO)>0){
				//添加赠送记录
				ActivityLog handOps = new ActivityLog();
				handOps.setActivityType(Long.valueOf(type));
				handOps.setMemberId(memberId);
				handOps.setTotalAmount(lotteryTouzhu.getBonus());
				handOps.setGiveAmount(temp);
				handOps.setGiveTime(new Date());
				baseService.insert(handOps);
				
				//更新余额
				memberAccountService.recharge(
					memberId, temp, BigDecimal.ZERO, BigDecimal.ZERO, "",
					"system", "盈亏活动赠送彩金", RechargeConstant.R_GIFT, 1, true, false);
				
				//更新会员打码量
				if(dml.compareTo(BigDecimal.ZERO) > 0) {
					memberService.updateMemberDml(memberId, dml, null, null, 6, null);
				}
			}else{
				return createErrorJsonResponse("未达到赠送条件！");
			}
		}
		return createSuccessJsonResponse(null);
	}
	
	
	@RequestMapping(value="/system/report/dailyTypeIndex", method=RequestMethod.GET)
	public ModelAndView toDailyTypeIndex() throws Exception {
		return createSuccessModelAndView("dailyReport/typeTable", DateUtil.getCurrentDateStr());
	}
	
	@RequestMapping(value="/system/report/getDailyTypeList", method=RequestMethod.GET)
	public ModelAndView getDailyTypeList(String date, Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(StringUtils.isBlank(date)) date = DateUtil.getCurrentDateStr();
		whereList.add(Where.between(LotteryTouzhuDomain.ADD_TIME, DateUtil.dateParse(date), DateUtil.addDay(DateUtil.dateParse(date), 1), true, false));
		whereList.add(Where.eq(LotteryTouzhuDomain.STATUS, 1));
		whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_TYPE, 0));
		Page<LotteryTouzhu> touzhuList = baseService.getPage(
			LotteryTouzhu.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.queryColumn(new String[]{
				LotteryTouzhuDomain.TYPE_NUM,
				"count(1) member_type", "sum(amount) amount", "sum(win_amount) win_amount",
				"sum(fd_amount) fd_amount", "sum(win_amount+fd_amount-amount) bonus", "sum((case when is_win = 1 then 1 else 0 end)) is_win"
			}),
			Parameter.groupBy(new String[]{LotteryTouzhuDomain.TYPE_NUM}),
			Parameter.orderBy(OrderBy.desc(6)),
			Parameter.pageSize(50)
		);
		if(touzhuList != null && touzhuList.getItems() != null && touzhuList.getItems().size() > 0) {
			List<LotteryType> typeList = lotteryTypeService.getAllLotteryType();
			Map<Integer, LotteryType> typeMap = new HashMap<Integer, LotteryType>();
			for(LotteryType lotteryType : typeList) typeMap.put(lotteryType.getNum(), lotteryType);
			
			LotteryTouzhu total = new LotteryTouzhu();
			total.setContent("总计");
			for(LotteryTouzhu touzhu : touzhuList.getItems()) {
				touzhu.setContent(typeMap.get(touzhu.getTypeNum()).getName());
				
				total.setMemberType(touzhu.getMemberType()+(total.getMemberType()==null?0:total.getMemberType()));
				total.setAmount(touzhu.getAmount().add(total.getAmount()==null?BigDecimal.ZERO:total.getAmount()));
				total.setWinAmount(touzhu.getWinAmount().add(total.getWinAmount()==null?BigDecimal.ZERO:total.getWinAmount()));
				total.setFdAmount(touzhu.getFdAmount().add(total.getFdAmount()==null?BigDecimal.ZERO:total.getFdAmount()));
				total.setBonus(touzhu.getBonus().add(total.getBonus()==null?BigDecimal.ZERO:total.getBonus()));
			}
			touzhuList.setParams(total);
		}
		return createSuccessModelAndView("dailyReport/typePage", touzhuList);
	}
}