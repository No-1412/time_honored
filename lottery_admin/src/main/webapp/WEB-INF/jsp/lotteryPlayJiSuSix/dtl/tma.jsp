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
            		&nbsp;&nbsp;&nbsp;&nbsp;返水(%)：<input name="reward" value="${data.reward}" type="text" min="0" width="100px;">
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
			               	<td><input class="quickNumber" type="text" name="n1101" value="${data.n1101.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n1102" value="${data.n1102.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n1103" value="${data.n1103.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n1104" value="${data.n1104.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n1105" value="${data.n1105.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n1106" value="${data.n1106.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n1107" value="${data.n1107.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n1108" value="${data.n1108.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n1109" value="${data.n1109.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n1110" value="${data.n1110.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n1111" value="${data.n1111.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n1112" value="${data.n1112.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n1113" value="${data.n1113.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n1114" value="${data.n1114.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n1115" value="${data.n1115.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n1116" value="${data.n1116.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n1117" value="${data.n1117.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n1118" value="${data.n1118.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n1119" value="${data.n1119.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n1120" value="${data.n1120.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n1121" value="${data.n1121.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n1122" value="${data.n1122.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n1123" value="${data.n1123.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n1124" value="${data.n1124.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n1125" value="${data.n1125.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n1126" value="${data.n1126.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n1127" value="${data.n1127.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n1128" value="${data.n1128.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n1129" value="${data.n1129.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n1130" value="${data.n1130.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n1131" value="${data.n1131.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n1132" value="${data.n1132.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n1133" value="${data.n1133.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n1134" value="${data.n1134.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n1135" value="${data.n1135.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n1136" value="${data.n1136.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n1137" value="${data.n1137.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n1138" value="${data.n1138.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n1139" value="${data.n1139.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n1140" value="${data.n1140.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n1141" value="${data.n1141.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n1142" value="${data.n1142.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n1143" value="${data.n1143.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n1144" value="${data.n1144.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n1145" value="${data.n1145.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n1146" value="${data.n1146.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n1147" value="${data.n1147.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n1148" value="${data.n1148.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n1149" value="${data.n1149.bonus}"></td>
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