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
                                    		<label class="col-lbl-left">审核结果：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width:100px;">
                                            <select id="status" name="status" class="form-control1">
                                            	<option value="">全部</option>
                                            	<option value="1">通过</option>
                                            	<option value="-1">不通过</option>
                                            </select>
                                        </div>
                                        
                                        
                                    </div>
                                    
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">&nbsp;&nbsp;&nbsp;&nbsp;审核人：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                           <input type="text" id="verifyUser" name="verifyUser" class="input-sm form-control">    
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                         <div class="col-sm-2 zero_pad_left">
                                           <input id="memberCode"  type="text" name="memberCode" class="input-sm form-control" >
                                        </div>
                                        <div class="col-sm-3 zero_pad_left">
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
                                    <th>账户/姓名</th>
                                    <th>开户行/账号</th>
                                    <th>分层</th>
                                    <th>金额</th>
                                    <th>代理商</th>
                                    <th>总次数</th>
                                    <th>当日次数</th>
                                    <th>结果</th>
                                    <th>审核人/时间</th>
                                    <th>手续费/行政费</th>
                                    <th>出款额</th>
                                    <th>备注</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/withdraw/verifyLogList">
								 <tr>
				                     <td colspan="13"><div class="not-data">数据加载中...</div></td>
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
			var status = $('#status').val();
			var verifyUser = $('#verifyUser').val();
			var memberCode = $('#memberCode').val();
			
			$.ajax({
                url: 'system/withdraw/verifyLog/exportCount',
                type: "post",
                data: {
                	dateStart : timestart,
                	dateEnd : timeend,
                	status: status,
                	verifyUser:verifyUser,
                	memberCode: memberCode
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
               		$('#export_frame').attr("src", "system/withdraw/verifyLog/export?dateStart="+timestart+"&dateEnd="+timeend+"&memberCode="+memberCode+"&status="+status+"&verifyUser="+verifyUser);
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