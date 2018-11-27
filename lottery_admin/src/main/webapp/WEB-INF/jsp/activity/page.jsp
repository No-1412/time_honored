<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="activity" items="${data.items}">
	    <tr>
	  		<td>${activity.id}</td>
            <td>${activity.title}</td>
            <td>${activity.object}</td>
            <td>${activity.content}</td>
            <td>${activity.status=='1'?'开启':'关闭'}</td>
         	<td><fmt:formatDate value="${activity.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td><fmt:formatDate value="${activity.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	       <td align="center">${activity.order}</td>
	        <td>
	            <a class="btn btn-sm btn-info edit_link" data-id="${activity.id}" data-url="system/activity/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${activity.id}" data-url="system/activity/delete" href="">删除</a>
	         	
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