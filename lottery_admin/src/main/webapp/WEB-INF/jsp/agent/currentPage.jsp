<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null}">
	<c:forEach var="report" varStatus="idx" items="${data}">
	    <tr>
	    	<td>${report.agentCode}</td>
	    	<td>${report.realWinAmount}</td>
	    	<td>${report.rechargeFee}</td>
	        <td>${report.withdrawFee}</td>
	        <td>${report.recharge}</td>
	        <td>${report.withdraw}</td>
	        <td>${report.recharge-report.withdraw}</td>
	        <td>${report.percent}</td>
	        <td>${report.khyjAmount}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null}">
	<tr>
		<td colspan="9"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>