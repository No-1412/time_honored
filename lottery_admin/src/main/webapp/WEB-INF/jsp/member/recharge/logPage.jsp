<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="recharge" items="${data.items}">
	    <tr style="background-color: ${recharge.status==1?'':'#ddc;'}">
	    	<td width="100">${recharge.orderNo}<br><fmt:formatDate value="${recharge.addTime}" pattern="MM-dd HH:mm" /></td>
	        <td>${recharge.memberCode}</td>
	         <td>${recharge.agentCode}</td>
         	<td>${recharge.levelName}</td>
         	<td>${recharge.inBank}<br>${recharge.inUser}</td>
         	<td>${recharge.amount}</td>
         	
         	<c:if test="${recharge.type==12}"><td>微信<br>${recharge.saveTime}</td></c:if>
         	<c:if test="${recharge.type==22}"><td>支付宝<br>${recharge.saveTime}</td></c:if>
         	<c:if test="${recharge.type==31}"><td>银行转账<br>${recharge.saveTime}</td></c:if>
         	<c:if test="${recharge.type==51}"><td>手动入款<br>${recharge.saveTime}</td></c:if>
         	<c:if test="${recharge.type==61}"><td>独立赠送彩金<br>${recharge.saveTime}</td></c:if>
         	
         	<c:if test="${recharge.type==51 || recharge.type==61}"><td></td><td></td></c:if>
         	<c:if test="${recharge.type!=51 && recharge.type!=61}"><td>第${recharge.totalTimes}次</td><td>第${recharge.times}次</td></c:if>
         	
         	<c:if test="${recharge.type==31}"><td>${recharge.code}<br>${recharge.extend}--${recharge.name}</td></c:if>
         	<c:if test="${recharge.type!=31}"><td>${recharge.code}<br>${recharge.name}</td></c:if>
         	
         	<c:if test="${recharge.status==1}"><td>通过</td></c:if>
         	<c:if test="${recharge.status==-1}"><td>不通过</td></c:if>
         	<c:if test="${recharge.status==-11}">
         	<td>
         	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${recharge.id}"
	        	   data-height="450px"
	        	   data-title="恢复确认"
	        	   data-url="system/recharge/verifyEdit1" href="">恢复确认</a>
	        </td>
	        </c:if>
         	
         	<td>${recharge.addAmount}</td>
         	<td>${recharge.giftAmount}</td>
         	<td>${recharge.dml}</td> 
         	<td>${recharge.verifyUser}<br><fmt:formatDate value="${recharge.verifyTime}" pattern="MM-dd HH:mm" /></td>
	        <td>${recharge.remark}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="16"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="16">
		<b style="float: left;margin-left: 5px;margin-top: 12px;">有效金额总计：${data.params}</b>
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>