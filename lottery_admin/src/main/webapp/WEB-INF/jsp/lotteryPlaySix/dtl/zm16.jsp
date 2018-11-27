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
	            			<th rowspan="2">号码</th>
	            			<th>正码一</th>
	            			<th>正码二</th>
	            			<th>正码三</th>
	            			<th>正码四</th>
	            			<th>正码五</th>
	            			<th>正码六</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>单码</td>
			               	<td><input class="quickNumber" type="text" name="n9101" value="${data.n9101.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9201" value="${data.n9201.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9301" value="${data.n9301.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9401" value="${data.n9401.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9501" value="${data.n9501.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9601" value="${data.n9601.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>双码</td>
			               	<td><input class="quickNumber" type="text" name="n9102" value="${data.n9102.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9202" value="${data.n9202.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9302" value="${data.n9302.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9402" value="${data.n9402.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9502" value="${data.n9502.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9602" value="${data.n9602.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>大码</td>
			               	<td><input class="quickNumber" type="text" name="n9103" value="${data.n9103.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9203" value="${data.n9203.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9303" value="${data.n9303.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9403" value="${data.n9403.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9503" value="${data.n9503.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9603" value="${data.n9603.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>小码</td>
			               	<td><input class="quickNumber" type="text" name="n9104" value="${data.n9104.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9204" value="${data.n9204.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9304" value="${data.n9304.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9404" value="${data.n9404.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9504" value="${data.n9504.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9604" value="${data.n9604.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>合单</td>
			               	<td><input class="quickNumber" type="text" name="n9105" value="${data.n9105.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9205" value="${data.n9205.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9305" value="${data.n9305.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9405" value="${data.n9405.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9505" value="${data.n9505.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9605" value="${data.n9605.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>合双</td>
			               	<td><input class="quickNumber" type="text" name="n9106" value="${data.n9106.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9206" value="${data.n9206.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9306" value="${data.n9306.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9406" value="${data.n9406.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9506" value="${data.n9506.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9606" value="${data.n9606.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>合大</td>
			               	<td><input class="quickNumber" type="text" name="n9107" value="${data.n9107.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9207" value="${data.n9207.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9307" value="${data.n9307.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9407" value="${data.n9407.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9507" value="${data.n9507.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9607" value="${data.n9607.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>合小</td>
			               	<td><input class="quickNumber" type="text" name="n9108" value="${data.n9108.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9208" value="${data.n9208.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9308" value="${data.n9308.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9408" value="${data.n9408.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9508" value="${data.n9508.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9608" value="${data.n9608.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>红波</td>
			               	<td><input class="quickNumber" type="text" name="n9109" value="${data.n9109.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9209" value="${data.n9209.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9309" value="${data.n9309.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9409" value="${data.n9409.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9509" value="${data.n9509.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9609" value="${data.n9609.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>蓝波</td>
			               	<td><input class="quickNumber" type="text" name="n9110" value="${data.n9110.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9210" value="${data.n9210.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9310" value="${data.n9310.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9410" value="${data.n9410.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9510" value="${data.n9510.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9610" value="${data.n9610.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>绿波</td>
			               	<td><input class="quickNumber" type="text" name="n9111" value="${data.n9111.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9211" value="${data.n9211.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9311" value="${data.n9311.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9411" value="${data.n9411.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9511" value="${data.n9511.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9611" value="${data.n9611.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>尾大</td>
			               	<td><input class="quickNumber" type="text" name="n9112" value="${data.n9112.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9212" value="${data.n9212.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9312" value="${data.n9312.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9412" value="${data.n9412.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9512" value="${data.n9512.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9612" value="${data.n9612.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>尾小</td>
			               	<td><input class="quickNumber" type="text" name="n9113" value="${data.n9113.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9213" value="${data.n9213.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9313" value="${data.n9313.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9413" value="${data.n9413.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9513" value="${data.n9513.bonus}"></td>
			               	<td><input class="quickNumber" type="text" name="n9613" value="${data.n9613.bonus}"></td>
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