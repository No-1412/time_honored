package com.ssc.admin.controller.system;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.annotation.Arg;
import com.ssc.core.annotation.FileUpload;
import com.ssc.core.annotation.Validation;
import com.ssc.core.constant.Constant;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.RedisUtil;
import com.ssc.core.utils.SecurityUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Admin;
import com.ssc.entity.Config;
import com.ssc.entity.CountTotal;
import com.ssc.entity.DailyTouzhuCount;
import com.ssc.entity.LotteryDraw;
import com.ssc.entity.LotteryTouzhu;
import com.ssc.entity.TipVideo;
import com.ssc.entity.domain.AdminDomain;
import com.ssc.entity.domain.DailyTouzhuCountDomain;
import com.ssc.entity.domain.LotteryDrawDomain;
import com.ssc.entity.domain.LotteryTouzhuDomain;
import com.ssc.google.auth.GoogleAuthenticator;
import com.ssc.mapper.RechargeMapper;
import com.ssc.mapper.WithdrawMapper;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.system.ConfigService;
import com.ssc.service.system.CountService;

@Controller
public class SystemController extends AdminBaseController {
	@Autowired
	private RedisUtil redisUtil;
	
	@Autowired
	private CountService countService;
	
	@Autowired
	private RechargeMapper rechargeMapper;
	
	@Autowired
	private WithdrawMapper withdrawMapper;
	
	@RequestMapping(value={"/", Constant.LOGIN_URL, "/system/index"}, method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		String page = "system/login";
		Map<String, Object> data = new HashMap<String, Object>();
		
		Admin admin = (Admin)getSessionAttribute(Constant.SESSION_USER);
		if(getSessionAttribute(Constant.SESSION_USER) != null) {
			page = "system/index";
			
			data.put("admin", admin);
			data.put("menuList", getMenuList(admin.getTypeId(), 1));
		}
		data.put("webName", configService.getValueByNid(ConfigService.WEB_NAME));
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(LotteryDrawDomain.STATUS, 0));
		whereList.add(Where.eq(LotteryDrawDomain.NUM, LotteryTypeService.XGLHC));
		LotteryDraw draw = baseService.getOne(LotteryDraw.class, whereList, Parameter.querySingle("count(1) num"));
		data.put("num", (draw == null ? 0 : draw.getNum()) > 3 ? 0 : 1);
		
