<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="online" items="${data.items}">
	    <tr>
	    	<td>${online.num}</td>
	        <td>${online.code}</td>
	        <td>${online.name}</td>
	        <c:if test="${type=='app'}"><th>${online.appType}</th></c:if>
	        <td>${online.logTime} <span style="color:red;">${online.logIp}<a style="margin-left: 5px;" target="_blank" href="http://www.baidu.com/s?wd=${online.logIp}">查</a></span></td>
         	<td><fmt:formatDate value="${online.lastActive}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>${online.onlineTime}</td>
         	<td>${online.logUrl}</td>
         	<td>${online.lastLogTime} <span style="color:red;">${online.lastLogIp}<a style="margin-left: 5px;" target="_blank" href="http://www.baidu.com/s?wd=${online.logIp}">查</a></span></td>
	        <td>
	         	<a class="btn btn-sm btn-info custom_link" data-msg="确定要把会员【${online.name}】下线？" data-data="${online.sessionId}" data-url="member/online/out" href="">剔线</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="${type=='app'?10:9}"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

