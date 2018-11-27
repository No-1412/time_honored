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
            	<div class="form-group">
            		快捷设置：
            		<input id="quickSet" type="text" min="0" width="100px;">
            	</div>
	    		<form role="form" class="form-horizontal" id="form" data-url="system/lotteryPlay/editSubmit">
	        	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr>
	            			<th rowspan="2">号码</th>
	            			<th colspan="5">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>百位</th>
	            			<th>十位</th>
	            			<th>个位</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>大</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10" value="${data.n10.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n20" value="${data.n20.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n30" value="${data.n30.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>小</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n11" value="${data.n11.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n21" value="${data.n21.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n31" value="${data.n31.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>单</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n12" value="${data.n12.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n22" value="${data.n22.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n32" value="${data.n32.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>双</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n13" value="${data.n13.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n23" value="${data.n23.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n33" value="${data.n33.bonus}"></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
            	<table class="table table-bordered table-condensed">
	            	<thead>
	            		<tr>
	            			<th colspan="7">总和、龙虎和</th>
	            		</tr>
	            		<tr>
	            			<th>总大</th>
	            			<th>总小</th>
	            			<th>总单</th>
	            			<th>总双</th>
	            			<th>龙</th>
	            			<th>虎</th>
	            			<th>和</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td><input type="number" min="0" name="n40" value="${data.n40.bonus}"></td>
		           			<td><input type="number" min="0" name="n41" value="${data.n41.bonus}"></td>
			               	<td><input type="number" min="0" name="n42" value="${data.n42.bonus}"></td>
			               	<td><input type="number" min="0" name="n43" value="${data.n43.bonus}"></td>
			               	<td><input type="number" min="0" name="n44" value="${data.n44.bonus}"></td>
			               	<td><input type="number" min="0" name="n45" value="${data.n45.bonus}"></td>
			               	<td><input type="number" min="0" name="n46" value="${data.n46.bonus}"></td>
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
            
            $("#quickSet").keyup(function(){
            	var value = $("#quickSet").val();
            	var $input = $('input[class$="quickNumber"]');
                $input.each(function(index, el) {
                	$(el).val(value);
                });
            })
        });
    </script>
</body>
</html>