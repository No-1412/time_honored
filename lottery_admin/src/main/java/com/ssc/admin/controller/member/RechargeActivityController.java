package com.ssc.admin.controller.member;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
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
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.AgentBack;
import com.ssc.entity.Config;
import com.ssc.service.agent.AgentBackService;

@Controller
public class RechargeActivityController extends AdminBaseController {
	@Autowired
	private AgentBackService agentBackService;
	
	public enum Type {
	    TYPETWO(2, "充值优惠"), TYPEFIVE(5, "累计充值优惠"), TYPETHREE(3, "双节充值送"), TYPEFOUR(4, "盈亏优惠");
	    
		private int index ;
	    private String name ;
	   
	    private Type(int index , String name){
	        this.name = name ;
	        this.index = index ;
	    }
	    public String getName() {
	        return name;
	    }
	    public void setName(String name) {
	        this.name = name;
	    }
	    public int getIndex() {
	        return index;
	    }
	    public void setIndex(int index) {
	        this.index = index;
	    }
	}
	
	@RequestMapping(value="/system/recharge/activity", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (Type s : Type.values()){
			Map<String,String> map = new HashMap<String,String>();
			map.put("index",s.getIndex()+"");
			map.put("typeName", s.getName());
			list.add(map);
		}
		return createSuccessModelAndView("member/recharge/activity", list);
	}
	
	@RequestMapping(value="/system/recharge/getActivityList", method=RequestMethod.GET)
	public ModelAndView getList(Integer type) throws Exception {
		if(type == null){
			type = 2;
		}
		Page<AgentBack> page = agentBackService.getAgentBack(null, type);
		
		if(page != null && page.getItems() != null && page.getItems().size() > 0) {
			String total = "";
			AgentBack agentBack = null;
			AgentBack nextAgentBack = null;
			List<AgentBack> list= new ArrayList<AgentBack>();
			List<AgentBack> list1= new ArrayList<AgentBack>();
			List<AgentBack> list2= new ArrayList<AgentBack>();
			for(int i=0;i<page.getItems().size();i++) {
				AgentBack temp = page.getItems().get(i);
				if(temp.getMinAmount().compareTo(BigDecimal.ZERO)<0){
					list1.add(temp);
				}else{
					list2.add(temp);
				}
			}
			Collections.reverse(list1);//倒序
			list.addAll(list1);
			list.addAll(list2);
			
			for(int i=0;i<list.size();i++) {
				nextAgentBack = null;
				agentBack = list.get(i);
				if(i < list.size()-1) {
					nextAgentBack = list.get(i+1);
				}
				
				total = agentBack.getMinAmount().intValue() + "~";
				if(nextAgentBack != null) {
					if(nextAgentBack.getMinAmount().compareTo(BigDecimal.ZERO)<0){
						total += (nextAgentBack.getMinAmount().intValue()+1);
					}else{
						if(agentBack.getMinAmount().compareTo(BigDecimal.ZERO)>0){
							total += (nextAgentBack.getMinAmount().intValue()-1);
						}
						
					}
					
				}
				agentBack.addExpression("total", total);
			}
		}
		return createSuccessModelAndView("member/recharge/activityPage", page);
	}
	
	@RequestMapping(value="/system/recharge/activityEdit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id, Integer type) throws Exception {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (Type s : Type.values()){
			Map<String,String> map = new HashMap<String,String>();
			map.put("index",s.getIndex()+"");
			map.put("typeName", s.getName());
			list.add(map);
		}
		dataMap.put("typeData", list);
		
