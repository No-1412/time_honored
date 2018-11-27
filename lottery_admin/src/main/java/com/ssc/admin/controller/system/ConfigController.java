package com.ssc.admin.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Config;
import com.ssc.entity.domain.ConfigDomain;

@Controller
public class ConfigController extends AdminBaseController {
	
	@RequestMapping(value="/system/config/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("config/table", isAdmin());
	}
	
	@RequestMapping(value="/system/config/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, String name) throws Exception {
		boolean isAdmin = isAdmin();
		List<Where> whereList = new ArrayList<Where>();
		if(isAdmin) {
			whereList.add(Where.in(ConfigDomain.TYPE, new Integer[]{0, 1}));
		} else {
			whereList.add(Where.eq(ConfigDomain.TYPE, 1));
		}
		if(StringUtils.isNotBlank(name)) {
			whereList.add(Where.likeAll(ConfigDomain.NAME, name));
		}
		Page<Config> configPage = baseService.getPage(
			Config.class,
			whereList,
			page == null ? 1 : (page+1),
			Parameter.orderBy(OrderBy.desc(ConfigDomain.TYPE), OrderBy.asc(ConfigDomain.SORT))
		);
		
		ModelAndView view = createSuccessModelAndView("config/page", configPage);
		view.addObject("isAdmin", isAdmin);
		return view;
	}
	
	@RequestMapping(value="/system/config/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(String id) throws Exception {
		Config config = null;
		if(StringUtils.isNotBlank(id)) {
			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.eq(ConfigDomain.NID, id));
			config = baseService.getOne(Config.class, whereList);
		} else {
			config = new Config();
			config.setImage("NVL");
		}
		
