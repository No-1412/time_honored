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
                                            	<input type="button" class="btn btn-sm btn-primary edit_link"
                                            		   data-title="分类选择"
                                            		   data-height="300px"
                                            		   data-width="600px;"
                                            		   data-url="member/recharge/verifyChoice"
                                            		   value="分类选择"></span>
                                            	&nbsp;
                                                <input type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                                <input id="back_refresh" type="hidden" class="btn btn-sm btn-primary" value="后台刷新"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>编号/时间</th>
                                    <th>会员</th>
                                    <th>分层</th>
                                    <th>转账账户/账号</th>
                                    <th>金额</th>
                                    <th>方式/转账时间</th>
                                    <th>总次数</th>
                                    <th>当日次数</th>
                                    <th>收款银行信息</th>
                                    <th>IP</th>
                                    <th width="160">常用操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/recharge/verifyList">
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
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>