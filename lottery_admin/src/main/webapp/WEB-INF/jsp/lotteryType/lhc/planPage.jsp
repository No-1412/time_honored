<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="draw" items="${data.items}">
	    <tr>
	        <td>${draw.period}</td>
	        <td>${draw.periodDay}</td>
         	<td>${draw.openTime}</td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${draw.id}" data-url="lottery/lhc/planEdit" href="">编辑</a>
	        </td>
	    </tr>
    </c:forEach>
	
	
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="4"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="4">
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>