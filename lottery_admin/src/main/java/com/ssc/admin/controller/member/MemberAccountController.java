package com.ssc.admin.controller.member;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Member;
import com.ssc.entity.MemberAccount;
import com.ssc.entity.constant.RechargeConstant;
import com.ssc.entity.domain.MemberAccountDomain;
import com.ssc.service.member.MemberService;

@Controller
public class MemberAccountController extends AdminBaseController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/system/memberAccount/index", method=RequestMethod.GET)
	public ModelAndView toIndex(Integer type, String timeStart, String timeEnd) throws Exception {
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("type", type+"");
		dataMap.put("timeEnd",timeEnd);
		dataMap.put("timeStart", timeStart);
		
		dataMap.put("date", DateUtil.getCurrentDateStr());
		dataMap.put("memberCode", getRequest().getParameter("id"));
		return createSuccessModelAndView("member/account/table", dataMap);
	}
	
	@RequestMapping(value="/system/memberAccount/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer[] type, String code, BigDecimal amount, Date timestart, Date timeend) throws Exception {
		if(type == null || type.length <= 0) {
			return createSuccessModelAndView("member/account/page", null);
		}
		
		List<Where> whereList = new ArrayList<Where>();
		if(timestart != null && timeend != null) {
			whereList.add(Where.between(MemberAccountDomain.OPS_TIME, timestart, timeend, true, true));
		}
		if(StringUtils.isNotBlank(code)) {
			Member member = memberService.getMemberByCode(code);
			whereList.add(Where.eq(MemberAccountDomain.MEMBER_ID, member == null ? 0L : member.getId()));
		}
		if(type != null && type.length > 0) {
			whereList.add(Where.in(MemberAccountDomain.BIG_TYPE, type));
		}
		if(amount != null && amount.compareTo(BigDecimal.ZERO) > 0) {
			whereList.add(Where.eq(MemberAccountDomain.AMOUNT, amount));
		}
		whereList.add(Where.eq(MemberAccountDomain.MEMBER_TYPE, 0));
		Page<MemberAccount> resultPage = baseService.getPage(
			MemberAccount.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.orderBy(OrderBy.desc(MemberAccountDomain.ID))
		);
		
		resultPage.setParams("0");
		if(resultPage.getItems() != null) {
			Member member = null;
			Map<Long, Member> memberMap = new HashMap<Long, Member>();
			for(MemberAccount account : resultPage.getItems()) {
				member = memberMap.get(account.getMemberId());
				if(member == null) {
					member = memberService.getMemberById(account.getMemberId());
					memberMap.put(member.getId(), member);
				}
				
				account.addExpand("memberName", member.getCode());
				account.addExpand("type", RechargeConstant.RECHARGE_MAP.get(account.getType()));
			}
			
			MemberAccount count = baseService.getOne(MemberAccount.class, whereList, Parameter.querySingle("sum(amount) amount"));
			resultPage.setParams(count.getAmount());
		}
		
		return createSuccessModelAndView("member/account/page", resultPage);
	}
}