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
	    		<form role="form" class="form-horizontal" id="form" data-url="system/lotteryPlayJiSuSix/editSubmit">
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
		           			<td>2肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14102" value="${data.n14102.bonus}"></td>
		           			<td>3肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14103" value="${data.n14103.bonus}"></td>
		           			<td>4肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14104" value="${data.n14104.bonus}"></td>
		           			<td>5肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14105" value="${data.n14105.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>6肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14106" value="${data.n14106.bonus}"></td>
		           			<td>7肖</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14107" value="${data.n14107.bonus}"></td>
		           			<td>总肖单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14108" value="${data.n14108.bonus}"></td>
		           			<td>总肖双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n14109" value="${data.n14109.bonus}"></td>
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