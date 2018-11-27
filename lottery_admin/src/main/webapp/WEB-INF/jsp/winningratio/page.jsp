<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="report" varStatus="idx" items="${data.items}">
	    <tr>
	    	<td>${data.pageSize*(data.pageNo-1)+idx.index+1}</td>
	        <td>${report.memberCode}</td>
	        <td>${report.fdAmount==null?'0.00':report.fdAmount}</td>
	        <td>${report.amount}</td>
	        <td>${(report.fdAmount/report.amount)*100}%</td>
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
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>