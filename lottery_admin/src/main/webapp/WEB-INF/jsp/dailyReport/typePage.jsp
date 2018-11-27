<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="report" varStatus="idx" items="${data.items}">
	    <tr>
	    	<td>${data.pageSize*(data.pageNo-1)+idx.index+1}</td>
	        <td>${report.content}</td>
	        <td>${report.memberType}</td>
	        <td>${report.amount}</td>
	        <td>${report.winAmount}</td>
	        <td>${report.fdAmount}</td>
	        <td>${report.bonus}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null}">
	<tr>
		<td colspan="7"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="7">
		<b style="float: left;margin-left: 5px;margin-top: 12px;color: blue;font-size: 14px;">
			输赢：<b style="color:${data.params.bonus > 0 ? "red":"green"}">${data.params.bonus==null?0:data.params.bonus}</b>
			&nbsp;&nbsp;投注：${data.params.amount==null?0:data.params.amount}
			<br><b style="color:black;font-size: 12px;">负数平台赢，正数平台输，只统计已结算的注单</b>
		</b>
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>