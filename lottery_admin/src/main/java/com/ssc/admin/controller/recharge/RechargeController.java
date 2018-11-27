package com.ssc.admin.controller.recharge;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.Admin;
import com.ssc.entity.AdminChoice;
import com.ssc.entity.HandOps;
import com.ssc.entity.Member;
import com.ssc.entity.MemberDml;
import com.ssc.entity.MemberLevel;
import com.ssc.entity.MemberRecharge;
import com.ssc.entity.RechargeWithdrawConfig;
import com.ssc.entity.RechargeWithdrawTimes;
import com.ssc.entity.custom.RechargeForm;
import com.ssc.entity.domain.AdminChoiceDomain;
import com.ssc.entity.domain.HandOpsDomain;
import com.ssc.entity.domain.MemberDomain;
import com.ssc.entity.domain.MemberRechargeDomain;
import com.ssc.mapper.RechargeMapper;
import com.ssc.service.member.MemberLevelService;
import com.ssc.service.member.MemberService;
import com.ssc.service.recharge.RechargeService;
import com.ssc.service.withdraw.WithdrawService;

@Controller
public class RechargeController extends AdminBaseController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private RechargeMapper rechargeMapaper;

	@Autowired
	private WithdrawService withdrawService;

	@Autowired
	private RechargeService rechargeService;

	@Autowired
	private MemberLevelService memberLevelService;

	// 手动存取款
	@RequestMapping(value = "/account/hand/index", method = RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		ModelAndView view = createSuccessModelAndView("member/hand/table", DateUtil.getCurrentDateStr());

		List<String> numList = new ArrayList<String>();
		String wechatNum = configService.getValueByNid("r_hand_wechat_num");
		int size = StringUtils.isBlank(wechatNum) ? 0 : Integer.valueOf(wechatNum);
		for (int i = 1; i <= size; i++)
			numList.add("3" + i);
		view.addObject("wechatNumList", numList);
		return view;
	}

	@RequestMapping(value = "/account/hand/getList", method = RequestMethod.GET)
	public ModelAndView getList(Integer page, String memberCode, String verifyUser, Date dateStart, Date dateEnd,
			Integer type) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if (StringUtils.isNotBlank(memberCode)) {
			whereList.add(Where.eq(HandOpsDomain.MEMBER_CODE, memberCode));
		}
		if (StringUtils.isNotBlank(verifyUser)) {
			whereList.add(Where.eq(HandOpsDomain.VERIFY_USER, verifyUser));
		}

		if (dateStart != null || dateEnd != null) {
			whereList.add(Where.between(HandOpsDomain.ADD_TIME, dateStart, dateEnd, true, true));
		}
		if (type != null) {
			if (type == 1)
				whereList.add(Where.in(HandOpsDomain.TYPE, new Integer[] { 10, 11, 12, 13 }));
			else
				whereList.add(Where.eq(HandOpsDomain.TYPE, type));
		}
		if (whereList.size() <= 0) {
			whereList.add(Where.gt(HandOpsDomain.ID, 0L));
		}
		Page<HandOps> handOpsPage = baseService.getPage(HandOps.class, whereList, page == null ? 1 : (page + 1),
				Parameter.orderBy(OrderBy.desc(HandOpsDomain.ID)));

		return createSuccessModelAndView("member/hand/page", handOpsPage);
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/hand/handExportCount", method = RequestMethod.POST)
	public CustomResponse handExportCount(String memberCode, String verifyUser, Date dateStart, Date dateEnd,Integer type) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if (StringUtils.isNotBlank(memberCode)) {
			whereList.add(Where.eq(HandOpsDomain.MEMBER_CODE, memberCode));
		}
		if (StringUtils.isNotBlank(verifyUser)) {
			whereList.add(Where.eq(HandOpsDomain.VERIFY_USER, verifyUser));
		}

		if (dateStart != null || dateEnd != null) {
			whereList.add(Where.between(HandOpsDomain.ADD_TIME, dateStart, dateEnd, true, true));
		}
		
		if (type != null) {
			if (type == 1)
				whereList.add(Where.in(HandOpsDomain.TYPE, new Integer[] { 10, 11, 12, 13 }));
			else
				whereList.add(Where.eq(HandOpsDomain.TYPE, type));
		}
		
		if (whereList.size() <= 0) {
			whereList.add(Where.gt(HandOpsDomain.ID, 0L));
		}
		HandOps handOps = baseService.getOne(HandOps.class, whereList,
				Parameter.querySingle("count(1) id"));
		if (handOps == null || handOps.getId() <= 0L)
			return createErrorJsonResponse("没有需要导出的数据！");
		if (handOps.getId() > 10000L)
			return createErrorJsonResponse("数据太多，请缩小查询范围(最多导出10000笔)！");

		return createSuccessJsonResponse(null);
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/account/hand/handExport", method = RequestMethod.GET)
	public void handExport(HttpServletResponse response,String memberCode, String verifyUser, Date dateStart, Date dateEnd,Integer type) throws Exception {
		OutputStream output = null;
		HSSFWorkbook workbook = null;
		try {
			List<Where> whereList = new ArrayList<Where>();
			if (StringUtils.isNotBlank(memberCode)) {
				whereList.add(Where.eq(HandOpsDomain.MEMBER_CODE, memberCode));
			}
			if (StringUtils.isNotBlank(verifyUser)) {
				whereList.add(Where.eq(HandOpsDomain.VERIFY_USER, verifyUser));
			}

			if (dateStart != null || dateEnd != null) {
				whereList.add(Where.between(HandOpsDomain.ADD_TIME, dateStart, dateEnd, true, true));
			}
			if (type != null) {
				if (type == 1)
					whereList.add(Where.in(HandOpsDomain.TYPE, new Integer[] { 10, 11, 12, 13 }));
				else
					whereList.add(Where.eq(HandOpsDomain.TYPE, type));
			}
			if (whereList.size() <= 0) {
				whereList.add(Where.gt(HandOpsDomain.ID, 0L));
			}
			List<HandOps> handOpsList = baseService.getList(HandOps.class, whereList,
					Parameter.orderBy(OrderBy.desc(HandOpsDomain.ID)));
			workbook = new HSSFWorkbook();
			HSSFCellStyle headstyle = workbook.createCellStyle();
			headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			if (handOpsList != null && handOpsList.size() > 0) {
				HSSFSheet sheet = workbook.createSheet();
				sheet.setColumnWidth(0, 6000);
				sheet.setColumnWidth(1, 3000);
				sheet.setColumnWidth(2, 3000);
				sheet.setColumnWidth(3, 3000);
				sheet.setColumnWidth(4, 6000);
				sheet.setColumnWidth(5, 6000);
				sheet.setColumnWidth(6, 3000);

				HSSFRow row = sheet.createRow(0);
				HSSFCell cell = row.createCell(0);
				cell.setCellValue("订单号");
				cell.setCellStyle(headstyle);

				cell = row.createCell(1);
				cell.setCellValue("会员");
				cell.setCellStyle(headstyle);

				cell = row.createCell(2);
				cell.setCellValue("金额");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(3);
				cell.setCellValue("类型");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(4);
				cell.setCellValue("备注");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(5);
				cell.setCellValue("时间");
				cell.setCellStyle(headstyle);
				
				cell = row.createCell(6);
				cell.setCellValue("操作者");
				cell.setCellStyle(headstyle);

				int idx = 1;
				for (HandOps handOps : handOpsList) {
					// 订单号
					row = sheet.createRow(idx);
					cell = row.createCell(0);
					cell.setCellValue(handOps.getOrderNo());

					// 会员
					cell = row.createCell(1);
					cell.setCellValue(handOps.getMemberCode());

					// 金额
					cell = row.createCell(2);
					cell.setCellValue(handOps.getAmount().toString());
					
					// 类型
					cell = row.createCell(3);
					cell.setCellValue(handOps.getType()==2?"扣款":(handOps.getType()==3?"彩金":(handOps.getType()==10?"默认存款":(handOps.getType()==11?"微信存款":(handOps.getType()==12?"支付宝存款":(handOps.getType()==31?"微信2存款":"存款"))))));
					
					// 备注
					cell = row.createCell(4);
					cell.setCellValue(handOps.getRemark());
					
					// 时间
					cell = row.createCell(5);
					cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(handOps.getAddTime()));
					
					// 操作者
					cell = row.createCell(6);
					cell.setCellValue(handOps.getVerifyUser());

					idx++;
				}
			}

			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("手动存款记录.xls"));

			output = response.getOutputStream();
			workbook.write(output);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (output != null) {
				try {
					output.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	

	// 手动存款
	@RequestMapping(value = "/system/member/handRecharge", method = RequestMethod.GET)
	public ModelAndView handRecharge(Long id) throws Exception {
		Member member = memberService.getMemberById(id);
		RechargeWithdrawConfig config = withdrawService.getRechargeWithdrawConfig();

		// 打码量倍数
		double dml = 0;
		if (member != null) {
			MemberDml memberDml = memberService.getMemberDml(id);
			dml = memberDml == null ? 0 : memberDml.getTimes().doubleValue();
		} else {
			dml = memberLevelService.getMemberLevelMap().get(1).getTimes().doubleValue();
		}

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", member == null ? null : member.getId());
		dataMap.put("dml", dml);
		dataMap.put("code", member == null ? null : member.getCode());
		dataMap.put("rate", config.getRechargeRate());
		dataMap.put("gift", config.getRechargeGift());

		// 默认类型
		Admin admin = getSessionUser();
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(AdminChoiceDomain.TYPE, 4));
		whereList.add(Where.eq(AdminChoiceDomain.ADMIN_ID, admin.getId()));
		List<AdminChoice> choiceList = baseService.getList(AdminChoice.class, whereList);

		String type = "0";
		if (choiceList != null && choiceList.size() > 0)
			type = choiceList.get(0).getValue();
		dataMap.put("type", type);

		List<String> numList = new ArrayList<String>();
		String wechatNum = configService.getValueByNid("r_hand_wechat_num");
		int size = StringUtils.isBlank(wechatNum) ? 0 : Integer.valueOf(wechatNum);
		for (int i = 1; i <= size; i++)
			numList.add("3" + i);
		dataMap.put("wechatNumList", numList);

		return createSuccessModelAndView("member/handRecharge", dataMap);
	}

	@ResponseBody
	@RequestMapping(value = "/system/member/handRechargeSubmit", method = RequestMethod.POST)
	public CustomResponse handRechargeSubmit(RechargeForm rechargeForm) throws Exception {
		Long lastTime = (Long)getSessionAttribute("hand-recharge");
		if(lastTime != null && (System.currentTimeMillis()/1000-lastTime) < 3) {
			return createErrorJsonResponse("请勿重复提交！");
		}
		setSessionAttribute("hand-recharge", System.currentTimeMillis()/1000);
		
		rechargeForm.setIp(getRequestIp());
		rechargeForm.setVerifyUser(getSessionUser().getCode());
		String errorMsg = rechargeService.handRecharge(rechargeForm);
		if (StringUtils.isNotBlank(errorMsg))
			return createErrorJsonResponse(errorMsg);

		return createSuccessJsonResponse(null);
	}

	// 赠送彩金
	@RequestMapping(value = "/system/member/handGift", method = RequestMethod.GET)
	public ModelAndView handGift(Long id) throws Exception {
		Member member = memberService.getMemberById(id);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", member == null ? null : member.getId());
		dataMap.put("code", member == null ? null : member.getCode());
		return createSuccessModelAndView("member/handGift", dataMap);
	}

	@ResponseBody
	@RequestMapping(value = "/system/member/handGiftSubmit", method = RequestMethod.POST)
	public CustomResponse handGiftSubmit(RechargeForm rechargeForm) throws Exception {
		Long lastTime = (Long)getSessionAttribute("hand-gift");
		if(lastTime != null && (System.currentTimeMillis()/1000-lastTime) < 3) {
			return createErrorJsonResponse("请勿重复提交！");
		}
		setSessionAttribute("hand-gift", System.currentTimeMillis()/1000);
		
		rechargeForm.setIp(getRequestIp());
		rechargeForm.setVerifyUser(getSessionUser().getCode());
		String errorMsg = rechargeService.handGift(rechargeForm);
		if (StringUtils.isNotBlank(errorMsg))
			return createErrorJsonResponse(errorMsg);

		return createSuccessJsonResponse(null);
	}

	// 审核入款
	@RequestMapping(value = "/system/recharge/verify", method = RequestMethod.GET)
	public ModelAndView verify() throws Exception {
		return createSuccessModelAndView("member/recharge/table", null);
	}

	@RequestMapping(value = "/system/recharge/verifyList", method = RequestMethod.GET)
	public ModelAndView verifyList(Integer page) throws Exception {
		List<Integer> typeList = getChoiceList(1, false);
		List<Integer> levelList = getChoiceList(2, false);
		Long id = (typeList == null || levelList == null || typeList.size() <= 0 || levelList.size() <= 0) ? 0L : null;

		page = page == null ? 1 : (page + 1);
		int totalSize = rechargeMapaper.getMemberRecharge(id, 0, typeList, 2, levelList, null, null, null, null, null,
				null);
		Page<RechargeForm> rechargePage = new Page<RechargeForm>();
		rechargePage.setPageSize(20);
		rechargePage.setPageNo(page);
		rechargePage.setTotalSize(totalSize);
		rechargePage.setTotalPage(totalSize / 20 + (totalSize % 20 == 0 ? 0 : 1));
		rechargePage.setItems(rechargeMapaper.getMemberRechargeList(id, 0, typeList, 2, levelList, null, null, null,
				null, 1, (page - 1) * 20, 20, null, null));

		if (page != null && rechargePage.getItems() != null) {
			Integer[] timesArr = null;
			RechargeWithdrawTimes times = null;
			Map<Long, Integer[]> timesMap = new HashMap<Long, Integer[]>();
			for (RechargeForm recharge : rechargePage.getItems()) {
				timesArr = timesMap.get(recharge.getMemberId());
				if (timesArr == null) {
					times = memberService.getLastRechargeWithdrawTimes(recharge.getMemberId());
					timesArr = new Integer[] { times.getRecharge(), times.getTotalRecharge() };
				}
				timesArr[0] = timesArr[0] + 1;
				timesArr[1] = timesArr[1] + 1;
				timesMap.put(recharge.getMemberId(), timesArr);

				recharge.setTimes(timesArr[0]);
				recharge.setTotalTimes(timesArr[1]);
			}
		}

		return createSuccessModelAndView("member/recharge/page", rechargePage);
	}

	@RequestMapping(value = "/system/recharge/verifyEdit", method = RequestMethod.GET)
	public ModelAndView verifyEdit(Long id) throws Exception {
		List<RechargeForm> rechargeList = rechargeMapaper.getMemberRechargeList(id, 0, null, 2, null, null, null, null,
				null, 0, 0, 1, null, null);
		RechargeForm recharge = (rechargeList == null || rechargeList.size() <= 0) ? null : rechargeList.get(0);

		ModelAndView view = createSuccessModelAndView("member/recharge/edit", recharge);
		view.addObject("config", withdrawService.getRechargeWithdrawConfig());
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/system/recharge/verifyEditSubmit", method = RequestMethod.POST)
	public CustomResponse verifyEditSubmit(RechargeForm rechargeForm) throws Exception {
		if (rechargeForm.getStatus() == null)
			return createErrorJsonResponse("请先选择审核结果！");

		rechargeForm.setIsReverify(false);
		rechargeForm.setVerifyUser(getSessionUser().getCode());
		String errorMsg = rechargeService.verifyRecharge(rechargeForm);
		if (StringUtils.isNotBlank(errorMsg))
			return createErrorJsonResponse(errorMsg);

		return createSuccessJsonResponse(null);
	}

	@RequestMapping(value = "/system/recharge/verifyEdit1", method = RequestMethod.GET)
	public ModelAndView verifyEdit1(Long id) throws Exception {
		List<RechargeForm> rechargeList = rechargeMapaper.getMemberRechargeList(id, -1, null, 2, null, null, null, null,
				null, 0, 0, 1, null, null);
		RechargeForm recharge = (rechargeList == null || rechargeList.size() <= 0) ? null : rechargeList.get(0);

		ModelAndView view = createSuccessModelAndView("member/recharge/edit1", recharge);
		view.addObject("config", withdrawService.getRechargeWithdrawConfig());
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/system/recharge/verifyEditSubmit1", method = RequestMethod.POST)
	public CustomResponse verifyEditSubmit1(RechargeForm rechargeForm) throws Exception {
		rechargeForm.setVerifyUser(getSessionUser().getCode());
		rechargeForm.setIsReverify(true);
		rechargeForm.setStatus(1);
		String errorMsg = rechargeService.verifyRecharge(rechargeForm);
		if (StringUtils.isNotBlank(errorMsg))
			return createErrorJsonResponse(errorMsg);

		return createSuccessJsonResponse(null);
	}

	// 正在审核
	@ResponseBody
	@RequestMapping(value = "/system/recharge/lockVerify", method = RequestMethod.POST)
	public CustomResponse lockVerify(Long id) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(MemberRechargeDomain.ID, id));
		whereList.add(Where.eq(MemberRechargeDomain.STATUS, 0));
		MemberRecharge recharge = new MemberRecharge();
		recharge.setVerifyUser(getSessionUser().getCode());
		recharge.setVerifyTime(new Date());
		recharge.setStatus(2);
		int result = baseService.update(recharge, whereList, false);
		if (result <= 0)
			return createErrorJsonResponse("该笔入款已有人在审核！");

		return createSuccessJsonResponse(null);
	}

	// 已审核入款记录
	@RequestMapping(value = "/system/recharge/verifyLog", method = RequestMethod.GET)
	public ModelAndView verifyLog() throws Exception {
		return createSuccessModelAndView("member/recharge/logTable", DateUtil.getCurrentDateStr());
	}

	@RequestMapping(value = "/system/recharge/verifyLogList", method = RequestMethod.GET)
	public ModelAndView verifyLogList(Integer page, String memberCode, String verifyUser, Date dateStart, Date dateEnd,
			Integer dateType, Integer saveType, Integer status, String agentCode) throws Exception {
		page = page == null ? 1 : (page + 1);
		RechargeForm form = rechargeMapaper.getMemberRechargeAmount(null, status,
				saveType == null ? null : Collections.singletonList(saveType), 2, null, memberCode, dateType, dateStart,
				dateEnd, agentCode, verifyUser);
		int totalSize = form.getTimes();
		Page<RechargeForm> rechargePage = new Page<RechargeForm>();
		rechargePage.setPageSize(20);
		rechargePage.setPageNo(page);
		rechargePage.setTotalSize(totalSize);
		rechargePage.setTotalPage(totalSize / 20 + (totalSize % 20 == 0 ? 0 : 1));
		List<RechargeForm> resultList = rechargeMapaper.getMemberRechargeList(null, status,
				saveType == null ? null : Collections.singletonList(saveType), 2, null, memberCode, dateType, dateStart,
				dateEnd, 2, (page - 1) * 20, 20, agentCode, verifyUser);
		if (resultList != null && resultList.size() > 0) {
			Date date = DateUtil.addSeconds(new Date(), -21600);
			for (RechargeForm temp : resultList) {
				if (temp.getStatus() != -1)
					continue;
				if (temp.getAddTime().compareTo(date) > 0)
					temp.setStatus(-11);
			}
		}
		rechargePage.setItems(resultList);

		rechargePage.setParams(form.getAmount() == null ? 0.0 : form.getAmount());
		return createSuccessModelAndView("member/recharge/logPage", rechargePage);
	}

	// 线上充值记录
	@RequestMapping(value = "/system/recharge/onlineRecord", method = RequestMethod.GET)
	public ModelAndView onlineLog() throws Exception {
		return createSuccessModelAndView("member/recharge/onlineRecordTable", DateUtil.getCurrentDateStr());
	}

	@RequestMapping(value = "/system/recharge/onlineRecordList", method = RequestMethod.GET)
	public ModelAndView onlineRecordList(Integer page, String memberCode, String orderNo, String tradeNo,
			Date dateStart, Date dateEnd, Integer[] type, Integer status, String verifyUser) throws Exception {
		if (type == null || type.length <= 0) {
			return createSuccessModelAndView("member/recharge/onlineRecordPage", null);
		}

		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.in(MemberRechargeDomain.TYPE, type));// 第三方入款

		String code = getRequest().getParameter("code");
		if (StringUtils.isNotBlank(code))
			whereList.add(Where.eq(MemberRechargeDomain.CODE, code));
		if (StringUtils.isNotBlank(orderNo))
			whereList.add(Where.eq(MemberRechargeDomain.ORDER_NO, orderNo));
		if (StringUtils.isNotBlank(tradeNo))
			whereList.add(Where.eq(MemberRechargeDomain.TRADE_NO, tradeNo));
		if (StringUtils.isNotBlank(verifyUser))
			whereList.add(Where.eq(MemberRechargeDomain.VERIFY_USER, verifyUser));
		if (dateStart != null || dateEnd != null) {
			whereList.add(Where.between(MemberRechargeDomain.ADD_TIME, dateStart, dateEnd));
		}
		if (status != null)
			whereList.add(Where.eq(MemberRechargeDomain.STATUS, status));
		if (StringUtils.isNotBlank(memberCode)) {
			Member member = memberService.getMemberByCode(memberCode);
			whereList.add(Where.eq(MemberRechargeDomain.MEMBER_ID, member == null ? 0L : member.getId()));
		}
		Page<MemberRecharge> rechargePage = baseService.getPage(MemberRecharge.class, whereList,
				page == null ? 1 : (page + 1), Parameter.orderBy(OrderBy.desc(MemberRechargeDomain.ID)));

		List<MemberLevel> level = memberLevelService.getMemberLevelList();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < level.size(); i++) {
			map.put(level.get(i).getLevel().toString(), level.get(i).getName());
		}

		if (rechargePage.getItems() != null) {
			Long[] ids = new Long[rechargePage.getItems().size()];
			for (int i = 0; i < ids.length; i++) {
				ids[i] = rechargePage.getItems().get(i).getMemberId();
			}
			
			List<Where> whereList1 = new ArrayList<Where>();
			whereList1.add(Where.in(MemberDomain.ID, ids));
			List<Member> members = baseService.getList(Member.class, whereList1);
			Map<String, String> map2 = new HashMap<String, String>();
			for (int i = 0; i < members.size(); i++) {
				map2.put(members.get(i).getId().toString(), members.get(i).getLevel().toString());
			}
			Map<String, String> map3 = new HashMap<String, String>();
			for (int i = 0; i < members.size(); i++) {
				map3.put(members.get(i).getId().toString(), members.get(i).getLogIp().toString());
			}
			for (int i = 0; i < rechargePage.getItems().size(); i++) {
				 rechargePage.getItems().get(i).addExpand("levelname", map.get(map2.get(rechargePage.getItems().get(i).getMemberId().toString())+""));
				 rechargePage.getItems().get(i).addExpand("regip", map3.get(rechargePage.getItems().get(i).getMemberId().toString()+""));
			}
		}

		whereList.add(Where.eq(MemberRechargeDomain.STATUS, 1));
		MemberRecharge recharge = baseService.getOne(MemberRecharge.class, whereList,
				Parameter.querySingle("sum(case when status = 1 then amount else 0 end) amount"));

		rechargePage.setParams(recharge == null || recharge.getAmount() == null ? 0.0 : recharge.getAmount());
		return createSuccessModelAndView("member/recharge/onlineRecordPage", rechargePage);
	}

	@ResponseBody
	@RequestMapping(value = "/system/recharge/onlineVerify", method = RequestMethod.POST)
	public CustomResponse onlineVerify(Long id, Integer status) throws Exception {
		try {
			String errorMsg = rechargeService.thirdVerifyByHand(id, status, getSessionUser().getCode());
			if (StringUtils.isNotBlank(errorMsg))
				return createErrorJsonResponse(errorMsg);
		} catch (Exception e) {
			e.printStackTrace();
			return createErrorJsonResponse("操作失败！");
		}
		return createSuccessJsonResponse(null);
	}

	@ResponseBody
	@RequestMapping(value = "/system/recharge/exportCount", method = RequestMethod.POST)
	public CustomResponse exportCount(String code, String memberCode, String orderNo, String tradeNo, Date dateStart,
			Date dateEnd, String type, Integer status) throws Exception {
		if (StringUtils.isBlank(type) || 1 != status)
			return createErrorJsonResponse("没有需要导出的数据！");

		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(MemberRechargeDomain.STATUS, 1));
		whereList.add(Where.in(MemberRechargeDomain.TYPE, type.split(",")));
		if (StringUtils.isNotBlank(code))
			whereList.add(Where.eq(MemberRechargeDomain.CODE, code));
		if (StringUtils.isNotBlank(orderNo))
			whereList.add(Where.eq(MemberRechargeDomain.ORDER_NO, orderNo));
		if (StringUtils.isNotBlank(tradeNo))
			whereList.add(Where.eq(MemberRechargeDomain.TRADE_NO, tradeNo));
		if (dateStart != null || dateEnd != null)
			whereList.add(Where.between(MemberRechargeDomain.ADD_TIME, dateStart, dateEnd));
		if (StringUtils.isNotBlank(memberCode)) {
			Member member = memberService.getMemberByCode(memberCode);
			whereList.add(Where.eq(MemberRechargeDomain.MEMBER_ID, member == null ? 0L : member.getId()));
		}

		MemberRecharge recharge = baseService.getOne(MemberRecharge.class, whereList,
				Parameter.querySingle("count(1) id"));
		if (recharge == null || recharge.getId() <= 0L)
			return createErrorJsonResponse("没有需要导出的数据！");
		if (recharge.getId() > 10000L)
			return createErrorJsonResponse("数据太多，请缩小查询范围(最多导出10000笔)！");

		return createSuccessJsonResponse(null);
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/system/recharge/export", method = RequestMethod.GET)
	public void export(HttpServletResponse response, String code, String memberCode, String orderNo, String tradeNo,
			Date dateStart, Date dateEnd, String type, Integer status) throws Exception {
		OutputStream output = null;
		HSSFWorkbook workbook = null;
		try {
			if (StringUtils.isBlank(type))
				return;

			List<Where> whereList = new ArrayList<Where>();
			whereList.add(Where.eq(MemberRechargeDomain.STATUS, 1));
			whereList.add(Where.in(MemberRechargeDomain.TYPE, type.split(",")));
			if (StringUtils.isNotBlank(code))
				whereList.add(Where.eq(MemberRechargeDomain.CODE, code));
			if (StringUtils.isNotBlank(orderNo))
				whereList.add(Where.eq(MemberRechargeDomain.ORDER_NO, orderNo));
			if (StringUtils.isNotBlank(tradeNo))
				whereList.add(Where.eq(MemberRechargeDomain.TRADE_NO, tradeNo));
			if (dateStart != null || dateEnd != null)
				whereList.add(Where.between(MemberRechargeDomain.ADD_TIME, dateStart, dateEnd));
			if (StringUtils.isNotBlank(memberCode)) {
				Member member = memberService.getMemberByCode(memberCode);
				whereList.add(Where.eq(MemberRechargeDomain.MEMBER_ID, member == null ? 0L : member.getId()));
			}
			List<MemberRecharge> rechargeList = baseService.getList(MemberRecharge.class, whereList,
					Parameter.orderBy(OrderBy.desc(MemberRechargeDomain.ID)));

			workbook = new HSSFWorkbook();

			HSSFCellStyle headstyle = workbook.createCellStyle();
			headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			if (rechargeList != null && rechargeList.size() > 0) {
				HSSFSheet sheet = workbook.createSheet();
				sheet.setColumnWidth(0, 3000);
				sheet.setColumnWidth(1, 3000);
				sheet.setColumnWidth(2, 10000);

				HSSFRow row = sheet.createRow(0);
				HSSFCell cell = row.createCell(0);
				cell.setCellValue("会员");
				cell.setCellStyle(headstyle);

				cell = row.createCell(1);
				cell.setCellValue("金额");
				cell.setCellStyle(headstyle);

				cell = row.createCell(2);
				cell.setCellValue("方式");
				cell.setCellStyle(headstyle);

				int idx = 1;
				for (MemberRecharge recharge : rechargeList) {
					// 会员
					row = sheet.createRow(idx);
					cell = row.createCell(0);
					cell.setCellValue(recharge.getInUser());

					// 金额
					cell = row.createCell(1);
					cell.setCellValue(recharge.getAmount().doubleValue());

					// 方式
					cell = row.createCell(2);
					cell.setCellValue(recharge.getName());

					idx++;
				}
			}

			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("线上充值记录.xls"));

			output = response.getOutputStream();
			workbook.write(output);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (output != null) {
				try {
					output.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "/system/recharge/verifyLog/exportCount", method = RequestMethod.POST)
	public CustomResponse verifyLogExportCount(String memberCode, String verifyUser, String agentCode, Date dateStart,
			Date dateEnd, Integer dateType, Integer saveType, Integer status) throws Exception {

		RechargeForm form = rechargeMapaper.getMemberRechargeAmount(null, status,
				saveType == null ? null : Collections.singletonList(saveType), 2, null, memberCode, dateType, dateStart,
				dateEnd, agentCode, verifyUser);
		int totalSize = form.getTimes();
		if (form == null || totalSize <= 0)
			return createErrorJsonResponse("没有需要导出的数据！");
		if (totalSize > 10000)
			return createErrorJsonResponse("数据太多，请缩小查询范围(最多导出10000笔)！");

		return createSuccessJsonResponse(null);
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/system/recharge/verifyLog/export", method = RequestMethod.GET)
	public void verifyLogExport(HttpServletResponse response, String memberCode, String verifyUser, String agentCode,
			Date dateStart, Date dateEnd, Integer dateType, Integer saveType, Integer status) throws Exception {
		OutputStream output = null;
		HSSFWorkbook workbook = null;
		try {

			List<RechargeForm> resultList = rechargeMapaper.getMemberRechargeList(null, status,
					saveType == null ? null : Collections.singletonList(saveType), 2, null, memberCode, dateType,
					dateStart, dateEnd, 2, 0, 10000, agentCode, verifyUser);
			if (resultList != null && resultList.size() > 0) {
				Date date = DateUtil.addSeconds(new Date(), -21600);
				for (RechargeForm temp : resultList) {
					if (temp.getStatus() != -1)
						continue;
					if (temp.getAddTime().compareTo(date) > 0)
						temp.setStatus(-11);
				}
			}

			workbook = new HSSFWorkbook();
			HSSFCellStyle headstyle = workbook.createCellStyle();
			headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			if (resultList != null && resultList.size() > 0) {
				HSSFSheet sheet = workbook.createSheet();
				sheet.setColumnWidth(0, 4500);
				sheet.setColumnWidth(1, 4500);
				sheet.setColumnWidth(2, 3000);
				sheet.setColumnWidth(3, 3000);
				sheet.setColumnWidth(4, 3000);
				sheet.setColumnWidth(5, 5000);
				sheet.setColumnWidth(6, 3000);
				sheet.setColumnWidth(7, 3000);
				sheet.setColumnWidth(8, 2000);
				sheet.setColumnWidth(9, 2000);
				sheet.setColumnWidth(10, 5000);
				sheet.setColumnWidth(11, 2000);
				sheet.setColumnWidth(12, 2000);
				sheet.setColumnWidth(13, 2000);
				sheet.setColumnWidth(14, 10000);

				HSSFRow row = sheet.createRow(0);
				HSSFCell cell = row.createCell(0);
				cell.setCellValue("编号");
				cell.setCellStyle(headstyle);

				cell = row.createCell(1);
				cell.setCellValue("时间");
				cell.setCellStyle(headstyle);

				cell = row.createCell(2);
				cell.setCellValue("会员");
				cell.setCellStyle(headstyle);

				cell = row.createCell(3);
				cell.setCellValue("代理");
				cell.setCellStyle(headstyle);

				cell = row.createCell(4);
				cell.setCellValue("分层");
				cell.setCellStyle(headstyle);

				cell = row.createCell(5);
				cell.setCellValue("转账账户/账号");
				cell.setCellStyle(headstyle);

				cell = row.createCell(6);
				cell.setCellValue("金额");
				cell.setCellStyle(headstyle);

				cell = row.createCell(7);
				cell.setCellValue("方式");
				cell.setCellStyle(headstyle);

				cell = row.createCell(8);
				cell.setCellValue("状况");
				cell.setCellStyle(headstyle);

				cell = row.createCell(9);
				cell.setCellValue("结果");
				cell.setCellStyle(headstyle);

				cell = row.createCell(10);
				cell.setCellValue("收款银行信息");
				cell.setCellStyle(headstyle);

				cell = row.createCell(11);
				cell.setCellValue("优惠");
				cell.setCellStyle(headstyle);

				cell = row.createCell(12);
				cell.setCellValue("彩金");
				cell.setCellStyle(headstyle);

				cell = row.createCell(13);
				cell.setCellValue("审核者");
				cell.setCellStyle(headstyle);

				cell = row.createCell(14);
				cell.setCellValue("备注");
				cell.setCellStyle(headstyle);

				int idx = 1;
				for (RechargeForm recharge : resultList) {
					row = sheet.createRow(idx);
					cell = row.createCell(0);
					cell.setCellValue(recharge.getOrderNo());

					cell = row.createCell(1);
					cell.setCellValue(DateUtil.dateTimeFormat(recharge.getAddTime()));

					cell = row.createCell(2);
					cell.setCellValue(recharge.getMemberCode());

					cell = row.createCell(3);
					cell.setCellValue(recharge.getAgentCode());

					cell = row.createCell(4);
					cell.setCellValue(recharge.getLevelName());

					cell = row.createCell(5);
					cell.setCellValue(new HSSFRichTextString((recharge.getInBank() == null ? "" : recharge.getInBank())
							+ "/" + (recharge.getInUser() == null ? "" : recharge.getInUser())));

					cell = row.createCell(6);
					cell.setCellValue(recharge.getAmount());

					String temp1 = "";
					if (recharge.getType().intValue() == 12) {
						temp1 = "微信";
					} else if (recharge.getType().intValue() == 22) {
						temp1 = "支付宝";
					} else if (recharge.getType().intValue() == 31) {
						temp1 = "银行转账";
					} else if (recharge.getType().intValue() == 51) {
						temp1 = "手动入款";
					} else if (recharge.getType().intValue() == 61) {
						temp1 = "独立赠送彩金";
					}
					cell = row.createCell(7);
					cell.setCellValue(temp1);

					String temp2 = "";
					if (recharge.getType().intValue() != 51 && recharge.getType().intValue() != 61) {
						temp2 = "第" + recharge.getTotalTimes() + "次";
					}
					cell = row.createCell(8);
					cell.setCellValue(temp2);

					cell = row.createCell(9);
					cell.setCellValue(recharge.getStatus().intValue() == 1 ? "通过" : "不通过");

					cell = row.createCell(10);
					cell.setCellValue(new HSSFRichTextString(recharge.getCode() + "/" + recharge.getName()));

					cell = row.createCell(11);
					cell.setCellValue(recharge.getAddAmount());

					cell = row.createCell(12);
					cell.setCellValue(recharge.getGiftAmount());

					cell = row.createCell(13);
					cell.setCellValue(recharge.getVerifyUser());

					cell = row.createCell(14);
					cell.setCellValue(recharge.getRemark());

					idx++;
				}
			}

			response.reset();
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("已审核存款记录.xls"));

			output = response.getOutputStream();
			workbook.write(output);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (output != null) {
				try {
					output.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}