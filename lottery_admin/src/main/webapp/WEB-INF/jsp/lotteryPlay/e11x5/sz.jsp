<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		input[type="number"] {width:100%;}
		th,td {text-align:center; width: 50px; height: 10px;}
	</style>
</head>

<body>
    <div class="ibox-content">
        <div class="row clearfix">
            <div class="col-sm-12">
	    		<form role="form" class="form-horizontal" id="form" data-url="system/lotteryPlay/editSubmit">
	        	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr>
	            			<th rowspan="2">号码</th>
	            			<th colspan="3">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>前三</th>
	            			<th>中三</th>
	            			<th>后三</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>顺子</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3101" value="${data.n3101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3201" value="${data.n3201.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3301" value="${data.n3301.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>半顺</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3102" value="${data.n3102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3202" value="${data.n3202.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3302" value="${data.n3302.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>杂六</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3103" value="${data.n3103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3203" value="${data.n3203.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3303" value="${data.n3303.bonus}"></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
            	<input type="hidden" name="roomId" value="${data.roomId}">
            	<input type="hidden" name="lotteryType" value="${data.lotteryType}">
            	<input type="hidden" name="lotteryPlayType" value="${data.lotteryPlayType}">
            	
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