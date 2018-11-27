<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="message" items="${data.items}">
	    <tr>
	        <td>${message.id}</td>
	        <td>${message.memberCode}</td>
            <td>${message.memberName}</td>
            <td>${message.title}</td>
            <td>${message.content}</td>
         	<td><fmt:formatDate value="${message.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td><fmt:formatDate value="${message.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${message.id}" data-url="member/message/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${message.id}" data-url="member/message/delete" href="">删除</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="8"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="8"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>