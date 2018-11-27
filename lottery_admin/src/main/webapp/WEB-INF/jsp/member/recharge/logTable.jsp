<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
	   <jsp:include page="../../common/quickTime.jsp"/>
	   
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
                                        <div class="col-sm-2 zero_pad_left">
                                            <select id="dateType" name="dateType" class="form-control1">
                                            	<option value="1">入款时间</option>
                                            	<option value="2">审核时间</option>
                                            </select>
                                        </div>
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
                                        
                                     </div>
                                     <div class="row">
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="memberCode" name="memberCode" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">代理账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="agentCode" name="agentCode" class="input-sm form-control">
                                        </div>
                                        
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">&nbsp;&nbsp;&nbsp;&nbsp;审核者：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="verifyUser" name="verifyUser" class="input-sm form-control">
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <select id="saveType" name="saveType" class="form-control1">
                                            	<option value="">全部</option>
                                            	<option value="11">微信</option>
                                            	<option value="12">支付宝</option>
                                            	<option value="1">网银转账</option>
                                            	<option value="2">ATM自动柜员机</option>
                                            	<option value="3">ATM现金入款</option>
                                            	<option value="4">银行柜台</option>
                                            	<option value="5">手机银行</option>
                                            	<option value="10">其它</option>
                                            </select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">审核结果：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <select id="status" name="status" class="form-control1">
                                            	<option value="">全部</option>
                                            	<option value="1">通过</option>
                                            	<option value="-1">不通过</option>
                                            </select>
                                        </div>
                                        
                                        <div class="col-sm-3">
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
                                	<th>编号/时间</th>
                                    <th>会员</th>
                                    <th>代理</th>
                                    <th>分层</th>
                                    <th>转账账户/账号</th>
                                    <th>金额</th>
                                    <th>方式/时间</th>
                                    <th>总次数</th>
                                    <th>当日次数</th>
                                    <th>收款银行信息</th>
                                    <th>结果</th>
                                    <th>优惠</th>
                                    <th>彩金</th>
                                    <th>打码量</th>
                                    <th>审核者/时间</th>
                                    <th>备注</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/recharge/verifyLogList">
								 <tr>
				                     <td colspan="16"><div class="not-data">数据加载中...</div></td>
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
			var dateType = $('#dateType').val();
			var timestart = $('#timestart').val();
			var timeend = $('#timeend').val();
			var saveType = $('#saveType').val();
			var memberCode = $('#memberCode').val();
			var agentCode = $('#agentCode').val();
			var status = $('#status').val();
			var verifyUser = $('#verifyUser').val();
			$.ajax({
                url: 'system/recharge/verifyLog/exportCount',
                type: "post",
                data: {
                	dateType : dateType,
                	dateStart : timestart,
                	dateEnd : timeend,
                	saveType : saveType,
                	memberCode: memberCode,
                	agentCode :agentCode,
                	status: status,
                	verifyUser:verifyUser
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
               		$('#export_frame').attr("src", "system/recharge/verifyLog/export?dateStart="+timestart+"&dateEnd="+timeend+"&dateType="+dateType+"&saveType="+saveType+"&memberCode="+memberCode+"&agentCode="+agentCode+"&status="+status+"&verifyUser="+verifyUser);
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