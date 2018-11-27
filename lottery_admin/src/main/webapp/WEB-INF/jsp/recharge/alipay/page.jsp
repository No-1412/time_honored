<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="alipay" items="${data.items}">
	    <tr>
	        <td>${alipay.id}</td>
	        <td>${alipay.payType==2?'扫码':(alipay.payType==3?'加好友':'转账到银行卡')}</td>
	        <td>${alipay.name}<br>${alipay.code}</td>
	        <td>${alipay.payMin}</td>
	        <td>${alipay.payMax}</td>
         	<td>${alipay.status=='1'?'启用':'停用'}</td>
         	<td><fmt:formatDate value="${alipay.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${alipay.id}" data-url="system/alipay/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${alipay.id}" data-url="system/alipay/delete" href="#">删除</a>
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