<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="wechat" items="${data.items}">
	    <tr>
	        <td>${wechat.id}</td>
	        <td>${wechat.payType==2?'扫码':(wechat.payType==3?'加好友':'转账到银行卡')}</td>
	        <td>${wechat.name}<br>${wechat.code}</td>
	        <td>${wechat.payMin}</td>
	        <td>${wechat.payMax}</td>
         	<td>${wechat.status=='1'?'启用':'停用'}</td>
         	<td><fmt:formatDate value="${wechat.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${wechat.id}" data-url="system/wechat/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${wechat.id}" data-url="system/wechat/delete" href="#">删除</a>
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