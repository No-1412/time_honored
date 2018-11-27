package com.ssc.admin.controller.daifu;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.NumberUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.HfbXf;
import com.ssc.entity.domain.HfbXfDomain;
import com.ssc.third.dahuitong.HiiposmUtil;
import com.ssc.third.dahuitong.HttpPostUtil;

@Controller
public class DaHuiTongDaiFuController extends AdminBaseController {
	public static final Map<String, String> STATUS;
	static {
		STATUS = new HashMap<String, String>();
		STATUS.put("N", "未支付");
		STATUS.put("S", "代付成功");
		STATUS.put("F", "代付失败");
		STATUS.put("W", "处理中");
		STATUS.put("B", "退款");
		STATUS.put("C", "取消");
	
	}
	
	@RequestMapping(value="/daHuiTong/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("daHuiTong/table", null);
	}
	
	@RequestMapping(value="/daHuiTong/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(HfbXfDomain.TYPE, 6));
		
		Page<HfbXf> hfbxfPage = baseService.getPage(
			HfbXf.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(HfbXfDomain.ID))
		);
		
		return createSuccessModelAndView("daHuiTong/page", hfbxfPage);
	}
	
	@RequestMapping(value="/daHuiTong/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("daHuiTong/edit", baseService.getById(HfbXf.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/daHuiTong/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(HfbXf hfbxf) throws Exception {
		try {
			new BigDecimal(hfbxf.getApplyAmt());
		} catch(Exception e) {
			return createErrorJsonResponse("无效下发金额！");
		}
		
		Map<String, String> reqmap = new HashMap<String, String>();
		reqmap.put("merchantId",hfbxf.getSysMerchNo());//商户号
		UUID uuid = UUID.randomUUID(); 
		reqmap.put("requestId", uuid.toString().replace("-", ""));
		reqmap.put("type", "agentPay");
		reqmap.put("requestIp",applicationContextUtil.getRequestIp());//订单生成机器ip
		reqmap.put("requestTime", DateUtil.getShortCurrentTimeStr());
		reqmap.put("orderId", baseService.genOrderNo(null));//商户唯一订单号
		reqmap.put("currency", "RMB");
		reqmap.put("orderRemark", "goods");
		reqmap.put("payRemark", "pay the price of goods");
		reqmap.put("amount",NumberUtils.round(new BigDecimal(hfbxf.getApplyAmt()).multiply(new BigDecimal(100)), 0)+"");
		reqmap.put("bankNo",hfbxf.getFinaCode());//银行编码
		reqmap.put("bankCardNo", hfbxf.getPayeeAcct());//账号
		reqmap.put("payerName",hfbxf.getPayeeName());//账号名
		reqmap.put("certType",hfbxf.getIdtype());//证件类型
		reqmap.put("certNo", hfbxf.getIdNumber());//证件号
		reqmap.put("perEntFlag", "1");
		
		String signData = reqmap.get("amount")+reqmap.get("bankCardNo")+reqmap.get("bankNo")+reqmap.get("certNo")+reqmap.get("certType")+reqmap.get("currency")+reqmap.get("merchantId")
		+reqmap.get("orderId")+reqmap.get("orderRemark")+reqmap.get("payerName")+reqmap.get("payRemark")+reqmap.get("perEntFlag")+reqmap.get("requestId")+reqmap.get("requestIp")
		+reqmap.get("requestTime")+reqmap.get("type");//签名数据
		
		Map<String, Object> fromMap2 = new HashMap<String,Object>();
		String jsonObj = JsonUtils.object2JsonString(reqmap);
		jsonObj = java.net.URLEncoder.encode(jsonObj, "UTF-8");
		fromMap2.put("transData", jsonObj);
		String key = hfbxf.getPublicKey();
		String hmac = HiiposmUtil.MD5Sign(signData, key);
		fromMap2.put("signData", hmac);//该参数不参与签名
		fromMap2.put("signType", "MD5");//该参数不参与签名
		fromMap2.put("version", "1.0.0");//该参数不参与签名
		fromMap2.put("dev", "java");//该参数不参与签名
		//retMsg是一个json串, 可以获取对应的接口返回参数值
		String result = HttpPostUtil.call("http://api2.itongpay.com/bospay/api/rest/bospay/services", fromMap2, "UTF-8", 1);
		
		//对result进行处理, 验签和解密等
		if(StringUtils.isBlank(result)) return createErrorJsonResponse("服务器返回数据为空！");
	
		Map<String, String> mapss = new HashMap<String, String>();
		try{
			mapss = JsonUtils.fromJson(result, Map.class);
			
			if(!"000000".equals(mapss.get("returnCode")) || !"S".equals(mapss.get("status"))) {
				return createErrorJsonResponse("提交失败："+mapss.get("message"));
			}
		} catch(Exception e) {
			return createErrorJsonResponse("返回数据异常：" + e.getMessage());
		}
		
	        
		if(hfbxf.getId() == null) {
			hfbxf.setType(6);
			hfbxf.setOrderNo(reqmap.get("orderId"));
			hfbxf.setAddTime(new Date());
			hfbxf.setStatus(mapss.get("status"));
			hfbxf.setAddBy(getSessionUser().getCode());
			
			baseService.insert(hfbxf);
		} else {
			baseService.updateById(hfbxf, hfbxf.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/daHuiTong/refresh", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		HfbXf hfbXf = baseService.getById(HfbXf.class, id, null);
		if(hfbXf == null) return createSuccessJsonResponse(null);
		
        Map<String,String> reqmap = new HashMap<String,String>();
        reqmap.put("merchantId",hfbXf.getSysMerchNo());//商户号
        UUID uuid = UUID.randomUUID(); 
        reqmap.put("requestId", uuid.toString().replace("-", ""));
        reqmap.put("type", "queryOrder");
        reqmap.put("orderType", "3");
        reqmap.put("orderId", hfbXf.getOrderNo());
        reqmap.put("requestIp",applicationContextUtil.getRequestIp());//订单生成机器ip
        reqmap.put("requestTime", DateUtil.getShortCurrentTimeStr());
	   
        String signData = reqmap.get("merchantId")+reqmap.get("orderId")+reqmap.get("orderType")+reqmap.get("requestId")+reqmap.get("requestIp")+reqmap.get("requestTime")+reqmap.get("type");//签名数据
		
		Map<String, Object> fromMap2 = new HashMap<String,Object>();
		String jsonObj = JsonUtils.object2JsonString(reqmap);
		jsonObj = java.net.URLEncoder.encode(jsonObj, "UTF-8");
		fromMap2.put("transData", jsonObj);
		String key = hfbXf.getPublicKey();
		String hmac = HiiposmUtil.MD5Sign(signData, key);
		fromMap2.put("signData", hmac);//该参数不参与签名
		fromMap2.put("signType", "MD5");//该参数不参与签名
		fromMap2.put("version", "1.0.0");//该参数不参与签名
		fromMap2.put("dev", "java");//该参数不参与签名
		//retMsg是一个json串, 可以获取对应的接口返回参数值
		String result = HttpPostUtil.call("http://api2.itongpay.com/bospay/api/rest/bospay/services", fromMap2, "UTF-8", 1);
		
		//对result进行处理, 验签和解密等
		if(StringUtils.isBlank(result)) return createErrorJsonResponse("刷新失败！");
	
		Map<String, String> mapss = new HashMap<String, String>();
		try{
			mapss = JsonUtils.fromJson(result, Map.class);
			
			if(!"000000".equals(mapss.get("returnCode"))) {
				
				hfbXf.setStatus(STATUS.get(mapss.get("status")));
				baseService.updateById(hfbXf, hfbXf.getId(), false);
				return createSuccessJsonResponse(null);
			}
		} catch(Exception e) {
			return createErrorJsonResponse("返回数据异常：" + e.getMessage());
		}
		
		return createErrorJsonResponse("刷新失败！");
	}

}