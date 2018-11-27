<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-reload="0" data-url="system/withdrawConfig/pageSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<div class="form-group">
	                                    <label class="col-sm-2 control-label">入款失败提示语：</label>
	                                    <div class="col-sm-5">
	                                    	<input type="text" name="errTip" class="form-control" value="${data.r_err_tip}"></input>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
	                                
                                	<div class="form-group">
	                                    <label class="col-sm-2 control-label">是否显示微信昵称：</label>
	                                    <div class="col-sm-5">
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.r_is_wechat_show==1?"checked":""} value="1" name="isWechatShow">显示</label>
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.r_is_wechat_show==0?"checked":""} value="0" name="isWechatShow">不显示</label>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="col-sm-2 control-label">微信入款提示语：</label>
	                                    <div class="col-sm-5">
	                                    	<input type="text" name="wechatTip" class="form-control" value="${data.r_wechat_tip}"></input>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="col-sm-2 control-label">微信入款步骤说明：</label>
	                                    <div class="col-sm-5">
	                                    	<textarea style="width:100%;" rows="8" type="text" id="wechat_step" name="wechatStep" class="form-control" placeholder="">${data.r_wechat_step}</textarea>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
	                                
	                                <div class="form-group">
	                                    <label class="col-sm-2 control-label">是否显示支付宝昵称：</label>
	                                    <div class="col-sm-5">
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.r_is_alipay_show==1?"checked":""} value="1" name="isAlipayShow">显示</label>
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.r_is_alipay_show==0?"checked":""} value="0" name="isAlipayShow">不显示</label>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="col-sm-2 control-label">支付宝入款提示语：</label>
	                                    <div class="col-sm-5">
	                                    	<input type="text" name="alipayTip" class="form-control" value="${data.r_alipay_tip}"></input>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="col-sm-2 control-label">支付宝入款步骤说明：</label>
	                                    <div class="col-sm-5">
	                                    	<textarea style="width:100%;" rows="8" type="text" id="alipay_step" name="alipayStep" class="form-control" placeholder="">${data.r_alipay_step}</textarea>
	                                    </div>
	                                    <div class="col-sm-5 form-control-static"></div>
	                                </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="保存">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
    <script type="text/javascript">
	    requirejs(["jquery","form"],function($,form){
	        form();//表单
	    });
    </script>
</body>
</html>