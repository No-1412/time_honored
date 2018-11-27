<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="checkin" items="${data.items}">
	    <tr>
	        <td>${checkin.memberCode}</td>
	        <td>${checkin.checkinDay}</td>
	        <td>${checkin.recharge}</td>
	        <td>${checkin.giftAmount}</td>
         	<td><fmt:formatDate value="${checkin.checkinTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="5"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="5"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>