package com.ssc.admin.controller.spread;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.ssc.core.utils.RedisUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Member;
import com.ssc.entity.custom.SpreadForm;
import com.ssc.mapper.SpreadMapper;

@Controller
public class SpreadController extends AdminBaseController {
	@Autowired
	private RedisUtil redisUtil;
	
	@Autowired
	private SpreadMapper spreadMapper;
	
	@RequestMapping(value="/system/spread/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("spread/table", null);
	}
	
	@RequestMapping(value="/system/spread/index1", method=RequestMethod.GET)
	public ModelAndView toIndex(String id) throws Exception {
		String[] values = StringUtils.isBlank(id) ? null : id.split("--", 4);
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("memberId", values == null ? null : values[0]);
		resultMap.put("timestart", values == null ? null : values[1]);
		resultMap.put("timeend", values == null ? null : values[2]);
		resultMap.put("memberCode", values == null ? null : values[3]);
		
		if(StringUtils.isBlank(resultMap.get("timestart"))) {
			resultMap.put("timestart", DateUtil.dateFormat(DateUtil.addDay(new Date(), -1)));
		}
		return createSuccessModelAndView("spread/table1", resultMap);
	}
	
	@RequestMapping(value="/system/spread/getList1", method=RequestMethod.GET)
	public ModelAndView getList1(Integer page, Long memberId, String memberCode, String timestart, String timeend) throws Exception {
		page = page == null ? 1 : (page + 1);
		
		SpreadForm search = new SpreadForm();
		search.setBegin((page-1)*20);
		search.setEnd(20);
		search.setMemberId(memberId);
		if(StringUtils.isNotBlank(memberCode)) search.setMemberCode(memberCode);
		if(StringUtils.isBlank(timestart)) timestart = DateUtil.dateFormat(DateUtil.addDay(new Date(), -1));
		if(StringUtils.isNotBlank(timestart)) search.setDateFrom(Integer.valueOf(timestart.replaceAll("-", "")));
		if(StringUtils.isNotBlank(timeend)) search.setDateTo(Integer.valueOf(timeend.replaceAll("-", "")));
		
		SpreadForm count = spreadMapper.getSpreadCount(search);
		
		Page<SpreadForm> spreadPage = new Page<SpreadForm>();
		spreadPage.setPageSize(20);
		spreadPage.setPageNo(page);
		spreadPage.setTotalSize(count.getTotalSize());
		spreadPage.setTotalPage(count.getTotalSize()/20 + (count.getTotalSize()%20 == 0 ? 0 : 1));
		if(count.getTotalSize() > 0) {
			List<SpreadForm> resultList = spreadMapper.getSpreadList(search);
			resultList.add(count);
			
			spreadPage.setItems(resultList);
		}
		
		return createSuccessModelAndView("spread/page1", spreadPage);
	}
	
	@RequestMapping(value="/system/spread/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Long memberId, String memberCode, String timestart, String timeend) throws Exception {
		page = page == null ? 1 : (page + 1);
		
		SpreadForm search = new SpreadForm();
		search.setBegin((page-1)*20);
		search.setEnd(20);
		search.setMemberId(memberId);
		if(StringUtils.isNotBlank(memberCode)) search.setMemberCode(memberCode);
		if(StringUtils.isNotBlank(timestart)) search.setDateFrom(Integer.valueOf(timestart.replaceAll("-", "")));
		if(StringUtils.isNotBlank(timeend)) search.setDateTo(Integer.valueOf(timeend.replaceAll("-", "")));
		
		SpreadForm count = spreadMapper.getSpreadCount1(search);
		
		Page<SpreadForm> spreadPage = new Page<SpreadForm>();
		spreadPage.setPageSize(20);
		spreadPage.setPageNo(page);
		spreadPage.setTotalSize(count.getTotalSize());
		spreadPage.setTotalPage(count.getTotalSize()/20 + (count.getTotalSize()%20 == 0 ? 0 : 1));
		if(count.getTotalSize() > 0) {
			List<SpreadForm> resultList = spreadMapper.getSpreadList1(search);
			resultList.add(count);
			
			spreadPage.setItems(resultList);
		}
		
		ModelAndView view = createSuccessModelAndView("spread/page", spreadPage);
		view.addObject("dataid", (memberId==null?"":memberId)+"--"+timestart+"--"+timeend);
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/system/spread/{type}", method=RequestMethod.POST)
	public CustomResponse danger(@PathVariable("type")String type, Long id) throws Exception {
		try {
			Member member = new Member();
			member.setId(id);
			member.setIsDanger("danger".equals(type) ? 1 : 0);
			baseService.updateById(member, id, false);
			
			redisUtil.getRedisTemplate().opsForHash().put(Constant.SESSION_USER_CACHE, id, null);
			
			return createSuccessJsonResponse(null);
		} catch(Exception e) {
			return createErrorJsonResponse("操作失败！");
		}
	}
}