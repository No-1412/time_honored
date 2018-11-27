<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<style>
.verify {
    top: 0;
    bottom: 0;
    margin: auto;
    display: block;
    width: 25px;
    height: 25px;
    cursor: pointer;
    float: left;
}
</style>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/withdraw/verifyEditSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员账号：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.memberCode}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">出款金额：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.amount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">手续费：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.fee}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">行政费：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.feeAdmin}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">审核状态：</label>
                                        <div class="col-sm-5" style="line-height: 35px;">
                                        	<input type="radio" name="status" value="1" class="verify" checked><label style="float: left;font-size: 17px;">通过</label>
                                        	<input style="margin-left: 50px;" type="radio" name="status" value="-1" class="verify"><label style="float:left;font-size: 17px;color:red;">不通过</label>
                                        </div>
                                        需达打码量:<b style="color:red">${dml.amount}</b>，实际打码量:<b style="color:red">${dml.realAmount}</b><br>
                                        <c:if test="${dml.realAmount >= dml.amount}">已经满足要求，可以提款</c:if>
                                        <c:if test="${dml.realAmount < dml.amount}">未满足要求，不可以提款</c:if>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">审核备注：</label>
                                        <div class="col-sm-5">
                                            <input id="verify_remark" type="text" name="remark" class="form-control" value="${data.remark}">
                                        </div>
                                        请仔细填写备注信息,给玩家知道原因
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
            
            /* $('#verify_status').on('change', function() {
            	$('#verify_remark').removeAttr('cls');
            	
            	var status = $('#verify_status').val();
            	if(status == -1) {
            		$('#verify_remark').attr('cls', '{required:true}');
            	}
            }); */
        });
    </script>
</body>
</html>