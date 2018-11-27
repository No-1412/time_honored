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
			               	<td>0</td>
			               	<td><input type="number" min="0" name="n2100" value="${data.n2100.bonus}"></td>
			               	<td><input type="number" min="0" name="n2200" value="${data.n2200.bonus}"></td>
			               	<td><input type="number" min="0" name="n2300" value="${data.n2300.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>1</td>
			               	<td><input type="number" min="0" name="n2101" value="${data.n2101.bonus}"></td>
			               	<td><input type="number" min="0" name="n2201" value="${data.n2201.bonus}"></td>
			               	<td><input type="number" min="0" name="n2301" value="${data.n2301.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>2</td>
			               	<td><input type="number" min="0" name="n2102" value="${data.n2102.bonus}"></td>
			               	<td><input type="number" min="0" name="n2202" value="${data.n2202.bonus}"></td>
			               	<td><input type="number" min="0" name="n2302" value="${data.n2302.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>3</td>
			               	<td><input type="number" min="0" name="n2103" value="${data.n2103.bonus}"></td>
			               	<td><input type="number" min="0" name="n2203" value="${data.n2203.bonus}"></td>
			               	<td><input type="number" min="0" name="n2303" value="${data.n2303.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>4</td>
			               	<td><input type="number" min="0" name="n2104" value="${data.n2104.bonus}"></td>
			               	<td><input type="number" min="0" name="n2204" value="${data.n2204.bonus}"></td>
			               	<td><input type="number" min="0" name="n2304" value="${data.n2304.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>5</td>
			               	<td><input type="number" min="0" name="n2105" value="${data.n2105.bonus}"></td>
			               	<td><input type="number" min="0" name="n2205" value="${data.n2205.bonus}"></td>
			               	<td><input type="number" min="0" name="n2305" value="${data.n2305.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>6</td>
			               	<td><input type="number" min="0" name="n2106" value="${data.n2106.bonus}"></td>
			               	<td><input type="number" min="0" name="n2206" value="${data.n2206.bonus}"></td>
			               	<td><input type="number" min="0" name="n2306" value="${data.n2306.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>7</td>
			               	<td><input type="number" min="0" name="n2107" value="${data.n2107.bonus}"></td>
			               	<td><input type="number" min="0" name="n2207" value="${data.n2207.bonus}"></td>
			               	<td><input type="number" min="0" name="n2307" value="${data.n2307.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>8</td>
			               	<td><input type="number" min="0" name="n2108" value="${data.n2108.bonus}"></td>
			               	<td><input type="number" min="0" name="n2208" value="${data.n2208.bonus}"></td>
			               	<td><input type="number" min="0" name="n2308" value="${data.n2308.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>9</td>
			               	<td><input type="number" min="0" name="n2109" value="${data.n2109.bonus}"></td>
			               	<td><input type="number" min="0" name="n2209" value="${data.n2209.bonus}"></td>
			               	<td><input type="number" min="0" name="n2309" value="${data.n2309.bonus}"></td>
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
            	var $input = $('input[type$="number"]');
                $input.each(function(index, el) {
                	$(el).val(value);
                });
            })
        });
    </script>
</body>
</html>