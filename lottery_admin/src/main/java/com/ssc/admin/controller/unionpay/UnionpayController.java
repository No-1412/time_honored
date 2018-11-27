package com.ssc.admin.controller.unionpay;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
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

import com.alibaba.fastjson.JSON;
import com.ssc.admin.controller.AdminBaseController;
import com.ssc.core.dao.query.OrderBy;
import com.ssc.core.dao.query.Parameter;
import com.ssc.core.dao.query.Where;
import com.ssc.core.entity.CustomResponse;
import com.ssc.core.entity.Page;
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.NumberUtils;
import com.ssc.core.utils.SecurityUtil;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.HfbXf;
import com.ssc.entity.domain.HfbXfDomain;
import com.ssc.third.ronghui.MerchantIn;
import com.ssc.third.ronghui.utils.Base64;
import com.ssc.third.ronghui.utils.Des3Encryption;
import com.ssc.third.ronghui.utils.HTTP;
import com.ssc.third.tongda.util.Disguiser;
import com.ssc.third.yitonng.MD5Utils;
import com.ssc.third.yitonng.Post;


@Controller
public class UnionpayController extends AdminBaseController{
	String deskey = "B39t63B886x075416336823U";
	String md5key = "H1094zp2IH1YHD1847m65By9hqoC7999";
	/** 编码字符集 **/	 
	private static String CHAR_ENCODING = "UTF-8";
	public static final Map<String, String> STATUS;
	static {
		STATUS = new HashMap<String, String>();
		STATUS.put("P", "处理中");
		STATUS.put("S", "代付成功");	
		STATUS.put("F", "处理失败");
	}
	
	@RequestMapping(value="/unionpay/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("unionpay/table", null);
	}
	
