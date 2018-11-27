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
                                <form role="form" class="form-horizontal" id="form" data-url="system/member/editSubmit">
                                	<input name="id" value="${data.member.id}" type="text" style="display:none;">
                                	<input name="bankId" value="${data.bank.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号：</label>
                                        <div class="col-sm-5">
                                            <input readonly  type="text" class="form-control" value="${data.member.code}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">真实姓名：</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" name="name" value="${data.member.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">推荐人ID：</label>
                                        <div class="col-sm-5">
                                            <input type="number" ${admin.isAdmin>=1?"":"readonly"} class="form-control" name="tjr" value="${data.member.tjr}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">手机号码：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="phone" class="form-control" value="${data.member.phone}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">QQ：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="qq" class="form-control" value="${data.member.qq}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮箱：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="email" class="form-control" value="${data.member.email}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">取款密码：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="wpassword" class="form-control" value="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户银行：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="bankName" class="form-control" value="${data.bank.bankName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">银行账号：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="accountCode" class="form-control" value="${data.bank.accountCode}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">开户省份：</label>
                                        <div class="col-sm-5">
                                            <input type="text" readonly  name=provice class="form-control" value="${data.bank.provice}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开户城市：</label>
                                        <div class="col-sm-5">
                                            <input type="text" readonly name="city" class="form-control" value="${data.bank.city}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <%-- <div class="form-group">
                                        <label class="col-sm-2 control-label">打码量：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="dml" class="form-control" value="${data.dml.amount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div> --%>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否风险会员：</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="isDanger">
                                            	<option value="1" ${data.member.isDanger==1?"selected":""}>是</option>
                                            	<option value="0" ${data.member.isDanger==0?"selected":""}>否</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="remark" class="form-control" value="${data.member.remark}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">后台备注：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="remark1" class="form-control" value="${data.member.remark1}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">APP彩金：</label>
                                        <div class="col-sm-5">
                                            <input type="text" readonly class="form-control" value="${data.member.isApp==0?'未赠送(未登录APP)':(data.member.isApp==1?'未赠送(资料未完善或未达到指定充值金额)':(data.member.isApp==2?'已赠送':'同名不赠送'))}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">密保问题：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="question" class="form-control" value="${data.security.question}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">密保答案：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="answer"  class="form-control" value="${data.security.answer}">
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