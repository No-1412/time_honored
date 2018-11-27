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
		           			<td><input class="quickNumber" type="number" min="0" name="n16201" value="${data.n16201.bonus}"></td>
		           			<td>牛</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16202" value="${data.n16202.bonus}"></td>
		           			<td>虎</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16203" value="${data.n16203.bonus}"></td>
		           			<td>兔</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16204" value="${data.n16204.bonus}"></td>
		           			<td>龙</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16205" value="${data.n16205.bonus}"></td>
		           			<td>蛇</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16206" value="${data.n16206.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>马</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16207" value="${data.n16207.bonus}"></td>
		           			<td>羊</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16208" value="${data.n16208.bonus}"></td>
		           			<td>猴</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16209" value="${data.n16209.bonus}"></td>
		           			<td>鸡</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16210" value="${data.n16210.bonus}"></td>
		           			<td>狗</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16211" value="${data.n16211.bonus}"></td>
		           			<td>猪</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n16212" value="${data.n16212.bonus}"></td>
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