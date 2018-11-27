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
	            			<th rowspan="2">位置</th>
	            			<th colspan="10">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>1</th>
	            			<th>2</th>
	            			<th>3</th>
	            			<th>4</th>
	            			<th>5</th>
	            			<th>6</th>
	            			<th>7</th>
	            			<th>8</th>
	            			<th>9</th>
	            			<th>10</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>冠军</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n200" value="${data.n200.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n201" value="${data.n201.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n202" value="${data.n202.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n203" value="${data.n203.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n204" value="${data.n204.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n205" value="${data.n205.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n206" value="${data.n206.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n207" value="${data.n207.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n208" value="${data.n208.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n209" value="${data.n209.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>亚军</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n300" value="${data.n300.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n301" value="${data.n301.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n302" value="${data.n302.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n303" value="${data.n303.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n304" value="${data.n304.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n305" value="${data.n305.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n306" value="${data.n306.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n307" value="${data.n307.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n308" value="${data.n308.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n309" value="${data.n309.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>季军</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n400" value="${data.n400.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n401" value="${data.n401.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n402" value="${data.n402.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n403" value="${data.n403.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n404" value="${data.n404.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n405" value="${data.n405.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n406" value="${data.n406.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n407" value="${data.n407.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n408" value="${data.n408.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n409" value="${data.n409.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第四名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n500" value="${data.n500.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n501" value="${data.n501.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n502" value="${data.n502.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n503" value="${data.n503.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n504" value="${data.n504.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n505" value="${data.n505.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n506" value="${data.n506.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n507" value="${data.n507.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n508" value="${data.n508.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n509" value="${data.n509.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第五名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n600" value="${data.n600.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n601" value="${data.n601.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n602" value="${data.n602.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n603" value="${data.n603.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n604" value="${data.n604.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n605" value="${data.n605.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n606" value="${data.n606.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n607" value="${data.n607.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n608" value="${data.n608.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n609" value="${data.n609.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第六名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n700" value="${data.n700.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n701" value="${data.n701.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n702" value="${data.n702.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n703" value="${data.n703.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n704" value="${data.n704.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n705" value="${data.n705.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n706" value="${data.n706.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n707" value="${data.n707.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n708" value="${data.n708.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n709" value="${data.n709.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第七名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n800" value="${data.n800.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n801" value="${data.n801.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n802" value="${data.n802.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n803" value="${data.n803.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n804" value="${data.n804.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n805" value="${data.n805.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n806" value="${data.n806.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n807" value="${data.n807.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n808" value="${data.n808.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n809" value="${data.n809.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第八名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n900" value="${data.n900.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n901" value="${data.n901.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n902" value="${data.n902.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n903" value="${data.n903.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n904" value="${data.n904.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n905" value="${data.n905.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n906" value="${data.n906.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n907" value="${data.n907.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n908" value="${data.n908.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n909" value="${data.n909.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第九名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1000" value="${data.n1000.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1001" value="${data.n1001.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1002" value="${data.n1002.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1003" value="${data.n1003.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1004" value="${data.n1004.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1005" value="${data.n1005.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1006" value="${data.n1006.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1007" value="${data.n1007.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1008" value="${data.n1008.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1009" value="${data.n1009.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第十名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1100" value="${data.n1100.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1101" value="${data.n1101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1102" value="${data.n1102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1103" value="${data.n1103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1104" value="${data.n1104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1105" value="${data.n1105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1106" value="${data.n1106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1107" value="${data.n1107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1108" value="${data.n1108.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n1109" value="${data.n1109.bonus}"></td>
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
            	var $input = $('input[class$="quickNumber"]');
                $input.each(function(index, el) {
                	$(el).val(value);
                });
            })
        });
    </script>
</body>
</html>