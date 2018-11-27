package com.ssc.admin.controller.yitong;

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
import com.ssc.core.utils.JsonUtils;
import com.ssc.core.utils.StringUtils;
import com.ssc.entity.HfbXf;
import com.ssc.entity.domain.HfbXfDomain;
import com.ssc.third.yitonng.MD5Utils;
import com.ssc.third.yitonng.Post;
import com.ssc.third.yitonng.YiTongResult;

@Controller
public class YiTongController extends AdminBaseController {
	public static final Map<String, String> STATUS;
	static {
		STATUS = new HashMap<String, String>();
		STATUS.put("00", "初始受理");
		STATUS.put("01", "处理中");
		STATUS.put("02", "代付成功");
		STATUS.put("03", "账户已扣款但出款失败");
		STATUS.put("04", "账户已扣款准备出款");
		STATUS.put("06", "账户已扣款出款处理中");
		STATUS.put("10", "账户已扣款但出款被拦截");
		STATUS.put("96", "代付失败已退款至账户");
	}
	
	@RequestMapping(value="/yitong/index", method=RequestMethod.GET)
	public ModelAndView toIndex() throws Exception {
		return createSuccessModelAndView("yitong/table", null);
	}
	
	@RequestMapping(value="/yitong/getList", method=RequestMethod.GET)
	public ModelAndView getList(Integer page) throws Exception {
		List<Where> whereList = new ArrayList<Where>();
		whereList.add(Where.eq(HfbXfDomain.TYPE, 2));
		
		Page<HfbXf> hfbxfPage = baseService.getPage(
			HfbXf.class,
			whereList,
			page == null ? 1 : (page + 1),
			Parameter.orderBy(OrderBy.desc(HfbXfDomain.ID))
		);
		
		return createSuccessModelAndView("yitong/page", hfbxfPage);
	}
	
	@RequestMapping(value="/yitong/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(Long id) throws Exception {
		return createSuccessModelAndView("yitong/edit", baseService.getById(HfbXf.class, id, null));
	}
	
	@ResponseBody
	@RequestMapping(value="/yitong/editSubmit", method=RequestMethod.POST)
	public CustomResponse adminSubmit(HfbXf hfbxf) throws Exception {
		try {
			new BigDecimal(hfbxf.getApplyAmt());
		} catch(Exception e) {
			return createErrorJsonResponse("无效下发金额！");
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", hfbxf.getSysMerchNo());
		map.put("accountNo", hfbxf.getPayeeAcct());
		map.put("accountName", hfbxf.getPayeeName());
		map.put("amount", hfbxf.getApplyAmt());
		map.put("bankName", hfbxf.getFinaCode());
		map.put("type", "gateway");
		map.put("route", "jinya");
		
		String sign = MD5Utils.getKeyedDigest(MD5Utils.getSignParam(map), hfbxf.getPublicKey());
		map.put("sign", sign);
		map.put("orderCode", hfbxf.getPayeeAcctAttr());
		String orderNo = baseService.genOrderNo(null);
		map.put("pay_number", orderNo);
		map.put("notify_url", "https://" + getRequestUrl() + "/yitong/notify");
		String strResult = Post.sendPost("http://extman.kefupay.cn/pay/pay_mobile.action", MD5Utils.getSignParam(map));
		if(StringUtils.isBlank(strResult)) return createErrorJsonResponse("服务器返回数据为空！");
		
		YiTongResult result = null;
        try {
	        result = JsonUtils.fromJson(strResult, YiTongResult.class);
	        if(!"000000".equals(result.getRespCode())) return createErrorJsonResponse("提交失败："+result.getRespInfo());
        } catch(Exception e) {
        	return createErrorJsonResponse("返回数据异常：" + e.getMessage());
        }
	        
		if(hfbxf.getId() == null) {
			hfbxf.setType(2);
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
	@RequestMapping(value="/yitong/refresh", method=RequestMethod.POST)
	public CustomResponse delete(Long id) throws Exception {
		HfbXf hfbXf = baseService.getById(HfbXf.class, id, null);
		if(hfbXf == null) return createSuccessJsonResponse(null);
		
        Map<String,String> map = new HashMap<String,String>();
        map.put("userid", hfbXf.getSysMerchNo());
        String sign = MD5Utils.getKeyedDigest(MD5Utils.getSignParam(map), hfbXf.getPublicKey());
        
        map.put("sign", sign);
        map.put("orderCode", "yt_withdrawQuery");
        map.put("pay_number", hfbXf.getOrderNo());
        String strResult = Post.sendPost("http://extman.kefupay.cn/pay/pay_mobile.action", MD5Utils.getSignParam(map));
		
		YiTongResult result = StringUtils.isBlank(strResult) ? null : JsonUtils.fromJson(strResult, YiTongResult.class);
		if(result != null && "000000".equals(result.getRespCode())) {
			hfbXf.setStatus(STATUS.get(result.getStatus()));
			baseService.updateById(hfbXf, hfbXf.getId(), false);
			return createSuccessJsonResponse(null);
		}
		
		return createErrorJsonResponse("刷新失败！");
	}
	
	@RequestMapping(value="/yitong/notify")
	public String getList() throws Exception {
		return "SUCCESS";
	}
}