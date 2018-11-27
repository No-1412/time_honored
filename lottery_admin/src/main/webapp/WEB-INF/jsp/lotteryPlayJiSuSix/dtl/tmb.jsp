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
            		快捷设置：<input id="quickSet" type="text" min="0" width="100px;">
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
	            			<th>号码</th>
	            			<th>赔率</th>
	            		</tr>
					</thead>
					<tbody>
		           		<tr>
			               	<td>01</td>
			               	<td><input class="quickNumber" type="text" name="n1201" value="${data.n1201.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n1202" value="${data.n1202.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n1203" value="${data.n1203.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n1204" value="${data.n1204.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n1205" value="${data.n1205.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n1206" value="${data.n1206.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n1207" value="${data.n1207.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n1208" value="${data.n1208.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n1209" value="${data.n1209.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n1210" value="${data.n1210.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n1211" value="${data.n1211.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n1212" value="${data.n1212.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n1213" value="${data.n1213.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n1214" value="${data.n1214.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n1215" value="${data.n1215.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n1216" value="${data.n1216.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n1217" value="${data.n1217.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n1218" value="${data.n1218.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n1219" value="${data.n1219.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n1220" value="${data.n1220.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n1221" value="${data.n1221.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n1222" value="${data.n1222.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n1223" value="${data.n1223.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n1224" value="${data.n1224.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n1225" value="${data.n1225.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n1226" value="${data.n1226.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n1227" value="${data.n1227.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n1228" value="${data.n1228.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n1229" value="${data.n1229.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n1230" value="${data.n1230.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n1231" value="${data.n1231.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n1232" value="${data.n1232.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n1233" value="${data.n1233.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n1234" value="${data.n1234.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n1235" value="${data.n1235.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n1236" value="${data.n1236.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n1237" value="${data.n1237.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n1238" value="${data.n1238.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n1239" value="${data.n1239.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n1240" value="${data.n1240.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n1241" value="${data.n1241.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n1242" value="${data.n1242.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n1243" value="${data.n1243.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n1244" value="${data.n1244.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n1245" value="${data.n1245.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n1246" value="${data.n1246.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n1247" value="${data.n1247.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n1248" value="${data.n1248.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n1249" value="${data.n1249.bonus}"></td>
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
		           			<td>特大</td>
		           			<td><input type="number" min="0" name="n1250" value="${data.n1250.bonus}"></td>
		           			<td>特尾大</td>
		           			<td><input type="number" min="0" name="n1252" value="${data.n1252.bonus}"></td>
		           			<td>特单</td>
		           			<td><input type="number" min="0" name="n1254" value="${data.n1254.bonus}"></td>
		           			<td>特大单</td>
		           			<td><input type="number" min="0" name="n1256" value="${data.n1256.bonus}"></td>
		           			<td>特小单</td>
		           			<td><input type="number" min="0" name="n1260" value="${data.n1260.bonus}"></td>
		           			
		               	</tr>
		               	<tr>
		               		<td>特小</td>
		           			<td><input type="number" min="0" name="n1251" value="${data.n1251.bonus}"></td>
		           			<td>特尾小</td>
		           			<td><input type="number" min="0" name="n1253" value="${data.n1253.bonus}"></td>
		           			<td>特双</td>
		           			<td><input type="number" min="0" name="n1255" value="${data.n1255.bonus}"></td>
		           			<td>特大双</td>
		           			<td><input type="number" min="0" name="n1257" value="${data.n1257.bonus}"></td>
		           			<td>特小双</td>
		           			<td><input type="number" min="0" name="n1261" value="${data.n1261.bonus}"></td>
		               	</tr>
		               	<tr>
		           			<td>特合大</td>
		           			<td><input type="number" min="0" name="n1258" value="${data.n1258.bonus}"></td>
		           			<td>特合单</td>
		           			<td><input type="number" min="0" name="n1262" value="${data.n1262.bonus}"></td>
		           			<td>特天肖</td>
		           			<td><input type="number" min="0" name="n1264" value="${data.n1264.bonus}"></td>
		           			<td>特前肖</td>
		           			<td><input type="number" min="0" name="n1266" value="${data.n1266.bonus}"></td>
		           			<td>特家肖</td>
		           			<td><input type="number" min="0" name="n1268" value="${data.n1268.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>特合小</td>
		           			<td><input type="number" min="0" name="n1259" value="${data.n1259.bonus}"></td>
		           			<td>特合双</td>
		           			<td><input type="number" min="0" name="n1263" value="${data.n1263.bonus}"></td>
		           			<td>特地肖</td>
		           			<td><input type="number" min="0" name="n1265" value="${data.n1265.bonus}"></td>
		           			<td>特后肖</td>
		           			<td><input type="number" min="0" name="n1267" value="${data.n1267.bonus}"></td>
		           			<td>特野肖</td>
		           			<td><input type="number" min="0" name="n1269" value="${data.n1269.bonus}"></td>
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