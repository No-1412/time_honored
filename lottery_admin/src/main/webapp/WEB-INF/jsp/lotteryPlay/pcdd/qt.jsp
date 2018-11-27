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
	            		<tr><th colspan="10">混合</th></tr>
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
			               	<td>大</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n100" value="${data.n100.bonus}"></td>
			               	<td>单</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n102" value="${data.n102.bonus}"></td>
			               	<td>大单</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n104" value="${data.n104.bonus}"></td>
			               	<td>大双</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n106" value="${data.n106.bonus}"></td>
			               	<td>极大</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n108" value="${data.n108.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>小</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n101" value="${data.n101.bonus}"></td>
			               	<td>双</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n103" value="${data.n103.bonus}"></td>
			               	<td>小单</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n105" value="${data.n105.bonus}"></td>
			               	<td>小双</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n107" value="${data.n107.bonus}"></td>
			               	<td>极小</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n109" value="${data.n109.bonus}"></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
            	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr><th colspan="10">波色</th></tr>
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
			               	<td>红波</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n200" value="${data.n200.bonus}"></td>
			               	<td>绿波</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n201" value="${data.n201.bonus}"></td>
			               	<td>蓝波</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n202" value="${data.n202.bonus}"></td>
			               	<td></td>
			               	<td></td>
			               	<td></td>
			               	<td></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
            	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr><th colspan="10">豹子</th></tr>
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
			               	<td>豹子</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n300" value="${data.n300.bonus}"></td>
			               	<td></td>
			               	<td></td>
			               	<td></td>
			               	<td></td>
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