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
			               	<td><input class="quickNumber" type="text" name="n7101" value="${data.n7101.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n7102" value="${data.n7102.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n7103" value="${data.n7103.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n7104" value="${data.n7104.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n7105" value="${data.n7105.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n7106" value="${data.n7106.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n7107" value="${data.n7107.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n7108" value="${data.n7108.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n7109" value="${data.n7109.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n7110" value="${data.n7110.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n7111" value="${data.n7111.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n7112" value="${data.n7112.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n7113" value="${data.n7113.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n7114" value="${data.n7114.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n7115" value="${data.n7115.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n7116" value="${data.n7116.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n7117" value="${data.n7117.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n7118" value="${data.n7118.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n7119" value="${data.n7119.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n7120" value="${data.n7120.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n7121" value="${data.n7121.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n7122" value="${data.n7122.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n7123" value="${data.n7123.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n7124" value="${data.n7124.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n7125" value="${data.n7125.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n7126" value="${data.n7126.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n7127" value="${data.n7127.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n7128" value="${data.n7128.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n7129" value="${data.n7129.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n7130" value="${data.n7130.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n7131" value="${data.n7131.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n7132" value="${data.n7132.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n7133" value="${data.n7133.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n7134" value="${data.n7134.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n7135" value="${data.n7135.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n7136" value="${data.n7136.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n7137" value="${data.n7137.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n7138" value="${data.n7138.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n7139" value="${data.n7139.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n7140" value="${data.n7140.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n7141" value="${data.n7141.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n7142" value="${data.n7142.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n7143" value="${data.n7143.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n7144" value="${data.n7144.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n7145" value="${data.n7145.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n7146" value="${data.n7146.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n7147" value="${data.n7147.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n7148" value="${data.n7148.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n7149" value="${data.n7149.bonus}"></td>
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