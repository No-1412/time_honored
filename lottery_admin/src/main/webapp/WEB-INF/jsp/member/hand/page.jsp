<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="member" items="${data.items}">
	    <tr>
	    	<td>${member.orderNo}</td>
	        <td>${member.memberCode}</td>
	        <td>${member.amount}</td>
	        <c:choose>
	        	<c:when test="${member.type==2}"><td>扣款</td></c:when>
	        	<c:when test="${member.type==3}"><td>彩金</td></c:when>
	        	<c:when test="${member.type==11}"><td>微信存款</td></c:when>
	        	<c:when test="${member.type>=31 and member.type<=39}"><td>微信${member.type-29}存款</td></c:when>
	        	<c:when test="${member.type==12}"><td>支付宝存款</td></c:when>
	        	<c:otherwise><td>存款</td></c:otherwise>
	        </c:choose>
         	<td>${member.remark}</td>
         	<td><fmt:formatDate value="${member.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>${member.verifyUser}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="7"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="7"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>