<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		.custom {float: left;line-height: 30px;height: 30px;}
	</style>
</head>

<body>
    <div class="ibox-content">
        <div class="row">
            <div class="">
	    		<form role="form" class="form-horizontal" id="form" data-reload="0" data-url="system/memberLevel/adjustSubmit">
	                <div class="form-group">
	                	<label class="col-sm-2 control-label custom" style="margin-left: 10px;">源层：</label>
                        <select class="custom" name="levelFrom"  style="width: 150px;">
	                    	<c:forEach var="item" items="${data}">
	                   		<option value="${item.level}" label="${item.name}" ${item.level==1?"selected":""}>
	                    	</c:forEach>
                    	</select>
	                    
	                    <label class="col-sm-2 control-label custom">目标层：</label>
	                    <select class="custom" name="levelTo" style="width: 150px;">
	                    	<option value="" label="请选择">
	                    	<c:forEach var="item" items="${data}">
	                    		<option value="${item.level}" label="${item.name}">
	                    	</c:forEach>
                    	</select>
	                </div>
            	
	            	<div class="form-group">
		                 <div class="col-sm-offset-2 col-sm-9" style="text-align: center;">
		                   <input type="submit" class="btn btn-info" value="调整">
		                   <input type="hidden" id="colse-btn" class="btn btn-danger" value="取消">
		                 </div>
		            </div>
            	</form>
	    	</div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
    <script type="text/javascript">
        requirejs(["jquery","form"],function($,form){
            form();
        })
    </script>
</body>
</html>