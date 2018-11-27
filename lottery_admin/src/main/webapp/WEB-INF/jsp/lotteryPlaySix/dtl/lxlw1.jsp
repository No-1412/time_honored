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
		           			<td><input class="quickNumber" type="number" min="0" name="n16101" value="${data.n16101.bonus}"></td>
		           			<td>牛</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16102" value="${data.n16102.bonus}"></td>
		           			<td>虎</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16103" value="${data.n16103.bonus}"></td>
		           			<td>兔</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16104" value="${data.n16104.bonus}"></td>
		           			<td>龙</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16105" value="${data.n16105.bonus}"></td>
		           			<td>蛇</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16106" value="${data.n16106.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>马</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16107" value="${data.n16107.bonus}"></td>
		           			<td>羊</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16108" value="${data.n16108.bonus}"></td>
		           			<td>猴</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16109" value="${data.n16109.bonus}"></td>
		           			<td>鸡</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16110" value="${data.n16110.bonus}"></td>
		           			<td>狗</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16111" value="${data.n16111.bonus}"></td>
		           			<td>猪</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16112" value="${data.n16112.bonus}"></td>
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