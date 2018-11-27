package com.ssc.admin.controller.member;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.service.BaseService;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.AgentBack;
import com.ssc.entity.CheckinLog;
import com.ssc.entity.Config;
import com.ssc.entity.domain.CheckinLogDomain;
import com.ssc.service.agent.AgentBackService;
import com.ssc.service.system.ConfigService;

@Controller
public class CheckinController extends AdminBaseController {
	@Autowired
	private BaseService baseService;
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private AgentBackService agentBackService;
	
	@RequestMapping(value="/system/checkin/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("member/checkin/table", null);
	}
	
	@RequestMapping(value="/system/checkin/getList", method=RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		Page<AgentBack> page = agentBackService.getAgentBack(null, 1);
		if(page != null && page.getItems() != null && page.getItems().size() > 0) {
			String total = "";
			AgentBack agentBack = null;
			AgentBack nextAgentBack = null;
			for(int i=0;i<page.getItems().size();i++) {
				nextAgentBack = null;
				agentBack = page.getItems().get(i);
				if(i < page.getItems().size()-1) {
					nextAgentBack = page.getItems().get(i+1);
				}
				
				total = agentBack.getMinAmount().intValue() + "~";
				if(nextAgentBack != null) {
					total += (nextAgentBack.getMinAmount().intValue()-1);
				}
				agentBack.addExpression("total", total);
			}
		}
		return createSuccessModelAndView("member/checkin/page", page);
	}
	
	@RequestMapping(value="/system/checkin/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("member/checkin/edit", baseService.getById(AgentBack.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/checkin/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(AgentBack agentBack) throws Exception {
		if(agentBack.getMinAmount() == null
				|| agentBack.getMinAmount().compareTo(BigDecimal.ZERO) <= 0) {
			return createErrorJsonResponse("最近三天充值总和必须大于0");
		}
		if(agentBack.getPercent() == null
				|| agentBack.getPercent().compareTo(BigDecimal.ZERO) < 0) {
			return createErrorJsonResponse("赠送比率不能小于0");
		}
		agentBack.setType(1);
		agentBackService.edit(agentBack);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/checkin/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		agentBackService.delete(id);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/checkin/maxedit", method=RequestMethod.GET)
	public ModelAndView toMaxedit(Long id) throws Exception {
		Config config = configService.getConfigByNid("max_gift_amount");
		return createSuccessModelAndView("member/checkin/maxedit", config);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/checkin/maxeditSubmit", method=RequestMethod.POST)
	public CustomResponse maxeditSubmit(Config config) throws Exception {
		config.setType(0);
		config.setUpdBy(getSessionUser().getCode());
		config.setUpdTime(new Date());
		if(config.getId() == null) {
			config.setType(2);
			config.setNid("max_gift_amount");
			config.setName("最大红包金额");
			config.setAddBy(config.getUpdBy());
			config.setAddTime(config.getUpdTime());
			configService.addConfig(config);
		} else {
			configService.updateConfig(config);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/checkin/log", method=RequestMethod.GET)
	public ModelAndView toLogIndex() throws Exception {
		return createSuccessModelAndView("member/checkin/logtable", null);
	}
	
	@RequestMapping(value="/system/checkin/getLogList", method=RequestMethod.GET)
	public ModelAndView getLogList(Integer page, String memberCode, Date timestart, Date timeend) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.gt(CheckinLogDomain.ID, 0L));
		if(StringUtils.isNotBlank(memberCode)) {
			whereList.add(Where.eq(CheckinLogDomain.MEMBER_CODE, memberCode));
		}
		whereList.add(Where.between(CheckinLogDomain.CHECKIN_TIME, timestart, timeend, true, true));
		Page<CheckinLog> resultPage = baseService.getPage(
			CheckinLog.class,
			whereList,
			page == null ? 1 : page + 1,
			Parameter.orderBy(OrderBy.desc(CheckinLogDomain.CHECKIN_DAY), OrderBy.desc(CheckinLogDomain.GIFT_AMOUNT))
		);
		return createSuccessModelAndView("member/checkin/logpage", resultPage);
	}
}