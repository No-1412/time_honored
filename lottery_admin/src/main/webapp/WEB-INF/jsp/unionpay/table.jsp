<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                            	<form action="" id="tableForm">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="input-group">
	                                            <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="unionpay/edit"></span>
		                                     	&nbsp;
                                                <input id="refresh_btn_1" type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>商户号</th>
                                    <th>类型</th>
                                    <th>下发人</th>
                                    <th>下发金额</th>
                                    <th>下发状态</th>
                                    <th>下发时间</th>
                                    <th width="150">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="unionpay/getList">
								 <tr>
				                     <td colspan="8"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
	                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
		requirejs(["jquery", 'layer'],function($, layer){
			$(document).on("click", "a.refresh_btn", function(e) {
				e.preventDefault();
			 	$.ajax({
		             url: 'unionpay/refresh',
		             type: "post",
		             data: {
		          	  	id: $(this).attr("data-id"),
		             }
		         }).done(function(results) {
		            if(results.status == "200") {
		         	 	layer.msg("刷新成功", {
		                   icon: 1,
		                   time: 1000
		               }, function() {
		                  $('#refresh_btn_1').click();
		               });
		            } else {
		               layer.msg(results.description, {
		                   icon: 2,
		                   time: 3000
		               });
		            }
		         })
			})
		});
	</script>
</body>
</html>