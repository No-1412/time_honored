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
                                                <input type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th style="text-align:center;">-</th>
                                    <th>账号</th>
                                    <th>姓名</th>
                                    <c:if test="${data=='app'}"><th>设备</th></c:if>
                                    <th>本次登录时间/IP</th>
                                    <th>最后活跃时间</th>
                                    <th>在线时间</th>
                                    <th>所在网址</th>
                                    <th>上次登录时间/IP</th>
                                    <th width="60">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="member/online/${data}/getList">
								 <tr>
				                     <td colspan="${data=='app'?10:9}"><div class="not-data">数据加载中...</div></td>
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