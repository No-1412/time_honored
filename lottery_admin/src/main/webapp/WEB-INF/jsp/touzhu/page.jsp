<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="touzhu" items="${data.items}">
	    <tr>
	        <td>${touzhu.period}</td>
	        <td>${touzhu.orderNo}</td>
	        <td><fmt:formatDate value="${touzhu.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>${touzhu.memberId}</td>
	        <td>${touzhu.memberCode}</td>
	        <td>${touzhu.typeName}</td>
	        <td><fmt:formatDate value="${touzhu.openTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>${touzhu.playName} - ${touzhu.content}</td>
	        <td>${touzhu.amount}</td>
	        <c:if test="${touzhu.status == 0}"><td>未结算</td></c:if>
	        <c:if test="${touzhu.status == -1}"><td>已取消</td></c:if>
	        <c:if test="${touzhu.status == 1}"><td style="color: ${touzhu.winAmount > 0 ? "red":"green"}">${touzhu.winAmount}</td></c:if>
	        <td>${touzhu.fdAmount}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="11"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="11">
		<b style="float: left;margin-left: 5px;margin-top: 12px;color: blue;font-size: 14px;">
			输赢：<b style="color:${data.params.winAmount > 0 ? "red":"green"}">${data.params.winAmount}</b>
			&nbsp;&nbsp;投注：${data.params.totalAmount}
			<br><b style="color:black;font-size: 12px;">负数平台赢，正数平台输，输赢统计只统计已结算的注单</b>
		</b>
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>
