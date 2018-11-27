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
			               	<td><input class="quickNumber" type="text" name="n8201" value="${data.n8201.bonus}"></td>
			               	<td>02</td>
			               	<td><input class="quickNumber" type="text" name="n8202" value="${data.n8202.bonus}"></td>
			               	<td>03</td>
			               	<td><input class="quickNumber" type="text" name="n8203" value="${data.n8203.bonus}"></td>
			               	<td>04</td>
			               	<td><input class="quickNumber" type="text" name="n8204" value="${data.n8204.bonus}"></td>
			               	<td>05</td>
			               	<td><input class="quickNumber" type="text" name="n8205" value="${data.n8205.bonus}"></td>
			               	<td>06</td>
			               	<td><input class="quickNumber" type="text" name="n8206" value="${data.n8206.bonus}"></td>
			               	<td>07</td>
			               	<td><input class="quickNumber" type="text" name="n8207" value="${data.n8207.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>08</td>
			               	<td><input class="quickNumber" type="text" name="n8208" value="${data.n8208.bonus}"></td>
			               	<td>09</td>
			               	<td><input class="quickNumber" type="text" name="n8209" value="${data.n8209.bonus}"></td>
			               	<td>10</td>
			               	<td><input class="quickNumber" type="text" name="n8210" value="${data.n8210.bonus}"></td>
			               	<td>11</td>
			               	<td><input class="quickNumber" type="text" name="n8211" value="${data.n8211.bonus}"></td>
			               	<td>12</td>
			               	<td><input class="quickNumber" type="text" name="n8212" value="${data.n8212.bonus}"></td>
			               	<td>13</td>
			               	<td><input class="quickNumber" type="text" name="n8213" value="${data.n8213.bonus}"></td>
			               	<td>14</td>
			               	<td><input class="quickNumber" type="text" name="n8214" value="${data.n8214.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>15</td>
			               	<td><input class="quickNumber" type="text" name="n8215" value="${data.n8215.bonus}"></td>
			               	<td>16</td>
			               	<td><input class="quickNumber" type="text" name="n8216" value="${data.n8216.bonus}"></td>
			               	<td>17</td>
			               	<td><input class="quickNumber" type="text" name="n8217" value="${data.n8217.bonus}"></td>
			               	<td>18</td>
			               	<td><input class="quickNumber" type="text" name="n8218" value="${data.n8218.bonus}"></td>
			               	<td>19</td>
			               	<td><input class="quickNumber" type="text" name="n8219" value="${data.n8219.bonus}"></td>
			               	<td>20</td>
			               	<td><input class="quickNumber" type="text" name="n8220" value="${data.n8220.bonus}"></td>
			               	<td>21</td>
			               	<td><input class="quickNumber" type="text" name="n8221" value="${data.n8221.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>22</td>
			               	<td><input class="quickNumber" type="text" name="n8222" value="${data.n8222.bonus}"></td>
			               	<td>23</td>
			               	<td><input class="quickNumber" type="text" name="n8223" value="${data.n8223.bonus}"></td>
			               	<td>24</td>
			               	<td><input class="quickNumber" type="text" name="n8224" value="${data.n8224.bonus}"></td>
			               	<td>25</td>
			               	<td><input class="quickNumber" type="text" name="n8225" value="${data.n8225.bonus}"></td>
			               	<td>26</td>
			               	<td><input class="quickNumber" type="text" name="n8226" value="${data.n8226.bonus}"></td>
			               	<td>27</td>
			               	<td><input class="quickNumber" type="text" name="n8227" value="${data.n8227.bonus}"></td>
			               	<td>28</td>
			               	<td><input class="quickNumber" type="text" name="n8228" value="${data.n8228.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>29</td>
			               	<td><input class="quickNumber" type="text" name="n8229" value="${data.n8229.bonus}"></td>
			               	<td>30</td>
			               	<td><input class="quickNumber" type="text" name="n8230" value="${data.n8230.bonus}"></td>
			               	<td>31</td>
			               	<td><input class="quickNumber" type="text" name="n8231" value="${data.n8231.bonus}"></td>
			               	<td>32</td>
			               	<td><input class="quickNumber" type="text" name="n8232" value="${data.n8232.bonus}"></td>
			               	<td>33</td>
			               	<td><input class="quickNumber" type="text" name="n8233" value="${data.n8233.bonus}"></td>
			               	<td>34</td>
			               	<td><input class="quickNumber" type="text" name="n8234" value="${data.n8234.bonus}"></td>
			               	<td>35</td>
			               	<td><input class="quickNumber" type="text" name="n8235" value="${data.n8235.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>36</td>
			               	<td><input class="quickNumber" type="text" name="n8236" value="${data.n8236.bonus}"></td>
			               	<td>37</td>
			               	<td><input class="quickNumber" type="text" name="n8237" value="${data.n8237.bonus}"></td>
			               	<td>38</td>
			               	<td><input class="quickNumber" type="text" name="n8238" value="${data.n8238.bonus}"></td>
			               	<td>39</td>
			               	<td><input class="quickNumber" type="text" name="n8239" value="${data.n8239.bonus}"></td>
			               	<td>40</td>
			               	<td><input class="quickNumber" type="text" name="n8240" value="${data.n8240.bonus}"></td>
			               	<td>41</td>
			               	<td><input class="quickNumber" type="text" name="n8241" value="${data.n8241.bonus}"></td>
			               	<td>42</td>
			               	<td><input class="quickNumber" type="text" name="n8242" value="${data.n8242.bonus}"></td>
		               	</tr>
		               	<tr>
			               	<td>43</td>
			               	<td><input class="quickNumber" type="text" name="n8243" value="${data.n8243.bonus}"></td>
			               	<td>44</td>
			               	<td><input class="quickNumber" type="text" name="n8244" value="${data.n8244.bonus}"></td>
			               	<td>45</td>
			               	<td><input class="quickNumber" type="text" name="n8245" value="${data.n8245.bonus}"></td>
			               	<td>46</td>
			               	<td><input class="quickNumber" type="text" name="n8246" value="${data.n8246.bonus}"></td>
			               	<td>47</td>
			               	<td><input class="quickNumber" type="text" name="n8247" value="${data.n8247.bonus}"></td>
			               	<td>48</td>
			               	<td><input class="quickNumber" type="text" name="n8248" value="${data.n8248.bonus}"></td>
			               	<td>49</td>
			               	<td><input class="quickNumber" type="text" name="n8249" value="${data.n8249.bonus}"></td>
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
		           			<td>正二大</td>
		           			<td><input type="number" min="0" name="n8250" value="${data.n8250.bonus}"></td>
		           			<td>正二单</td>
		           			<td><input type="number" min="0" name="n8252" value="${data.n8252.bonus}"></td>
		           			<td>正二合单</td>
		           			<td><input type="number" min="0" name="n8254" value="${data.n8254.bonus}"></td>
		           			<td>正二红</td>
		           			<td><input type="number" min="0" name="n8256" value="${data.n8256.bonus}"></td>
		           			<td>正二绿</td>
		           			<td><input type="number" min="0" name="n8258" value="${data.n8258.bonus}"></td>
		               	</tr>
		               	<tr>
		               		<td>正二小</td>
		           			<td><input type="number" min="0" name="n8251" value="${data.n8251.bonus}"></td>
		           			<td>正二双</td>
		           			<td><input type="number" min="0" name="n8253" value="${data.n8253.bonus}"></td>
		           			<td>正二合双</td>
		           			<td><input type="number" min="0" name="n8255" value="${data.n8255.bonus}"></td>
		           			<td>正二蓝</td>
		           			<td><input type="number" min="0" name="n8257" value="${data.n8257.bonus}"></td>
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