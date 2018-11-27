package com.ssc.admin.controller.system;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.LotteryTouzhu;
import com.ssc.entity.Member;
import com.ssc.entity.domain.LotteryTouzhuDomain;
import com.ssc.mapper.LotteryTouzhuMapper;
import com.ssc.service.member.MemberService;
@Controller
public class WinningRatioController extends AdminBaseController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LotteryTouzhuMapper lotteryTouzhuMapper;
	
	@RequestMapping(value="/system/winning/ratioIndex", method=RequestMethod.GET)
	public ModelAndView toDailyIndex() throws Exception {
		return createSuccessModelAndView("winningratio/table",DateUtil.getCurrentDateStr());
	}
	
//	@RequestMapping(value="/system/winning/getRatioList", method=RequestMethod.GET)
//	public ModelAndView getRatioList(String dateFrom,String dateTo,String code, Integer page) throws Exception {
//		List<Where> whereList = new ArrayList<Where>();
//		if(StringUtils.isBlank(dateFrom)) dateFrom = DateUtil.getCurrentDateStr();
//		if(StringUtils.isBlank(dateTo)) dateTo = DateUtil.getCurrentDateStr();
//		whereList.add(Where.between(LotteryTouzhuDomain.ADD_TIME, DateUtil.dateParse(dateFrom), DateUtil.dateParse(dateTo), true, false));
//		if(StringUtils.isNotBlank(code)) {
//			Member member = memberService.getMemberByCode(code);
//			if(member == null) {
//				return createSuccessModelAndView("winningratio/page", null);
//			}
//			whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_ID, member.getId()));
//		}
//		Page<LotteryTouzhu> touzhuList = baseService.getPage(
//			LotteryTouzhu.class,
//			whereList,
//			page == null ? 1 : page+1,
//			Parameter.queryColumn(new String[]{
//				LotteryTouzhuDomain.MEMBER_ID,
//				LotteryTouzhuDomain.MEMBER_CODE,
//				"sum(amount) amount"}),
//			Parameter.groupBy(new String[]{LotteryTouzhuDomain.MEMBER_ID})
//		);
//		List<LotteryTouzhu> list = touzhuList.getItems();
//		List<Where> whereList2 = new ArrayList<Where>();
//		whereList2.add(Where.eq(LotteryTouzhuDomain.TYPE_NUM, 18));
//		whereList2.add(Where.between(LotteryTouzhuDomain.ADD_TIME, DateUtil.dateParse(dateFrom), DateUtil.dateParse(dateTo), true, false));
//		if(list!=null){
//		int j = list.size();
//		for (int i = 0; i < j; i++) {
//			whereList2.add(Where.eq(LotteryTouzhuDomain.MEMBER_ID, list.get(i).getMemberId()));
//			LotteryTouzhu ltz = baseService.getOne(
//					LotteryTouzhu.class,
//					whereList2,
//					Parameter.queryColumn(new String[]{"sum(amount) amount"})
//				);
//			if(ltz!=null){
//				list.get(i).setFdAmount(ltz.getAmount());
//			}else{
//				list.get(i).setFdAmount(BigDecimal.valueOf(0.00));
//			}
//		}
//			touzhuList.setItems(list);
//		}
//		if(touzhuList == null || touzhuList.getItems() != null && touzhuList.getItems().size() > 0) {
//			LotteryTouzhu total = baseService.getOne(
//				LotteryTouzhu.class,
//				whereList,
//				Parameter.queryColumn(new String[]{"sum(amount) amount"})
//			);
//			touzhuList.setParams(total);
//		}
//		
//		return createSuccessModelAndView("winningratio/page", touzhuList);
//	}
	@RequestMapping(value="/system/winning/getRatioList", method=RequestMethod.GET)
	public ModelAndView getRatioList(String dateFrom,String dateTo,String code, Integer page) throws Exception {
		page = page == null ? 1 : (page + 1);
		List<LotteryTouzhu> list = lotteryTouzhuMapper.getLottreyCount(dateFrom,dateTo,code);
		int totalSize = list.size();
		int begin = (page-1)*20;
		int end = 20;
		Page<LotteryTouzhu> tzPage = new Page<LotteryTouzhu>();
		tzPage.setPageSize(20);
		tzPage.setPageNo(page);
		tzPage.setTotalSize(totalSize);
		tzPage.setTotalPage(totalSize/20 + (totalSize%20 == 0 ? 0 : 1));
		tzPage.setItems(lotteryTouzhuMapper.getLottery(dateFrom,dateTo,code,begin,end));
		return createSuccessModelAndView("winningratio/page",tzPage);
	}
	
}
