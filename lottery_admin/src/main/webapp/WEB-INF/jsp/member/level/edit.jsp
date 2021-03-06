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
                                <form role="form" class="form-horizontal" id="form" data-url="system/memberLevel/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<input name="rechargeTimes" value="${data.rechargeTimes}" type="text" style="display:none;">
                                	<input name="rechargeAmount" value="${data.rechargeAmount}" type="text" style="display:none;">
                                	
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">层级：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" ${data.id!=null?"readonly":""} type="number" name="level" class="form-control" value="${data.level}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="remark" class="form-control" value="${data.remark}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">打码量倍数：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="times" class="form-control" value="${data.times}">
                                                                                                                     最后一笔入款的倍数
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">固定打码量：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="amount" class="form-control" value="${data.amount}">
                                            0以打码量倍数为准，>0则以固定打码量为准
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <!-- 快汇宝自动出款设置 -->
                                    <c:if test="${admin.isAdmin==1}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">快汇宝后台URL：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="khbAdminUrl" class="form-control" value="${data.khbAdminUrl}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">快汇宝加密密钥：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="khbAdminKey" class="form-control" value="${data.khbAdminKey}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    </c:if>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">是否赠送线上充值彩金：</label>
                                        <div class="col-sm-5">
                                           <select class="form-control" name="sendOnlineGift">
                                        	<option value="-1" ${data.sendOnlineGift==-1?"selected":""}>不赠送</option>
                                        	<option value="1" ${data.sendOnlineGift==1?"selected":""}>赠送</option>
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