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
import com.ssc.entity.RechargeBank;
import com.ssc.entity.domain.RechargeBankDomain;
import com.ssc.service.recharge.RechargeTypeService;

@Controller
public class RechargeBankController extends AdminBaseController {
	@Autowired
	private RechargeTypeService rechargeTypeService;
	
	@RequestMapping(value="/system/rechargeBank/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("recharge/bank/table", null);
	}
	
	@RequestMapping(value="/system/rechargeBank/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.gt(RechargeBankDomain.ID, 0L));
		Page<RechargeBank> resultPage = baseService.getPage(
			RechargeBank.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.orderBy(OrderBy.desc(RechargeBankDomain.STATUS), OrderBy.asc(RechargeBankDomain.SORT))
		);
		
		return createSuccessModelAndView("recharge/bank/page", resultPage);
	}
	
	@RequestMapping(value="/system/rechargeBank/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		RechargeBank rechargeBank = baseService.getById(RechargeBank.class, id, null);
		if(rechargeBank == null) {
			rechargeBank = new RechargeBank();
			rechargeBank.setStatus(1);
		}
		
		return createSuccessModelAndView("recharge/bank/edit", rechargeBank);
	}
	
	@Validation(
		args={
			@Arg(field=RechargeBankDomain.BANK_NAME, text="开户行", minLength=2, maxLength=25),
			@Arg(field=RechargeBankDomain.BANK_ADDR, text="开户行所在地", minLength=2, maxLength=25),
			@Arg(field=RechargeBankDomain.ACCOUNT_CODE, text="银行账号", minLength=2, maxLength=25),
			@Arg(field=RechargeBankDomain.ACCOUNT_NAME, text="开户人", minLength=2, maxLength=25)
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/rechargeBank/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(RechargeBank rechargeBank) throws Exception {
		rechargeBank.setUpdTime(new Date());
		rechargeBank.setUpdBy(getSessionUser().getCode());
		if(rechargeBank.getId() == null) {
			rechargeBank.setAddBy(rechargeBank.getUpdBy());
			rechargeBank.setAddTime(rechargeBank.getUpdTime());
		}
		rechargeTypeService.update(rechargeBank, rechargeBank.getId() == null, 3);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/rechargeBank/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		rechargeTypeService.delete(RechargeBank.class, id, 3);
		
		return createSuccessJsonResponse(null);
	}
}