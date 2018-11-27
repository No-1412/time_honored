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
                                <form role="form" class="form-horizontal" id="form" data-url="system/member/updateDmlSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<input name="memberId" value="${data.memberId}" type="text" style="display:none;">
                                	
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">充值金额：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.inAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">实际打码量：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" class="form-control" value="${data.realAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">需达打码量：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="amount" class="form-control" value="${data.amount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">打码量倍数：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="times" class="form-control" value="${data.times}">
                                            <b style="color: red;">修改打码量倍数只对以后的充值有效，如果要调整本次打码量，请直接修改需达打码量<b>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
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