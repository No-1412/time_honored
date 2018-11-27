package com.ssc.admin.controller.member;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
import com.ssc.core.utils.SecurityUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Agent;
import com.ssc.entity.AgentMember;
import com.ssc.entity.Member;
import com.ssc.entity.MemberBank;
import com.ssc.entity.MemberDml;
import com.ssc.entity.MemberLevel;
import com.ssc.entity.MemberLogin;
import com.ssc.entity.MemberSecurity;
import com.ssc.entity.custom.MemberForm;
import com.ssc.entity.domain.AgentDomain;
import com.ssc.entity.domain.AgentMemberDomain;
import com.ssc.entity.domain.MemberDmlDomain;
import com.ssc.entity.domain.MemberLoginDomain;
import com.ssc.mapper.MemberMapper;
import com.ssc.search.form.MemberSearchForm;
import com.ssc.service.member.MemberLevelService;
import com.ssc.service.member.MemberService;

@Controller
public class MemberController extends AdminBaseController {
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberLevelService memberLevelService;
	
	@RequestMapping(value="/system/member/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		String id = getRequest().getParameter("id");
		Map<String, String> dataMap = new HashMap<String, String>();
		if(StringUtils.isNotBlank(id)) {
			String[] temp = id.split(":");
			if(temp != null && temp.length == 2) {
				dataMap.put("key", temp[0]);
				dataMap.put("value", temp[1]);
			}
		}
		return createSuccessModelAndView("member/table", dataMap);
	}
	
	@RequestMapping(value="/system/member/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page, Integer idx, String value, MemberSearchForm form) throws Exception {
		if(StringUtils.isNotBlank(value)) value = value.trim();
		
		page = page == null ? 1 : (page + 1);
		int totalSize = memberMapper.getMemberCount(idx, value, form);
		Page<MemberForm> memberPage = new Page<MemberForm>();
		memberPage.setPageSize(20);
		memberPage.setPageNo(page);
		memberPage.setTotalSize(totalSize);
		memberPage.setTotalPage(totalSize/20 + (totalSize%20 == 0 ? 0 : 1));
		memberPage.setItems(memberMapper.getMemberList(idx, value, form, (page-1)*20, 20));
		
		return createSuccessModelAndView("member/page", memberPage);
	}
	
	@RequestMapping(value="/system/member/adjustAgent", method=RequestMethod.GET)
	public ModelAndView adjustAgent() throws Exception {
		return createSuccessModelAndView("member/adjustAgent", null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/adjustAgentSubmit", method=RequestMethod.POST)
	public CustomResponse adjustAgentSubmit(Long fromAgent, Long toAgent) throws Exception {
		if(fromAgent == null || toAgent == null) return createErrorJsonResponse("源、目标代理ID不能为空");
		
		Agent agent = baseService.getById(Agent.class, fromAgent, new String[]{AgentDomain.ID});
		if(agent == null) return createErrorJsonResponse("源代理ID不存在！");
		agent = baseService.getById(Agent.class, toAgent, new String[]{AgentDomain.ID});
		if(agent == null) return createErrorJsonResponse("目标代理ID不存在！");
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AgentMemberDomain.AGENT_ID, fromAgent));
		AgentMember am = new AgentMember();
		am.setAgentId(toAgent);
		baseService.update(am, whereList, false);
		return createSuccessJsonResponse(null);
	}
	