		config.addExpand("isAdmin", isAdmin());
		return createSuccessModelAndView("config/edit", config);
	}
	
	@Validation(
		args={
			@Arg(field=ConfigDomain.NAME, text="参数名"),
			@Arg(field=ConfigDomain.NID, text="参数标识"),
			@Arg(field=ConfigDomain.VALUE, text="参数值")
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/config/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Config config) throws Exception {
		config.setImage(StringUtils.isBlank(config.getImage()) ? "NVL" : config.getImage());
		
		config.setUpdBy(getSessionUser().getCode());
		config.setUpdTime(new Date());
		if(config.getId() != null && config.getId() > 0L) {
			configService.updateConfig(config);
		} else {
			config.setAddBy(config.getUpdBy());
			config.setAddTime(config.getUpdTime());
			configService.addConfig(config);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/delete", method=RequestMethod.POST)
	public CustomResponse delete(String id) throws Exception {
		configService.deleteConfigByNid(id);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/config/app", method=RequestMethod.GET)
	public ModelAndView toAppSet() throws Exception {
		return createSuccessModelAndView("config/app", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/appSubmit", method=RequestMethod.POST)
	public CustomResponse appSubmit(Integer isOpen, Double amount, Double dmlTimes, Double recharge) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config setConfig = configMap.get("app_download_set");
		Config amountConfig = configMap.get("app_download_amount");
		Config dmlTimesConfig = configMap.get("app_download_dml_times");
		Config rechargeConfig = configMap.get("app_download_dml_recharge");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(setConfig, "下载APP送彩金开关", "app_download_set", (isOpen==null?0:isOpen)+""));
		if(amount != null) {
			configList.add(setConfig(amountConfig, "下载APP赠送彩金金额", "app_download_amount", (amount==null?0:amount.intValue())+""));
		}
		if(dmlTimes != null) {
			configList.add(setConfig(dmlTimesConfig, "下载APP赠送彩金打码量倍数", "app_download_dml_times", (dmlTimes==null?0:dmlTimes)+""));
		}
		if(recharge != null) {
			configList.add(setConfig(rechargeConfig, "下载APP赠送彩金最低充值金额", "app_download_dml_recharge", (recharge==null?0:recharge)+""));
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
	
	@RequestMapping(value="/system/config/sfcDrawType", method=RequestMethod.GET)
	public ModelAndView toSfcDrawType() throws Exception {
		return createSuccessModelAndView("config/sfcDrawType", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/sfcDrawTypeSubmit", method=RequestMethod.POST)
	public CustomResponse sfcDrawTypeSubmit(Integer type, Integer times) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config selfTypeConfig = configMap.get("draw_self_sfc_type");
		Config randomTimesConfig = configMap.get("draw_self_sfc_random_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(selfTypeConfig, "三分时时开奖方式", "draw_self_sfc_type", (type==null?1:type)+""));
		configList.add(setConfig(randomTimesConfig, "三分时时随机开奖次数", "draw_self_sfc_random_times", (times==null?1:times)+""));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/config/sfcJssscDrawType", method=RequestMethod.GET)
	public ModelAndView toSfcJssscDrawType() throws Exception {
		return createSuccessModelAndView("config/sfcJssscDrawType", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/sfcJssscDrawTypeSubmit", method=RequestMethod.POST)
	public CustomResponse sfcJssscDrawTypeSubmit(Integer type, Integer times) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config selfTypeConfig = configMap.get("draw_self_jsssc_type");
		Config randomTimesConfig = configMap.get("draw_self_jsssc_random_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(selfTypeConfig, "极速时时开奖方式", "draw_self_jsssc_type", (type==null?1:type)+""));
		configList.add(setConfig(randomTimesConfig, "极速时时随机开奖次数", "draw_self_jsssc_random_times", (times==null?1:times)+""));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/config/sfpk10DrawType", method=RequestMethod.GET)
	public ModelAndView toSfpk10DrawType() throws Exception {
		return createSuccessModelAndView("config/sfpk10DrawType", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/sfpk10DrawTypeSubmit", method=RequestMethod.POST)
	public CustomResponse sfpk10DrawTypeSubmit(Integer type, Integer times) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config selfTypeConfig = configMap.get("draw_self_sfpk10_type");
		Config randomTimesConfig = configMap.get("draw_self_sfpk10_random_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(selfTypeConfig, "三分PK10开奖方式", "draw_self_sfpk10_type", (type==null?1:type)+""));
		configList.add(setConfig(randomTimesConfig, "三分PK10随机开奖次数", "draw_self_sfpk10_random_times", (times==null?1:times)+""));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/config/jspk10DrawType", method=RequestMethod.GET)
	public ModelAndView toJspk10DrawType() throws Exception {
		return createSuccessModelAndView("config/jspk10DrawType", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/jspk10DrawTypeSubmit", method=RequestMethod.POST)
	public CustomResponse jspk10DrawTypeSubmit(Integer type, Integer times) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config selfTypeConfig = configMap.get("draw_self_jspk10_type");
		Config randomTimesConfig = configMap.get("draw_self_jspk10_random_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(selfTypeConfig, "极速PK10开奖方式", "draw_self_jspk10_type", (type==null?1:type)+""));
		configList.add(setConfig(randomTimesConfig, "极速PK10随机开奖次数", "draw_self_jspk10_random_times", (times==null?1:times)+""));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/config/xyk3DrawType", method=RequestMethod.GET)
	public ModelAndView toXyk3DrawType() throws Exception {
		return createSuccessModelAndView("config/xyk3DrawType", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/xyk3DrawTypeSubmit", method=RequestMethod.POST)
	public CustomResponse xyk3DrawTypeSubmit(Integer type, Integer times) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config selfTypeConfig = configMap.get("draw_self_xyk3_type");
		Config randomTimesConfig = configMap.get("draw_self_xyk3_random_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(selfTypeConfig, "幸运快三开奖方式", "draw_self_xyk3_type", (type==null?1:type)+""));
		configList.add(setConfig(randomTimesConfig, "幸运快三随机开奖次数", "draw_self_xyk3_random_times", (times==null?1:times)+""));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/config/jslhcDrawType", method=RequestMethod.GET)
	public ModelAndView jslhcDrawType() throws Exception {
		return createSuccessModelAndView("config/jslhcDrawType", configService.getAllConfigValueMap());
	}
	
	@ResponseBody
	@RequestMapping(value="/system/config/jslhcDrawTypeSubmit", method=RequestMethod.POST)
	public CustomResponse jslhcDrawTypeSubmit(Integer type, Integer times) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config selfTypeConfig = configMap.get("draw_self_jslhc_type");
		Config randomTimesConfig = configMap.get("draw_self_jslhc_random_times");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(selfTypeConfig, "极速六合彩开奖方式", "draw_self_jslhc_type", (type==null?1:type)+""));
		configList.add(setConfig(randomTimesConfig, "极速六合彩随机开奖次数", "draw_self_jslhc_random_times", (times==null?1:times)+""));
		configService.updateConfig(configList);
		
		return createSuccessJsonResponse(null);
	}
}