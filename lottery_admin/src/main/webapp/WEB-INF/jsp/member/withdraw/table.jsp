<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content" style="padding-top: 2px;padding-left: 2px;padding-right: 2px;">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                        			<c:if test="${data.isOpen}">
                        			<div class="row">
                                    	<div class="col-lbl-1" style="width: 80px;">
                                    		<label class="col-lbl-left">第三方：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select id="third_id" class="form-control1" name="exportType">
	                                       		<option value="" label="请选择" />
	                                       		<c:forEach var="third" items="${data.thirdList}">
	                                       			<option value="${third.type}" label="${third.name}" />
                                    			</c:forEach>
	                                       	</select>
                                        </div>
                                        <div class="col-sm-3" style="width: 20%;">
                                            <div class="input-group">
                                            	<input id="view_balance_btn" type="button" class="btn btn-sm btn-primary" value="查看余额">&nbsp;
                                            	<input id="update_status_btn" type="button" class="btn btn-sm btn-primary" value="更新出款状态">&nbsp;
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">操作人：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                           <input type="text" id="verifyUser" name="verifyUser" class="input-sm form-control">    
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-lbl-1" style="width: 80px;">
                                    		<label class="col-lbl-left">金 &nbsp;&nbsp;&nbsp;额：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
                                            <input id="amountFrom" type="number" value="${data.moneyFrom}" class="input-sm form-control">
                                            <input id="amountFromHidden" type="hidden" name="amountFrom">
                                            <input id="is_batch_auto_withdraw" type="hidden" name="isBatch">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">--&nbsp;</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
                                            <input id="amountTo" type="number" value="${data.moneyTo}" class="input-sm form-control">
                                            <input id="amountToHidden" type="hidden" name="amountTo">
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select id="exportType" class="form-control1" name="exportType">
	                                       		<option value="1" label="民生银行" />
	                                       		<option value="2" label="招商银行" />
	                                       	</select>
                                        </div>
                                        <div class="col-sm-3" style="width: 20%;">
                                            <div class="input-group">
                                            	<input id="search_btn" type="button" class="btn btn-sm btn-primary" value="查找">&nbsp;
                                            	<input id="export_btn" type="button" class="btn btn-sm btn-primary" value="导出">&nbsp;
                                            	<input id="refresh_btn" type="submit" class="btn btn-sm btn-primary" value="刷新">&nbsp;
                                                <input id="back_refresh" type="hidden" class="btn btn-sm btn-primary" value="后台刷新">
                                            </div>
                                        </div>
                                        <div class="col-sm-3" style="float: right;width: 17%;">
                                            <div class="input-group">
                                            	<input type="button" class="btn btn-sm btn-primary edit_link"
                                            		   data-height="220px"
                                            		   data-width="600px;"
                                            		   data-title="分层选择"
                                            		   data-url="member/withdraw/verifyChoice" value="分层选择">
                                            	&nbsp;
                                            	<input type="button" class="btn btn-sm btn-primary edit_link"
                                            		   data-height="170px"
                                            		   data-width="450px;"
                                            		   data-title="默认金额设置"
                                            		   data-url="member/withdraw/defaultMoney" value="默认金额">
                                           	</div>
                                        </div>
                                    </div>
                                    <div class="row" style="padding-left: 15px;color: red;font-size: 12px;">
                                    要导出前请先点击查找按钮，导出只针对当前页面显示的未审核提款记录；要查看所有待审核提款，请点击刷新按钮
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>编号/时间</th>
                                    <th>账户</th>
                                    <th>真名</th>
                                    <th>分层</th>
                                    <th>代理</th>
                                    <th>开户行/账号</th>
                                    <th>金额</th>
                                    <th>总次数</th>
                                    <th width="70">当日次数</th>
                                    <th width="160">快捷查询</th>
                                    <th width="160">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/withdraw/verifyList">
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
	requirejs(['jquery', 'tablePage','layer', "quickTime"], function($, tablePage,layer) {
		$('#view_balance_btn').on('click', function() {
			var index = layer.load();
			$.ajax({
                url: 'system/withdraw/viewBalance',
                type: "post",
                data: {
                	id: $('#third_id').val()
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
                	layer.open({
    				    content: '账号余额：' + results.data,
    				    btn: ['确定'],
    		            yes: function(index) {
    		            	layer.close(index);
    		            }
    				}); 
                } else {
                    layer.msg(results.description, {
                        icon: 2,
                        time: 2000
                    });
                }
            });
		}),
		
		$('#update_status_btn').on('click', function() {
			var index = layer.load();
			$.ajax({
                url: 'system/withdraw/updateStatus',
                type: "post",
                data: {
                	id: $('#third_id').val()
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
                	layer.msg("更新成功", {
                        icon: 1,
                        time: 1000
                    }, function() {
                 	   	is_hand = 0;
 	               		$("#tableForm").find("input[type=submit]").click();
 	               		is_hand = 1;
                    });
                } else {
                    layer.msg(results.description, {
                        icon: 2,
                        time: 2000
                    });
                }
            });
		}),
		$('#export_btn').on('click', function() {
			var index = layer.load();
			var amountFrom = $('#amountFrom').val();
			var amountTo = $('#amountTo').val();
			var exportType = $('#exportType').val()
			$.ajax({
                url: 'system/withdraw/exportCount',
                type: "post",
                data: {
                    amountFrom : amountFrom,
                    amountTo : amountTo,
                    exportType : exportType,
                    fileType: 'txt'
                }
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
                	if(results.data == 1) {
                    	layer.msg("没有需要导出的数据，请先点击查找按钮！", {icon: 1, time: 2000});
                	} else if(results.data == 2) {
                    	layer.msg("导出银行模板不存在！", {icon: 1, time: 2000});
                	} else {
                		$('#export_frame').attr("src", "system/withdraw/exportTxt?exportType="+exportType+"&amountFrom="+amountFrom+"&amountTo="+amountTo);
                	}
                } else {
                    layer.msg(results.description, {
                        icon: 2,
                        time: 2000
                    });
                }
            });
		}),
		
		$('#search_btn').on('click', function() {
			$('#amountFromHidden').val($('#amountFrom').val());
			$('#amountToHidden').val($('#amountTo').val());
			$('#is_batch_auto_withdraw').val(2);
			
			$('#refresh_btn').trigger('click');
			
			$('#amountFromHidden').val('');
			$('#amountToHidden').val('');
			$('#is_batch_auto_withdraw').val(0);
		}),
		
		$('#auto_batch_btn').on('click', function() {
			var index = layer.load();
			$.ajax({
                url: 'system/withdraw/batchAuto',
                type: "post",
                data: {}
            }).done(function(results) {
            	layer.close(index);
                if(results.status == "200") {
                	if(results.data == 0) {
                    	layer.msg("没有需要出款的数据，请先点击查找按钮！", {icon: 1, time: 2000});
                	} else if(results.data == 1) {
                		layer.msg("提交成功！", {icon: 1, time: 2000}, function() {
                			$('#is_batch_auto_withdraw').val(1);
	                		$('#refresh_btn').trigger('click');
	            			$('#is_batch_auto_withdraw').val(0);
                		});
                	} else {
                		layer.open({
        				    content: results.data,
        				    btn: ['确定'],
        				    success: function(elem){
        				    	$(".layui-layer-content").css({'height':"350px"});
        	                    $(".layui-layer-dialog").css({"width":"470px"});  
        	                },
        		            yes: function(index) {
        		            	layer.close(index);
        		            	
        		            	$('#is_batch_auto_withdraw').val(1);
    	                		$('#refresh_btn').trigger('click');
    	            			$('#is_batch_auto_withdraw').val(0);
        		            }
        				}); 
                	}
                } else {
                    layer.msg(results.description, {
                        icon: 2,
                        time: 2000
                    });
                }
            });
		}),
		
		$(document).on("click", "a.third_withdraw", function(e) {
	       e.preventDefault();
    	   var index = layer.load();
    	   $.ajax({
               url: $(this).attr("data-url"),
               type: "post",
               data: {
            	   id: $(this).attr("data-id"),
                   thirdId: $('#third_id').val()
               }
           }).done(function(results) {
        	   layer.close(index);
               if(results.status == "200") {
                   layer.msg("提交成功", {
                       icon: 1,
                       time: 1000
                   }, function() {
                	   	is_hand = 0;
	               		$("#tableForm").find("input[type=submit]").click();
	               		is_hand = 1;
                   });
               } else {
            	   layer.open({
	   				    content: results.description,
	   				    btn: ['确定'],
	   		            yes: function(index) {
	   		            	layer.close(index);
	   		            	is_hand = 0;
		               		$("#tableForm").find("input[type=submit]").click();
		               		is_hand = 1;
	   		            }
	   			   }); 
               }
           });
	   });
	})
	</script>
</body>
</html>