package com.ssc.admin.controller.system;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.utils.AESEncryptUtil;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.RedisUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.draw.kaicai.api.ApiResponse;
import com.ssc.draw.kaicai.api.ApiResponseData;
import com.ssc.entity.LotteryDraw;
import com.ssc.entity.LotteryType;
import com.ssc.entity.domain.LotteryDrawDomain;
import com.ssc.service.lottery.LotteryTypeService;
import com.ssc.service.system.ConfigService;

@Controller
public class ApiController extends AdminBaseController {
	@Autowired
	private RedisUtil redisUtil;
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private LotteryTypeService lotteryTypeService;
	
	public static Map<String, LotteryType> TYPE_MAP = new HashMap<String, LotteryType>();
	
	@ResponseBody
	@RequestMapping(value="/api/getDomain")
	public String getAppDomain(String data) {
		try {
			Map<String, String> configMap = configService.getAllConfigValueMap();
			String aesKey = configMap.get("aes_key");
			String wapUrl = configMap.get("wap_url");
			
			CustomResponse response = null;
			if(StringUtils.isBlank(wapUrl)) {
				response = createErrorJsonResponse("域名获取失败，请重试！");
			} else {
				response = createSuccessJsonResponse(wapUrl);
			}
			
			return AESEncryptUtil.encrypt(aesKey, JsonUtils.object2JsonNoEscaping(response), null);
		} catch(Exception e) {
			return "Error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/android1")
	public String getAndroidDomain1(String version) {
		try {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			Map<String, String> configMap = configService.getAllConfigValueMap();
			resultMap.put("url", configMap.get("android_url"));
			resultMap.put("updateUrl", configMap.get("android_download"));
			resultMap.put("lowVersion", configMap.get("android_low_version"));
			resultMap.put("currentVersion", configMap.get("android_new_version"));
			resultMap.put("storeVersion", configMap.get("android_store_version"));
			resultMap.put("verifyStoreType", configMap.get("android_verify_store_type"));
			
			return AESEncryptUtil.encrypt(configMap.get("aes_key"), JsonUtils.object2JsonNoEscaping(createSuccessJsonResponse(resultMap)), version);
		} catch(Exception e) {
			return "Error";
		}
	}
	
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value="/android11")
	public String getAndroidDomain11() {
		return URLEncoder.encode(getAndroidDomain1("1"));
	}
	
	@ResponseBody
	@RequestMapping(value="/ios2")
	public String getIosDomain1(String version) {
		try {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			Map<String, String> configMap = configService.getAllConfigValueMap();
			resultMap.put("url", configMap.get("ios_url"));
			resultMap.put("updateUrl", configMap.get("ios_download"));
			resultMap.put("lowVersion", configMap.get("ios_low_version"));
			resultMap.put("currentVersion", configMap.get("ios_new_version"));
			resultMap.put("checkVersion", configMap.get("ios_check_version"));
			resultMap.put("checkVersion2", configMap.get("ios_check_version_2"));
			resultMap.put("checkVersion3", configMap.get("ios_check_version_3"));
			resultMap.put("checkVersion4", configMap.get("ios_check_version_4"));
			String iosVersion = configMap.get("ios_check_version_list");
			if(StringUtils.isNotBlank(iosVersion)) {
				String[] tmps = null;
				Map<String, String> iosVersionMap = new HashMap<String, String>();
				for(String tmp : iosVersion.split(";")) {
					tmps = tmp.split(":");
					iosVersionMap.put(tmps[0], tmps[1]);
				}
				resultMap.put("iosVersionMap", iosVersionMap);
			}
			
			return AESEncryptUtil.encrypt(configMap.get("aes_key"), JsonUtils.object2JsonNoEscaping(createSuccessJsonResponse(resultMap)), version);
		} catch(Exception e) {
			return "Error";
		}
	}
	
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value="/ios21")
	public String getIosDomain21() {
		return URLEncoder.encode(getIosDomain1("1"));
	}
	
	@ResponseBody
	@RequestMapping(value="api/newly.do")
	public String getNewlyOpen(String token, String format, String code, Boolean extend, Integer rows) {
		try {
			return (String) redisUtil.getRedisTemplate().opsForHash().get("ssc-api-last-draw", code);
		} catch(Exception e) {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="api/daily.do")
	public String getDailyOpen(String token, String format, String code, String date) {
		try {
			LotteryType lotteryType = TYPE_MAP.get(code);
			if(lotteryType == null) {
				List<LotteryType> lotteryTypeList = lotteryTypeService.getAllLotteryType();
				for(LotteryType temp : lotteryTypeList) {
					if(temp.getApiCode().equals(code)) lotteryType = temp;
					
					TYPE_MAP.put(temp.getApiCode(), lotteryType);
				}
			}
			
			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.eq(LotteryDrawDomain.NUM, lotteryType.getNum()));
			if(date == null) {
				whereList.add(Where.eq(LotteryDrawDomain.PERIOD_DAY, DateUtil.getShortCurrentDateStr()));
			} else {
				whereList.add(Where.eq(LotteryDrawDomain.PERIOD_DAY, date.replace("-", "")));
			}
			List<LotteryDraw> drawList = baseService.getList(
				LotteryDraw.class,
				whereList,
				Parameter.orderBy(OrderBy.desc(LotteryDrawDomain.PERIOD))
			);
			
			ApiResponse response = new ApiResponse();
			response.setCode(lotteryType.getApiCode());
			response.setRows(drawList == null ? 0 : drawList.size());
			if(drawList != null && drawList.size() > 0) {
				ApiResponseData data = null;
				List<ApiResponseData> dataList = new ArrayList<ApiResponseData>();
				for(LotteryDraw draw : drawList) {
					data = new ApiResponseData();
					data.setExpect(draw.getPeriod());
					if(lotteryType.getNum().equals(LotteryTypeService.XGLHC)) {
						data.setOpencode(draw.getContent());
					} else {
						data.setOpencode(draw.getOriginalContent());
					}
					data.setOpentime(draw.getOpenTime());
					
					dataList.add(data);
				}
				response.setData(dataList);
			}
			
			return JsonUtils.object2JsonString(response);
		} catch(Exception e) {
			return "error";
		}
	}
}