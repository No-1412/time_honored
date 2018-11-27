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
			               	<td><input class="quickNumber" type="text" name="n8301" value="${data.n8301.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n8302" value="${data.n8302.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n8303" value="${data.n8303.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n8304" value="${data.n8304.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n8305" value="${data.n8305.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n8306" value="${data.n8306.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n8307" value="${data.n8307.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n8308" value="${data.n8308.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n8309" value="${data.n8309.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n8310" value="${data.n8310.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n8311" value="${data.n8311.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n8312" value="${data.n8312.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n8313" value="${data.n8313.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n8314" value="${data.n8314.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n8315" value="${data.n8315.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n8316" value="${data.n8316.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n8317" value="${data.n8317.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n8318" value="${data.n8318.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n8319" value="${data.n8319.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n8320" value="${data.n8320.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n8321" value="${data.n8321.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n8322" value="${data.n8322.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n8323" value="${data.n8323.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n8324" value="${data.n8324.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n8325" value="${data.n8325.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n8326" value="${data.n8326.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n8327" value="${data.n8327.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n8328" value="${data.n8328.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n8329" value="${data.n8329.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n8330" value="${data.n8330.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n8331" value="${data.n8331.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n8332" value="${data.n8332.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n8333" value="${data.n8333.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n8334" value="${data.n8334.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n8335" value="${data.n8335.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n8336" value="${data.n8336.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n8337" value="${data.n8337.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n8338" value="${data.n8338.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n8339" value="${data.n8339.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n8340" value="${data.n8340.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n8341" value="${data.n8341.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n8342" value="${data.n8342.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n8343" value="${data.n8343.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n8344" value="${data.n8344.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n8345" value="${data.n8345.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n8346" value="${data.n8346.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n8347" value="${data.n8347.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n8348" value="${data.n8348.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n8349" value="${data.n8349.bonus}"></td>
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
		           			<td>正三大</td>
		           			<td><input type="number" min="0" name="n8350" value="${data.n8350.bonus}"></td>
		           			<td>正三单</td>
		           			<td><input type="number" min="0" name="n8352" value="${data.n8352.bonus}"></td>
		           			<td>正三合单</td>
		           			<td><input type="number" min="0" name="n8354" value="${data.n8354.bonus}"></td>
		           			<td>正三红</td>
		           			<td><input type="number" min="0" name="n8356" value="${data.n8356.bonus}"></td>
		           			<td>正三绿</td>
		           			<td><input type="number" min="0" name="n8358" value="${data.n8358.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>正三小</td>
		           			<td><input type="number" min="0" name="n8351" value="${data.n8351.bonus}"></td>
		           			<td>正三双</td>
		           			<td><input type="number" min="0" name="n8353" value="${data.n8353.bonus}"></td>
		           			<td>正三合双</td>
		           			<td><input type="number" min="0" name="n8355" value="${data.n8355.bonus}"></td>
		           			<td>正三蓝</td>
		           			<td><input type="number" min="0" name="n8357" value="${data.n8357.bonus}"></td>
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