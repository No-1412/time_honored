<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="hfbxf" items="${data.items}">
	    <tr>
	        <td>${hfbxf.orderNo}</td>
	        <td>${hfbxf.sysMerchNo}</td>
	        <td>${hfbxf.addBy}</td>
	        <td>${hfbxf.applyAmt}</td>
	        <td>${hfbxf.status}</td>
         	<td><fmt:formatDate value="${hfbxf.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-danger refresh_btn" data-id="${hfbxf.id}">刷新状态</a>
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