	@RequestMapping(value="/unionpay/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.in(HfbXfDomain.TYPE,new String[]{"5","6"}));
		Page<HfbXf> hfbxfPage = baseService.getPage(
			HfbXf.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(HfbXfDomain.ID))
		);
		return createSuccessModelAndView("unionpay/page", hfbxfPage);
	}
	
	@RequestMapping(value="/unionpay/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id,Long type) throws Exception {
		return createSuccessModelAndView("unionpay/edit", id==null?type:baseService.getById(HfbXf.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/unionpay/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(HfbXf hfbxf) throws Exception {
		HTTP http = new HTTP();
		try {
			new BigDecimal(hfbxf.getApplyAmt());
		} catch(Exception e) {
			return createErrorJsonResponse("无效下发金额！");
		}
		Map strResult = null;
		String cardNo = Des3Encryption.encode(deskey,hfbxf.getPayeeAcct());
		String bankName = returnBankName(hfbxf.getFinaCode());
		String strUTF = URLEncoder.encode(bankName);  
        String strUTF8 = URLDecoder.decode(strUTF, "UTF-8");
		Map<String, String> reqmap = new HashMap<String, String>();
		reqmap.put("agentNo", "8934838954");
		reqmap.put("orderNum", baseService.genOrderNo(null));//商户唯一订单号
		reqmap.put("amount",NumberUtils.format(new BigDecimal(hfbxf.getApplyAmt()), new DecimalFormat("#0.00")));
		reqmap.put("cardNo",cardNo);//账号
		reqmap.put("payerName",Des3Encryption.encode(deskey,hfbxf.getPayeeName()));//账号名
		reqmap.put("bankName",strUTF8.getBytes("UTF-8").toString());//银行名称
		if(hfbxf.getType()==5){
			reqmap.put("accountType","UnionPay");
			reqmap.put("trxType", "WITHDRAW");
//			StringBuffer sign = new StringBuffer();	
//			sign.append("#").append(reqmap.get("trxType"));		
//			sign.append("#").append(reqmap.get("agentNo"));
//			sign.append("#").append(reqmap.get("orderNum"));
//			sign.append("#").append(reqmap.get("amount"));
//			sign.append("#").append(reqmap.get("cardNo"));
//			sign.append("#").append(reqmap.get("payerName"));
//			sign.append("#").append(reqmap.get("bankName"));
//			sign.append("#").append(reqmap.get("accountType"));
//			sign.append("#").append(md5key);
			String sign = "#" + reqmap.get("trxType") + "#" + reqmap.get("agentNo") + "#" + reqmap.get("orderNum") + "#" + reqmap.get("amount") + "#"
					+ reqmap.get("cardNo") +"#" + reqmap.get("payerName") + "#" + reqmap.get("bankName") + "#" + reqmap.get("accountType") + "#"
					+ md5key;
			String generateSign = Disguiser.disguiseMD5(sign);
			reqmap.put("sign", generateSign);
			strResult = http.sendPost("http://trx.ronghuijinfubj.com/middlepaytrx//online/withdraw/unionpayTithDraw", reqmap);
		}else{
			reqmap.put("accountType","NET");
			reqmap.put("trxType", "NET_WITHDRAW");
			reqmap.put("idCardNo", hfbxf.getIdNumber());
			reqmap.put("bankNo","105701000454");
			reqmap.put("bankCode",hfbxf.getFinaCode());
			reqmap.put("phoneNumber",hfbxf.getSysMerchNo());
//			StringBuffer sign = new StringBuffer();	
//			sign.append("#").append(reqmap.get("trxType"));			
//			sign.append("#").append(reqmap.get("agentNo"));
//			sign.append("#").append(reqmap.get("orderNum"));
//			sign.append("#").append(reqmap.get("amount"));
//			sign.append("#").append(reqmap.get("cardNo"));
//			sign.append("#").append(reqmap.get("idCardNo"));
//			sign.append("#").append(reqmap.get("payerName"));
//			sign.append("#").append(reqmap.get("bankName"));
//			sign.append("#").append(reqmap.get("bankCode"));
//			sign.append("#").append(reqmap.get("bankNo"));
//			sign.append("#").append(reqmap.get("phoneNumber"));
//			sign.append("#").append(reqmap.get("accountType"));
//			sign.append("#").append(md5key);
			String sign = "#" + reqmap.get("trxType") + "#" + reqmap.get("agentNo") + "#" + reqmap.get("orderNum") + "#" + reqmap.get("amount") + "#"
					+ reqmap.get("cardNo") +"#" + reqmap.get("idCardNo") + "#" + reqmap.get("payerName") + "#" + reqmap.get("bankName") + "#"
					+ reqmap.get("bankCode") + "#" + reqmap.get("bankNo") + "#" + reqmap.get("phoneNumber") + "#" + reqmap.get("accountType") + "#" + md5key;
			String generateSign = Disguiser.disguiseMD5(sign);
			reqmap.put("sign", generateSign);
			strResult = http.sendPost("http://trx.ronghuijinfubj.com/middlepaytrx//online/withdraw/netTithDraw", reqmap);
		}
//		String strResult = Post.sendPost("http://trx.ronghuijinfubj.com/middlepaytrx/online/withdraw/unionpayTithDraw", MD5Utils.getSignParam(reqmap));
//		String re = new String(strResult.getBytes("GBK"),CHAR_ENCODING);
//		if(StringUtils.isBlank(strResult)) return createErrorJsonResponse("服务器返回数据为空！");
//		UnionpayResult result = null;
//        try {
//	        result = JsonUtils.fromJson(strResult, UnionpayResult.class);
//	        if(!"0000".equals(result.getRetCode())){
//	        	return createErrorJsonResponse("提交失败："+result.getRetMsg());
//	        } 
//	    } catch(Exception e) {
//        	return createErrorJsonResponse("返回数据异常：" + e.getMessage());
//        }
		if (!"0000".equals(strResult.get("retCode"))) {
			return createErrorJsonResponse("提交失败："+strResult.get("retMsg"));
		}
		if(hfbxf.getId() == null) {
			hfbxf.setOrderNo(reqmap.get("orderNum"));
			hfbxf.setAddTime(new Date());
			hfbxf.setStatus(strResult.get("retMsg").toString());
			hfbxf.setAddBy(getSessionUser().getCode());
			baseService.insert(hfbxf);
		} else {
			baseService.updateById(hfbxf, hfbxf.getId(), false);
		}
		
		return createSuccessJsonResponse(null);
	}
	
	@ResponseBody
	@RequestMapping(value="/unionpay/refresh", method=RequestMethod.POST)
	public CustomResponse refresh(Long id) throws Exception {
		HTTP http = new HTTP();
		HfbXf hfbXf = baseService.getById(HfbXf.class, id, null);
		if(hfbXf == null) return createSuccessJsonResponse(null);
		
        Map<String,String> map = new HashMap<String,String>();
        map.put("trxType", "WithDrawQuery");
        map.put("agentNo", "8934838954");
        map.put("orderNum", hfbXf.getOrderNo());//商户唯一订单号
        StringBuffer sign = new StringBuffer();	
		sign.append("#").append(map.get("trxType"));			
		sign.append("#").append(map.get("agentNo"));
		sign.append("#").append(map.get("orderNum"));
		sign.append("#").append(md5key);
		String signStr = SecurityUtil.md5(sign.toString());
		map.put("sign", signStr);
		Map strResult = http.sendPost("http://trx.ronghuijinfubj.com/middlepaytrx/online/withdraw/queryWithDrawOrder", map);
		if (strResult != null && "0000".equals(strResult.get("retCode"))) {
			hfbXf.setStatus(STATUS.get(strResult.get("retMsg")));
			baseService.updateById(hfbXf, hfbXf.getId(), false);
			return createSuccessJsonResponse(null);
		}
//      String strResult = Post.sendPost("http://trx.ronghuijinfubj.com/middlepaytrx/online/withdraw/queryWithDrawOrder", MD5Utils.getSignParam(map));
//		UnionpayResult result = StringUtils.isBlank(strResult) ? null : JsonUtils.fromJson(strResult, UnionpayResult.class);
//		if(result != null && "0000".equals(result.getRetCode())) {
//			hfbXf.setStatus(STATUS.get(result.getWithDrawMsg()));
//			baseService.updateById(hfbXf, hfbXf.getId(), false);
//			return createSuccessJsonResponse(null);
//		}
		return createErrorJsonResponse("刷新失败！");
	}
	
	public String returnBankName(String key) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("BOC","中国银行");
		map.put("ABC","农业银行");
		map.put("ICBC","工商银行");
		map.put("BCOM","交通银行");
		map.put("CCB","建设银行");
		map.put("CMB","招商银行");
		map.put("CMBC","民生银行");
		map.put("CEBB","光大银行");
		map.put("BOB","北京银行");
		map.put("SHB","上海银行");
		map.put("NBB","宁波银行");
		map.put("HXB","华夏银行");
		map.put("CIB","兴业银行");
		map.put("PSBC","中国邮政银行");
		map.put("SPABANK","平安银行");
		map.put("SPDB","浦发银行");
		map.put("ECITIC","中信银行");
		map.put("HZB","杭州银行");
		map.put("GDB","广发银行");
		return map.get(key);
	}
	
	public static String encode(String key, String data) {
		try {
			byte[] keyByte = key.getBytes(CHAR_ENCODING);
			byte[] dataByte = data.getBytes(CHAR_ENCODING);
			byte[] valueByte = MerchantIn.des3Encryption(keyByte, dataByte);
			String value = new String(Base64.encode(valueByte), CHAR_ENCODING);
			return value;
		} catch (Exception e) {
			return null;
		}
	}
}
