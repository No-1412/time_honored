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
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
		           			<td>红波</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3100" value="${data.n3100.bonus}"></td>
		           			<td>蓝波</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3101" value="${data.n3101.bonus}"></td>
		           			<td>绿波</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3102" value="${data.n3102.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3200" value="${data.n3200.bonus}"></td>
		           			<td>蓝单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3204" value="${data.n3204.bonus}"></td>
		           			<td>绿单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3208" value="${data.n3208.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3201" value="${data.n3201.bonus}"></td>
		           			<td>蓝双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3205" value="${data.n3205.bonus}"></td>
		           			<td>绿双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3209" value="${data.n3209.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3202" value="${data.n3202.bonus}"></td>
		           			<td>蓝大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3206" value="${data.n3206.bonus}"></td>
		           			<td>绿大</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3210" value="${data.n3210.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3203" value="${data.n3203.bonus}"></td>
		           			<td>蓝小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3207" value="${data.n3207.bonus}"></td>
		           			<td>绿小</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3211" value="${data.n3211.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红大单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3300" value="${data.n3300.bonus}"></td>
		           			<td>蓝大单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3304" value="${data.n3304.bonus}"></td>
		           			<td>绿大单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3308" value="${data.n3308.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红大双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3301" value="${data.n3301.bonus}"></td>
		           			<td>蓝大双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3305" value="${data.n3305.bonus}"></td>
		           			<td>绿大双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3309" value="${data.n3309.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红小单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3302" value="${data.n3302.bonus}"></td>
		           			<td>蓝小单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3306" value="${data.n3306.bonus}"></td>
		           			<td>绿小单</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3310" value="${data.n3310.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>红小双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3303" value="${data.n3303.bonus}"></td>
		           			<td>蓝小双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3307" value="${data.n3307.bonus}"></td>
		           			<td>绿小双</td>
		           			<td><input class="quickNumber" type="number" min="0" name="n3311" value="${data.n3311.bonus}"></td>
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