		return createSuccessModelAndView(page, data);
	}
	
	@RequestMapping(value="/system/first", method=RequestMethod.GET)
	public ModelAndView toFirst() throws Exception {
		List<String> dayList = new ArrayList<String>();
		Date date = DateUtil.getCurrentDate();
		for(int i=3;i<10;i++) dayList.add(DateUtil.dateFormat(DateUtil.addDay(date, -i)));
		
		return createSuccessModelAndView("system/first", dayList);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/first/count", method=RequestMethod.POST)
	public CustomResponse firstCount(Integer type) throws Exception {
		Date dateBegin = (Date) getSessionAttribute("last_time");
		if(dateBegin == null) dateBegin = new Date();
		setSessionAttribute("last_time", new Date());
		dateBegin = DateUtil.addSeconds(dateBegin, -1);
		
		//待审核出款
		List<Integer> levelList = getChoiceList(3, false);
		int withdrawTimes = 0;
		if(levelList != null && levelList.size() > 0) {
			withdrawTimes = withdrawMapper.getMemberWithdraw(null, 0, levelList, null,null, type == 1 ? dateBegin : null, null, null, null, 1);
		}
		
		//待审核入款
		levelList = getChoiceList(2, false);
		List<Integer> typeList = getChoiceList(1, false);
		int rechargeTimes = 0;
		if(typeList != null && levelList != null && typeList.size() > 0 && levelList.size() > 0) {
			rechargeTimes = rechargeMapper.getMemberRecharge(null, 0, typeList, 2, levelList, null, 1, type == 1 ? dateBegin : null, null, null,null);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		if(type == 1) {
			TipVideo tipVideo = (TipVideo) redisUtil.getRedisValue("ssc-tip-video");
			if(tipVideo == null) {
				tipVideo = baseService.getById(TipVideo.class, 1L, null);
				redisUtil.setRedisValue("ssc-tip-video", tipVideo);
			}
			
			dataMap.put("rechargeTime", tipVideo.getRechargeTime()*1000);
			dataMap.put("rechargeCount", rechargeTimes);
			dataMap.put("rechargeAudio", tipVideo.getRechargeVideo());
			
			dataMap.put("withdrawTime", tipVideo.getWithdrawTime()*1000);
			dataMap.put("withdrawCount", withdrawTimes);
			dataMap.put("withdrawAudio", tipVideo.getWithdrawVideo());
			
			//线上入款
//			int onlineTimes = rechargeMapper.getMemberRecharge(null, 1, typeList, 1, levelList, null, 2, dateBegin, null, null,null);
//			dataMap.put("onlineTime", tipVideo.getOnlineTime()*1000);
//			dataMap.put("onlineCount", onlineTimes);
//			dataMap.put("onlineAudio", tipVideo.getOnlineVideo());
		} else {
			dataMap.put("rechargeCount", rechargeTimes);
			dataMap.put("withdrawCount", withdrawTimes);
			
			dataMap.put("online", countService.getOnlineUser());
			dataMap.put("userBalance", countService.getUserBalance());
			
			List<CountTotal> countList = countService.getCountTotal();
			dataMap.put("total", countList.get(0));
			dataMap.put("current", countList.get(1));
			
			//前9天下注会员情况
			Date date = DateUtil.getCurrentDate();
			Integer[] dayList = new Integer[9];
			for(int i=1;i<=9;i++) {
				date = DateUtil.addDay(date, -1);
				dayList[i-1] = Integer.valueOf(DateUtil.dateFormat(date).replaceAll("-", ""));
			}
			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.in(DailyTouzhuCountDomain.DAY, dayList));
			List<DailyTouzhuCount> tzMemberList = baseService.getList(
				DailyTouzhuCount.class,
				whereList,
				Parameter.orderBy(OrderBy.asc(DailyTouzhuCountDomain.DAY)),
				Parameter.queryColumn(new String[]{DailyTouzhuCountDomain.DAY, DailyTouzhuCountDomain.MEMBERS})
			);
			Map<Integer, Integer> tzMemberMap = new HashMap<Integer, Integer>();
			if(tzMemberList != null && tzMemberList.size() > 0) {
				for(DailyTouzhuCount tc : tzMemberList) tzMemberMap.put(tc.getDay(), tc.getMembers());
			}
			
			List<Integer> resultList = new ArrayList<Integer>();
			for(Integer day : dayList) resultList.add(tzMemberMap.get(day) == null ? 0 : tzMemberMap.get(day));
			
			
			//当天下注会员数
			whereList = new ArrayList<Where>();
			whereList.add(Where.eq(LotteryTouzhuDomain.MEMBER_TYPE, 0));
			whereList.add(Where.ge(LotteryTouzhuDomain.ADD_TIME, DateUtil.getCurrentDate()));
			LotteryTouzhu tz = baseService.getOne(LotteryTouzhu.class, whereList, Parameter.querySingle("count(distinct member_id) id"));
		
			resultList.add(0, tz == null ? 0 : tz.getId().intValue());
			dataMap.put("tzMembers", resultList);
		}
		
		return createSuccessJsonResponse(dataMap);
	}
	
	@Validation(
		args={
			@Arg(index=1, text="用户名"),
			@Arg(index=2, text="密码"),
		}
	)
	@ResponseBody
	@RequestMapping(value="/common/login/submit", method=RequestMethod.POST)
	public CustomResponse login(String username, String password, String vcode) throws Exception {
		if(StringUtils.isBlank(vcode)) return createSuccessJsonResponse("动态口令不能为空！");
		
		Admin admin = baseService.getOne(Admin.class, Collections.singletonList(Where.eq(AdminDomain.CODE, username)));
		String key = configService.getValueByNid("google_auth_key");
//		if(!(GoogleAuthenticator.authcode(vcode, GoogleAuthenticator.getKey(key))
//				|| (StringUtils.isNotBlank(admin.getAuthKey()) && GoogleAuthenticator.authcode(vcode, GoogleAuthenticator.getKey(admin.getAuthKey()))))) {
//			return createErrorJsonResponse("动态口令错误，请重新输入！");
//		}
		
		if(admin == null
				|| !SecurityUtil.md5(SecurityUtil.sha1(password)).equals(admin.getPassword())) {
			return createErrorJsonResponse("用户不存在或密码错误");
		}
		if(admin.getStatus() == -1) {
			return createErrorJsonResponse("用户已被锁定！");
		}
		
		RedisTemplate<String, Object> redisTemplate = redisUtil.getRedisTemplate();
		redisTemplate.boundHashOps("ssc-sso-user").put(admin.getId(), getRequest().getSession().getId());
		
		setSessionAttribute(Constant.SESSION_USER, admin);
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/common/logout", method=RequestMethod.GET)
	public ModelAndView logout() throws Exception {
		removeSessionAttribute(Constant.SESSION_USER);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("webName", configService.getValueByNid(ConfigService.WEB_NAME));
		
		return createSuccessModelAndView("system/login", data);
	}
	
	@ResponseBody
	@FileUpload(fieldsName={"imgUrl"})
	@RequestMapping(value="/system/upload", method=RequestMethod.POST)
	public CustomResponse upload(MultipartHttpServletRequest request, String imgUrl) throws Exception {
		return createSuccessJsonResponse(Collections.singletonMap("imgUrl", imgUrl));
	}
	
	@RequestMapping(value="/system/tipVideo", method=RequestMethod.GET)
	public ModelAndView toTipVideo() throws Exception {
		return createSuccessModelAndView("video/config", baseService.getById(TipVideo.class, 1L, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/tipVideo/submit", method=RequestMethod.POST)
	public CustomResponse tipVideoSubmit(MultipartHttpServletRequest request, TipVideo tipVideo) throws Exception {
		Map<String, MultipartFile> fileMap = request.getFileMap();
		
		String fileName = "";
		String fileSuffix = "";
		String uploadPath = configService.getValueByNid("upload_img_path");
		for(String field : fileMap.keySet()) {
			MultipartFile file = fileMap.get(field);
			if(file == null || file.getSize() <= 0 || StringUtils.isBlank(file.getOriginalFilename())) continue;
			
			fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			if("rechargeVideo1".equals(field)) {
				fileName = "uploadimg/video/recharge" + fileSuffix;
				tipVideo.setRechargeVideo(fileName);
			} else if("withdrawVideo1".equals(field)) {
				fileName = "uploadimg/video/withdraw" + fileSuffix;
				tipVideo.setWithdrawVideo(fileName);
			} else if("onlineVideo1".equals(field)) {
				fileName = "uploadimg/video/online" + fileSuffix;
				tipVideo.setOnlineVideo(fileName);
			}
			
			file.transferTo(new File(uploadPath + "/" + fileName));
		}
		baseService.updateById(tipVideo, tipVideo.getId(), false);
		
		//更新缓存
		redisUtil.setRedisValue("ssc-tip-video", baseService.getById(TipVideo.class, 1L, null));
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/reg/config", method=RequestMethod.GET)
	public ModelAndView toRegConfig() throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config qq = configMap.get("reg_qq_set");
		Config phone = configMap.get("reg_phone_set");
		Config email = configMap.get("reg_email_set");
		Config spread = configMap.get("reg_spread_set");
		Config agentQQ = configMap.get("reg_agent_rel_qq");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("qq", qq == null ? 0 : Integer.valueOf(qq.getValue()));
		dataMap.put("phone", phone == null ? 0 : Integer.valueOf(phone.getValue()));
		dataMap.put("email", email == null ? 0 : Integer.valueOf(email.getValue()));
		dataMap.put("spread", spread == null ? BigDecimal.ZERO : new BigDecimal(spread.getValue()));
		dataMap.put("reg_agent_rel_qq", "NVL".equals(agentQQ == null ? "NVL" : agentQQ.getValue()) ? "" : agentQQ.getValue());
		
		return createSuccessModelAndView("reg/config", dataMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/reg/configSubmit", method=RequestMethod.POST)
	public CustomResponse regConfigSubmit(Integer phone, Integer email, Integer qq, BigDecimal spread, String regAgentRelQQ) throws Exception {
		Map<String, Config> configMap = configService.getAllConfigMap();
		Config qqConfig = configMap.get("reg_qq_set");
		Config phoneConfig = configMap.get("reg_phone_set");
		Config emailConfig = configMap.get("reg_email_set");
		Config spreadConfig = configMap.get("reg_spread_set");
		Config regAgentRelQQConfig = configMap.get("reg_agent_rel_qq");
		
		List<Config> configList = new ArrayList<Config>();
		configList.add(setConfig(qqConfig, " 注册QQ设置", "reg_qq_set", (qq==null?0:qq)+""));
		configList.add(setConfig(phoneConfig, " 注册手机设置", "reg_phone_set", (phone==null?0:phone)+""));
		configList.add(setConfig(emailConfig, " 注册邮箱设置", "reg_email_set", (email==null?0:email)+""));
		configList.add(setConfig(spreadConfig, " 推荐收益转换率", "reg_spread_set", (spread==null?BigDecimal.ZERO:spread)+""));
		configList.add(setConfig(regAgentRelQQConfig, " 代理加盟联系QQ", "reg_agent_rel_qq", StringUtils.isBlank(regAgentRelQQ)?"NVL":regAgentRelQQ));
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