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
                                <form role="form" class="form-horizontal" id="form" data-url="system/memberLevel/wechatSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">层级：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="level" class="form-control" value="${data.level}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="remark" class="form-control" value="${data.remark}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">微信：</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="wechat">
                                        	<option value="" label="">
                                   			<c:forEach var="wechat" items="${data.expand.wechatList}">
                                   			<c:if test="${wechat.pay_type==2}">
                                   			<option value="${wechat.id}" label="${wechat.name}(${wechat.code}) -- 扫码" ${wechat.checked==1?"selected":""}>
                                   			</c:if>
                                   			<c:if test="${wechat.pay_type==3}">
                                   			<option value="${wechat.id}" label="${wechat.name} -- 加好友" ${wechat.checked==1?"selected":""}>
                                   			</c:if>
                                   			<c:if test="${wechat.pay_type==5}">
                                   			<option value="${wechat.id}" label="${wechat.code}(${wechat.name}) -- ${wechat.bank}" ${wechat.checked==1?"selected":""}>
                                   			</c:if>
                                            </c:forEach>
                                            </select>
                                   		</div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">第三方微信：</label>
                                        <div class="col-sm-5" style="margin-top: 5px;">
                                   			<c:forEach var="third" items="${data.expand.thirdList}">
                                   			<input type="checkbox" name="third" value="${third.id}" ${third.checked==1?"checked":""}>${third.name}<br>
                                            </c:forEach>
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