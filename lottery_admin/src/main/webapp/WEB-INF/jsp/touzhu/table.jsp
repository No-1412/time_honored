<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2 {
		    width: 15%;
		}
		.col-sm-3 {
		    width: 15%;
		}
		
		.col-sm-a {
		    width: 10%;
		}
	</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
	   <jsp:include page="../common/quickTime.jsp"/>
	   
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">时间类型：</label>
                                        </div>
                                        <div class="col-sm-2 col-sm-a zero_pad_left">
                                        	<select id="dateType" name="dateType" class="form-control1">
	                                        	<option value="1">投注时间</option>
	                                        	<option value="2">开奖时间</option>
	                                        </select>
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">开始时间：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timestart" name="dateFrom" value="${data.date} 00:00:00" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">结束时间：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timeend" name="dateTo" value="${data.date} 23:59:59" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">彩种：</label>
                                        </div>
                                        <div class="col-sm-2 col-sm-a zero_pad_left">
                                        	<select id="lottery" name="lotteryType" class="form-control1">
                                            	<option value="">全部</option>
	                                        	<c:forEach var="item" items="${data.lotteryTypeList}">
	                                        	<option value="${item.num}">${item.name}</option>
	                                            </c:forEach>
	                                        </select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">状态：</label>
                                        </div>
                                        <div class="col-sm-2 col-sm-a zero_pad_left">
                                        	<select id="status" name="status" class="form-control1">
                                            	<option value="">全部</option>
	                                        	<option value="1">已结算</option>
	                                        	<option value="0">未结算</option>
	                                        	<option value="-1">已取消</option>
	                                        </select>
                                        </div>
                                        <div class="col-sm-2 col-sm-a zero_pad_left">
                                        	<select id="sort" name="sort" class="form-control1">
                                            	<option value=""></option>
	                                        	<option value="1">下注金额</option>
	                                        	<option value="2">净利润</option>
	                                        </select>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员类型：</label>
                                        </div>
                                        <div class="col-sm-2 col-sm-a zero_pad_left">
                                        	<select id="memberType" name="memberType" class="form-control1">
	                                        	<option value="0">会员</option>
	                                        	<option value="2">试玩账号</option>
	                                        </select>
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input id="memberCode" type="text" name="memberCode" class="input-sm form-control">
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">下注期数：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input id="period" type="text" name="period" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">单号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input id="orderNo" type="text" name="orderNo" class="input-sm form-control">
                                        </div>
                                        
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>&nbsp;
                                                <input id="export_btn" type="button" class="btn btn-sm btn-primary" value="导出">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>期数</th>
                                    <th>单号</th>
                                    <th>下注时间</th>
                                    <th>会员ID</th>
                                    <th>会员账号</th>
                                    <th>彩种</th>
                                    <th>开奖时间</th>
                                    <th>玩法</th>
                                    <th>下注金额</th>
                                    <th>净利润</th>
                                    <th>返水额</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/lotteryTouzhu/getList">
								 <tr>
				                     <td colspan="11"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="is_load" value="0">
    <iframe id="export_frame" src="" style="display: none;"></iframe>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
	requirejs(['jquery', 'tablePage','layer'], function($, tablePage,layer) {
		$('#export_btn').on('click', function() {
			var index = layer.load();
			var dateType = $('#dateType').val();
			var dateFrom = $('#timestart').val();
			var dateTo = $('#timeend').val();
			var lotteryType = $('#lottery').val();
			var status = $('#status').val();
			var sort = $('#sort').val();
			var memberType = $('#memberType').val();
			var memberCode = $('#memberCode').val();
			var period = $('#period').val();
			var orderNo = $('#orderNo').val();
			$.ajax({
                url: 'system/lotteryTouzhu/exportCount',
                type: "post",
                data: {
                	dateType : dateType,
                	dateFrom : dateFrom,
                	dateTo: dateTo,
                	lotteryType: lotteryType,
                	period: period,
                	status: status,
                	orderNo: orderNo,
                	memberCode: memberCode,
                	memberType: memberType,
                	sort: sort
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
               		$('#export_frame').attr("src", "system/lotteryTouzhu/export?dateType="+dateType+"&dateFrom="+dateFrom+"&dateTo="+dateTo+"&lotteryType="+lotteryType+"&period="+period+"&status="+status+"&orderNo="+orderNo+"&memberCode="+memberCode+"&memberType="+memberType+"&sort="+sort);
                } else {
                    layer.msg(results.description, {
                        icon: 2,
                        time: 2000
                    });
                }
            });
		})
	})
	</script>
</body>
</html>