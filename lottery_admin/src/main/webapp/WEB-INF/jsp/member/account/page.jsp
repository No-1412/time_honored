<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="account" items="${data.items}">
	    <tr>
	    	<td>${account.expand.memberName}</td>
	        <td>${account.amount}</td>
	        <td>${account.amountAfter}</td>
	        <td>${account.expand.type}</td>
	        <td>${account.remark}</td>
         	<td><fmt:formatDate value="${account.opsTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>${account.opsBy}</td>
         	<td>${account.orderNo}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="8"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="8"><b style="margin-top: 10px;float: left;">总计：${data.params}</b><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>