<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="adminType" items="${data.items}">
	    <tr>
	        <td>${adminType.id}</td>
	        <td>${adminType.type==1?'IP':'会员账号'}</td>
	        <td>${adminType.value}</td>
	        <td>${adminType.remark}</td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${adminType.id}" data-url="system/memberIpFilter/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${adminType.id}" data-url="system/memberIpFilter/delete" href="">删除</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="5"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="5"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>