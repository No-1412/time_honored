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
			               	<td><input class="quickNumber" type="text" name="n8401" value="${data.n8401.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n8402" value="${data.n8402.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n8403" value="${data.n8403.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n8404" value="${data.n8404.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n8405" value="${data.n8405.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n8406" value="${data.n8406.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n8407" value="${data.n8407.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n8408" value="${data.n8408.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n8409" value="${data.n8409.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n8410" value="${data.n8410.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n8411" value="${data.n8411.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n8412" value="${data.n8412.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n8413" value="${data.n8413.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n8414" value="${data.n8414.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n8415" value="${data.n8415.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n8416" value="${data.n8416.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n8417" value="${data.n8417.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n8418" value="${data.n8418.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n8419" value="${data.n8419.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n8420" value="${data.n8420.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n8421" value="${data.n8421.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n8422" value="${data.n8422.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n8423" value="${data.n8423.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n8424" value="${data.n8424.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n8425" value="${data.n8425.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n8426" value="${data.n8426.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n8427" value="${data.n8427.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n8428" value="${data.n8428.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n8429" value="${data.n8429.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n8430" value="${data.n8430.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n8431" value="${data.n8431.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n8432" value="${data.n8432.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n8433" value="${data.n8433.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n8434" value="${data.n8434.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n8435" value="${data.n8435.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n8436" value="${data.n8436.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n8437" value="${data.n8437.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n8438" value="${data.n8438.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n8439" value="${data.n8439.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n8440" value="${data.n8440.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n8441" value="${data.n8441.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n8442" value="${data.n8442.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n8443" value="${data.n8443.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n8444" value="${data.n8444.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n8445" value="${data.n8445.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n8446" value="${data.n8446.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n8447" value="${data.n8447.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n8448" value="${data.n8448.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n8449" value="${data.n8449.bonus}"></td>
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
		           			<td>正四大</td>
		           			<td><input type="number" min="0" name="n8450" value="${data.n8450.bonus}"></td>
		           			<td>正四单</td>
		           			<td><input type="number" min="0" name="n8452" value="${data.n8452.bonus}"></td>
		           			<td>正四合单</td>
		           			<td><input type="number" min="0" name="n8454" value="${data.n8454.bonus}"></td>
		           			<td>正四红</td>
		           			<td><input type="number" min="0" name="n8456" value="${data.n8456.bonus}"></td>
		           			<td>正四绿</td>
		           			<td><input type="number" min="0" name="n8458" value="${data.n8458.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>正四小</td>
		           			<td><input type="number" min="0" name="n8451" value="${data.n8451.bonus}"></td>
		           			<td>正四双</td>
		           			<td><input type="number" min="0" name="n8453" value="${data.n8453.bonus}"></td>
		           			<td>正四合双</td>
		           			<td><input type="number" min="0" name="n8455" value="${data.n8455.bonus}"></td>
		           			<td>正四蓝</td>
		           			<td><input type="number" min="0" name="n8457" value="${data.n8457.bonus}"></td>
		           			<td></td><td></td>
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