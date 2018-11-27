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
		           			<td>0尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16500" value="${data.n16500.bonus}"></td>
		           			<td>1尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16501" value="${data.n16501.bonus}"></td>
		           			<td>2尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16502" value="${data.n16502.bonus}"></td>
		           			<td>3尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16503" value="${data.n16503.bonus}"></td>
		           			<td>4尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16504" value="${data.n16504.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>5尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16505" value="${data.n16505.bonus}"></td>
		           			<td>6尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16506" value="${data.n16506.bonus}"></td>
		           			<td>7尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16507" value="${data.n16507.bonus}"></td>
		           			<td>8尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16508" value="${data.n16508.bonus}"></td>
		           			<td>9尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16509" value="${data.n16509.bonus}"></td>
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