<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="level" items="${data.items}">
	    <tr>
	        <td>${level.level}</td>
	        <td>${level.name}</td>
	        <td>${level.remark}</td>
	        <td><a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/wechat" href="">编辑</a></td>
	        <td><a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/alipay" href="">编辑</a></td>
	        <td><a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/qqpay" href="">编辑</a></td>
	        <td><a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/bank" href="">编辑</a></td>
	        <td><a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/third" href="">编辑</a></td>
	        <td><a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/other" href="">编辑</a></td>
         	<td width="140px;">
         		<span style="float:left;">${level.rechargeTimes}<br>${level.rechargeAmount}</span>
         		<c:if test="${level.level!='1'}">
         		<a style="float:right;" class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-height="250px" data-title="修改分层条件" data-url="system/memberLevel/condition" href="">修改</a>
         		</c:if>
         	</td>
         	<td><fmt:formatDate value="${level.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	        	<a class="btn btn-sm btn-info edit_link" data-id="${level.id}" data-url="system/memberLevel/edit" href="">编辑</a>
	        	<c:if test="${level.level!='1'}">
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${level.id}" data-url="system/memberLevel/delete" href="#">删除</a>
	         	</c:if>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="12"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="12"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>