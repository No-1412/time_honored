package com.ssc.admin.controller.mbkj;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ssc.core.utils.DyHttpClient;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.HfbXf;
import com.ssc.entity.domain.HfbXfDomain;
import com.ssc.third.mbkj.MbkjResult;
import com.ssc.third.yitonng.MD5Utils;

@Controller
public class MbkjController extends AdminBaseController {
	public static final Map<String, String> STATUS;
	static {
		STATUS = new HashMap<String, String>();
		STATUS.put("00", "交易已受理");
		STATUS.put("61", "超出金额限制");
		STATUS.put("97", "低于平台余额");
		STATUS.put("1", "成功");
		STATUS.put("2", "失败");
		STATUS.put("3", "未知，继续轮询");
		STATUS.put("4", "交易不存在");
	}
	
	@RequestMapping(value="/mbkj/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("mbkj/table", null);
	}
	
	@RequestMapping(value="/mbkj/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(HfbXfDomain.TYPE, 3));
		
		Page<HfbXf> hfbxfPage = baseService.getPage(
			HfbXf.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(HfbXfDomain.ID))
		);
		
		return createSuccessModelAndView("mbkj/page", hfbxfPage);
	}
	
	@RequestMapping(value="/mbkj/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("mbkj/edit", baseService.getById(HfbXf.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/mbkj/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(HfbXf hfbxf) throws Exception {
		try {
			new BigDecimal(hfbxf.getApplyAmt());
		} catch(Exception e) {
			return createErrorJsonResponse("无效下发金额！");
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("accNo", hfbxf.getPayeeAcct());
		map.put("accName", hfbxf.getPayeeName());
		map.put("transAmount", hfbxf.getApplyAmt());
		map.put("userid", hfbxf.getSysMerchNo());
		map.put("merId", hfbxf.getFinaCode());
		map.put("merKey", hfbxf.getPayeeAcctAttr());
		
		String sign = MD5Utils.getKeyedDigest(MD5Utils.getSignParam(map), hfbxf.getPublicKey());
		map.put("sign", sign);
		map.put("orderCode", "mb_withdraw");
		String orderNo = baseService.genOrderNo(null);
		map.put("pay_number", orderNo);
		
		String strResult = DyHttpClient.doPost("http://extman.kefupay.cn/newWechats/newWeChatpayment_mobile.action", map);
		if(StringUtils.isBlank(strResult)) return createErrorJsonResponse("服务器返回数据为空！");
		
		MbkjResult result = null;
        try {
	        result = JsonUtils.fromJson(strResult, MbkjResult.class);
	        if(!"00".equals(result.getRespCode())) return createErrorJsonResponse("提交失败："+result.getRespInfo());
        } catch(Exception e) {
        	return createErrorJsonResponse("返回数据异常：" + e.getMessage());
        }
	        
		if(hfbxf.getId() == null) {
			hfbxf.setType(3);
			hfbxf.setOrderNo(orderNo);
			hfbxf.setAddTime(new Date());
			hfbxf.setStatus(result.getRespInfo());
			hfbxf.setAddBy(getSessionUser().getCode());
			
			baseService.insert(hfbxf);
		} else {
			baseService.updateById(hfbxf, hfbxf.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/mbkj/refresh", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		HfbXf hfbXf = baseService.getById(HfbXf.class, id, null);
		if(hfbXf == null) return createSuccessJsonResponse(null);
		
        Map<String,String> map = new HashMap<String,String>();
        map.put("orderId", hfbXf.getOrderNo());
        map.put("userid", hfbXf.getSysMerchNo());
        map.put("merId", hfbXf.getFinaCode());
        map.put("merKey", hfbXf.getPayeeAcctAttr());
        
        String sign = MD5Utils.getKeyedDigest(MD5Utils.getSignParam(map), hfbXf.getPublicKey());
		map.put("sign", sign);
		map.put("orderCode", "mb_withdrawQuery");
		
		String strResult = DyHttpClient.doPost("http://extman.kefupay.cn/newWechats/newWeChatpayment_mobile.action", map);
		MbkjResult result = StringUtils.isBlank(strResult) ? null : JsonUtils.fromJson(strResult, MbkjResult.class);
		if(result != null) {
			String status = STATUS.get(result.getRespCode());
			hfbXf.setStatus(StringUtils.isBlank(status) ? result.getRespInfo() : status);
			baseService.updateById(hfbXf, hfbXf.getId(), false);
			return createSuccessJsonResponse(null);
		}
		
		return createErrorJsonResponse("刷新失败！");
	}
}