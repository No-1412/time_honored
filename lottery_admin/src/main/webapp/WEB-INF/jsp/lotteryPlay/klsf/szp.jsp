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
	            			<th colspan="8">赔率</th>
	            		</tr>
	            		<tr>
	            			<th>第一球</th>
	            			<th>第二球</th>
	            			<th>第三球</th>
	            			<th>第四球</th>
	            			<th>第五球</th>
	            			<th>第六球</th>
	            			<th>第七球</th>
	            			<th>第八球</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>01</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n101" value="${data.n101.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n201" value="${data.n201.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n301" value="${data.n301.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n401" value="${data.n401.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n501" value="${data.n501.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n601" value="${data.n601.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n701" value="${data.n701.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n801" value="${data.n801.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n102" value="${data.n102.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n202" value="${data.n202.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n302" value="${data.n302.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n402" value="${data.n402.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n502" value="${data.n502.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n602" value="${data.n602.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n702" value="${data.n702.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n802" value="${data.n802.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n103" value="${data.n103.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n203" value="${data.n203.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n303" value="${data.n303.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n403" value="${data.n403.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n503" value="${data.n503.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n603" value="${data.n603.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n703" value="${data.n703.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n803" value="${data.n803.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n104" value="${data.n104.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n204" value="${data.n204.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n304" value="${data.n304.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n404" value="${data.n404.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n504" value="${data.n504.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n604" value="${data.n604.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n704" value="${data.n704.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n804" value="${data.n804.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n105" value="${data.n105.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n205" value="${data.n205.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n305" value="${data.n305.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n405" value="${data.n405.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n505" value="${data.n505.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n605" value="${data.n605.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n705" value="${data.n705.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n805" value="${data.n805.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n106" value="${data.n106.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n206" value="${data.n206.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n306" value="${data.n306.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n406" value="${data.n406.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n506" value="${data.n506.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n606" value="${data.n606.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n706" value="${data.n706.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n806" value="${data.n806.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n107" value="${data.n107.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n207" value="${data.n207.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n307" value="${data.n307.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n407" value="${data.n407.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n507" value="${data.n507.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n607" value="${data.n607.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n707" value="${data.n707.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n807" value="${data.n807.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n108" value="${data.n108.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n208" value="${data.n208.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n308" value="${data.n308.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n408" value="${data.n408.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n508" value="${data.n508.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n608" value="${data.n608.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n708" value="${data.n708.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n808" value="${data.n808.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n109" value="${data.n109.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n209" value="${data.n209.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n309" value="${data.n309.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n409" value="${data.n409.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n509" value="${data.n509.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n609" value="${data.n609.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n709" value="${data.n709.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n809" value="${data.n809.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n110" value="${data.n110.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n210" value="${data.n210.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n310" value="${data.n310.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n410" value="${data.n410.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n510" value="${data.n510.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n610" value="${data.n610.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n710" value="${data.n710.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n810" value="${data.n810.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n111" value="${data.n111.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n211" value="${data.n211.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n311" value="${data.n311.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n411" value="${data.n411.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n511" value="${data.n511.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n611" value="${data.n611.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n711" value="${data.n711.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n811" value="${data.n811.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n112" value="${data.n112.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n212" value="${data.n212.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n312" value="${data.n312.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n412" value="${data.n412.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n512" value="${data.n512.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n612" value="${data.n612.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n712" value="${data.n712.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n812" value="${data.n812.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n113" value="${data.n113.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n213" value="${data.n213.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n313" value="${data.n313.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n413" value="${data.n413.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n513" value="${data.n513.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n613" value="${data.n613.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n713" value="${data.n713.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n813" value="${data.n813.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n114" value="${data.n114.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n214" value="${data.n214.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n314" value="${data.n314.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n414" value="${data.n414.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n514" value="${data.n514.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n614" value="${data.n614.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n714" value="${data.n714.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n814" value="${data.n814.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n115" value="${data.n115.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n215" value="${data.n215.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n315" value="${data.n315.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n415" value="${data.n415.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n515" value="${data.n515.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n615" value="${data.n615.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n715" value="${data.n715.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n815" value="${data.n815.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n116" value="${data.n116.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n216" value="${data.n216.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n316" value="${data.n316.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n416" value="${data.n416.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n516" value="${data.n516.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n616" value="${data.n616.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n716" value="${data.n716.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n816" value="${data.n816.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n117" value="${data.n117.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n217" value="${data.n217.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n317" value="${data.n317.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n417" value="${data.n417.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n517" value="${data.n517.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n617" value="${data.n617.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n717" value="${data.n717.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n817" value="${data.n817.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n118" value="${data.n118.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n218" value="${data.n218.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n318" value="${data.n318.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n418" value="${data.n418.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n518" value="${data.n518.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n618" value="${data.n618.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n718" value="${data.n718.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n818" value="${data.n818.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n119" value="${data.n119.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n219" value="${data.n219.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n319" value="${data.n319.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n419" value="${data.n419.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n519" value="${data.n519.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n619" value="${data.n619.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n719" value="${data.n719.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n819" value="${data.n819.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n120" value="${data.n120.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n220" value="${data.n220.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n320" value="${data.n320.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n420" value="${data.n420.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n520" value="${data.n520.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n620" value="${data.n620.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n720" value="${data.n720.bonus}"></td>
			               	<td><input class="quickNumber" type="number" min="0" name="n820" value="${data.n820.bonus}"></td>
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