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
                                <form role="form" class="form-horizontal" id="form" data-url="system/platformReport/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">平台名称：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="name" class="form-control" value="${data.expand.platformName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">报表月份：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="reportMonth" class="form-control" value="${data.reportMonth}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">报表金额：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="reportAmount" class="form-control" value="${data.reportAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">应收金额：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="finalAmount" class="form-control" value="${data.finalAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:false}" class="form-control" name="status">
                                            	<option value="0" label="未付" ${data.status==0?"selected":""} />
                                            	<option value="1" label="已付" ${data.status==1?"selected":""} />
                                            	<option value="2" label="部分支付" ${data.status==2?"selected":""} />
                                            	<option value="3" label="不收" ${data.status==3?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">支付时间：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="payTime" class="form-control" value="${data.payTime}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">系统维护费：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="serviceFee" class="form-control" value="${data.serviceFee}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">维护费备注：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="serviceFeeRemark" class="form-control" value="${data.serviceFeeRemark}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">优惠：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="subFee" class="form-control" value="${data.subFee}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">优惠备注：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="subFeeRemark" class="form-control" value="${data.subFeeRemark}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-7">
                                        <textarea style="width:100%;" rows="5" type="text" name="remark" class="form-control" placeholder="">${data.remark}</textarea>
                                        </div>
                                        <div class="col-sm-3 form-control-static"></div>
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