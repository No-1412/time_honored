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
                                <form role="form" class="form-horizontal" id="form" data-url="hfb/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商户号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="sysMerchNo" class="form-control" value="${data.sysMerchNo}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商户秘钥：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="publicKey" class="form-control" value="${data.publicKey}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">下发金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="applyAmt" class="form-control" value="${data.applyAmt}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">银行账号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payeeAcct" class="form-control" value="${data.payeeAcct}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">银行户名：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payeeName" class="form-control" value="${data.payeeName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户行省：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="bankProvince" class="form-control" value="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户行市：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="bankCity" class="form-control" value="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户行名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="bankName" class="form-control" value="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号属性：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="payeeAcctAttr" >
                                           		<option value="PRIVATE" label="对私" ${data.payeeAcctAttr.equals('PRIVATE')?"selected":""} />
                                           		<option value="PUBLIC" label="对公" ${data.payeeAcctAttr.equals('PUBLIC')?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">下发银行代码：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="finaCode" class="form-control" value="${data.finaCode}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${data.id != null}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="status" class="form-control" value="${data.status}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    </c:if>
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