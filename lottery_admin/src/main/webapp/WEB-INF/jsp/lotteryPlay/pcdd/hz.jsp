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
	    		<form role="form" class="form-horizontal" id="form" data-url="system/lotteryPlay/editSubmit">
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
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>0</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n10" value="${data.n10.bonus}"></td>
			               	<td>1</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n11" value="${data.n11.bonus}"></td>
			               	<td>2</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n12" value="${data.n12.bonus}"></td>
			               	<td>3</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n13" value="${data.n13.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>4</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n14" value="${data.n14.bonus}"></td>
			               	<td>5</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n15" value="${data.n15.bonus}"></td>
			               	<td>6</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n16" value="${data.n16.bonus}"></td>
			               	<td>7</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n17" value="${data.n17.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>8</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n18" value="${data.n18.bonus}"></td>
			               	<td>9</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n19" value="${data.n19.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n20" value="${data.n20.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n21" value="${data.n21.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n22" value="${data.n22.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n23" value="${data.n23.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n24" value="${data.n24.bonus}"></td>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n25" value="${data.n25.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n26" value="${data.n26.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n27" value="${data.n27.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n28" value="${data.n28.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n29" value="${data.n29.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n30" value="${data.n30.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n31" value="${data.n31.bonus}"></td>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n32" value="${data.n32.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n33" value="${data.n33.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n34" value="${data.n34.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n35" value="${data.n35.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n36" value="${data.n36.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="number" min="0" name="n37" value="${data.n37.bonus}"></td>
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
        });
    </script>
</body>
</html>