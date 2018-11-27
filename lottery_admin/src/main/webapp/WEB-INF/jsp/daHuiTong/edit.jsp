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
                                <form role="form" class="form-horizontal" id="form" data-url="daHuiTong/editSubmit">
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
                                        <label class="col-sm-2 control-label">证件类型：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="idtype" >
                                           		<option value="01" label="身份证" ${data.idtype.equals('01')?"selected":""} />
                                           		<option value="03" label="护照" ${data.idtype.equals('03')?"selected":""} />
                                           		<option value="99" label="其他证件" ${data.idtype.equals('99')?"selected":""} />
											</select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">证件号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}"   type="text" name="idNumber" class="form-control" value="${data.idNumber}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">下发银行名称：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="finaCode" >
                                         		<option value="A10000" label="中国工商银行" ${data.finaCode.equals('A10000')?"selected":""} />
												<option value="A10001" label="中国农业银行" ${data.finaCode.equals('A10001')?"selected":""} />
												<option value="A10002" label="中国银行" ${data.finaCode.equals('A10002')?"selected":""} />
												<option value="A10003" label="中国建设银行" ${data.finaCode.equals('A10003')?"selected":""} />
												<option value="A10007" label="交通银行" ${data.finaCode.equals('A10007')?"selected":""} />
												<option value="A10008" label="中信银行" ${data.finaCode.equals('A10008')?"selected":""} />
												<option value="A10011" label="中国光大银行" ${data.finaCode.equals('A10011')?"selected":""} />
												<option value="A10012" label="华夏银行" ${data.finaCode.equals('A10012')?"selected":""} />
												<option value="A10009" label="中国民生银行" ${data.finaCode.equals('A10009')?"selected":""} />
												<option value="A10006" label="广东发展银行" ${data.finaCode.equals('A10006')?"selected":""} />
												<option value="A10004" label="招商银行" ${data.finaCode.equals('A10004')?"selected":""} />
												<option value="A10010" label="兴业银行" ${data.finaCode.equals('A10010')?"selected":""} />
												<option value="A10005" label="上海浦东发展银行" ${data.finaCode.equals('A10005')?"selected":""} />
										</select>
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