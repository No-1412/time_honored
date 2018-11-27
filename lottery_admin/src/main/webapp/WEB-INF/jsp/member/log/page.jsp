s<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.page.items != null}">
	<c:forEach var="loginLog" items="${data.page.items}">
	    <tr>
	    	<td>${data.memberName}</td>
	        <td>${loginLog.logIp}<a style="margin-left: 5px;" target="_blank" href="http://www.baidu.com/s?wd=${loginLog.logIp}">查</a></td>
         	<td><fmt:formatDate value="${loginLog.logTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>${loginLog.logUrl}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.page.items == null}">
	<tr>
		<td colspan="4"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="4"><div id="pages" data-page="${data.page.pageNo-1}" data-total="${data.page.totalSize}" data-epage="${data.page.pageSize}"></div></td>
</tr>