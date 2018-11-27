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
                                    		<label class="col-lbl-left">类&nbsp;&nbsp;&nbsp;&nbsp;型：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                           <select class="form-control1" id="ty" name="type" >
                                           		<option value="" label="所有" />
	                                       		<option value="1" label="存款" />
	                                       		<option value="2" label="扣款" />
	                                       		<option value="3" label="彩金" />
	                                       		<option value="10" label="默认存款" />
	                                       		<option value="11" label="微信存款" />
	                                       		<c:forEach var="item" items="${wechatNumList}">
	                                       		<option value="${item}" label="微信${item-29}存款" />
	                                       		</c:forEach>
	                                       		<option value="12" label="支付宝存款" />
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
                                    		<label class="col-lbl-left">操作者：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="vuser" name="verifyUser" class="input-sm form-control">
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="mcode" name="memberCode" class="input-sm form-control">
                                        </div>
                                    	<div class="col-sm-4" style="width: 40%">
                                            <div class="input-group">
                                            	<input type="submit" class="btn btn-sm btn-primary" value="查找">&nbsp;
                                            	<a class="btn btn-sm btn-info edit_link"
									        	   data-id=""
									        	   data-width="850px"
									        	   data-title="手动存款"
									        	   data-url="system/member/handRecharge" href="">手动存款</a>&nbsp;
                                                <a class="btn btn-sm btn-info edit_link"
									        	   data-id=""
									        	   data-title="手动扣款"
									        	   data-url="system/member/handWithdraw" href="">手动扣款</a>&nbsp;
									        	<a class="btn btn-sm btn-info edit_link"
									        	   data-id=""
									        	   data-title="独立赠送彩金"
									        	   data-url="system/member/handGift" href="">独立赠送彩金</a>&nbsp;
									        	<a id="dc" class="btn btn-sm btn-info">导出</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>会员</th>
                                    <th>金额</th>
                                    <th>类型</th>
                                    <th>备注</th>
                                    <th>时间</th>
                                    <th>操作者</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="account/hand/getList">
								 <tr>
				                     <td colspan="7"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
	                        <iframe id="export_frame" src="" style="display: none;"></iframe>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
	requirejs(['jquery', 'tablePage','layer'], function($, tablePage,layer) {
		$('#dc').on('click', function() {
			var index = layer.load();
			var type = $('#ty').val();
			var dateStart = $('#timestart').val();
			var dateEnd = $('#timeend').val();
			var verifyUser = $('#vuser').val();
			var memberCode = $('#mcode').val();
			$.ajax({
                url: 'account/hand/handExportCount',
                type: "post",
                data: {
                	dateStart : dateStart,
                	dateEnd : dateEnd,
                	verifyUser: verifyUser,
                	memberCode: memberCode,
                	type:type
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
               		$('#export_frame').attr("src", "account/hand/handExport?dateStart="+dateStart+"&dateEnd="+dateEnd+"&verifyUser="+verifyUser+"&memberCode="+memberCode+"&type="+type);
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