<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="recharge" items="${data.items}">
	    <tr>
	    	<td width="100">${recharge.orderNo}<br><fmt:formatDate value="${recharge.addTime}" pattern="MM-dd HH:mm" /></td>
	        <td>${recharge.memberCode}</td>
         	<td>${recharge.levelName}</td>
         	<td>${recharge.inBank}<br>${recharge.inUser}</td>
         	<td>${recharge.amount}</td>
         	<c:if test="${recharge.type==12}"><td>微信<br>${recharge.saveTime}</td></c:if>
         	<c:if test="${recharge.type==22}"><td>支付宝<br>${recharge.saveTime}</td></c:if>
         	<c:if test="${recharge.type==31}"><td>银行转账<br>${recharge.saveTime}</td></c:if>
         	<td>第${recharge.totalTimes}次</td>
         	<td>第${recharge.times}次</td>
         	<c:if test="${recharge.type==31}"><td>${recharge.code}<br>${recharge.extend}--${recharge.name}</td></c:if>
         	<c:if test="${recharge.type!=31}"><td>${recharge.code}<br>${recharge.name}</td></c:if>
         	<td>${recharge.ip}</td>
	        <td>
	        	<c:if test="${recharge.status==2}">
	        	<b style="color:red;">${recharge.verifyUser}正在审核<b>
	        	</c:if>
	        	<c:if test="${recharge.status==0}">
	        	<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${recharge.id}"
	        	   data-msg="NVL"
	        	   data-url="system/recharge/lockVerify" href="#">正在审核</a>
	        	</c:if>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${recharge.id}"
	        	   data-height="450px"
	        	   data-title="确认审核"
	        	   data-url="system/recharge/verifyEdit" href="">确认审核</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="11"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="11"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>