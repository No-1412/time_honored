<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="third" items="${data.items}">
	    <tr>
	        <td>${third.name}</td>
	        <td>${third.expand.type}</td>
	        <td>${third.merid}</td>
	        <td>${third.minAmount}</td>
	        <td>${third.maxAmount}</td>
	        <td>${third.status=='1'?'启用':'停用'}</td>
	        <td>${third.sort}</td>
         	<td><fmt:formatDate value="${third.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${third.id}" data-url="system/rechargeThird/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${third.id}" data-url="system/rechargeThird/delete" href="#">删除</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="9"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="9"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>