<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<link href="assets/css/first.css" rel="stylesheet">
	<style>
		.total-table{
			width:100%;
			text-align:center;
			margin-top:20px;
			font-size:14px;
		}
		
	</style>
</head>

<body class="gray-bg">
	<div class="page">
		<div class="wrapper fn-clear">
			<div class="count mt30 b-none">
				<div class="count-con">
					<div class="count-tit">
						<i class="iconfont">&#xe604;</i>
						<span class="title-con">待办事项</span>
						<input type="button" id="refresh" style="margin-left: 20px;" value="刷新">
					</div>
					<dl class="static fn-clear">
						<dd>充值待审核：<em id="recharage_count"></em><a id="recharge_verify" class="text-info ml20" href="javascript:;">查看</a></dd>
						<dd>提现待审核：<em id="withdraw_count"></em><a id="withdraw_verify" class="text-info ml20" href="javascript:;">查看</a></dd>
					</dl>
					
					<!-- <div class="count-tit">
	                    <i class="iconfont">&#xe604;</i>
	                    <span class="title-con">平台统计</span>
               	 	</div>
                	<dl class="static fn-clear">
                		<dd>充值总金额：<em id="recharge_amount"></em>元</dd>
                		<dd>提现总金额：<em id="withdraw_amount"></em>元</dd>
                		<dd>投注总金额：<em id="touzhu_amount"></em>元</dd>
                		<dd>中奖总金额：<em id="win_amount"></em>元</dd>
                		<dd>返还总金额：<em id="return_amount"></em>元</dd>
                	</dl> -->
                	
                	<div class="count-tit">
	                    <i class="iconfont">&#xe604;</i>
	                    <span class="title-con">近10天下注会员统计</span>
                	</div>
                	<table class="total-table">
	                	<tr>
	                		<th width="70" style="text-align: center;">今天</th>
	                		<th width="70" style="text-align: center;">昨天</th>
	                		<th width="70" style="text-align: center;">前天</th>
	                		<c:forEach var="day" items="${data}"><th width="100">${day}</th></c:forEach>
	                		<th></th>
	                	</tr>
	                	<tr>
	                		<td id="tz_members_0"></td>
	                		<td id="tz_members_1"></td>
	                		<td id="tz_members_2"></td>
	                		<td id="tz_members_3"></td>
	                		<td id="tz_members_4"></td>
	                		<td id="tz_members_5"></td>
	                		<td id="tz_members_6"></td>
	                		<td id="tz_members_7"></td>
	                		<td id="tz_members_8"></td>
	                		<td id="tz_members_9"></td>
	                	</tr>
                	</table>
					
                	<div class="count-tit" style="margin-top: 30px;">
	                    <i class="iconfont">&#xe604;</i>
	                    <span class="title-con">用户统计</span>
                	</div>
                	<table class="total-table" style="width: 70%;">
	                	<tr>
	                		<th style="text-align: center;">用户总数</th>
	                		<th style="text-align: center;">代理人数</th>
	                		<th style="text-align: center;">会员人数</th>
	                		<th style="text-align: center;">今日注册会员</th>
<!-- 	                		<th>今日投注总额</th> -->
<!-- 	                		<th>今日中奖总额</th> -->
<!-- 	                		<th>今日充值总额</th> -->
<!-- 	                		<th>今日提现总额</th> -->
	                		<th style="text-align: center;">当前在线人数</th>
	                		<th style="text-align: center;">用户总余额</th>
	                	</tr>
	                	<tr>
	                		<td id="user_count"></td>
	                		<td id="user_proxy"></td>
	                		<td id="user_member"></td>
	                		<td id="user_new_member" style="color: red;"></td>
<!-- 	                		<td id="user_touzhu_amount"></td> -->
<!-- 	                		<td id="user_win_amount"></td> -->
<!-- 	                		<td id="user_recharge_amount"></td> -->
<!-- 	                		<td id="user_withdraw_amount"></td> -->
	                		<td id="user_online"></td>
	                		<td id="user_balance"></td>
	                	</tr>
                	</table>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/first"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>