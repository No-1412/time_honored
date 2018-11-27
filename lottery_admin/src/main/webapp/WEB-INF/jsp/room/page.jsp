<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="room" items="${data.items}">
	    <tr>
	        <td>${room.name}</td>
	        <td>${room.reward}</td>
	        <td><img style="width:110px;height:110px;" src="${room.image}"></td>
	        <td>${room.remark}</td>
	        <td><fmt:formatDate value="${room.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td><fmt:formatDate value="${room.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	        	<c:if test="${room.id!='1'}">
	         	<a class="btn btn-sm btn-info edit_link" data-id="${room.id}" data-url="system/room/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-info cancel_link" data-id="${room.id}" data-url="system/room/delete" href="">删除</a>
	         	</c:if>
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