package com.ssc.admin.controller.member;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Admin;
import com.ssc.entity.AdminChoice;
import com.ssc.entity.MemberLevel;
import com.ssc.entity.domain.AdminChoiceDomain;
import com.ssc.service.member.MemberLevelService;

@Controller
public class VerifyChoiceController extends AdminBaseController {
	@Autowired
	private MemberLevelService memberLevelService;
	
	@RequestMapping(value="/member/recharge/handRecharge", method=RequestMethod.GET)
	public ModelAndView handRecharge() throws Exception {
		String type = null;
		Set<String> sets = getChoice(4);
		if(sets != null && sets.size() > 0) {
			for(String tmp : sets) type = tmp;
		}
		
		List<String> numList = new ArrayList<String>();
		String wechatNum = configService.getValueByNid("r_hand_wechat_num");
		int size = StringUtils.isBlank(wechatNum) ? 0 : Integer.valueOf(wechatNum);
		for(int i=1;i<=size;i++) numList.add("3"+i);
		
		ModelAndView view = createSuccessModelAndView("member/choice/handRecharge", type);
		view.addObject("wechatNumList", numList);
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/recharge/handRechargeSubmit", method=RequestMethod.POST)
	public CustomResponse handRechargeSubmit(Integer type) throws Exception {
		Admin admin = getSessionUser();
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.TYPE, 4));
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		baseService.delete(AdminChoice.class, whereList);
		
