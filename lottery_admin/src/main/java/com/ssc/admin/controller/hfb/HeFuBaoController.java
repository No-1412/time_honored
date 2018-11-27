package com.ssc.admin.controller.hfb;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import com.ssc.core.utils.DateUtil;
import com.ssc.core.utils.DyHttpClient;
import com.ssc.entity.HfbXf;
import com.ssc.entity.domain.HfbXfDomain;

@Controller
public class HeFuBaoController extends AdminBaseController {
	public static final Map<String, String> STATUS;
	static {
		STATUS = new HashMap<String, String>();
		STATUS.put("00", "提交申请");
		STATUS.put("01", "审核通过");
		STATUS.put("02", "申请被拒绝");
		STATUS.put("03", "已打批次");
		STATUS.put("04", "提交到渠道");
		STATUS.put("05", "代付成功");
		STATUS.put("06", " 代付失败");
	}
	
	@RequestMapping(value="/hfb/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("hfb/table", null);
	}
	
	@RequestMapping(value="/hfb/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(HfbXfDomain.TYPE, 1));
		
		Page<HfbXf> hfbxfPage = baseService.getPage(
			HfbXf.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(HfbXfDomain.ID))
		);
		
		return createSuccessModelAndView("hfb/page", hfbxfPage);
	}
	
	@RequestMapping(value="/hfb/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("hfb/edit", baseService.getById(HfbXf.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/hfb/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(HfbXf hfbxf, String bankProvince, String bankCity, String bankName) throws Exception {
		try {
			new BigDecimal(hfbxf.getApplyAmt());
		} catch(Exception e) {
			return createErrorJsonResponse("无效下发金额！");
		}
		
		String service = "applyAgentPay";
		String signType = "MD5";
		String inputCharset = "UTF-8";
		String sysMerchNo = hfbxf.getSysMerchNo();
		String outOrderNo = baseService.genOrderNo(null);
		String orderTime = DateUtil.getShortCurrentTimeStr();
		String applyAmt = hfbxf.getApplyAmt();
		String payeeAcctAttr = hfbxf.getPayeeAcctAttr();
		String payeeAcct = hfbxf.getPayeeAcct();
		String payeeName = hfbxf.getPayeeName();
		String finaCode = hfbxf.getFinaCode();
		
		Map<String, String> param = new LinkedHashMap<String, String>();
		param.put("service", service);
		param.put("signType", signType);
		param.put("inputCharset", inputCharset);
		param.put("sysMerchNo", sysMerchNo);
		param.put("outOrderNo", outOrderNo);
		param.put("orderTime", orderTime);
		param.put("applyAmt", applyAmt);
		param.put("payeeAcctAttr", payeeAcctAttr);
		param.put("payeeAcct", payeeAcct);
		param.put("payeeName", payeeName);
		param.put("finaCode", finaCode);
		param.put("bankProvince", bankProvince);
		param.put("bankCity", bankCity);
		param.put("bankName", bankName);
		param.put("sign", SignUtils.getSign(param, hfbxf.getPublicKey(), "UTF-8"));
		
		HfbResult result = DyHttpClient.doPost("http://t.mwnrg.com/trade/api/applyAgentPay", param, HfbResult.class);
		if(result == null) return createErrorJsonResponse("服务器返回数据为空！");
		if(!"0000".equals(result.getRetCode())) return createErrorJsonResponse("提交失败：" + result.getRetMsg());
		
		if(hfbxf.getId() == null) {
			hfbxf.setType(1);
			hfbxf.setOrderNo(outOrderNo);
			hfbxf.setAddTime(new Date());
			hfbxf.setStatus(STATUS.get(result.getOrderStatus()));
			hfbxf.setAddBy(getSessionUser().getCode());
			
			baseService.insert(hfbxf);
		} else {
			baseService.updateById(hfbxf, hfbxf.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/hfb/refresh", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		HfbXf hfbXf = baseService.getById(HfbXf.class, id, null);
		if(hfbXf == null) return createSuccessJsonResponse(null);
		
		String service = "queryAgentPay";
		String signType = "MD5";
		String inputCharset = "UTF-8";
		String sysMerchNo = hfbXf.getSysMerchNo();
		String outOrderNo = hfbXf.getOrderNo(); 

		Map<String, String> param = new LinkedHashMap<String, String>();
		param.put("service", service);
		param.put("signType", signType);
		param.put("inputCharset", inputCharset);
		param.put("sysMerchNo", sysMerchNo);
		param.put("outOrderNo", outOrderNo);
		param.put("sign", SignUtils.getSign(param, hfbXf.getPublicKey(), "UTF-8"));
		
		HfbResult result = DyHttpClient.doPost("http://t.mwnrg.com/trade/api/queryAgentPay", param, HfbResult.class);
		if(result != null && "0000".equals(result.getRetCode())) {
			hfbXf.setStatus(STATUS.get(result.getOrderStatus()));
			baseService.updateById(hfbXf, hfbXf.getId(), false);
			return createSuccessJsonResponse(null);
		}
		
		return createErrorJsonResponse(result.getRetMsg());
	}
}