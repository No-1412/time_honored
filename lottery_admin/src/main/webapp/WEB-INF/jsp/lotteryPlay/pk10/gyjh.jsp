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
	            			<th rowspan="1">号码</th>
	            			<th colspan="1">赔率</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>3,4,18,19</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1200" value="${data.n1200.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>9,10,12,13</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1201" value="${data.n1201.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>5,6,16,17</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1202" value="${data.n1202.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1203" value="${data.n1203.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>7,8,14,15</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1204" value="${data.n1204.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>和大</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1205" value="${data.n1205.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>和小</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1206" value="${data.n1206.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>和单</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1207" value="${data.n1207.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>和双</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1208" value="${data.n1208.bonus}"></td>
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