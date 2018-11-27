package com.ssc.admin.controller.recharge;

import java.util.ArrayList;
import java.util.List;

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
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.RechargeChannel;
import com.ssc.entity.domain.RechargeChannelDomain;
import com.ssc.service.recharge.RechargeChannelService;

@Controller
public class RechargeCahnnelController extends AdminBaseController {
	@Autowired
	private RechargeChannelService channelService;
	
	@RequestMapping(value="/system/rechargeChannel/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("rechargeChannel/table", null);
	}
	
	@RequestMapping(value="/system/rechargeChannel/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page,String name) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		if(StringUtils.isNotBlank(name)) {
			whereList.add(Where.likeAll(RechargeChannelDomain.NAME, name));
		}
		whereList.add(Where.gt(RechargeChannelDomain.ID, 0L));
		Page<RechargeChannel> channelPage = baseService.getPage(
			RechargeChannel.class,
			whereList,
			page == null ? 1 : page + 1,
			Parameter.orderBy(OrderBy.desc(RechargeChannelDomain.STATUS), OrderBy.asc(RechargeChannelDomain.SORT), OrderBy.asc(RechargeChannelDomain.CODE))
		);
		return createSuccessModelAndView("rechargeChannel/page", channelPage);
	}
	
	@RequestMapping(value="/system/rechargeChannel/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("rechargeChannel/edit", baseService.getById(RechargeChannel.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/rechargeChannel/editSubmit", method=RequestMethod.POST)
	public CustomResponse editSubmit(RechargeChannel channel) throws Exception {
		return createSuccessJsonResponse(channelService.editChannel(channel));
	}
	
	@ResponseBody
	@RequestMapping(value="/system/rechargeChannel/delete", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		return createSuccessJsonResponse(channelService.delChannel(id));
	}
}