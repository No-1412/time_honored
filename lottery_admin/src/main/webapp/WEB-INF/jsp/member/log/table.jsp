<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="row clearfix">
       <div class="col-sm-12">
           <div class="ibox float-e-margins">
               <div class="ibox-content">
                   <table class="table table-bordered table-condensed">
                       	<form action="" id="tableForm">
                       		<input type="hidden" name="memberId" value="${data}">
                       	</form>
                       
                       <thead>
                           <tr>
                               <th>账号</th>
                               <th>IP/属地</th>
                               <th>登录时间</th>
                               <th>域名</th>
                           </tr>
                       </thead>
                       
                       <tbody id="tableId" url="system/member/getLoginLogList">
						 <tr>
		                    <td colspan="4"><div class="not-data">数据加载中...</div></td>
		                 </tr>
                    </tbody>
                   </table>
               </div>
           </div>
       </div>
    </div>
        
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>