	@RequestMapping(value="/system/member/test", method=RequestMethod.GET)
	public ModelAndView toTest() throws Exception {
		return createSuccessModelAndView("member/test", null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/testSubmit", method=RequestMethod.POST)
	public CustomResponse testSubmit(String code, String name, String password) throws Exception {
		if(StringUtils.isBlank(code)) return createErrorJsonResponse("账号不能 为空！");
		if(StringUtils.isBlank(name)) return createErrorJsonResponse("名称不能 为空！");
		if(StringUtils.isBlank(password)) return createErrorJsonResponse("密码不能 为空！");
		if(code.toLowerCase().startsWith("guest")) return createErrorJsonResponse("测试账号不能以guest开头");
		
		Member member = new Member();
		member.setCode(code);
		member.setName(name);
		member.setLpassword(password);
		member.setType(2);
		member.setRemark("#admin#");
		String errorMsg = memberService.register(member, false);
		if(StringUtils.isNotBlank(errorMsg)) {
			return createErrorJsonResponse(errorMsg);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	//编辑
	@RequestMapping(value="/system/member/edit", method=RequestMethod.GET)
	public ModelAndView edit(Long id) throws Exception {
		Member member = baseService.getById(Member.class, id, null);
		MemberDml dml = memberService.getMemberDml(id);
		MemberBank bank = memberService.getMemberBank(id);
		MemberSecurity security = memberService.getMemberSecurity(member.getId());
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dml", dml);
		dataMap.put("bank", bank);
		dataMap.put("member", member);
		dataMap.put("security", security);
		
		return createSuccessModelAndView("member/edit", dataMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(Member member, Long bankId,
			String bankName, String accountCode, Long dmlId, BigDecimal dml,String question,String answer) throws Exception {
		if(StringUtils.isNotBlank(member.getWpassword())) {
			if(member.getWpassword().length() != 4) return createErrorJsonResponse("取款密码必须是4位数字");
			try {
				Integer.valueOf(member.getWpassword());
			} catch(Exception e) {
				return createErrorJsonResponse("取款密码必须是4位数字");
			}
		}
		
		if(member.getTjr() != null && member.getTjr() != 0L) {
			Member tjr = memberService.getMemberById(member.getTjr());
			if(tjr == null) return createErrorJsonResponse("推荐人ID不存在！");
		} else {
			member.setTjr(0L);
		}
		
		
		
		MemberBank bank = null;
		Member oMember = memberService.getMemberById(member.getId());
		
		/*String is_sendMessage_gift = configService.getValueByNid("is_sendMessage_gift");
		if("1".equals(is_sendMessage_gift)){
			if(oMember.getType() ==0 && StringUtils.isNotBlank(oMember.getPhone())){
				int count = memberMapper.getMemberCountByPhone(member.getId(),oMember.getPhone());
				if(count>=1){
					return createErrorJsonResponse("该手机号已注册，请勿重复绑定！");
				}
			}
		}*/
		
		if(StringUtils.isNotBlank(accountCode) || StringUtils.isNotBlank(bankName)
				|| (StringUtils.isNotBlank(member.getName()) && !member.getName().equals(oMember.getName()))) {
			bank = new MemberBank();
			bank.setId(bankId);
			bank.setAccountName(member.getName());
			bank.setAccountCode(accountCode);
			bank.setBankName(bankName);
		}
		
		MemberDml memberDml = null;
		if(dml != null && dml.compareTo(BigDecimal.ZERO) > 0) {
			memberDml = new MemberDml();
			memberDml.setAmount(dml);
			memberDml.setId(dmlId);
		}
		
		if(StringUtils.isNotBlank(member.getWpassword())) {
			member.setWpassword(SecurityUtil.md5(SecurityUtil.sha1(member.getWpassword())));
		}
		memberService.updateMemberById(member, bank, memberDml);
		MemberSecurity memberSecurity = memberService.getMemberSecurity(member.getId());
		if(StringUtils.isNotBlank(answer) || StringUtils.isNotBlank(question)){
			memberSecurity.setQuestion(question);
			memberSecurity.setAnswer(answer);
		}
		memberService.updateMemberSecurity(memberSecurity);
		return createSuccessJsonResponse(null);
	}
	
	//启用/冻结 
	@ResponseBody
	@RequestMapping(value="/system/member/updateStatus", method=RequestMethod.POST)
	public CustomResponse updateStatus(Long id, int data) throws Exception {
		memberService.updateMemberStatus(id, data);
		
		return createSuccessJsonResponse(null);
	}
	
	//调整分层
	@RequestMapping(value="/system/member/updateLevel", method=RequestMethod.GET)
	public ModelAndView updateLevel(Long id) throws Exception {
		Map<Integer, MemberLevel> levelMap = memberLevelService.getMemberLevelMap();
		List<MemberLevel> levelList = new ArrayList<MemberLevel>();
		for(Integer level : levelMap.keySet()) {
			levelList.add(levelMap.get(level));
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("levelList", levelList);
		dataMap.put("id", id);
		Member member = memberService.getMemberById(id);
		dataMap.put("lockLevel", member.getLockLevel());
		dataMap.put("level", member.getLevel());
		return createSuccessModelAndView("member/level", dataMap);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/updateLevelSubmit", method=RequestMethod.POST)
	public CustomResponse updateLevelSubmit(Long id, Integer level, String lockLevel) throws Exception {
		if(id == null || id <= 0) return createSuccessJsonResponse(null);
		if(level == null || level <= 0) return createErrorJsonResponse("会员分层不能为空！");
		
		memberService.updateMemberLevel(id, level, "on".equals(lockLevel) ? 1 : 0);
		return createSuccessJsonResponse(null);
	}
	
	//调整打码量
	@RequestMapping(value="/system/member/updateDml", method=RequestMethod.GET)
	public ModelAndView updateDml(Long id) throws Exception {
		MemberDml memberDml = baseService.getOne(
			MemberDml.class,
			Collections.singletonList(Where.eq(MemberDmlDomain.MEMBER_ID, id))
		);
		return createSuccessModelAndView("member/dml", memberDml);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/updateDmlSubmit", method=RequestMethod.POST)
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public CustomResponse updateDmlSubmit(MemberDml memberDml) throws Exception {
		if(memberDml.getTimes() == null || memberDml.getTimes().compareTo(BigDecimal.ZERO) <= 0) {
			memberDml.setTimes(BigDecimal.ZERO);
		}
		if(memberDml.getAmount() == null || memberDml.getAmount().compareTo(BigDecimal.ZERO) <= 0) {
			memberDml.setAmount(BigDecimal.ZERO);
		}
		memberService.updateMemberDml(memberDml.getMemberId(), memberDml.getAmount(), memberDml.getTimes(), null, 2, null);
		
		return createSuccessJsonResponse(null);
	}
	
	//登录日志 
	@RequestMapping(value="/system/member/loginLog", method=RequestMethod.GET)
	public ModelAndView loginLog(Long id) throws Exception {
		return createSuccessModelAndView("member/log/table", id);
	}
	
	@RequestMapping(value="/system/member/getLoginLogList", method=RequestMethod.GET)
	public ModelAndView getLoginLogList(Integer page, Long memberId) throws Exception {
		Page<MemberLogin> loginLogPage = baseService.getPage(
			MemberLogin.class,
			Collections.singletonList(Where.eq(MemberLoginDomain.MEMBER_ID, memberId)),
			page == null ? 1 : page + 1,
			Parameter.orderBy(OrderBy.desc(MemberLoginDomain.ID))
		);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("page", loginLogPage);
		dataMap.put("memberName", memberService.getMemberById(memberId).getCode());
		return createSuccessModelAndView("member/log/page", dataMap);
	}
	
	//重置密码
	@RequestMapping(value="/system/member/resetPassword", method=RequestMethod.GET)
	public ModelAndView resetPassword(Long id) throws Exception {
		return createSuccessModelAndView("member/resetPassword", id);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/resetPasswordSubmit", method=RequestMethod.POST)
	public CustomResponse resetPasswordSubmit(Long memberId, String password, String confirmPassword) throws Exception {
		if(StringUtils.isBlank(password)
				|| StringUtils.isBlank(confirmPassword)
				|| !password.equals(confirmPassword)) {
			return createErrorJsonResponse("两次输入的密码不一致！");
		}
		
		Member member = new Member();
		member.setId(memberId);
		member.setLpassword(SecurityUtil.md5(SecurityUtil.sha1(password)));
		member.setLockStatus(0);
		member.setErrorTimes(0);
		memberService.updateMemberById(member);
		
		return createSuccessJsonResponse(null);
	}
	
	//调整代理
	@RequestMapping(value="/system/member/updateAgent", method=RequestMethod.GET)
	public ModelAndView updateAgent(Long id) throws Exception {
		return createSuccessModelAndView("member/agent", id);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/member/updateAgentSubmit", method=RequestMethod.POST)
	public CustomResponse updateAgentSubmit(Long id, Long agentId) throws Exception {
		if(id == null || id <= 0) return createSuccessJsonResponse(null);
		if(agentId == null || agentId <= 0L) return createErrorJsonResponse("代理ID不能为空！");
		
		Agent agent = baseService.getById(Agent.class, agentId, new String[]{AgentDomain.ID});
		if(agent == null) return createErrorJsonResponse("代理ID不存在！");
		
		AgentMember agentMember = new AgentMember();
		agentMember.setAgentId(agentId);
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AgentDomain.MEMBER_ID, id));
		baseService.update(agentMember, whereList, false);
		
		return createSuccessJsonResponse(null);
	}
}