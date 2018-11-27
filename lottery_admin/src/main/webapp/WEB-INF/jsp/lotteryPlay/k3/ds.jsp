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
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>4点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n4" value="${data.n4.bonus}"></td>
			               	<td>5点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n5" value="${data.n5.bonus}"></td>
			               	<td>6点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n6" value="${data.n6.bonus}"></td>
			               	<td>7点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n7" value="${data.n7.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>8点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n8" value="${data.n8.bonus}"></td>
			               	<td>9点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n9" value="${data.n9.bonus}"></td>
			               	<td>10点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10" value="${data.n10.bonus}"></td>
			               	<td>11点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n11" value="${data.n11.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>12点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n12" value="${data.n12.bonus}"></td>
			               	<td>13点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n13" value="${data.n13.bonus}"></td>
			               	<td>14点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n14" value="${data.n14.bonus}"></td>
			               	<td>15点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n15" value="${data.n15.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>16点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n16" value="${data.n16.bonus}"></td>
			               	<td>17点</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n17" value="${data.n17.bonus}"></td>
			               	<td></td>
			               	<td></td>
			               	<td></td>
			               	<td></td>
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