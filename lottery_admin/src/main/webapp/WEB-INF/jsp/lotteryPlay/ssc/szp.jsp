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
	            			<th rowspan="2">号码</th>
	            			<th colspan="5">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>万位</th>
	            			<th>千位</th>
	            			<th>百位</th>
	            			<th>十位</th>
	            			<th>个位</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>0</td>
			               	<td><input type="number" min="0" name="n10" value="${data.n10.bonus}"></td>
			               	<td><input type="number" min="0" name="n20" value="${data.n20.bonus}"></td>
			               	<td><input type="number" min="0" name="n30" value="${data.n30.bonus}"></td>
			               	<td><input type="number" min="0" name="n40" value="${data.n40.bonus}"></td>
			               	<td><input type="number" min="0" name="n50" value="${data.n50.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>1</td>
			               	<td><input type="number" min="0" name="n11" value="${data.n11.bonus}"></td>
			               	<td><input type="number" min="0" name="n21" value="${data.n21.bonus}"></td>
			               	<td><input type="number" min="0" name="n31" value="${data.n31.bonus}"></td>
			               	<td><input type="number" min="0" name="n41" value="${data.n41.bonus}"></td>
			               	<td><input type="number" min="0" name="n51" value="${data.n51.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>2</td>
			               	<td><input type="number" min="0" name="n12" value="${data.n12.bonus}"></td>
			               	<td><input type="number" min="0" name="n22" value="${data.n22.bonus}"></td>
			               	<td><input type="number" min="0" name="n32" value="${data.n32.bonus}"></td>
			               	<td><input type="number" min="0" name="n42" value="${data.n42.bonus}"></td>
			               	<td><input type="number" min="0" name="n52" value="${data.n52.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>3</td>
			               	<td><input type="number" min="0" name="n13" value="${data.n13.bonus}"></td>
			               	<td><input type="number" min="0" name="n23" value="${data.n23.bonus}"></td>
			               	<td><input type="number" min="0" name="n33" value="${data.n33.bonus}"></td>
			               	<td><input type="number" min="0" name="n43" value="${data.n43.bonus}"></td>
			               	<td><input type="number" min="0" name="n53" value="${data.n53.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>4</td>
			               	<td><input type="number" min="0" name="n14" value="${data.n14.bonus}"></td>
			               	<td><input type="number" min="0" name="n24" value="${data.n24.bonus}"></td>
			               	<td><input type="number" min="0" name="n34" value="${data.n34.bonus}"></td>
			               	<td><input type="number" min="0" name="n44" value="${data.n44.bonus}"></td>
			               	<td><input type="number" min="0" name="n54" value="${data.n54.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>5</td>
			               	<td><input type="number" min="0" name="n15" value="${data.n15.bonus}"></td>
			               	<td><input type="number" min="0" name="n25" value="${data.n25.bonus}"></td>
			               	<td><input type="number" min="0" name="n35" value="${data.n35.bonus}"></td>
			               	<td><input type="number" min="0" name="n45" value="${data.n45.bonus}"></td>
			               	<td><input type="number" min="0" name="n55" value="${data.n55.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>6</td>
			               	<td><input type="number" min="0" name="n16" value="${data.n16.bonus}"></td>
			               	<td><input type="number" min="0" name="n26" value="${data.n26.bonus}"></td>
			               	<td><input type="number" min="0" name="n36" value="${data.n36.bonus}"></td>
			               	<td><input type="number" min="0" name="n46" value="${data.n46.bonus}"></td>
			               	<td><input type="number" min="0" name="n56" value="${data.n56.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>7</td>
			               	<td><input type="number" min="0" name="n17" value="${data.n17.bonus}"></td>
			               	<td><input type="number" min="0" name="n27" value="${data.n27.bonus}"></td>
			               	<td><input type="number" min="0" name="n37" value="${data.n37.bonus}"></td>
			               	<td><input type="number" min="0" name="n47" value="${data.n47.bonus}"></td>
			               	<td><input type="number" min="0" name="n57" value="${data.n57.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>8</td>
			               	<td><input type="number" min="0" name="n18" value="${data.n18.bonus}"></td>
			               	<td><input type="number" min="0" name="n28" value="${data.n28.bonus}"></td>
			               	<td><input type="number" min="0" name="n38" value="${data.n38.bonus}"></td>
			               	<td><input type="number" min="0" name="n48" value="${data.n48.bonus}"></td>
			               	<td><input type="number" min="0" name="n58" value="${data.n58.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>9</td>
			               	<td><input type="number" min="0" name="n19" value="${data.n19.bonus}"></td>
			               	<td><input type="number" min="0" name="n29" value="${data.n29.bonus}"></td>
			               	<td><input type="number" min="0" name="n39" value="${data.n39.bonus}"></td>
			               	<td><input type="number" min="0" name="n49" value="${data.n49.bonus}"></td>
			               	<td><input type="number" min="0" name="n59" value="${data.n59.bonus}"></td>
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
            	var $input = $('input[type$="number"]');
                $input.each(function(index, el) {
                	$(el).val(value);
                });
            })
        });
    </script>
</body>
</html>