		type = type == null ? 0 : type;
		AdminChoice choice = new AdminChoice();
		choice.setAdminId(admin.getId());
		choice.setType(4);
		choice.setValue(type+"");
		choice.setUpdTime(new Date());
		baseService.insert(choice);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/member/recharge/verifyChoice", method=RequestMethod.GET)
	public ModelAndView recharge() throws Exception {
		List<MemberLevel> levelList = memberLevelService.getMemberLevelList();
		
		Map<String, Object> temp = null;
		Set<String> choiceSet = getChoice(2);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		for(MemberLevel level : levelList) {
			temp = new HashMap<String, Object>();
			temp.put("name", level.getName());
			temp.put("value", level.getLevel());
			temp.put("checked", choiceSet.contains(""+level.getLevel()) ? "checked" : "");
			
			resultList.add(temp);
		}
		resultMap.put("level", resultList);
		
		choiceSet = getChoice(1);
		resultList = new ArrayList<Map<String, Object>>();
		temp = new HashMap<String, Object>();
		temp.put("name", "微信");
		temp.put("value", "11");
		temp.put("checked", choiceSet.contains("11") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "支付宝");
		temp.put("value", "12");
		temp.put("checked", choiceSet.contains("12") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "网银转账");
		temp.put("value", "1");
		temp.put("checked", choiceSet.contains("1") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "ATM自动柜员机");
		temp.put("value", "2");
		temp.put("checked", choiceSet.contains("2") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "ATM现金入款");
		temp.put("value", "3");
		temp.put("checked", choiceSet.contains("3") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "银行柜台");
		temp.put("value", "4");
		temp.put("checked", choiceSet.contains("4") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "手机银行");
		temp.put("value", "5");
		temp.put("checked", choiceSet.contains("5") ? "checked" : "");
		resultList.add(temp);
		
		temp = new HashMap<String, Object>();
		temp.put("name", "其它");
		temp.put("value", "10");
		temp.put("checked", choiceSet.contains("10") ? "checked" : "");
		resultList.add(temp);
		
		resultMap.put("type", resultList);
		
		return createSuccessModelAndView("member/choice/recharge", resultMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/member/recharge/verifyChoiceSubmit", method=RequestMethod.POST)
	public CustomResponse rechargeSubmit(String[] type, String[] level) throws Exception {
		Admin admin = getSessionUser();
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		whereList.add(Where.in(AdminChoiceDomain.TYPE, new Integer[]{1, 2}));
		baseService.delete(AdminChoice.class, whereList);
		
		AdminChoice choice = null;
		List<AdminChoice> choiceList = new ArrayList<AdminChoice>();
		if(type != null && type.length > 0) {
			for(String value : type) {
				choice = new AdminChoice();
				choice.setAdminId(admin.getId());
				choice.setType(1);
				choice.setValue(value);
				choice.setUpdTime(new Date());
				
				choiceList.add(choice);
			}
		}
		
		if(level != null && level.length > 0) {
			for(String value : level) {
				choice = new AdminChoice();
				choice.setAdminId(admin.getId());
				choice.setType(2);
				choice.setValue(value);
				choice.setUpdTime(new Date());
				
				choiceList.add(choice);
			}
		}
		baseService.insert(choiceList);
		getChoiceList(1, true);
		getChoiceList(2, true);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/member/withdraw/verifyChoice", method=RequestMethod.GET)
	public ModelAndView withdraw() throws Exception {
		List<MemberLevel> levelList = memberLevelService.getMemberLevelList();
		
		Map<String, Object> temp = null;
		Set<String> choiceSet = getChoice(3);
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		for(MemberLevel level : levelList) {
			temp = new HashMap<String, Object>();
			temp.put("name", level.getName());
			temp.put("value", level.getLevel());
			temp.put("checked", choiceSet.contains(""+level.getLevel()) ? "checked" : "");
			
			resultList.add(temp);
		}
		
		return createSuccessModelAndView("member/choice/withdraw", resultList);
	}
	
	@ResponseBody
	@RequestMapping(value="/member/withdraw/verifyChoiceSubmit", method=RequestMethod.POST)
	public CustomResponse withdrawSubmit(String[] level) throws Exception {
		Admin admin = getSessionUser();
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		whereList.add(Where.in(AdminChoiceDomain.TYPE, new Integer[]{3}));
		baseService.delete(AdminChoice.class, whereList);
		
		AdminChoice choice = null;
		List<AdminChoice> choiceList = new ArrayList<AdminChoice>();
		if(level != null && level.length > 0) {
			for(String value : level) {
				choice = new AdminChoice();
				choice.setAdminId(admin.getId());
				choice.setType(3);
				choice.setValue(value);
				choice.setUpdTime(new Date());
				
				choiceList.add(choice);
			}
		}
		baseService.insert(choiceList);
		getChoiceList(3, true);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/member/withdraw/defaultMoney", method=RequestMethod.GET)
	public ModelAndView defaultMoney() throws Exception {
		String moneyTo = null;
		String moneyFrom = null;
		
		Set<String> sets = getChoice(5);
		if(sets != null && sets.size() == 2) {
			int idx = 0;
			for(String temp : sets) {
				if(idx == 0) moneyFrom = temp;
				else if(idx == 1) moneyTo = temp;
				
				idx++;
			}
		}
		
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("moneyTo", moneyTo);
		dataMap.put("moneyFrom", moneyFrom);
		return createSuccessModelAndView("member/choice/defaultMoney", dataMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/member/withdraw/defaultMoneySubmit", method=RequestMethod.POST)
	public CustomResponse defaultMoneySubmit(String moneyFrom, String moneyTo) throws Exception {
		if(StringUtils.isNotBlank(moneyFrom) && StringUtils.isNotBlank(moneyTo)) {
			if(new BigDecimal(moneyFrom).compareTo(new BigDecimal(moneyTo)) > 0) {
				return createErrorJsonResponse("金额设置不对，请重新设置！");
			}
		}
		
		Admin admin = getSessionUser();
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.TYPE, 5));
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		baseService.delete(AdminChoice.class, whereList);
		
		AdminChoice choice = new AdminChoice();
		choice.setAdminId(admin.getId());
		choice.setType(5);
		choice.setValue(moneyFrom);
		choice.setUpdTime(new Date());
		baseService.insert(choice);
		
		choice = new AdminChoice();
		choice.setAdminId(admin.getId());
		choice.setType(5);
		choice.setValue(moneyTo);
		choice.setUpdTime(new Date());
		baseService.insert(choice);
		
		return createSuccessJsonResponse(null);
	}
	
	private Set<String> getChoice(int type) throws Exception {
		Admin admin = getSessionUser();
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.TYPE, type));
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		List<AdminChoice> choiceList = baseService.getList(AdminChoice.class, whereList, Parameter.orderBy(OrderBy.asc(AdminChoiceDomain.ID)));
		
		Set<String> resultSet = new HashSet<String>();
		if(choiceList != null && choiceList.size() > 0) {
			for(AdminChoice choice : choiceList) {
				resultSet.add(choice.getValue());
			}
		}
		
		return resultSet;
	}
}