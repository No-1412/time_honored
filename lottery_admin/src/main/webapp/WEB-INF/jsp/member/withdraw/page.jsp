<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="withdraw" items="${data.items}">
	    <tr>
	    	<td width="100">${withdraw.orderNo}<br><fmt:formatDate value="${withdraw.addTime}" pattern="MM-dd HH:mm" /></td>
	        <td>${withdraw.memberCode}</td>
         	<td>${withdraw.memberName}</td>
         	<td>${withdraw.levelName}</td>
         	<td>${withdraw.agentName}</td>
         	<td>${withdraw.bankName}<br>${withdraw.accountCode}</td>
         	<td>${withdraw.amount}</td>
         	<td>第${withdraw.totalTimes}次</td>
         	<td>第${withdraw.times}次</td>
         	<td>
         		<a class="btn btn-sm btn-info edit_link"
	        	   data-id="1:${withdraw.memberCode}"
	        	   data-width="1050px"
	        	   data-height="550px;"
	        	   data-title="会员资料"
	        	   data-url="system/member/index" href="">会员资料</a>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${withdraw.memberCode}"
	        	   data-width="1050px"
	        	   data-height="550px;"
	        	   data-title="资金流水"
	        	   data-url="system/memberAccount/index" href="">资金流水</a>
         	</td>
	        <td width="250">
	        	<c:if test="${withdraw.status==2 and withdraw.thirdRemark != null}">${withdraw.thirdRemark}<br></c:if>
	        	<c:if test="${withdraw.status==2}">
	        	<b style="color:red;">${withdraw.updBy}正在审核<b>
	        	</c:if>
	        	<c:if test="${withdraw.status==0}">
	        	<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${withdraw.id}"
	        	   data-msg="NVL"
	        	   data-url="system/withdraw/lockVerify" href="#">正在审核</a>
	        	</c:if>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${withdraw.id}"
	        	   data-height="450px"
	        	   data-title="确认审核"
	        	   data-url="system/withdraw/verifyEdit" href="">确认审核</a>
	        	<c:if test="${data.params.isOpen and withdraw.status==0}">
	        	<a class="btn btn-sm btn-info third_withdraw"
	        	   data-id="${withdraw.id}"
	        	   data-url="system/withdraw/third" href="#">第三方出款</a>
	        	</c:if>
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
	<td colspan="11">
		<b style="float: left;margin-left: 5px;margin-top: 12px;">提款金额总计：${data.params.amount}</b>
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>