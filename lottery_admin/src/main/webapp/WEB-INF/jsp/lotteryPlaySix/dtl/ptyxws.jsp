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
	            			<th>号码</th>
	            			<th>赔率</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td>鼠</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11101" value="${data.n11101.bonus}"></td>
		           			<td>牛</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11102" value="${data.n11102.bonus}"></td>
		           			<td>虎</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11103" value="${data.n11103.bonus}"></td>
		           			<td>兔</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11104" value="${data.n11104.bonus}"></td>
		           			<td>龙</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11105" value="${data.n11105.bonus}"></td>
		           			<td>蛇</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11106" value="${data.n11106.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>马</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11107" value="${data.n11107.bonus}"></td>
		           			<td>羊</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11108" value="${data.n11108.bonus}"></td>
		           			<td>猴</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11109" value="${data.n11109.bonus}"></td>
		           			<td>鸡</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11110" value="${data.n11110.bonus}"></td>
		           			<td>狗</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11111" value="${data.n11111.bonus}"></td>
		           			<td>猪</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11112" value="${data.n11112.bonus}"></td>
		               	</tr>
	            	</tbody>
            	</table>
            	
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
		           			<td><input class="quickNumber" type="number" min="0" name="n11200" value="${data.n11200.bonus}"></td>
		           			<td>1尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11201" value="${data.n11201.bonus}"></td>
		           			<td>2尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11202" value="${data.n11202.bonus}"></td>
		           			<td>3尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11203" value="${data.n11203.bonus}"></td>
		           			<td>4尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11204" value="${data.n11204.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>5尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11205" value="${data.n11205.bonus}"></td>
		           			<td>6尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11206" value="${data.n11206.bonus}"></td>
		           			<td>7尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11207" value="${data.n11207.bonus}"></td>
		           			<td>8尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11208" value="${data.n11208.bonus}"></td>
		           			<td>9尾</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n11209" value="${data.n11209.bonus}"></td>
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