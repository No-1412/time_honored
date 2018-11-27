package com.ssc.admin.controller.system;

import java.util.ArrayList;
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
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.mapper.CommonMapper;

@Controller
public class SqlController extends AdminBaseController {
	@Autowired
	private CommonMapper commonMapper;
	
	@RequestMapping(value="/system/sql", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("system/sql", null);
	}
	
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/system/sql/execute", method=RequestMethod.POST)
	public CustomResponse submit(String sql) throws Exception {
		sql = sql == null ? null : sql.trim();
		if(StringUtils.isBlank(sql) || sql.contains(";")) return createErrorJsonResponse("无效的sql语句");
		
		List<Map> resultList = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			resultList = commonMapper.executeQuery(sql);
		} catch(Exception e) {
			dataMap.put("exception", JsonUtils.object2JsonString(e));
			return createSuccessJsonResponse(dataMap);
		}
		if(resultList == null || resultList.size() <= 0) return createErrorJsonResponse("查不到数据");
		
		List keyList = new ArrayList();
		List<List> tmpList = new ArrayList<List>();
		for(Object key : resultList.get(0).keySet()) keyList.add(key);
		tmpList.add(keyList);
		
		List tmpList1 = new ArrayList();
		for(Map map : resultList) {
			tmpList1 = new ArrayList();
			for(Object key : keyList) {
				tmpList1.add(map.get(key));
			}
			tmpList.add(tmpList1);
		}
		
		dataMap.put("result", tmpList);
		dataMap.put("exception", "NVL");
		
		return createSuccessJsonResponse(dataMap);
	}
}