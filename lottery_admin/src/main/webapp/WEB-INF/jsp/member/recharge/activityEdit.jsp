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
                                <form role="form" class="form-horizontal" id="form" data-url="system/recharge/activityEditSubmit">
                                	<input name="id" value="${data.agentBack.id}" type="text" style="display:none;">
                                   
	                                <div class="form-group">
                                        <label class="col-sm-2 control-label" style="width: 140px;">活动名称：</label>
                                         <div class="col-sm-5">
                                         <select class="form-control" name="type" id="typeVal"" onchange="changeType(this.value);">
                                 			<c:forEach var="types" items="${data.typeData}">
                                 				<c:if test="${types.index == data.agentBack.type}">
                                 					<option value="${types.index}" label="${types.typeName}" selected="selected"/>
                                 				</c:if>
                                 				<c:if test="${types.index != data.agentBack.type}">
                                 					<option value="${types.index}" label="${types.typeName}" />
                                 				</c:if>
                                         		
                                         	</c:forEach>
                                         </select>
                                         </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label id="labelName" class="col-sm-2 control-label" style="width: 140px;">充值金额：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="minAmount" class="form-control" value="${data.agentBack.minAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" style="width: 140px;">赠送金额：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="percent" class="form-control" value="${data.agentBack.percent}">
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
            form();//表单
        });
        
        function changeType(val){
	    	if(val ==4){
	    		$("#labelName").html("盈亏金额：");
	    	}else{
	    		$("#labelName").html("充值金额：");
	    	}
	    }
    </script>
</body>
</html>