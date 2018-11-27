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
	            			<th>号码</th>
	            			<th>赔率</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td>0头</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6100" value="${data.n6100.bonus}"></td>
		           			<td>1头</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6101" value="${data.n6101.bonus}"></td>
		           			<td>2头</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6102" value="${data.n6102.bonus}"></td>
		           			<td>3头</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6103" value="${data.n6103.bonus}"></td>
		           			<td>4头</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6104" value="${data.n6104.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>0尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6200" value="${data.n6200.bonus}"></td>
		           			<td>1尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6201" value="${data.n6201.bonus}"></td>
		           			<td>2尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6202" value="${data.n6202.bonus}"></td>
		           			<td>3尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6203" value="${data.n6203.bonus}"></td>
		           			<td>4尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6204" value="${data.n6204.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>5尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6205" value="${data.n6205.bonus}"></td>
		           			<td>6尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6206" value="${data.n6206.bonus}"></td>
		           			<td>7尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6207" value="${data.n6207.bonus}"></td>
		           			<td>8尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6208" value="${data.n6208.bonus}"></td>
		           			<td>9尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n6209" value="${data.n6209.bonus}"></td>
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