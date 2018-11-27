package com.ssc.admin.controller.agent;

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
import com.ssc.entity.AgentLevel;
import com.ssc.entity.domain.AgentLevelDomain;
import com.ssc.service.agent.AgentLevelService;

@Controller
public class AgentLevelController extends AdminBaseController {
	@Autowired
	private AgentLevelService agentLevelService;
	
	@RequestMapping(value="/system/agentLevel/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("agent/level/table", null);
	}
	
	@RequestMapping(value="/system/agentLevel/getList", method=RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		return createSuccessModelAndView("agent/level/page", agentLevelService.getAllAgentLevel());
	}
	
	@RequestMapping(value="/system/agentLevel/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("agent/level/edit", baseService.getById(AgentLevel.class, id, null));
	}
	
	@Validation(
		args={
			@Arg(field=AgentLevelDomain.NAME, text="名称", minLength=2, maxLength=10),
			@Arg(field=AgentLevelDomain.REMARK, text="备注", minLength=2, maxLength=25)
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/agentLevel/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(AgentLevel agentLevel) throws Exception {
		agentLevelService.edit(agentLevel);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/agentLevel/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		agentLevelService.delete(id);
		
		return createSuccessJsonResponse(null);
	}
}