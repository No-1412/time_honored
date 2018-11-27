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
                                <form role="form" class="form-horizontal" id="form" data-url="unionpay/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型：</label>
                                         <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="type" >
                                           		<option value="5" label="银联" ${data.type.equals('5')?"selected":""} />
                                           		<option value="6" label="网关" ${data.type.equals('6')?"selected":""} />
                                           	</select>
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
                                           		<option value="0" label="身份证" ${data.idtype.equals('0')?"selected":""} />
                                           		<option value="1" label="户口簿" ${data.idtype.equals('10')?"selected":""} />
                                            	<option value="2" label="护照" ${data.idtype.equals('2')?"selected":""} />
                                           		<option value="3" label="军官证" ${data.idtype.equals('3')?"selected":""} />
                                            	<option value="4" label="士兵证" ${data.idtype.equals('4')?"selected":""} />
                                           		<option value="5" label="港澳居民来往内地通行证" ${data.idtype.equals('5')?"selected":""} />
                                            	<option value="6" label="台湾同胞来往内地通行证" ${data.idtype.equals('6')?"selected":""} />
                                           		<option value="7" label="临时身份证" ${data.idtype.equals('7')?"selected":""} />
                                           		<option value="8" label="外国人居留证" ${data.idtype.equals('8')?"selected":""} />
                                           		<option value="9" label="警官证" ${data.idtype.equals('9')?"selected":""} />
                                           		<option value="X" label="其他证件" ${data.idtype.equals('X')?"selected":""} />
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
                                        <label class="col-sm-2 control-label">电话号码：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}"   type="text" name="sysMerchNo" class="form-control" value="${data.sysMerchNo}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">下发银行名称：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="finaCode" >
												<option value="BOC" label="中国银行" ${data.finaCode.equals('BOC')?"selected":""} />
												<option value="ABC" label="农业银行" ${data.finaCode.equals('ABC')?"selected":""} />
												<option value="ICBC" label="工商银行" ${data.finaCode.equals('ICBC')?"selected":""} />
												<option value="BCOM" label="交通银行" ${data.finaCode.equals('BCOM')?"selected":""} />
												<option value="CCB" label="建设银行" ${data.finaCode.equals('CCB')?"selected":""} />
												<option value="CMB" label="招商银行" ${data.finaCode.equals('CMB')?"selected":""} />
												<option value="CMBC" label="民生银行" ${data.finaCode.equals('CMBC')?"selected":""} />
												<option value="CEBB" label="光大银行" ${data.finaCode.equals('CEBB')?"selected":""} />
												<option value="BOB" label="北京银行" ${data.finaCode.equals('BOB')?"selected":""} />
												<option value="SHB" label="上海银行" ${data.finaCode.equals('SHB')?"selected":""} />
												<option value="NBB" label="宁波银行" ${data.finaCode.equals('NBB')?"selected":""} />
												<option value="HXB" label="华夏银行" ${data.finaCode.equals('HXB')?"selected":""} />
												<option value="CIB" label="兴业银行" ${data.finaCode.equals('CIB')?"selected":""} />
												<option value="PSBC" label="中国邮政银行" ${data.finaCode.equals('PSBC')?"selected":""} />
												<option value="SPABANK" label="平安银行" ${data.finaCode.equals('SPABANK')?"selected":""} />
												<option value="SPDB" label="浦发银行" ${data.finaCode.equals('SPDB')?"selected":""} />
												<option value="ECITIC" label="中信银行" ${data.finaCode.equals('ECITIC')?"selected":""} />
												<option value="HZB" label="杭州银行" ${data.finaCode.equals('HZB')?"selected":""} />
												<option value="GDB" label="广发银行" ${data.finaCode.equals('GDB')?"selected":""} />
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