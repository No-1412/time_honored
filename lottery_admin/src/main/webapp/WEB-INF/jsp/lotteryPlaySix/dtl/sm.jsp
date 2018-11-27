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
           		快捷设置：<input id="quickSet" type="text" min="0" width="100px;">
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
		           			<td>特大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2100" value="${data.n2100.bonus}"></td>
		           			<td>特尾大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2102" value="${data.n2102.bonus}"></td>
		           			<td>特单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2104" value="${data.n2104.bonus}"></td>
		           			<td>特大单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2106" value="${data.n2106.bonus}"></td>
		           			<td>特小单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2110" value="${data.n2110.bonus}"></td>
		           			
		               	</tr>
		               	<tr>
		               		<td>特小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2101" value="${data.n2101.bonus}"></td>
		           			<td>特尾小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2103" value="${data.n2103.bonus}"></td>
		           			<td>特双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2105" value="${data.n2105.bonus}"></td>
		           			<td>特大双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2107" value="${data.n2107.bonus}"></td>
		           			<td>特小双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2111" value="${data.n2111.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>特合大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2108" value="${data.n2108.bonus}"></td>
		           			<td>特合单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2112" value="${data.n2112.bonus}"></td>
		           			<td>特天肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2114" value="${data.n2114.bonus}"></td>
		           			<td>特前肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2116" value="${data.n2116.bonus}"></td>
		           			<td>特家肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2118" value="${data.n2118.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>特合小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2109" value="${data.n2109.bonus}"></td>
		           			<td>特合双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2113" value="${data.n2113.bonus}"></td>
		           			<td>特地肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2115" value="${data.n2115.bonus}"></td>
		           			<td>特后肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2117" value="${data.n2117.bonus}"></td>
		           			<td>特野肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2119" value="${data.n2119.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>总大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2120" value="${data.n2120.bonus}"></td>
		           			<td>总小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2121" value="${data.n2121.bonus}"></td>
		           			<td>总单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2122" value="${data.n2122.bonus}"></td>
		           			<td>总双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n2123" value="${data.n2123.bonus}"></td>
		           			<td></td>
		           			<td></td>
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