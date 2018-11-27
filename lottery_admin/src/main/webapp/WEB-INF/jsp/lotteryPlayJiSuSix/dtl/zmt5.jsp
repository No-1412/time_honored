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
			               	<td><input class="quickNumber" type="text" name="n8501" value="${data.n8501.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n8502" value="${data.n8502.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n8503" value="${data.n8503.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n8504" value="${data.n8504.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n8505" value="${data.n8505.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n8506" value="${data.n8506.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n8507" value="${data.n8507.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n8508" value="${data.n8508.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n8509" value="${data.n8509.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n8510" value="${data.n8510.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n8511" value="${data.n8511.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n8512" value="${data.n8512.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n8513" value="${data.n8513.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n8514" value="${data.n8514.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n8515" value="${data.n8515.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n8516" value="${data.n8516.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n8517" value="${data.n8517.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n8518" value="${data.n8518.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n8519" value="${data.n8519.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n8520" value="${data.n8520.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n8521" value="${data.n8521.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n8522" value="${data.n8522.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n8523" value="${data.n8523.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n8524" value="${data.n8524.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n8525" value="${data.n8525.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n8526" value="${data.n8526.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n8527" value="${data.n8527.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n8528" value="${data.n8528.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n8529" value="${data.n8529.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n8530" value="${data.n8530.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n8531" value="${data.n8531.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n8532" value="${data.n8532.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n8533" value="${data.n8533.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n8534" value="${data.n8534.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n8535" value="${data.n8535.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n8536" value="${data.n8536.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n8537" value="${data.n8537.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n8538" value="${data.n8538.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n8539" value="${data.n8539.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n8540" value="${data.n8540.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n8541" value="${data.n8541.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n8542" value="${data.n8542.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n8543" value="${data.n8543.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n8544" value="${data.n8544.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n8545" value="${data.n8545.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n8546" value="${data.n8546.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n8547" value="${data.n8547.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n8548" value="${data.n8548.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n8549" value="${data.n8549.bonus}"></td>
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
		           			<td>正五大</td>
		           			<td><input type="number" min="0" name="n8550" value="${data.n8550.bonus}"></td>
		           			<td>正五单</td>
		           			<td><input type="number" min="0" name="n8552" value="${data.n8552.bonus}"></td>
		           			<td>正五合单</td>
		           			<td><input type="number" min="0" name="n8554" value="${data.n8554.bonus}"></td>
		           			<td>正五红</td>
		           			<td><input type="number" min="0" name="n8556" value="${data.n8556.bonus}"></td>
		           			<td>正五绿</td>
		           			<td><input type="number" min="0" name="n8558" value="${data.n8558.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>正五小</td>
		           			<td><input type="number" min="0" name="n8551" value="${data.n8551.bonus}"></td>
		           			<td>正五双</td>
		           			<td><input type="number" min="0" name="n8553" value="${data.n8553.bonus}"></td>
		           			<td>正五合双</td>
		           			<td><input type="number" min="0" name="n8555" value="${data.n8555.bonus}"></td>
		           			<td>正五蓝</td>
		           			<td><input type="number" min="0" name="n8557" value="${data.n8557.bonus}"></td>
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