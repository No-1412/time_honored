package com.ssc.admin.controller.system;

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
import com.ssc.core.entity.CustomResponse;
import com.ssc.entity.Config;
import com.ssc.entity.RechargeWithdrawConfig;
import com.ssc.service.system.ConfigService;
import com.ssc.service.withdraw.WithdrawService;

@Controller
public class RechargeWithdrawConfigController extends AdminBaseController {
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private WithdrawService withdrawService;
	
	@RequestMapping(value="/system/withdrawConfig/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		RechargeWithdrawConfig config = baseService.getById(RechargeWithdrawConfig.class, 1L, null);
		
		Map<String, String> configMap = configService.getAllConfigValueMap();
		String recharge_random_money="0";
		if(configMap.get("recharge_random_money")==null || "".equals(configMap.get("recharge_random_money"))){
			recharge_random_money = "0";
		}else{
			recharge_random_money = configMap.get("recharge_random_money");
		}
		config.addExpand("withdrawTipOpen", configMap.get("withdraw_tip_open"));
		config.addExpand("withdrawTipMsg", configMap.get("withdraw_tip_msg"));
		config.addExpand("rechargeRandomMoney", recharge_random_money);
		config.addExpand("rechargeTypeTip", configMap.get("recharge_type_tip"));
		return createSuccessModelAndView("withdraw/config", config);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdrawConfig/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(RechargeWithdrawConfig rechargeWithdrawConfig, Integer withdrawTipOpen,
			String withdrawTipMsg, Integer rechargeRandomMoney, String rechargeTypeTip) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config withdrawTipOpenConfig = configMap.get("withdraw_tip_open");
		Config withdrawTipMsgConfig = configMap.get("withdraw_tip_msg");
		Config rechargeRandomMoneyConfig = configMap.get("recharge_random_money");
		Config rechargeTypeTipConfig = configMap.get("recharge_type_tip");
		
		if(rechargeRandomMoney ==null){
			rechargeRandomMoney = 0;
		}
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(withdrawTipOpenConfig, "提款提示开关", "withdraw_tip_open", withdrawTipOpen+""));
		configList.add(setConfig(withdrawTipMsgConfig, "提款提示信息", "withdraw_tip_msg", withdrawTipMsg));
		configList.add(setConfig(rechargeRandomMoneyConfig, "充值随机金额", "recharge_random_money", rechargeRandomMoney+""));
		configList.add(setConfig(rechargeTypeTipConfig, "充值方式提醒", "recharge_type_tip", rechargeTypeTip));
		configService.updateConfig(configList);
		
		withdrawService.updateRechargeWithdrawConfig(rechargeWithdrawConfig);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/withdrawConfig/page", method=RequestMethod.GET)
	public ModelAndView toPage() throws Exception {
		return createSuccessModelAndView("withdraw/page", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdrawConfig/pageSubmit", method=RequestMethod.POST)
	public CustomResponse pageEditSubmit(Integer isWechatShow, String wechatTip, String wechatStep,
			Integer isAlipayShow, String alipayTip, String alipayStep, String errTip) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config errTipConfig = configMap.get("r_err_tip");
		Config wechatShowConfig = configMap.get("r_is_wechat_show");
		Config wechatTipConfig = configMap.get("r_wechat_tip");
		Config wechatSetpConfig = configMap.get("r_wechat_step");
		Config alipayShowConfig = configMap.get("r_is_alipay_show");
		Config alipayTipConfig = configMap.get("r_alipay_tip");
		Config alipaySetpConfig = configMap.get("r_alipay_step");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(errTipConfig, "充值-入款失败提示", "r_err_tip", errTip));
		configList.add(setConfig(wechatShowConfig, "充值-是否显示微信昵称", "r_is_wechat_show", (isWechatShow==null?1:isWechatShow)+""));
		configList.add(setConfig(wechatTipConfig, "充值-微信入款提示", "r_wechat_tip", wechatTip));
		configList.add(setConfig(wechatSetpConfig, "充值-微信入款步骤说明", "r_wechat_step", wechatStep));
		configList.add(setConfig(alipayShowConfig, "充值-是否显示支付宝昵称", "r_is_alipay_show", (isAlipayShow==null?1:isAlipayShow)+""));
		configList.add(setConfig(alipayTipConfig, "充值-支付宝入款提示", "r_alipay_tip", alipayTip));
		configList.add(setConfig(alipaySetpConfig, "充值-支付宝入款步骤说明", "r_alipay_step", alipayStep));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	private Config setConfig(Config config, String name, String nid, String value) {
		config = config == null ? new Config() : config;
		
		config.setUpdTime(new Date());
		config.setUpdBy(getSessionUser().getCode());
		if(config.getId() == null) {
			config.setType(2);
			config.setNid(nid);
			config.setName(name);
			config.setImage("NVL");
			config.setAddBy(config.getAddBy());
			config.setAddTime(new Date());
		}
		config.setValue(value);
		
		return config;
	}
}