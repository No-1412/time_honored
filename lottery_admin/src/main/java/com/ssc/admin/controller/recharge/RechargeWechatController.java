package com.ssc.admin.controller.recharge;

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
import com.ssc.core.annotation.Arg;
import com.ssc.core.annotation.Validation;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.RechargeBank;
import com.ssc.entity.RechargeWechatAlipay;
import com.ssc.entity.domain.RechargeBankDomain;
import com.ssc.entity.domain.RechargeWechatAlipayDomain;
import com.ssc.service.recharge.RechargeTypeService;

@Controller
public class RechargeWechatController extends AdminBaseController {
	@Autowired
	private RechargeTypeService rechargeTypeService;
	
	@RequestMapping(value="/system/wechat/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("recharge/wechat/table", null);
	}
	
	@RequestMapping(value="/system/wechat/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(RechargeWechatAlipayDomain.TYPE, 1));
		Page<RechargeWechatAlipay> resultPage = baseService.getPage(
			RechargeWechatAlipay.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.orderBy(OrderBy.desc(RechargeWechatAlipayDomain.STATUS), OrderBy.asc(RechargeWechatAlipayDomain.SORT))
		);
		
		return createSuccessModelAndView("recharge/wechat/page", resultPage);
	}
	
	@RequestMapping(value="/system/wechat/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		RechargeWechatAlipay rechargeBank = baseService.getById(RechargeWechatAlipay.class, id, null);
		if(rechargeBank == null) {
			rechargeBank = new RechargeWechatAlipay();
			rechargeBank.setStatus(1);
			rechargeBank.setPayImg("NVL");
		}
		
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(RechargeBankDomain.STATUS, 1));
		List<RechargeBank> bankList = baseService.getList(
			RechargeBank.class,
			whereList,
			Parameter.orderBy(OrderBy.asc(RechargeBankDomain.SORT)),
			Parameter.queryColumn(new String[]{
				RechargeBankDomain.ID, RechargeBankDomain.ACCOUNT_CODE,
				RechargeBankDomain.ACCOUNT_NAME, RechargeBankDomain.BANK_NAME
			})
		);
		rechargeBank.addExpand("bankList", bankList);
		
		return createSuccessModelAndView("recharge/wechat/edit", rechargeBank);
	}
	
	@Validation(
		args={
			@Arg(field=RechargeWechatAlipayDomain.PAY_NAME, text="充值方式标题", minLength=2, maxLength=50),
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/wechat/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(RechargeWechatAlipay rechargeWechatAlipay) throws Exception {
		boolean isScan = rechargeWechatAlipay.getPayType() == 2;
		if(isScan) {
			if(StringUtils.isBlank(rechargeWechatAlipay.getCode())) return createErrorJsonResponse("微信账号不能为空");
			if(StringUtils.isBlank(rechargeWechatAlipay.getPayDesc())) return createErrorJsonResponse("充值方式描述不能为空");
			if(rechargeWechatAlipay.getPayMin() == null) return createErrorJsonResponse("最小充值金额不能为空");
			if(rechargeWechatAlipay.getPayMax() == null) return createErrorJsonResponse("最大充值金额不能为空");
			if(rechargeWechatAlipay.getPayMax() < rechargeWechatAlipay.getPayMin()) return createErrorJsonResponse("最大充值金额不能小于最小充值金额");
		}
		
		rechargeWechatAlipay.setUpdTime(new Date());
		rechargeWechatAlipay.setUpdBy(getSessionUser().getCode());
		if(rechargeWechatAlipay.getId() == null) {
			rechargeWechatAlipay.setType(1);
			rechargeWechatAlipay.setAddBy(rechargeWechatAlipay.getUpdBy());
			rechargeWechatAlipay.setAddTime(rechargeWechatAlipay.getUpdTime());
		}
		if(rechargeWechatAlipay.getPayType() == 5) {
			RechargeBank bank = baseService.getById(RechargeBank.class, rechargeWechatAlipay.getBankId(), null);
			if(bank == null || bank.getStatus() != 1) return createErrorJsonResponse("该银行卡已经停用，请选择其它银行卡！");
			
			rechargeWechatAlipay.setCode(bank.getAccountCode());
			rechargeWechatAlipay.setName(bank.getAccountName());
			rechargeWechatAlipay.setBank(bank.getBankName());
		}
		rechargeTypeService.update(rechargeWechatAlipay, rechargeWechatAlipay.getId() == null, 1);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/wechat/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		rechargeTypeService.delete(RechargeWechatAlipay.class, id, 1);
		
		return createSuccessJsonResponse(null);
	}
}