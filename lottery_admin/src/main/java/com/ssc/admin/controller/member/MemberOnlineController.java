package com.ssc.admin.controller.member;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.constant.Constant;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.RedisUtil;
import com.ssc.core.utils.StringUtils;

@Controller
public class MemberOnlineController extends AdminBaseController {
	@Autowired
	private RedisUtil redisUtil;
	
	@RequestMapping(value="/member/online/{type}", method=RequestMethod.GET)
	public ModelAndView toIndex(@PathVariable("type")String type) throws Exception {
		return createSuccessModelAndView("member/online/table", type);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/member/online/{type}/getList", method=RequestMethod.GET)
	public ModelAndView getList(@PathVariable("type")String type) throws Exception {
		List<Map> resultList = new ArrayList<Map>();
		if("pc".equals(type)) {
			resultList.addAll(getOnlineUserInfo(1, Constant.ONLINE_MAP.get(1)));
		} else if("wap".equals(type)) {
			resultList.addAll(getOnlineUserInfo(2, Constant.ONLINE_MAP.get(2)));
		} else if("app".equals(type)) {
			resultList.addAll(getOnlineUserInfo(3, Constant.ONLINE_MAP.get(3)));
			resultList.addAll(getOnlineUserInfo(4, Constant.ONLINE_MAP.get(4)));
		}
		
		Page<Map> resultPage = null;
		if(resultList != null && resultList.size() > 0) {
			int num = resultList.size();
			for(Map temp : resultList) {
				temp.put("num", num--);
			}
			resultPage = new Page<Map>();
			resultPage.setPageNo(1);
			resultPage.setTotalPage(1);
			resultPage.setItems(resultList);
			resultPage.setPageSize(resultList.size());
			resultPage.setTotalSize(resultPage.getPageSize());
		}
		
		ModelAndView view = createSuccessModelAndView("member/online/page", resultPage);
		view.addObject("type", type);
		
		return view;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<Map> getOnlineUserInfo(int type, String hashKey) { 
		List<Map> mapList = new ArrayList<Map>();
		RedisTemplate redisTemplate = redisUtil.getRedisTemplate();
		if(StringUtils.isNotBlank(hashKey)) {
			Set<Object> keySet = redisTemplate.boundHashOps(hashKey).keys();
			if(keySet != null && keySet.size() > 0) {
				String temp = null;
				Map userMap = null;
				Long expireTime = 0L;
				Date date = new Date();
				for(Object key : keySet) {
					temp = (String)redisTemplate.boundHashOps(hashKey).get(key);
					if(!(key instanceof String) || StringUtils.isBlank(temp)) continue;
					
					//session过期
					if(((String)key).startsWith("app-ys-")) expireTime = redisTemplate.getExpire(((String)key).replace("-ys-", ""));
					else expireTime = redisTemplate.getExpire((String)key);
					if(expireTime <= 0) {
						redisTemplate.boundHashOps(hashKey).delete(key);
						continue;
					}
					
					//用户登录信息
					userMap = JsonUtils.fromJson(temp, Map.class);
					userMap.put("sessionId", key);
					
					//最后活跃时间
					userMap.put("lastActive", DateUtil.addSeconds(date, expireTime.intValue()-1800));
					
					//在线时间
					userMap.put("onlineTime", getOnlinetTime(userMap));
					
					//App设备
					if(type == 3) userMap.put("appType", "IOS");
					else if(type == 4) userMap.put("appType", "Android");
					
					mapList.add(userMap);
				}
			}
		}
		
		return mapList;
	}
	
	@SuppressWarnings("rawtypes")
	private String getOnlinetTime(Map map) {
		Date date2 = (Date)map.get("lastActive");
		String date1 = (String)map.get("logTime");
		if(StringUtils.isBlank(date1) || date2 == null) return "";
		
		long seconds = (date2.getTime() - DateUtil.timeParse(date1).getTime())/1000;
		return seconds/3600 + "时" + (seconds%3600)/60 + "分" + (seconds%60) + "秒";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/online/out", method=RequestMethod.POST)
	public CustomResponse out(String data) throws Exception {
		if(StringUtils.isNotBlank(data)) redisUtil.delete(data.startsWith("app-ys-") ? data.replace("-ys-", "") : data);
		return createSuccessJsonResponse(null);
	}
}