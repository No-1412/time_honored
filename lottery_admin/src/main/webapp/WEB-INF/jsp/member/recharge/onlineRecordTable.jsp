<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2 {width: 12%;}
	</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
	   <jsp:include page="../../common/quickTime.jsp"/>
	   
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content" style="padding:2px;">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">开始日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timestart" name="dateStart" value="${data} 00:00:00" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">结束日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timeend" name="dateEnd" value="${data} 23:59:59" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">&nbsp;&nbsp;&nbsp; 状态：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <select id="status" class="form-control1" name="status">
                                            	<option value="" label="全部"/>
	                                       		<option value="1" label="已存入" selected />
	                                       		<option value="0" label="待审核" />
	                                       		<option value="-1" label="已取消" />
	                                       	</select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">类型：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="margin-top: 5px;width:250px;">
                                            <input id="type_1" type="checkbox" name="type" value="11" checked><label>微信</label>
                                            <input id="type_2" type="checkbox" name="type" value="21" checked><label>支付宝</label>
                                            <input id="type_4" type="checkbox" name="type" value="71" checked><label>QQ钱包</label>
                                            <input id="type_3" type="checkbox" name="type" value="41" checked><label>网银</label>
                                            <input id="type_5" type="checkbox" name="type" value="81" checked><label>其它</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">商务编号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <div class="input-group">
	                                            <input id="code" type="text" name="code"  class="input-sm form-control" >
                                            </div>
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <div class="input-group">
	                                            <input id="memberCode" type="text" name="memberCode" class="input-sm form-control" >
                                            </div>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">订单号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <div class="input-group">
	                                            <input id="orderNo" type="text" name="orderNo" class="input-sm form-control" >
                                            </div>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">交易号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <div class="input-group">
	                                            <input id="tradeNo" type="text" name="tradeNo" class="input-sm form-control" >
                                            </div>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">审核人：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <div class="input-group">
	                                            <input id="tradeNo" type="text" name="verifyUser" class="input-sm form-control" >
                                            </div>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <div class="input-group">
	                                            <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
	                                            &nbsp;<input id="export_btn" type="button" class="btn btn-sm btn-primary" value="导出">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>订单号</th>
                                    <th>会员</th>
                                    <th>层级</th>
                                    <th>金额</th>
                                    <th>方式</th>
                                    <th>商务编号</th>
                                    <th>提交时间</th>
                                    <th>审核人</th>
                                    <th width="100">状态</th>
                                    <th>支付时间</th>
                                    <th>银行</th>
                                    <th width="125">交易号</th>
                                    <th width="100">IP</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/recharge/onlineRecordList">
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
    <iframe id="export_frame" src="" style="display: none;"></iframe>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
	requirejs(['jquery', 'tablePage','layer'], function($, tablePage,layer) {
		$('#export_btn').on('click', function() {
			var index = layer.load();
			var timestart = $('#timestart').val();
			var timeend = $('#timeend').val();
			var code = $('#code').val();
			var memberCode = $('#memberCode').val();
			var orderNo = $('#orderNo').val();
			var tradeNo = $('#tradeNo').val();
			var status = $('#status').val();
			var type = '';
			if($('#type_1').attr("checked")) type += ',11';
			if($('#type_2').attr("checked")) type += ',21';
			if($('#type_3').attr("checked")) type += ',41';
			if($('#type_4').attr("checked")) type += ',71';
			if($('#type_5').attr("checked")) type += ',81';
			$.ajax({
                url: 'system/recharge/exportCount',
                type: "post",
                data: {
                	dateStart : timestart,
                	dateEnd : timeend,
                	code : code,
                	memberCode: memberCode,
                	status: status,
                	type: type,
                	tradeNo: tradeNo,
                	orderNo: orderNo
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
               		$('#export_frame').attr("src", "system/recharge/export?dateStart="+timestart+"&dateEnd="+timeend+"&code="+code+"&memberCode="+memberCode+"&orderNo="+orderNo+"&tradeNo="+tradeNo+"&status="+status+"&type="+type);
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