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
			               	<td>无牛</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4101" value="${data.n4101.bonus}"></td>
			               	<td>牛1</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4102" value="${data.n4102.bonus}"></td>
			               	<td>牛2</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4103" value="${data.n4103.bonus}"></td>
			               	<td>牛3</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4104" value="${data.n4104.bonus}"></td>
			               	<td>牛4</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4105" value="${data.n4105.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>牛5</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4106" value="${data.n4106.bonus}"></td>
			               	<td>牛6</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4107" value="${data.n4107.bonus}"></td>
			               	<td>牛7</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4108" value="${data.n4108.bonus}"></td>
			               	<td>牛8</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4109" value="${data.n4109.bonus}"></td>
			               	<td>牛9</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4110" value="${data.n4110.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>牛牛</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4111" value="${data.n4111.bonus}"></td>
			               	<td>牛大</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4112" value="${data.n4112.bonus}"></td>
			               	<td>牛小</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4113" value="${data.n4113.bonus}"></td>
			               	<td>牛单</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4114" value="${data.n4114.bonus}"></td>
			               	<td>牛双</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4115" value="${data.n4115.bonus}"></td>
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
        })
    </script>
</body>
</html>