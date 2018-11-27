package com.ssc.admin.controller.member;

import java.util.Collections;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.constant.Constant;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.RedisUtil;
import com.ssc.entity.MemberLevel;
import com.ssc.entity.domain.MemberLevelDomain;
import com.ssc.mapper.MemberMapper;
import com.ssc.service.member.MemberLevelService;
import com.ssc.service.recharge.RechargeTypeService;
import com.ssc.service.system.ConfigService;

@Controller
public class MemberLevelController extends AdminBaseController {
	@Autowired
	private RedisUtil redisUtil;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private MemberLevelService memberLevelService;
	
	@Autowired
	private RechargeTypeService rechargeTypeService;
	
	@RequestMapping(value="/system/memberLevel/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("member/level/table", null);
	}
	
	@RequestMapping(value="/system/memberLevel/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		Page<MemberLevel> resultPage = baseService.getPage(
			MemberLevel.class,
			Collections.singletonList(Where.gt(MemberLevelDomain.ID, 0L)),
			page == null ? 1 : (page+1),
			Parameter.orderBy(OrderBy.desc(MemberLevelDomain.LEVEL))
		);
		return createSuccessModelAndView("member/level/page", resultPage);
	}
	
	@RequestMapping(value="/system/memberLevel/{type}", method=RequestMethod.GET)
	public ModelAndView toEdit(@PathVariable("type")String type, Long id) throws Exception {
		String isPlatformMulti = "";
		MemberLevel memberLevel = null;
		if(id != null) memberLevel = baseService.getById(MemberLevel.class, id, null);
		if("wechat".equals(type)) {
			isPlatformMulti = configService.getValueByNid("self_rcharge_type_multi");
			memberLevel.addExpand("wechatList", rechargeTypeService.getMemberLevelRecharge(id, 0, 1));
			memberLevel.addExpand("thirdList", rechargeTypeService.getMemberLevelRecharge(id, 1, 1));
		} else if("alipay".equals(type)) {
			isPlatformMulti = configService.getValueByNid("self_rcharge_type_multi");
			memberLevel.addExpand("alipayList", rechargeTypeService.getMemberLevelRecharge(id, 0, 2));
			memberLevel.addExpand("thirdList", rechargeTypeService.getMemberLevelRecharge(id, 1, 2));
		} else if("bank".equals(type)) {
			memberLevel.addExpand("bankList", rechargeTypeService.getMemberLevelRecharge(id, 0, 3));
		} else if("third".equals(type)) {
			memberLevel.addExpand("thirdList", rechargeTypeService.getMemberLevelRecharge(id, 1, 4));
		} else if("qqpay".equals(type)) {
			memberLevel.addExpand("qqpayList", rechargeTypeService.getMemberLevelRecharge(id, 1, 7));
		} else if("other".equals(type)) {
			memberLevel.addExpand("otherList", rechargeTypeService.getMemberLevelRecharge(id, 1, 8));
		}
		
		return createSuccessModelAndView("member/level/" + type + ("1".equals(isPlatformMulti) ? "1" : ""), memberLevel);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/memberLevel/{type}Submit", method=RequestMethod.POST)
	public CustomResponse editSubmit(@PathVariable("type")String type, MemberLevel memberLevel) throws Exception {
		memberLevel.setUpdTime(new Date());
		memberLevel.setUpdBy(getSessionUser().getCode());
		if(memberLevel.getId() == null) {
			memberLevel.setAddBy(memberLevel.getUpdBy());
			memberLevel.setAddTime(memberLevel.getUpdTime());
		}
		
		int rechargeType = 5;
		String[] rechargeIds = null;
		if("wechat".equals(type)) {
			rechargeType = 1;
			rechargeIds = getRequest().getParameterMap().get("wechat");
		} else if("alipay".equals(type)) {
			rechargeType = 2;
			rechargeIds = getRequest().getParameterMap().get("alipay");
		} else if("bank".equals(type)) {
			rechargeType = 3;
			rechargeIds = getRequest().getParameterMap().get("bank");
		} else if("third".equals(type)) {
			rechargeType = 4;
		} else if("qqpay".equals(type)) {
			rechargeType = 7;
		} else if("other".equals(type)) {
			rechargeType = 8;
		}
		
		//第三方支付方式ID
		Long[] thirdList = null;
		String[] thirdIds = getRequest().getParameterMap().get("third");
		if(thirdIds != null && thirdIds.length > 0) {
			int idx = 0;
			thirdList = new Long[thirdIds.length];
			for(String third : thirdIds) {
				try {
					thirdList[idx++]  = Long.valueOf(third);
				}catch(Exception e) {}
			}
		}
		
		memberLevelService.updateMemberLevel(memberLevel, rechargeType, thirdList, rechargeIds);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/memberLevel/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		memberLevelService.deleteMemberLevel(id);
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/memberLevel/adjust", method=RequestMethod.GET)
	public ModelAndView adjust() throws Exception {
		return createSuccessModelAndView("member/level/adjust", memberLevelService.getMemberLevelList());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/memberLevel/adjustSubmit", method=RequestMethod.POST)
	public CustomResponse adjustSubmit(Integer levelFrom, Integer levelTo) throws Exception {
		if(levelFrom == null || levelFrom <= 0) return createErrorJsonResponse("源层不能为空！");
		if(levelTo == null || levelTo <= 0) return createErrorJsonResponse("目标层不能为空！");
		if(levelFrom == levelTo) return createErrorJsonResponse("源层、目标层不能一样！");
		
		try {
			memberMapper.updateMemberLevel(levelFrom, levelTo);
			
			redisUtil.delete(Constant.SESSION_USER_CACHE);
		} catch(Exception e) {
			return createErrorJsonResponse("更新失败，请稍后重试！");
		}
		
		return createSuccessJsonResponse(null);
	}
}