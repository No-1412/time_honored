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
                                <form role="form" class="form-horizontal" id="form" data-reload="0" data-url="system/withdrawConfig/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<div class="form-group">
                                        <label class="col-sm-2 control-label">公司入款优惠比例(%)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="rechargeRate" class="form-control" value="${data.rechargeRate}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">赠送优惠上限(每天)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="rechargeMaxRate" class="form-control" value="${data.rechargeMaxRate}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">赠送彩金比例(%)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="rechargeGift" class="form-control" value="${data.rechargeGift}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">赠送彩金上限：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="rechargeMaxGift" class="form-control" value="${data.rechargeMaxGift}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                	<div class="form-group">
                                        <label class="col-sm-2 control-label">免费次数：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="freeTimes" class="form-control" value="${data.freeTimes}">0表示不限制次数
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">取款手续费(%)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="fee" class="form-control" value="${data.fee}">取款额*百分比，超过免费次数后收取
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">取款行政费：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="feeAdmin" class="form-control" value="${data.feeAdmin}">超过免费次数后收取
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单笔最低出款金额：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="minAmount" class="form-control" value="${data.minAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单笔最大出款金额：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="maxAmount" class="form-control" value="${data.maxAmount}">
                                            0表示不限制
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">提款开关：</label>
                                        <div class="col-sm-5">
                                        	<input type="radio" name="withdrawStatus" value="1" ${data.withdrawStatus==1?"checked":""}>开启
                                        	<input style="margin-left: 50px;" type="radio" name="withdrawStatus" value="-1" ${data.withdrawStatus==-1?"checked":""}>关闭
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">提款关闭说明：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="withdrawDesc" class="form-control" value="${data.withdrawDesc}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">提款温馨提示开关：</label>
                                        <div class="col-sm-5">
                                        	<label class="radio-inline">
	                                            <input type="radio" ${data.expand.withdrawTipOpen==1?"checked":""} value="1" name="withdrawTipOpen">开启</label>
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.expand.withdrawTipOpen==0?"checked":""} value="0" name="withdrawTipOpen">关闭</label>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">提款温馨提示信息：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name=withdrawTipMsg class="form-control" value="${data.expand.withdrawTipMsg}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">充值随机金额开关：</label>
                                        <div class="col-sm-5">
                                        <c:if test="${data.expand.rechargeRandomMoney==null}">
                                        	<label class="radio-inline">
	                                            <input type="radio" value="1" name="rechargeRandomMoney">开启</label>
	                                        <label class="radio-inline">
	                                            <input type="radio" checked value="0" name="rechargeRandomMoney">关闭</label>
                                        </c:if>
                                        <c:if test="${data.expand.rechargeRandomMoney!=null}">
                                        	<label class="radio-inline">
	                                            <input type="radio" ${data.expand.rechargeRandomMoney==1?"checked":""} value="1" name="rechargeRandomMoney">开启</label>
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.expand.rechargeRandomMoney==0?"checked":""} value="0" name="rechargeRandomMoney">关闭</label>
                                        </c:if>
                                        	
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">充值方式提醒：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name=rechargeTypeTip class="form-control" value="${data.expand.rechargeTypeTip}">
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
	    var content = '${content}';
	    requirejs(["jquery","form"],function($,form){
	        form();
	    });
    </script>
</body>
</html>