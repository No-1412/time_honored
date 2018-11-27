<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="scrollImg" items="${data.items}">
	    <tr>
	        <td>${scrollImg.id}</td>
            <td><img style="width: 250px;height: 100px;" src="${scrollImg.pc}"></td>
            <td><img style="width: 150px;height: 70px;" src="${scrollImg.wap}"></td>
            <td>${scrollImg.status==1?'显示':'不显示'}</td>
         	<td><fmt:formatDate value="${scrollImg.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td><fmt:formatDate value="${scrollImg.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td align="center">${scrollImg.order}</td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${scrollImg.id}" data-url="system/scrollImg/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${scrollImg.id}" data-url="system/scrollImg/delete" href="">删除</a>
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