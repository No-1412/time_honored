<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="rechargeBank" items="${data.items}">
	    <tr>
	        <td>${rechargeBank.bankName}</td>
	        <td>${rechargeBank.bankAddr}</td>
	        <td>${rechargeBank.accountCode}</td>
	        <td>${rechargeBank.accountName}</td>
         	<td>${rechargeBank.status=='1'?'启用':'停用'}</td>
         	<td><fmt:formatDate value="${rechargeBank.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${rechargeBank.id}" data-url="system/rechargeBank/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${rechargeBank.id}" data-url="system/rechargeBank/delete" href="#">删除</a>
	        </td>
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