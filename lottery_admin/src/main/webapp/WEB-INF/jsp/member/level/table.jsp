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
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                            	<form action="" id="tableForm">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="system/memberLevel/edit"></span>
                                                &nbsp;
                                                <input type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                                &nbsp;
                                                <input type="button" class="btn btn-sm btn-primary edit_link"
                                            		   data-height="160px"
                                            		   data-width="450px;"
                                            		   data-title="分层管理"
                                            		   data-url="system/memberLevel/adjust" value="分层管理">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>层级</th>
                                    <th>层级名称</th>
                                    <th>备注</th>
                                    <th>微信</th>
                                    <th>支付宝</th>
                                    <th>QQ钱包</th>
                                    <th>银行</th>
                                    <th>第三方</th>
                                    <th>其它</th>
                                    <th>充值次数/总充值金额</th>
                                    <th>修改时间</th>
                                    <th width="150">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/memberLevel/getList">
								 <tr>
				                     <td colspan="12"><div class="not-data">数据加载中...</div></td>
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
		requirejs(['jquery', 'tablePage','layer', "quickTime"], function($, tablePage,layer) {
			$('#adjust_level').on('click', function() {
				
			})
		})
	</script>
</body>
</html>