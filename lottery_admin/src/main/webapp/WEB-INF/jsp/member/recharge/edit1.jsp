<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/recharge/verifyEditSubmit1">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员账号：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.memberCode}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">入款金额：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.amount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否赠送优惠：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="add">
                                            	<option value="1" label="赠送" ${isRechargeAddOpen==1?'selected':''} />
                                            	<option value="-1" label="不赠送" ${isRechargeAddOpen!=1?'selected':''} />
                                            </select>
                                        </div>
                                        <label class="col-sm-2 colleft3">系统计算结果：${data.amount*config.rechargeRate/100}</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否赠送彩金：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="gift">
                                            	<option value="1" label="赠送" />
                                            	<option value="-1" label="不赠送" selected />
                                            </select>
                                        </div>
                                       <c:if test="${config.rechargeMaxGift > 0 && config.rechargeMaxGift <= data.amount*config.rechargeGift/100}"><label class="col-sm-2 colleft3">系统计算结果：${config.rechargeMaxGift}</label></c:if>
                                       <c:if test="${config.rechargeMaxGift <= 0 || config.rechargeMaxGift > data.amount*config.rechargeGift/100}"><label class="col-sm-2 colleft3">系统计算结果：${data.amount*config.rechargeGift/100}</label></c:if>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">审核备注：</label>
                                        <div class="col-sm-5">
                                            <input id="verify_remark" type="text" name="remark" class="form-control" value="${data.remark}">
                                        </div>
                                        <label class="col-sm-2 colleft4">请仔细填写备注信息,给玩家知道原因</label>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="确定">
                                          <input type="button" id="colse-btn" class="btn btn-danger" value="取消">
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
            form();
        });
    </script>
</body>
</html>