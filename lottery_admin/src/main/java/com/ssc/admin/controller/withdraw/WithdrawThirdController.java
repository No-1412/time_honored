package com.ssc.admin.controller.withdraw;

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
import com.ssc.entity.WithdrawThird;
import com.ssc.entity.domain.RechargeThirdDomain;
import com.ssc.entity.domain.WithdrawThirdDomain;
import com.ssc.service.withdraw.WithdrawService;
import com.ssc.third.BaseThridTransfer;

@Controller
public class WithdrawThirdController extends AdminBaseController {
	@Autowired
	private WithdrawService withdrawService;
	
	@RequestMapping(value="/system/withdrawThird/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("withdraw/third/table", null);
	}
	
	@RequestMapping(value="/system/withdrawThird/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.gt(WithdrawThirdDomain.ID, 0L));
		Page<WithdrawThird> resultPage = baseService.getPage(
			WithdrawThird.class,
			whereList,
			page == null ? 1 : page+1,
			Parameter.orderBy(OrderBy.desc(WithdrawThirdDomain.STATUS), OrderBy.asc(WithdrawThirdDomain.SORT))
		);
		if(resultPage != null && resultPage.getItems() != null) {
			for(WithdrawThird third : resultPage.getItems()) {
				third.addExpand("type", BaseThridTransfer.THIRD_MAP.get(third.getType()));
			}
		}
		
		return createSuccessModelAndView("withdraw/third/page", resultPage);
	}
	
	@RequestMapping(value="/system/withdrawThird/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		WithdrawThird third = baseService.getById(WithdrawThird.class, id, null);
		if(third == null) {
			third = new WithdrawThird();
			third.setStatus(1);
		}
		third.addExpand("thirdList", BaseThridTransfer.THIRD_LIST);
		
		return createSuccessModelAndView("withdraw/third/edit", third);
	}
	
	@Validation(
		args={
			@Arg(field=RechargeThirdDomain.NAME, text="名称", minLength=2, maxLength=50),
			@Arg(field=RechargeThirdDomain.MERID, text="商户号", minLength=2, maxLength=25),
		}
	)
	@ResponseBody
	@RequestMapping(value="/system/withdrawThird/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(WithdrawThird third) throws Exception {
		third.setUpdTime(new Date());
		third.setUpdBy(getSessionUser().getCode());
		if(third.getId() == null) {
			third.setAddBy(third.getUpdBy());
			third.setAddTime(third.getUpdTime());
		}
		withdrawService.updateWithdrawThird(third);
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/system/withdrawThird/delete", method=RequestMethod.POST)
	public CustomResponse delele(Long id) throws Exception {
		withdrawService.deleteWithdrawThird(id);
		
		return createSuccessJsonResponse(null);
	}
}