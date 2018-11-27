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
	            			<th colspan="5">3连</th>
	            		</tr>
	            		<tr>
	            			<th>豹子</th>
	            			<th>顺子</th>
	            			<th>对子</th>
	            			<th>半顺</th>
	            			<th>杂六</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td><input type="number" min="0" name="n3100" value="${data.n3100.bonus}"></td>
		           			<td><input type="number" min="0" name="n3101" value="${data.n3101.bonus}"></td>
			               	<td><input type="number" min="0" name="n3102" value="${data.n3102.bonus}"></td>
			               	<td><input type="number" min="0" name="n3103" value="${data.n3103.bonus}"></td>
			               	<td><input type="number" min="0" name="n3104" value="${data.n3104.bonus}"></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
            	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr>
	            			<th colspan="10">跨度</th>
	            		</tr>
	            		<tr>
	            			<th>号码</th>
	            			<th>赔率</th>
	            			<th>号码</th>
	            			<th>赔率</th>
	            			<th>号码</th>
	            			<th>赔率</th>
	            			<th>号码</th>
	            			<th>赔率</th>
	            			<th>号码</th>
	            			<th>赔率</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td>0</td>
		           			<td><input type="number" min="0" name="n3200" value="${data.n3200.bonus}"></td>
		           			<td>1</td>
		           			<td><input type="number" min="0" name="n3201" value="${data.n3201.bonus}"></td>
		           			<td>2</td>
		           			<td><input type="number" min="0" name="n3202" value="${data.n3202.bonus}"></td>
		           			<td>3</td>
		           			<td><input type="number" min="0" name="n3203" value="${data.n3203.bonus}"></td>
		           			<td>4</td>
		           			<td><input type="number" min="0" name="n3204" value="${data.n3204.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>5</td>
		           			<td><input type="number" min="0" name="n3205" value="${data.n3205.bonus}"></td>
		           			<td>6</td>
		           			<td><input type="number" min="0" name="n3206" value="${data.n3206.bonus}"></td>
		           			<td>7</td>
		           			<td><input type="number" min="0" name="n3207" value="${data.n3207.bonus}"></td>
		           			<td>8</td>
		           			<td><input type="number" min="0" name="n3208" value="${data.n3208.bonus}"></td>
		           			<td>9</td>
		           			<td><input type="number" min="0" name="n3209" value="${data.n3209.bonus}"></td>
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