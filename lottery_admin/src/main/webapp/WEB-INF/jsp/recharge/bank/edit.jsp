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
                                <form role="form" class="form-horizontal" id="form" data-url="system/rechargeBank/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户行：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="bankName" class="form-control" value="${data.bankName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户行所在地：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="bankAddr" class="form-control" value="${data.bankAddr}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">银行账号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="accountCode" class="form-control" value="${data.accountCode}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户人：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="accountName" class="form-control" value="${data.accountName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">最小金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payMin" class="form-control" value="${data.payMin}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">最大金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payMax" class="form-control" value="${data.payMax}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status" >
                                           		<option value="1" label="启用" ${data.status=='1'?"selected":""} />
                                           		<option value="-1" label="停用" ${data.status=='-1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">显示顺序：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="sort" class="form-control" value="${data.sort}">
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