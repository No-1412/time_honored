package com.ssc.admin.controller.system;

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
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.DailyRechargeCount;
import com.ssc.entity.DailyTouzhuCount;
import com.ssc.entity.DailyWithdrawCount;
import com.ssc.mapper.DailyCountMapper;

@Controller
public class DailyCountController extends AdminBaseController {
	@Autowired
	private DailyCountMapper dailyCountMapper;
	
	@RequestMapping(value="/system/daily/count", method=RequestMethod.GET)
	public ModelAndView toIndex(Date dateFrom, Date dateTo) throws Exception {
		Date today = null;
		Integer dayFrom = null, dayTo = null;
		if(dateFrom == null || dateTo == null) {
			today = DateUtil.getCurrentDate();
		} else {
			today = DateUtil.getCurrentDate();
			if(dateTo.compareTo(today) < 0) today = null;
			
			dayFrom = Integer.valueOf(DateUtil.dateShortFormat(dateFrom));
			dayTo = Integer.valueOf(DateUtil.dateShortFormat(dateTo));
		}
		
		BigDecimal pAmount = BigDecimal.ZERO;
		BigDecimal vAmount = BigDecimal.ZERO;
		BigDecimal rAmount = BigDecimal.ZERO;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dateFrom", DateUtil.dateFormat(dateFrom == null ? today : dateFrom) + " 00:00:00");
		dataMap.put("dateTo", DateUtil.dateFormat(dateTo == null ? today : dateTo) + " 23:59:59");
		
		//返水
		dataMap.put("fdNum", 0);
		dataMap.put("fdAmount", 0.0);
		List<DailyTouzhuCount> touzhuList = dailyCountMapper.getDailyTouzhuCount(dayFrom, dayTo, today);
		if(touzhuList != null && touzhuList.size() > 0) {
			DailyTouzhuCount tz = touzhuList.get(0);
			vAmount = vAmount.add(tz.getFdAmount());
			dataMap.put("fdNum", tz.getFdNum());
			dataMap.put("fdAmount", tz.getFdAmount().doubleValue());
		}
		
		//充值
		List<DailyRechargeCount> cList = new ArrayList<DailyRechargeCount>();
		List<DailyRechargeCount> oList = new ArrayList<DailyRechargeCount>();
		
		List<String> numList = new ArrayList<String>();
		String wechatNum = configService.getValueByNid("r_hand_wechat_num");
		int size = StringUtils.isBlank(wechatNum) ? 0 : Integer.valueOf(wechatNum);
		for(int i=1;i<=size;i++) numList.add("3"+i);
		
		BigDecimal handWechat = BigDecimal.ZERO;
		BigDecimal handAlipay = BigDecimal.ZERO;
		int cNum = 0, oNum = 0, hNum = 0, addNum = 0, giftNum = 0;
		BigDecimal cAmount = BigDecimal.ZERO, oAmount = BigDecimal.ZERO;
		BigDecimal hAmount = BigDecimal.ZERO, addAmount = BigDecimal.ZERO, giftAmount = BigDecimal.ZERO;
		List<DailyRechargeCount> rechargeList = dailyCountMapper.getDailyRechargeCount(dayFrom, dayTo, today);
		if(rechargeList != null && rechargeList.size() > 0) {
			for(DailyRechargeCount recharge : rechargeList) {
				addNum += recharge.getAddNum();
				addAmount = addAmount.add(recharge.getAddAmount());
				giftNum += recharge.getGiftNum();
				giftAmount = giftAmount.add(recharge.getGiftAmount());
				
				if(recharge.getType() == 11 || recharge.getType() == 21 || recharge.getType() == 41 || recharge.getType() == 71) {
					oList.add(recharge);
					
					oNum += recharge.getNum();
					oAmount = oAmount.add(recharge.getAmount());
				} else if(recharge.getType() == 51) {
					hNum += recharge.getNum();
					hAmount = hAmount.add(recharge.getAmount());
					
					if("1".equals(recharge.getCode())
							|| numList.contains(recharge.getCode())) {
						handWechat = handWechat.add(recharge.getAmount());
					} else if("2".equals(recharge.getCode())) {
						handAlipay = handAlipay.add(recharge.getAmount());
					}
				} else if(recharge.getType() == 61) {
				} else {
					cList.add(recharge);
					
					cNum += recharge.getNum();
					cAmount = cAmount.add(recharge.getAmount());
				}
			}
		}
		dataMap.put("cNum", cNum);
		dataMap.put("oNum", oNum);
		dataMap.put("hNum", hNum);
		dataMap.put("addNum", addNum);
		dataMap.put("giftNum", giftNum);
		dataMap.put("cAmount", cAmount);
		dataMap.put("oAmount", oAmount);
		dataMap.put("hAmount", hAmount);
		dataMap.put("addAmount", addAmount);
		dataMap.put("giftAmount", giftAmount);
		dataMap.put("handWechat", handWechat);
		dataMap.put("handAlipay", handAlipay);
		
		vAmount = vAmount.add(addAmount).add(giftAmount);
		pAmount = pAmount.add(cAmount).add(oAmount).add(hAmount);
		rAmount = pAmount;
		
		//出款
		dataMap.put("mNum", 0);
		dataMap.put("aNum", 0);
		dataMap.put("feeNum", 0);
		dataMap.put("feeAdminNum", 0);
		dataMap.put("mAmount", 0.0);
		dataMap.put("aAmount", 0.0);
		dataMap.put("feeAmount", 0.0);
		dataMap.put("feeAdminAmount", 0.0);
		List<DailyWithdrawCount> withdrawList = dailyCountMapper.getDailyWithdrawCount(dayFrom, dayTo, today);
		if(withdrawList != null && withdrawList.size() > 0) {
			int feeNum = 0;
			int feeAdminNum = 0;
			BigDecimal feeAmount = BigDecimal.ZERO;
			BigDecimal feeAdminAmount = BigDecimal.ZERO;
			for(DailyWithdrawCount withdraw : withdrawList) {
				feeNum += withdraw.getFeeNum();
				feeAdminNum += withdraw.getFeeAdminNum();
				feeAmount = feeAmount.add(withdraw.getFee());
				feeAdminAmount = feeAdminAmount.add(withdraw.getFeeAdmin());
				if(withdraw.getType() == 1) {
					rAmount = rAmount.subtract(withdraw.getAmount());
					
					dataMap.put("mNum", withdraw.getNum());
					dataMap.put("mAmount", withdraw.getAmount());
				} else if(withdraw.getType() == 2) {
					dataMap.put("aNum", withdraw.getNum());
					dataMap.put("aAmount", withdraw.getAmount());
				}
			}
			
			dataMap.put("feeNum", feeNum);
			dataMap.put("feeAdminNum", feeAdminNum);
			dataMap.put("feeAmount", feeAmount);
			dataMap.put("feeAdminAmount", feeAdminAmount);
		}
		
		dataMap.put("pAmount", pAmount);
		dataMap.put("vAmount", vAmount);
		dataMap.put("rAmount", rAmount);
		
		dataMap.put("cList", cList);
		dataMap.put("oList", oList);
		
		return createSuccessModelAndView("count/count", dataMap);
	}
}