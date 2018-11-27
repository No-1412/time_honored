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
	            			<th colspan="6">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>大</th>
	            			<th>小</th>
	            			<th>单</th>
	            			<th>双</th>
	            			<th>龙</th>
	            			<th>虎</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>冠军</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10" value="${data.n10.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n11" value="${data.n11.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n12" value="${data.n12.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n13" value="${data.n13.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n14" value="${data.n14.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n15" value="${data.n15.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>亚军</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n20" value="${data.n20.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n21" value="${data.n21.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n22" value="${data.n22.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n23" value="${data.n23.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n24" value="${data.n24.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n25" value="${data.n25.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>季军</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n30" value="${data.n30.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n31" value="${data.n31.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n32" value="${data.n32.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n33" value="${data.n33.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n34" value="${data.n34.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n35" value="${data.n35.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第四名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n40" value="${data.n40.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n41" value="${data.n41.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n42" value="${data.n42.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n43" value="${data.n43.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n44" value="${data.n44.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n45" value="${data.n45.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第五名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n50" value="${data.n50.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n51" value="${data.n51.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n52" value="${data.n52.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n53" value="${data.n53.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n54" value="${data.n54.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n55" value="${data.n55.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>第六名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n60" value="${data.n60.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n61" value="${data.n61.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n62" value="${data.n62.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n63" value="${data.n63.bonus}"></td>
			               	<td></td><td></td>
		               	</tr>
		               	<tr>
			               	<td>第七名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n70" value="${data.n70.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n71" value="${data.n71.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n72" value="${data.n72.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n73" value="${data.n73.bonus}"></td>
			               	<td></td><td></td>
		               	</tr>
		               	<tr>
			               	<td>第八名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n80" value="${data.n80.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n81" value="${data.n81.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n82" value="${data.n82.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n83" value="${data.n83.bonus}"></td>
			               	<td></td><td></td>
		               	</tr>
		               	<tr>
			               	<td>第九名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n90" value="${data.n90.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n91" value="${data.n91.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n92" value="${data.n92.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n93" value="${data.n93.bonus}"></td>
			               	<td></td><td></td>
		               	</tr>
		               	<tr>
			               	<td>第十名</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n100" value="${data.n100.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n101" value="${data.n101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n102" value="${data.n102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n103" value="${data.n103.bonus}"></td>
			               	<td></td><td></td>
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