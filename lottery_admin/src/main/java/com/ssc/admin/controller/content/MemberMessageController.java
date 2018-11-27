package com.ssc.admin.controller.content;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.ssc.entity.Agent;
import com.ssc.entity.MemberMessage;
import com.ssc.entity.domain.AgentDomain;
import com.ssc.entity.domain.MemberMessageDomain;
import com.ssc.service.content.MemberMessageService;
import com.ssc.service.member.MemberLevelService;

@Controller
public class MemberMessageController extends AdminBaseController {
	@Autowired
	private MemberMessageService messageService;
	
	@Autowired
	private MemberLevelService memberLevelService;
	
	@RequestMapping(value="/member/message/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("message/table", null);
	}
	
	@RequestMapping(value="/member/message/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer type, String memberCode) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.gt(MemberMessageDomain.ID, 0));
		if(type != null && type > 0) {
			whereList.add(Where.eq(MemberMessageDomain.TYPE, type));
		}
		if(StringUtils.isNotBlank(memberCode)) {
			whereList.add(Where.in(MemberMessageDomain.MEMBER_CODE, new String[]{memberCode, "ALL"}));
		}
		whereList.add(Where.eq(MemberMessageDomain.ALL_ID, 0L));
		Page<MemberMessage> messagePage = baseService.getPage(
			MemberMessage.class,
			whereList,
			page == null ? 1 : (page+1),
			Parameter.orderBy(OrderBy.desc(MemberMessageDomain.ADD_TIME)),
			Parameter.queryColumn(new String[]{
				MemberMessageDomain.ID, MemberMessageDomain.MEMBER_CODE, MemberMessageDomain.MEMBER_NAME,
				MemberMessageDomain.TITLE, MemberMessageDomain.ADD_TIME, MemberMessageDomain.UPD_TIME, "concat(left(content, 50), '......') content"
			})
		);
		
		return createSuccessModelAndView("message/page", messagePage);
	}
	
	@RequestMapping(value="/member/message/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		MemberMessage messagae = null;
		if(id != null && id > 0L) {
			messagae = baseService.getById(MemberMessage.class, id, null);
		}
		
		return createSuccessModelAndView("message/edit", messagae);
	}
	
	@Validation(
		args={
			@Arg(field=MemberMessageDomain.MEMBER_CODE, text="会员账号"),
			@Arg(field=MemberMessageDomain.TITLE, text="标题", maxLength=25),
			@Arg(field=MemberMessageDomain.CONTENT, text="内容", maxLength=200)
		}
	)
	@ResponseBody
	@RequestMapping(value="/member/message/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(MemberMessage message) throws Exception {
		String errorMsg = messageService.editMessage(message);
		if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(errorMsg);
		
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/member/message/batch", method=RequestMethod.GET)
	public ModelAndView toBatchEdit(Long id) throws Exception {
		return createSuccessModelAndView("message/batch", null);
	}
	
	@ResponseBody
	@RequestMapping(value="/member/message/batchSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Integer level, Long agent, String title, String content) throws Exception {
		if(level == null) return createErrorJsonResponse("会员分层不能为空！");
		if(agent == null) return createErrorJsonResponse("代理账号不能为空！");
		if(StringUtils.isBlank(title)) return createErrorJsonResponse("标题不能为空！");
		if(StringUtils.isBlank(content)) return createErrorJsonResponse("内容不能为空！");
		if(0 == level && 0 == agent.intValue()) return createErrorJsonResponse("会员层级、代理ID不能同时为0！");
		
		if(0 != level && memberLevelService.getMemberLevelMap().get(level) == null) return createErrorJsonResponse("会员层级不存在！");
		if(0 != agent) {
			Agent tmp = baseService.getById(Agent.class, agent, new String[]{AgentDomain.ID});
			if(tmp == null) return createErrorJsonResponse("代理ID不存在！");
		}
		
		messageService.batchAddMessage(level, agent, title, content);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/member/message/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		return createSuccessJsonResponse(messageService.deleteMessage(null, id));
	}
}