<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="agentLevel" items="${data.items}">
	    <tr>
	        <td>${agentLevel.id}</td>
	        <td>${agentLevel.name}</td>
         	<td>${agentLevel.remark}</td>
         	<td>${agentLevel.status == '1' ? '启用' : '停用'}</td>
         	<td><fmt:formatDate value="${agentLevel.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${agentLevel.id}" data-url="system/agentLevel/edit" href="">编辑</a>
	         	<c:if test="${agentLevel.id !='1'}">
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${agentLevel.id}" data-url="system/agentLevel/delete" href="">删除</a>
	         	</c:if>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="6"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="6"><div id="pages" data-page="${data.pageNo}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>