		AgentBack agentBack = baseService.getById(AgentBack.class, id, null);
		if(agentBack == null) {
			agentBack = new AgentBack();
			agentBack.setType(type);
		}
		dataMap.put("agentBack", agentBack);
		return createSuccessModelAndView("member/recharge/activityEdit",dataMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/recharge/activityEditSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(AgentBack agentBack) throws Exception {
		if(agentBack.getType() !=4){
			if(agentBack.getMinAmount() == null
					|| agentBack.getMinAmount().compareTo(BigDecimal.ZERO) <= 0) {
				return createErrorJsonResponse("充值金额必须大于0");
			}
		}
		
		if(agentBack.getPercent() == null
				|| agentBack.getPercent().compareTo(BigDecimal.ZERO) < 0) {
			return createErrorJsonResponse("赠送金额不能小于0");
		}
//		agentBack.setType(2);
		agentBackService.edit(agentBack);
		
		Page<AgentBack> page = agentBackService.getAgentBack(null, agentBack.getType().intValue());
		if(page != null && page.getItems() != null && page.getItems().size() > 0) {
			AgentBack lastAgentBack = null;
			AgentBack nextAgentBack = null;
			
			List<AgentBack> list= new ArrayList<AgentBack>();
			List<AgentBack> list1= new ArrayList<AgentBack>();
			List<AgentBack> list2= new ArrayList<AgentBack>();
			for(int i=0;i<page.getItems().size();i++) {
				AgentBack temp = page.getItems().get(i);
				if(temp.getMinAmount().compareTo(BigDecimal.ZERO)<0){
					list1.add(temp);
				}else{
					list2.add(temp);
				}
			}
			Collections.reverse(list1);//倒序
			list.addAll(list1);
			list.addAll(list2);
			for(int i=0;i<list.size();i++) {
				AgentBack temp = list.get(i);
				if(agentBack.getId().longValue() == temp.getId().longValue()){
					if(i !=0){
						lastAgentBack = list.get(i-1);
					}
					
					if(i <list.size()-1) {
						nextAgentBack = list.get(i+1);
					}
					break;
				}
			}
			if(lastAgentBack != null) {
				if(agentBack.getMinAmount().compareTo(BigDecimal.ZERO)<0){
					lastAgentBack.setMaxAmount(new BigDecimal(agentBack.getMinAmount().intValue()+1));
				}else{
					if(lastAgentBack.getMaxAmount().compareTo(BigDecimal.ZERO)>0){
						lastAgentBack.setMaxAmount(new BigDecimal(agentBack.getMinAmount().intValue()-1));
					}
				}
				
				agentBackService.edit(lastAgentBack);
			}
			
			if(nextAgentBack != null) {
				if(nextAgentBack.getMinAmount().compareTo(BigDecimal.ZERO)<0){
					agentBack.setMaxAmount(new BigDecimal(nextAgentBack.getMinAmount().intValue()+1));
				}else{
					agentBack.setMaxAmount(new BigDecimal(nextAgentBack.getMinAmount().intValue()-1));
				}
				
				agentBackService.edit(agentBack);
			}else{
				if(agentBack.getMinAmount().compareTo(BigDecimal.ZERO)<0){
					agentBack.setMaxAmount(new BigDecimal(-999999999));
				}else{
					agentBack.setMaxAmount(new BigDecimal(999999999));
				}
				
				agentBackService.edit(agentBack);
			}
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/recharge/activityDelete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		agentBackService.delete(id);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/recharge/configEdit", method=RequestMethod.GET)
	public ModelAndView toMaxedit(Long id) throws Exception {
		return createSuccessModelAndView("member/recharge/configEdit", configService.getAllConfigValueMap());
	}
	
	@RequestMapping(value="/system/recharge/configEdit3", method=RequestMethod.GET)
	public ModelAndView toMaxedit3(Long id) throws Exception {
		Map<String,String> map = configService.getAllConfigValueMap();
		String deateEnd = map.get("recharge_activity3_dateEnd");
		String temp1 = deateEnd +" 09:00:00";
		Date temp2 = DateUtil.addDay(DateUtil.timeParse(temp1), 1);
		String excuteTime = DateUtil.dateTimeFormat(temp2);
		map.put("recharge_activity3_excuteTime", excuteTime);
		return createSuccessModelAndView("member/recharge/configEdit3", map);
	}
	
	@RequestMapping(value="/system/recharge/configEdit4", method=RequestMethod.GET)
	public ModelAndView toMaxedit4(Long id) throws Exception {
		return createSuccessModelAndView("member/recharge/configEdit4", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/recharge/configEditSubmit", method=RequestMethod.POST)
	public CustomResponse maxeditSubmit(Integer isOpen, Double amount, Double addAmount,
			Double dmlTimes, Double addDmlTimes, Double times, String regTime) throws Exception {
		
		Date date = null;
		if(isOpen !=null){
			if(isOpen.intValue() !=0){
				try {
					date = DateUtil.dateParse(regTime);
				} catch(Exception e) {}
				if(StringUtils.isBlank(regTime) || date == null) return createErrorJsonResponse("注册时间格式错误！");
			}
		}
		
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("recharge_activity_set");
		Config amountConfig = configMap.get("recharge_activity_amount");
		Config dmlTimesConfig = configMap.get("recharge_activity_dml_times");
		Config addDmlTimesConfig = configMap.get("recharge_activity_dml_times1");
		Config rechargeConfig = configMap.get("recharge_activity_times");
		Config regConfig = configMap.get("recharge_activity_reg_time");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(setConfig, "充值赠送彩金活动开关", "recharge_activity_set", (isOpen==null?0:isOpen)+""));
		if(amount != null) {
			configList.add(setConfig(amountConfig, "历史充值金额", "recharge_activity_amount", (amount==null?0:amount.intValue())+""));
		}
		if(dmlTimes != null) {
			configList.add(setConfig(dmlTimesConfig, "本金打码量倍数", "recharge_activity_dml_times", (dmlTimes==null?0:dmlTimes)+""));
		}
		if(addDmlTimes != null) {
			configList.add(setConfig(addDmlTimesConfig, "彩金打码量倍数", "recharge_activity_dml_times1", (addDmlTimes==null?0:addDmlTimes)+""));
		}
		if(times != null) {
			configList.add(setConfig(rechargeConfig, "每天最大赠送次数", "recharge_activity_times", (times==null?1:times.intValue())+""));
		}
		if(regTime != null) {
			configList.add(setConfig(regConfig, "注册时间", "recharge_activity_reg_time", (regTime==null?DateUtil.getCurrentDateStr():regTime)));
		}
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/recharge/configEditSubmit3", method=RequestMethod.POST)
	public CustomResponse maxeditSubmit3(String isOpen,Double dmlTimes,Double addDmlTimes,String dateTo,String dateEnd) throws Exception {
		
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("recharge_activity3_set");
		Config dmlTimesConfig = configMap.get("recharge_activity3_allTimes");
		Config addDmlTimesConfig = configMap.get("recharge_activity3_dml_times");
		Config dateToConfig = configMap.get("recharge_activity3_dateTo");
		Config dateEndConfig = configMap.get("recharge_activity3_dateEnd");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(setConfig, "双节活动开关", "recharge_activity3_set", (isOpen==null?Type.TYPETHREE.getIndex()+"-"+"0":isOpen)));
		if(dmlTimes != null) {
			configList.add(setConfig(dmlTimesConfig, "需达打码量倍数", "recharge_activity3_allTimes", (dmlTimes==null?0:dmlTimes)+""));
		}
		if(addDmlTimes != null) {
			configList.add(setConfig(addDmlTimesConfig, "彩金打码量倍数", "recharge_activity3_dml_times", (addDmlTimes==null?0:addDmlTimes)+""));
		}
		if(dateTo != null) {
			configList.add(setConfig(dateToConfig, "活动开始时间", "recharge_activity3_dateTo", dateTo));
		}
		if(dateEnd != null) {
			configList.add(setConfig(dateEndConfig, "活动结束时间", "recharge_activity3_dateEnd", dateEnd));
		}
		configService.updateConfig(configList);
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/recharge/configEditSubmit4", method=RequestMethod.POST)
	public CustomResponse maxeditSubmit4(String isOpen,Double addDmlTimes) throws Exception {
		
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("recharge_activity4_set");
		Config addDmlTimesConfig = configMap.get("recharge_activity4_dml_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(setConfig, "盈亏活动开关", "recharge_activity4_set", (isOpen==null?Type.TYPEFOUR.getIndex()+"-"+"0":isOpen)));
		if(addDmlTimes != null) {
			configList.add(setConfig(addDmlTimesConfig, "彩金打码量倍数", "recharge_activity4_dml_times", (addDmlTimes==null?0:addDmlTimes)+""));
		}
		configService.updateConfig(configList);
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/recharge/configEdit5", method=RequestMethod.GET)
	public ModelAndView toMaxedit5(Long id) throws Exception {
		return createSuccessModelAndView("member/recharge/configEdit5", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/recharge/configEditSubmit5", method=RequestMethod.POST)
	public CustomResponse maxeditSubmit5(Integer isOpen, Double amount, Double addAmount,
			Double dmlTimes, Double addDmlTimes, Double times, String regTime) throws Exception {
		Date date = null;
		if(isOpen !=null){
			if(isOpen.intValue() !=0){
				try {
					date = DateUtil.dateParse(regTime);
				} catch(Exception e) {}
				if(StringUtils.isBlank(regTime) || date == null) return createErrorJsonResponse("注册时间格式错误！");
			}
		}
		
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("recharge_activity5_set");
		Config amountConfig = configMap.get("recharge_activity5_amount");
		Config dmlTimesConfig = configMap.get("recharge_activity5_dml_times");
		Config addDmlTimesConfig = configMap.get("recharge_activity5_dml_times1");
		Config rechargeConfig = configMap.get("recharge_activity5_times");
		Config regConfig = configMap.get("recharge_activity5_reg_time");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(setConfig, "累计充值赠送彩金活动开关", "recharge_activity5_set", (isOpen==null?0:isOpen)+""));
		if(amount != null) {
			configList.add(setConfig(amountConfig, "历史充值金额", "recharge_activity5_amount", (amount==null?0:amount.intValue())+""));
		}
		if(dmlTimes != null) {
			configList.add(setConfig(dmlTimesConfig, "本金打码量倍数", "recharge_activity5_dml_times", (dmlTimes==null?0:dmlTimes)+""));
		}
		if(addDmlTimes != null) {
			configList.add(setConfig(addDmlTimesConfig, "彩金打码量倍数", "recharge_activity5_dml_times1", (addDmlTimes==null?0:addDmlTimes)+""));
		}
		if(times != null) {
			configList.add(setConfig(rechargeConfig, "每天最大赠送次数", "recharge_activity5_times", (times==null?1:times.intValue())+""));
		}
		if(regTime != null) {
			configList.add(setConfig(regConfig, "注册时间", "recharge_activity5_reg_time", (regTime==null?DateUtil.getCurrentDateStr():regTime)));
		}
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