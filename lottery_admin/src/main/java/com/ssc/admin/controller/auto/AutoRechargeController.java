package com.ssc.admin.controller.auto;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.AutoRechargeLog;
import com.ssc.entity.custom.AutoRechargeForm;
import com.ssc.service.auto.AutoRechargeWithdrawService;
import com.ssc.service.system.ConfigService;

@Controller
public class AutoRechargeController extends AdminBaseController {
	public static final String WECHAT = "wechat";
	public static final String ALIPAY = "alipay";
	public static final String BANK_ICBC = "icbc";
	public static final String CAIFUTONG = "caiFuTong";
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private AutoRechargeWithdrawService autoRechargeService;
	
	@ResponseBody
	@RequestMapping(value="/common/autoRecharge")
	public String autoRecharge(AutoRechargeForm autoForm) throws Exception {
		AutoRechargeLog log = null;
		try {
			log = new AutoRechargeLog();
			log.setStatus(0);
			log.setNotifyTime(new Date());
			log.setNotifyContent(JsonUtils.object2JsonString(getRequest().getParameterMap()));
			baseService.insert(log);
			
			String key = configService.getValueByNid("khb_recharge_key");
			if(StringUtils.isBlank(autoForm.getKeys()) || !key.equals(autoForm.getKeys())) {
				log.setErrorContent("Error Key");
			} else if(!"微信、支付宝、工商银行、招商银行".contains(autoForm.getSource())) {
				log.setErrorContent("充值方式不匹配");
			} else {
				String errorMsg = autoRechargeService.autoRecharge(autoForm);
				log.setErrorContent(errorMsg);
			}
			
			return "Success";
		} catch(Exception e) {
			log.setErrorContent(JsonUtils.object2JsonString(e));
			return "Fail";
		} finally {
			log.setStatus(StringUtils.isBlank(log.getErrorContent()) ? 1 : - 1);
			baseService.updateById(log, log.getId(), false);
		}
	}
}