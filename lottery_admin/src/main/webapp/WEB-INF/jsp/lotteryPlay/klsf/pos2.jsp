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
	            			<th colspan="8">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>第一球</th>
	            			<th>第二球</th>
	            			<th>第三球</th>
	            			<th>第四球</th>
	            			<th>第五球</th>
	            			<th>第六球</th>
	            			<th>第七球</th>
	            			<th>第八球</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>东</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3101" value="${data.n3101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4101" value="${data.n4101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5101" value="${data.n5101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6101" value="${data.n6101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7101" value="${data.n7101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8101" value="${data.n8101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9101" value="${data.n9101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10101" value="${data.n10101.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>西</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3102" value="${data.n3102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4102" value="${data.n4102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5102" value="${data.n5102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6102" value="${data.n6102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7102" value="${data.n7102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8102" value="${data.n8102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9102" value="${data.n9102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10102" value="${data.n10102.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>南</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3103" value="${data.n3103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4103" value="${data.n4103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5103" value="${data.n5103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6103" value="${data.n6103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7103" value="${data.n7103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8103" value="${data.n8103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9103" value="${data.n9103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10103" value="${data.n10103.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>北</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3104" value="${data.n3104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4104" value="${data.n4104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5104" value="${data.n5104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6104" value="${data.n6104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7104" value="${data.n7104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8104" value="${data.n8104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9104" value="${data.n9104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10104" value="${data.n10104.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>中</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3105" value="${data.n3105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4105" value="${data.n4105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5105" value="${data.n5105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6105" value="${data.n6105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7105" value="${data.n7105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8105" value="${data.n8105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9105" value="${data.n9105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10105" value="${data.n10105.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>发</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3106" value="${data.n3106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4106" value="${data.n4106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5106" value="${data.n5106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6106" value="${data.n6106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7106" value="${data.n7106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8106" value="${data.n8106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9106" value="${data.n9106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10106" value="${data.n10106.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>白</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n3107" value="${data.n3107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4107" value="${data.n4107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5107" value="${data.n5107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6107" value="${data.n6107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7107" value="${data.n7107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8107" value="${data.n8107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9107" value="${data.n9107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10107" value="${data.n10107.bonus}"></td>
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