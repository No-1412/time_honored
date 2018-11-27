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
			               	<td><input class="quickNumber" type="text" name="n8101" value="${data.n8101.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n8102" value="${data.n8102.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n8103" value="${data.n8103.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n8104" value="${data.n8104.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n8105" value="${data.n8105.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n8106" value="${data.n8106.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n8107" value="${data.n8107.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n8108" value="${data.n8108.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n8109" value="${data.n8109.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n8110" value="${data.n8110.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n8111" value="${data.n8111.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n8112" value="${data.n8112.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n8113" value="${data.n8113.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n8114" value="${data.n8114.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n8115" value="${data.n8115.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n8116" value="${data.n8116.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n8117" value="${data.n8117.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n8118" value="${data.n8118.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n8119" value="${data.n8119.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n8120" value="${data.n8120.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n8121" value="${data.n8121.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n8122" value="${data.n8122.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n8123" value="${data.n8123.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n8124" value="${data.n8124.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n8125" value="${data.n8125.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n8126" value="${data.n8126.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n8127" value="${data.n8127.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n8128" value="${data.n8128.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n8129" value="${data.n8129.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n8130" value="${data.n8130.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n8131" value="${data.n8131.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n8132" value="${data.n8132.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n8133" value="${data.n8133.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n8134" value="${data.n8134.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n8135" value="${data.n8135.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n8136" value="${data.n8136.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n8137" value="${data.n8137.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n8138" value="${data.n8138.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n8139" value="${data.n8139.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n8140" value="${data.n8140.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n8141" value="${data.n8141.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n8142" value="${data.n8142.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n8143" value="${data.n8143.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n8144" value="${data.n8144.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n8145" value="${data.n8145.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n8146" value="${data.n8146.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n8147" value="${data.n8147.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n8148" value="${data.n8148.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n8149" value="${data.n8149.bonus}"></td>
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
		           			<td>正一大</td>
		           			<td><input type="number" min="0" name="n8150" value="${data.n8150.bonus}"></td>
		           			<td>正一单</td>
		           			<td><input type="number" min="0" name="n8152" value="${data.n8152.bonus}"></td>
		           			<td>正一合单</td>
		           			<td><input type="number" min="0" name="n8154" value="${data.n8154.bonus}"></td>
		           			<td>正一红</td>
		           			<td><input type="number" min="0" name="n8156" value="${data.n8156.bonus}"></td>
		           			<td>正一绿</td>
		           			<td><input type="number" min="0" name="n8158" value="${data.n8158.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>正一小</td>
		           			<td><input type="number" min="0" name="n8151" value="${data.n8151.bonus}"></td>
		           			<td>正一双</td>
		           			<td><input type="number" min="0" name="n8153" value="${data.n8153.bonus}"></td>
		           			<td>正一合双</td>
		           			<td><input type="number" min="0" name="n8155" value="${data.n8155.bonus}"></td>
		           			<td>正一蓝</td>
		           			<td><input type="number" min="0" name="n8157" value="${data.n8157.bonus}"></td>
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