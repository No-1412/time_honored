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
			               	<td><input class="quickNumber" type="text" name="n8601" value="${data.n8601.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n8602" value="${data.n8602.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n8603" value="${data.n8603.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n8604" value="${data.n8604.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n8605" value="${data.n8605.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n8606" value="${data.n8606.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n8607" value="${data.n8607.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n8608" value="${data.n8608.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n8609" value="${data.n8609.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n8610" value="${data.n8610.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n8611" value="${data.n8611.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n8612" value="${data.n8612.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n8613" value="${data.n8613.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n8614" value="${data.n8614.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n8615" value="${data.n8615.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n8616" value="${data.n8616.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n8617" value="${data.n8617.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n8618" value="${data.n8618.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n8619" value="${data.n8619.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n8620" value="${data.n8620.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n8621" value="${data.n8621.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n8622" value="${data.n8622.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n8623" value="${data.n8623.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n8624" value="${data.n8624.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n8625" value="${data.n8625.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n8626" value="${data.n8626.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n8627" value="${data.n8627.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n8628" value="${data.n8628.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n8629" value="${data.n8629.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n8630" value="${data.n8630.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n8631" value="${data.n8631.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n8632" value="${data.n8632.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n8633" value="${data.n8633.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n8634" value="${data.n8634.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n8635" value="${data.n8635.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n8636" value="${data.n8636.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n8637" value="${data.n8637.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n8638" value="${data.n8638.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n8639" value="${data.n8639.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n8640" value="${data.n8640.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n8641" value="${data.n8641.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n8642" value="${data.n8642.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n8643" value="${data.n8643.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n8644" value="${data.n8644.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n8645" value="${data.n8645.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n8646" value="${data.n8646.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n8647" value="${data.n8647.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n8648" value="${data.n8648.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n8649" value="${data.n8649.bonus}"></td>
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
		           			<td>正六大</td>
		           			<td><input type="number" min="0" name="n8650" value="${data.n8650.bonus}"></td>
		           			<td>正六单</td>
		           			<td><input type="number" min="0" name="n8652" value="${data.n8652.bonus}"></td>
		           			<td>正六合单</td>
		           			<td><input type="number" min="0" name="n8654" value="${data.n8654.bonus}"></td>
		           			<td>正六红</td>
		           			<td><input type="number" min="0" name="n8656" value="${data.n8656.bonus}"></td>
		           			<td>正六绿</td>
		           			<td><input type="number" min="0" name="n8658" value="${data.n8658.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>正六小</td>
		           			<td><input type="number" min="0" name="n8651" value="${data.n8651.bonus}"></td>
		           			<td>正六双</td>
		           			<td><input type="number" min="0" name="n8653" value="${data.n8653.bonus}"></td>
		           			<td>正六合双</td>
		           			<td><input type="number" min="0" name="n8655" value="${data.n8655.bonus}"></td>
		           			<td>正六蓝</td>
		           			<td><input type="number" min="0" name="n8657" value="${data.n8657.bonus}"></td>
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