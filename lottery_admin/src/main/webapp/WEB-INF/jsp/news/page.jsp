<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="news" items="${data.items}">
	    <tr>
	    	<td>${news.id}</td>
            <td>${news.type}</td>
            <td>${news.source}</td>
            <td>${news.title}</td>
            <td>${news.zhaiYao}</td>
         	<td><fmt:formatDate value="${news.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td><fmt:formatDate value="${news.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td align="center">${news.order}</td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${news.id}" data-url="system/news/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${news.id}" data-url="system/news/delete" href="">删除</a>
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