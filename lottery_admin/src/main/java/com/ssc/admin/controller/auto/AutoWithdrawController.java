package com.ssc.admin.controller.auto;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.utils.DyHttpClient;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.SecurityUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.AutoWithdrawLog;
import com.ssc.entity.MemberWithdraw;
import com.ssc.entity.custom.AutoWithdrawForm;
import com.ssc.entity.custom.WithdrawForm;
import com.ssc.entity.domain.MemberWithdrawDomain;
import com.ssc.service.auto.AutoRechargeWithdrawService;
import com.ssc.service.withdraw.WithdrawService;

@Controller
public class AutoWithdrawController extends AdminBaseController {
	@Autowired
	private WithdrawService withdrawService;
	
	@Autowired
	private AutoRechargeWithdrawService autoWithdrawService;
	
	@ResponseBody
	@RequestMapping(value="/system/withdraw/auto", method=RequestMethod.POST)
	public CustomResponse autoVerify(Long id) throws Exception {
		try {
			String errorMsg = autoWithdrawService.autoWithdraw(id, getSessionUser().getCode());
			if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(errorMsg);
		} catch(Exception e) {
			e.printStackTrace();
			return createErrorJsonResponse("自动出款提交失败！");
		}
		return createSuccessJsonResponse(null);
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/system/withdraw/batchAuto", method=RequestMethod.POST)
	public CustomResponse batchAutoVerify() throws Exception {
		try {
			List<Long> idList = (List<Long>) getSessionAttribute("admin_withdraw_id_list");
			if(idList == null || idList.size() <= 0) return createSuccessJsonResponse(0);
			
			Long id = null;
			StringBuffer errorMsgs = new StringBuffer();
			List<String> orderList = (List<String>) getSessionAttribute("admin_withdraw_order_list");
			for(int i=0;i<idList.size();i++) {
				id = idList.get(i);
				String errorMsg = autoWithdrawService.autoWithdraw(id, getSessionUser().getCode());
				if(StringUtils.isNotBlank(errorMsg)) errorMsgs.append(orderList.get(i)).append(":").append(errorMsg).append("<br>");
			}
			if(StringUtils.isNotBlank(errorMsgs.toString())) {
				return createSuccessJsonResponse(errorMsgs.toString());
			}
		} catch(Exception e) {
			e.printStackTrace();
			return createErrorJsonResponse("批量自动出款提交失败！");
		}
		
		return createSuccessJsonResponse(1);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdraw/autoSearch")
	public CustomResponse autoSearch(String orderId) throws Exception {
		if(StringUtils.isBlank(orderId)) return createErrorJsonResponse("订单号不能为空！");
		
		String url = configService.getValueByNid("khb_auto_withdraw");
		String key = configService.getValueByNid("khb_auto_withdraw_key");
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("funName", "getTransferResult");
		paramMap.put("orderID", orderId);
		String keyStr = SecurityUtil.md5(orderId+"$"+key);
		paramMap.put("keyStr", keyStr.substring(0, 10) + keyStr.substring(22, 32));
		AutoWithdrawForm result = DyHttpClient.doPost(url, paramMap, AutoWithdrawForm.class);
		
		String errorMsg = getNameByCode(result.getCode());
		if(StringUtils.isNotBlank(errorMsg)) return createErrorJsonResponse(errorMsg);
		result.setStatusName(getStatusNameByCode(result.getStatus()));
		
		return createSuccessJsonResponse(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/common/autoWithdraw")
	public String autoWithdrawBack() throws Exception {
		AutoWithdrawLog log = null;
		boolean isSuccess = false;
		try {
			//添加日志
			HttpServletRequest request = getRequest();
			String content = JsonUtils.object2JsonString(request.getParameterMap());
			log = new AutoWithdrawLog();
			log.setNotifyTime(new Date());
			log.setNotifyContent(content);
			log.setStatus(0);
			baseService.insert(log);
			
			String orderId = request.getParameter("orderID");
			log.setOrderId(orderId);
			String payNumId = request.getParameter("payNumID");
			String status = request.getParameter("status");
			String notifyKeyStr = request.getParameter("keyStr");
			
			String key = configService.getValueByNid("khb_auto_withdraw_key");
			String keyStr = SecurityUtil.md5(orderId+"$"+payNumId+"$"+status+"$"+key);
			keyStr = keyStr.substring(0, 10) + keyStr.substring(22, 32);
			
			if(StringUtils.isBlank(notifyKeyStr) || !notifyKeyStr.equals(keyStr)) {//校验不通过
				log.setErrorContent("校验不通过");
			} else {//平台审核
				//根据订单号查找提现记录
				List<Where> whereList = new ArrayList<Where>();
				whereList.add(Where.eq(MemberWithdrawDomain.ORDER_NO, orderId));
				List<MemberWithdraw> withdrawList = baseService.getList(
					MemberWithdraw.class,
					whereList,
					Parameter.queryColumn(new String[]{MemberWithdrawDomain.ID, MemberWithdrawDomain.STATUS})
				);
				if(withdrawList == null || withdrawList.size() <= 0) {
					log.setErrorContent("订单号" + orderId + "不存在");
				} else if(withdrawList.size() > 1) {
					log.setErrorContent("同一订单号" + orderId + "存在多笔记录");
				} else {
					MemberWithdraw withdraw = withdrawList.get(0);
					
					if("3".equals(status)) {
						WithdrawForm form = new WithdrawForm();
						form.setId(withdraw.getId());
						form.setStatus(1);
						form.setUpdBy("system");
						
						String errorMsg = withdrawService.verifyWithdraw(form);
						if(StringUtils.isNotBlank(errorMsg)) {
							log.setErrorContent(errorMsg);
						}
					} else {
						log.setErrorContent("自动出款失败");
					}
					
					isSuccess = true;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			log.setErrorContent(JsonUtils.object2JsonString(e));
		} finally {
			log.setStatus(isSuccess ? 1 : -1);
			baseService.updateById(log, log.getId(), false);
		}
		
		return "Success";
	}
	
	private String getNameByCode(String code) {
		if("200".equals(code)) return null;
		
		if("100".equals(code)) return "API接口已关闭";
		if("101".equals(code)) return "验证失败";
		if("102".equals(code)) return "订单已存在";
		if("103".equals(code)) return "订单不存在";
		if("201".equals(code)) return "操作失败";
		
		return "未知错误";
	}
	
	private String getStatusNameByCode(int status) {
		if(status == 0) return "未处理";
		if(status == 1) return "通过审核";
		if(status == 2) return "正在转出";
		if(status == 3) return "成功转出";
		if(status == 4) return "转出失败";
		if(status == 5) return "置疑";
		if(status == 6) return "等待验证";
		
		return "未知状态";
	}
}