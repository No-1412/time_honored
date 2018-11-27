package com.ssc.admin.controller.recharge;

import java.util.ArrayList;
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
import com.ssc.core.utils.RedisUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.RechargeChannel;
import com.ssc.entity.RechargeThird;
import com.ssc.entity.domain.RechargeThirdDomain;
import com.ssc.service.recharge.RechargeChannelService;
import com.ssc.service.recharge.RechargeTypeService;
import com.ssc.third.shq.ShqResultList;
import com.ssc.third.shq.ShqWechatAlipay;

@Controller
public class RechargeThirdController extends AdminBaseController {
	@Autowired
	private RedisUtil redisUtil;
	
	@Autowired
	private RechargeChannelService channelService;
	
	@Autowired
	private RechargeTypeService rechargeTypeService;
	
	@RequestMapping(value="/system/rechargeThird/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("recharge/third/table", null);
	}
	
	@RequestMapping(value="/system/rechargeThird/getList",method=RequestMethod.GET)
	public ModelAndView getList(Integer page, String name,String merid, Integer type1) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(StringUtils.isNotBlank(name)) {
			whereList.add(Where.likeAll(RechargeThirdDomain.NAME, name));
		}
		if(StringUtils.isNotBlank(merid)) {
			whereList.add(Where.eq(RechargeThirdDomain.MERID, merid));
		}
		if(type1 != null && type1 > 0) {
			if(type1 == 4) whereList.add(Where.eq(RechargeThirdDomain.PAY_TYPE, 4));
			else if(type1 == 5) whereList.add(Where.eq(RechargeThirdDomain.PAY_TYPE, 8));
			else whereList.add(Where.in(RechargeThirdDomain.TYPE1, new Integer[]{0, type1}));
		}
		whereList.add(Where.gt(RechargeThirdDomain.ID, 0L));
		Page<RechargeThird> resultPage = baseService.getPage(
			RechargeThird.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.orderBy(OrderBy.desc(RechargeThirdDomain.STATUS), OrderBy.asc(RechargeThirdDomain.SORT))
		);
		if(resultPage != null && resultPage.getItems() != null) {
			RechargeChannel channel = null;
			Map<Long, RechargeChannel> channelMap = channelService.getChannelMap();
			for(RechargeThird third : resultPage.getItems()) {
				channel = channelMap.get(Long.valueOf(third.getType()));
				third.addExpand("type", channel == null ? "" : channel.getName());
			}
		}
		
		return createSuccessModelAndView("recharge/third/page", resultPage);
	}
	
	@RequestMapping(value="/system/rechargeThird/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		RechargeThird rechargeThird = baseService.getById(RechargeThird.class, id, null);
		if(rechargeThird == null) {
			rechargeThird = new RechargeThird();
			rechargeThird.setStatus(1);
		}else{
			if(rechargeThird.getRadomNum() ==null){
				rechargeThird.setRadomNum(0);
			}
		}
		rechargeThird.addExpand("thirdList", channelService.getChannelList());
		
		return createSuccessModelAndView("recharge/third/edit", rechargeThird);
	}
	
	@Validation(
		args={
			@Arg(field=RechargeThirdDomain.NAME, text="名称", minLength=2, maxLength=50),
			@Arg(field=RechargeThirdDomain.MERID, text="商户号", minLength=2, maxLength=50),
			@Arg(field=RechargeThirdDomain.PAY_URL, text="支付URL", minLength=2, maxLength=100),
			@Arg(field=RechargeThirdDomain.MIN_AMOUNT, text="最小金额", minValue="0"),
			@Arg(field=RechargeThirdDomain.MAX_AMOUNT, text="最大金额", minValue="0"),
			@Arg(field=RechargeThirdDomain.ADD_AMOUNT, text="赠送优惠", minValue="0", maxValue="100"),
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/rechargeThird/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(RechargeThird rechargeThird) throws Exception {
		if(StringUtils.isNotBlank(rechargeThird.getPayUrl())) {
			if(rechargeThird.getPayUrl().endsWith("/")) {
				rechargeThird.setPayUrl(rechargeThird.getPayUrl().substring(0, rechargeThird.getPayUrl().length()-1));
			}
		}
		rechargeThird.setUpdTime(new Date());
		rechargeThird.setUpdBy(getSessionUser().getCode());
		RechargeChannel channel = channelService.getChannelByCode(Long.valueOf(rechargeThird.getType()));
		rechargeThird.setPayType(channel.getType());
		rechargeThird.setReturnType(channel.getReturnType());
		if(channel.getType() == 4 || channel.getType() == 8) rechargeThird.setType1(0);
		if(rechargeThird.getId() == null) {
			rechargeThird.setAddBy(rechargeThird.getUpdBy());
			rechargeThird.setAddTime(rechargeThird.getUpdTime());
		}
		rechargeTypeService.update(rechargeThird, rechargeThird.getId() == null, 4);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/rechargeThird/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		rechargeTypeService.delete(RechargeThird.class, id, 4);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/rechargeThird/poolQuery", method=RequestMethod.POST)
	public CustomResponse poolQuery(Long id,Integer type) throws Exception {
		ShqWechatAlipay shq = new ShqWechatAlipay();
		Map<String,List<ShqResultList>> resultList = shq.poolQuery(baseService.getById(RechargeThird.class, id, null));
		if(resultList == null || resultList.size() <= 0) return createErrorJsonResponse("获取子商户号列表失败！");
		
		StringBuffer result = new StringBuffer();
		List<ShqResultList> list = resultList.get("wechat");
		List<ShqResultList> list2 = resultList.get("alipay");
		List<ShqResultList> list3 = resultList.get("wechatList");
		List<ShqResultList> list4 = resultList.get("qqpayList");
		if(type.intValue()==1){
			if(list.size()>0){
				result.append("---微信公众号子商户号---").append("</br>");
				for(ShqResultList data : list) result.append(data.getMchid()).append(":").append(data.getMerchant_name()).append("</br>");
			}
			if(list3 != null && list3.size()>0){
				result.append("---微信扫码子商户号---").append("</br>");
				for(ShqResultList data : list3) result.append(data.getMchid()).append(":").append(data.getMerchant_name()).append("</br>");
			}
		}
		if(type.intValue()==2){
			if(list2.size()>0){
				result.append("---支付宝子商户号---").append("</br>");
				for(ShqResultList data : list2) result.append(data.getMchid()).append(":").append(data.getMerchant_name()).append("</br>");
			}
			if(list4.size()>0){
				result.append("---QQ钱包子商户号---").append("</br>");
				for(ShqResultList data : list4) result.append(data.getMchid()).append(":").append(data.getMerchant_name()).append("</br>");
			}
		}
		
		return createSuccessJsonResponse(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/rechargeThird/poolRefresh", method=RequestMethod.POST)
	public CustomResponse poolRefresh(Long id, Integer type) throws Exception {
		RechargeThird third = baseService.getById(RechargeThird.class, id, null);
		if(third == null) return createSuccessJsonResponse(null);
		
		String key = "shq-" + third.getMerid() + "-" + type;
		String idxKey = "shq-idx-" + third.getMerid() + "-" + type;
		String timeKey = "shq-time-" + third.getMerid() + "-" + type;
		redisUtil.delete(key, idxKey, timeKey);
		
		if(type == 1) {
			key = "shq-" + third.getMerid() + "-" + 3;
			idxKey = "shq-idx-" + third.getMerid() + "-" + 3;
			timeKey = "shq-time-" + third.getMerid() + "-" + 3;
			redisUtil.delete(key, idxKey, timeKey);
		}
		
		return createSuccessJsonResponse(null);
	}
}