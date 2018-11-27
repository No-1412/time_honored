package com.ssc.admin.controller.agent;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.service.BaseService;
import com.ssc.entity.AgentBack;
import com.ssc.service.agent.AgentBackService;

@Controller
public class AgentBackController extends AdminBaseController {
	@Autowired
	private BaseService baseService;
	
	@Autowired
	private AgentBackService agentBackService;
	
	@RequestMapping(value="/system/agentBack/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("agent/back/table", null);
	}
	
	@RequestMapping(value="/system/agentBack/getList", method=RequestMethod.GET)
	public ModelAndView getList() throws Exception {
		Page<AgentBack> page = agentBackService.getAgentBack(null, 0);
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
		return createSuccessModelAndView("agent/back/page", page);
	}
	
	@RequestMapping(value="/system/agentBack/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("agent/back/edit", baseService.getById(AgentBack.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/agentBack/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(AgentBack agentBack) throws Exception {
		if(agentBack.getMinAmount() == null
				|| agentBack.getMinAmount().compareTo(BigDecimal.ZERO) <= 0) {
			return createErrorJsonResponse("会员输赢总和必须大于0");
		}
		if(agentBack.getPercent() == null
				|| agentBack.getPercent().compareTo(BigDecimal.ZERO) < 0) {
			return createErrorJsonResponse("退佣比率不能小于0");
		}
		
		agentBack.setType(0);
		agentBackService.edit(agentBack);
		
		Page<AgentBack> page = agentBackService.getAgentBack(null, 0);
		if(page != null && page.getItems() != null && page.getItems().size() > 0) {
			AgentBack lastAgentBack = null;
			AgentBack nextAgentBack = null;
			for(int i=0;i<page.getItems().size();i++) {
				AgentBack temp = page.getItems().get(i);
				if(agentBack.getId().longValue() == temp.getId().longValue()){
					if(i !=0){
						lastAgentBack = page.getItems().get(i-1);
					}
					
					if(i < page.getItems().size()-1) {
						nextAgentBack = page.getItems().get(i+1);
					}
					break;
				}
			}
			
			if(lastAgentBack != null) {
				lastAgentBack.setMaxAmount(new BigDecimal(agentBack.getMinAmount().intValue()-1));
				agentBackService.edit(lastAgentBack);
			}
			
			if(nextAgentBack != null) {
				agentBack.setMaxAmount(new BigDecimal(nextAgentBack.getMinAmount().intValue()-1));
				agentBackService.edit(agentBack);
			}else{
				agentBack.setMaxAmount(new BigDecimal(999999999));
				agentBackService.edit(agentBack);
			}
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/agentBack/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		agentBackService.delete(id);
		
		return createSuccessJsonResponse(null);
	}
}