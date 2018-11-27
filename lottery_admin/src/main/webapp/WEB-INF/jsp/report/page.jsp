<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null}">
	<c:forEach var="report" varStatus="idx" items="${data}">
	    <tr>
	    	<td>${report.agentCode == '总计' ? '' : (idx.index+1)}</td>
	        <td>${report.agentCode}</td>
	        <td>${report.tzMembers}</td>
	        <td>${report.zdl}</td>
	        <td>${report.amount}</td>
	        <td>${report.winAmount}</td>
	        <td>${report.fdAmount}</td>
	        <td>${report.realWinAmount}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null}">
	<tr>
		<td colspan="8"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>