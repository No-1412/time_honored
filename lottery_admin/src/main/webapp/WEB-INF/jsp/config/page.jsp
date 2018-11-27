<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="config" items="${data.items}">
	    <tr>
	        <td>${config.name}</td>
            <td>${config.nid}</td>
         	<c:if test="${config.image != 'NVL'}">
         		<c:if test="${config.nid == 'wap_logo'}">
         		<td><img style="width:87px;height:31px;background-color: #ec2829;" src="${config.image}"></td>
         		</c:if>
         		<c:if test="${config.nid != 'wap_logo'}">
            	<td><img style="width:110px;height:110px;" src="${config.image}"></td>
            	</c:if>
            </c:if>
            <c:if test="${config.image == 'NVL'}">
            	<td>${config.value}</td>
            </c:if>
            <td>
            	<a class="btn btn-sm btn-info edit_link" data-id="${config.nid}" data-url="system/config/edit" href="">编辑</a>
            	<c:if test="${isAdmin}"><a class="btn btn-sm btn-danger cancel_link" data-id="${config.nid}" data-url="system/config/delete" href="#">删除</a></c:if>
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
	<td colspan="4"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>