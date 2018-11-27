package com.ssc.admin.controller.agent;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.annotation.Arg;
import com.ssc.core.annotation.Validation;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Agent;
import com.ssc.entity.domain.AgentLevelDomain;
import com.ssc.service.agent.AgentLevelService;
import com.ssc.service.agent.AgentService;
import com.ssc.service.member.MemberLevelService;

@Controller
public class AgentController extends AdminBaseController {
	@Autowired
	private AgentService agentService;
	
	@Autowired
	private AgentLevelService agentLevelService;
	
	@Autowired
	private MemberLevelService memberLevelService;
	
	@RequestMapping(value="/system/agent/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("agent/table", null);
	}
	
	@RequestMapping(value="/system/agent/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer idx, String value, Integer status) throws Exception {
		Agent agent = new Agent();
		agent.setStatus(status);
		if(StringUtils.isNotBlank(value)) {
			try {
				if(idx == 2) agent.setId(Long.valueOf(value));
				else if(idx == 1) agent.setCode(value);
				else if(idx == 3) agent.setExtUrl(value);
			} catch(Exception e) {
				agent.setId(0L);
			}
		}
		Map<Long, String> agentLevelMap = agentLevelService.getAllAgentLevelName(null);
		Page<Agent> resultPage = agentService.getAgentPage(getPageNo(page), agent);
		if(resultPage != null && resultPage.getItemsCount() > 0) {
			for(Agent temp : resultPage.getItems()) {
				temp.addExpression("levelName", agentLevelMap.get(temp.getLevel()));
			}
		}
		return createSuccessModelAndView("agent/page", resultPage);
	}
	
	@RequestMapping(value="/system/agent/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		Agent agent = baseService.getById(Agent.class, id, null);
		if(agent == null) {
			agent = new Agent();
			agent.setStatus(1);
			agent.setLevel(1L);
		}
		agent.addExpand("levelList", memberLevelService.getMemberLevelList());
		agent.addExpand("agentLevel", agentLevelService.getAllAgentLevelName(1));
		
		return createSuccessModelAndView("agent/edit", agent);
	}
	
	@Validation(
		args={
			@Arg(field=AgentLevelDomain.NAME, text="名称", minLength=2, maxLength=10)
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/agent/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(Agent agent) throws Exception {
		agentService.edit(agent);
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/agent/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		agentService.delete(id);
		return createSuccessJsonResponse(null);
	}
}