<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="withdraw" items="${data.items}">
	    <tr style="background-color: ${withdraw.status==1?'':'#ddc;'}">
	    	<td width="100">${withdraw.orderNo}<br><fmt:formatDate value="${withdraw.addTime}" pattern="MM-dd HH:mm" /></td>
	        <td>${withdraw.memberCode}<br>${withdraw.memberName}</td>
         	<td>${withdraw.bankName}<br>${withdraw.accountCode}</td>
         	<td>${withdraw.levelName}</td>
         	<td>${withdraw.amount}</td>
         	<td>${withdraw.agentName}</td>
         	
         	<c:if test="${withdraw.accountCode == '-'}"><td>-</td></c:if>
         	<c:if test="${withdraw.accountCode != '-'}"><td>第${withdraw.totalTimes}次</td></c:if>
         	
         	<c:if test="${withdraw.accountCode == '-'}"><td>-</td></c:if>
         	<c:if test="${withdraw.accountCode != '-'}"><td>第${withdraw.times}次</td></c:if>
         	
         	<td>${withdraw.status==1?"通过":"不通过"}</td>
         	<td>${withdraw.updBy}<c:if test="${withdraw.status==1 and withdraw.thirdRemark != null}">-${withdraw.thirdRemark}</c:if> <br><fmt:formatDate value="${withdraw.updTime}" pattern="MM-dd HH:mm" /></td>
	        <td>${withdraw.fee}/${withdraw.feeAdmin}</td>
	        <td>${withdraw.amount}</td>
	        <td>${withdraw.remark}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="13"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="13">
		<b style="float: left;margin-left: 5px;margin-top: 12px;">有效金额总计：${data.params}</b>
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>