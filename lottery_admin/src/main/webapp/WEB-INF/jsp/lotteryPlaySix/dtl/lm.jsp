<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		input[type="number"] {width:100%;}
		th,td {text-align:center; width: 50px; height: 10px;}
		.quickNumber{width:100%;}
	</style>
</head>

<body>
    <div class="ibox-content">
        <div class="row clearfix">
            <div class="col-sm-12">
	    		<form role="form" class="form-horizontal" id="form" data-url="system/lotteryPlaySix/editSubmit">
            	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr>
	            			<th colspan="2">号码</th>
	            			<th>赔率</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td rowspan="2">三中二</td>
		           			<td>中二</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17101" value="${data.n17101.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>中三</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17102" value="${data.n17102.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td colspan="2">三全中</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17201" value="${data.n17201.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td colspan="2">二全中</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17301" value="${data.n17301.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td rowspan="2">二中特</td>
		           			<td>中特</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17401" value="${data.n17401.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>中二</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17402" value="${data.n17402.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td colspan="2">特串</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n17501" value="${data.n17501.bonus}"></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
            	<input type="hidden" name="playNum1" value="${data.playNum1}">
            	<input type="hidden" name="playNum2" value="${data.playNum2}">
            	
            	<div class="form-group">
	                 <div class="col-sm-offset-2 col-sm-9" style="text-align: center;">
	                   <input type="submit" class="btn btn-info" value="保存">
	                   <input type="button" id="colse-btn" class="btn btn-danger" value="取消">
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
        });
    </script>
</body>
</html>