package com.ssc.admin.controller.daifu;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
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
import com.ssc.third.daifu.DaiFuResult;
import com.ssc.third.yitonng.MD5Utils;
import com.ssc.third.yitonng.Post;

@Controller
public class DaiFuController extends AdminBaseController {
	public static final Map<String, String> STATUS;
	static {
		STATUS = new HashMap<String, String>();
		STATUS.put("P", "处理中");
		STATUS.put("S", "代付成功");
		STATUS.put("F", "处理失败");
	}
	
	@RequestMapping(value="/daifu/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("daifu/table", null);
	}
	
	@RequestMapping(value="/daifu/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(HfbXfDomain.TYPE, 4));
		
		Page<HfbXf> hfbxfPage = baseService.getPage(
			HfbXf.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(HfbXfDomain.ID))
		);
		
		return createSuccessModelAndView("daifu/page", hfbxfPage);
	}
	
	@RequestMapping(value="/daifu/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("daifu/edit", baseService.getById(HfbXf.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/daifu/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(HfbXf hfbxf) throws Exception {
		try {
			new BigDecimal(hfbxf.getApplyAmt());
		} catch(Exception e) {
			return createErrorJsonResponse("无效下发金额！");
		}
		
		Map<String, String> reqmap = new HashMap<String, String>();
		reqmap.put("service", "v1_liquidation_pay");
		reqmap.put("version", "1.0");
		reqmap.put("merchant_no",hfbxf.getSysMerchNo());//商户号
		reqmap.put("charset", "UTF-8");
		reqmap.put("req_time", DateUtil.getShortCurrentTimeStr());
		reqmap.put("nonce_str", new java.security.SecureRandom().toString());
		reqmap.put("out_trade_no", baseService.genOrderNo(null));//商户唯一订单号
		reqmap.put("amount",NumberUtils.round(new BigDecimal(hfbxf.getApplyAmt()).multiply(new BigDecimal(100)), 0)+"");
		reqmap.put("account_no", hfbxf.getPayeeAcct());//账号
		reqmap.put("account_name",hfbxf.getPayeeName());//账号名
		reqmap.put("client_ip",applicationContextUtil.getRequestIp());//订单生成机器ip
		reqmap.put("order_time", DateUtil.getShortCurrentTimeStr());
		reqmap.put("id_type",hfbxf.getIdtype());//证件类型
		reqmap.put("id", hfbxf.getIdNumber());//证件号
		reqmap.put("bank_code",hfbxf.getFinaCode());//银行编码
		reqmap.put("notify_url","https://" + getRequestUrl() + "/daifu/notify" );//异步回调地址
		
		Map<String, String> params = signMap(reqmap,"MD5", hfbxf.getPublicKey(),"UTF-8");
		
		String strResult = Post.sendPost("http://scpay.shopping98.com/v1/gateway.shtml", MD5Utils.getSignParam(params));
		
		if(StringUtils.isBlank(strResult)) return createErrorJsonResponse("服务器返回数据为空！");
		
		DaiFuResult result = null;
        try {
	        result = JsonUtils.fromJson(strResult, DaiFuResult.class);
	        if(!"0000".equals(result.getResp_code())){
	        	return createErrorJsonResponse("提交失败："+result.getResp_msg());
	        } 
	    } catch(Exception e) {
        	return createErrorJsonResponse("返回数据异常：" + e.getMessage());
        }
	        
		if(hfbxf.getId() == null) {
			hfbxf.setType(4);
			hfbxf.setOrderNo(result.getOut_trade_no());
			hfbxf.setAddTime(new Date());
			hfbxf.setStatus(result.getTrans_msg());
			hfbxf.setAddBy(getSessionUser().getCode());
			
			baseService.insert(hfbxf);
		} else {
			baseService.updateById(hfbxf, hfbxf.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/daifu/refresh", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		HfbXf hfbXf = baseService.getById(HfbXf.class, id, null);
		if(hfbXf == null) return createSuccessJsonResponse(null);
		
        Map<String,String> map = new HashMap<String,String>();
        map.put("service", "v1_liquidation_query");
        map.put("version", "1.0");
        map.put("merchant_no",hfbXf.getSysMerchNo());//商户号
        map.put("charset", "UTF-8");
        map.put("req_time", DateUtil.getShortCurrentTimeStr());
        map.put("nonce_str", new java.security.SecureRandom().toString());
        map.put("out_trade_no", hfbXf.getOrderNo());
	   
        Map<String, String> params = signMap(map,"MD5", hfbXf.getPublicKey(), "UTF-8");
        
        String strResult = Post.sendPost("http://scpay.shopping98.com/v1/gateway.shtml", MD5Utils.getSignParam(params));
		
		DaiFuResult result = StringUtils.isBlank(strResult) ? null : JsonUtils.fromJson(strResult, DaiFuResult.class);
		if(result != null && "0000".equals(result.getResp_code())) {
			hfbXf.setStatus(STATUS.get(result.getTrans_status()));
			baseService.updateById(hfbXf, hfbXf.getId(), false);
			return createSuccessJsonResponse(null);
		}
		
		return createErrorJsonResponse("刷新失败！");
	}
	
	@RequestMapping(value="/daifu/notify")
	public String getList() throws Exception {
		return "SUCCESS";
	}
	public static Map<String, String> signMap(Map<String, String> params, String sign_type, String key,
			String input_charset) {
		// 过滤空值、sign与sign_type参数
		Map<String, String> sParaNew = paraFilter(params);
		// 获取待签名字符串
		String preSignStr = createLinkString(sParaNew);
		// 获得签名验证结果
		String text = preSignStr + key;
		String sign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
		// 签名结果与签名方式加入请求提交参数组中
		sParaNew.put("sign", sign);
		sParaNew.put("sign_type", sign_type);
		return sParaNew;
	}
	
	public static Map<String, String> paraFilter(Map<String, String> sArray) {

		Map<String, String> result = new HashMap<String, String>();

		if (sArray == null || sArray.size() <= 0) {
			return result;
		}

		for (String key : sArray.keySet()) {
			String value = sArray.get(key);
			if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
					|| key.equalsIgnoreCase("sign_type")) {
				continue;
			}
			result.put(key, value);
		}

		return result;
	}
	public static String createLinkString(Map<String, String> params) {

		List<String> keys = new ArrayList<String>(params.keySet());
		Collections.sort(keys);

		String prestr = "";

		for (int i = 0; i < keys.size(); i++) {
			String key = keys.get(i);
			String value = params.get(key);

			if (i == keys.size() - 1) {// 拼接时，不包括最后一个&字符
				prestr = prestr + key + "=" + value;
			} else {
				prestr = prestr + key + "=" + value + "&";
			}
		}

		return prestr;
	}
	
	public static byte[] getContentBytes(String content, String charset) {
		if (charset == null || "".equals(charset)) {
			return content.getBytes();
		}
		try {
			return content.getBytes(charset);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
		}
	}
}