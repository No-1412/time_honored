<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="channel" items="${data.items}">
	    <tr>
	        <td>${channel.code}</td>
	        <td>${channel.name}</td>
	        <td>
	        	<c:choose>
	        		<c:when test="${channel.type==1}">微信</c:when>
	        		<c:when test="${channel.type==2}">支付宝</c:when>
	        		<c:when test="${channel.type==3}">微信+支付宝</c:when>
	        		<c:when test="${channel.type==4}">网银</c:when>
	        		<c:when test="${channel.type==7}">微信+支付宝+QQ钱包</c:when>
	        		<c:when test="${channel.type==8}">其它</c:when>
	        	</c:choose>
	        </td>
	        <td>${channel.returnType == 1 ? '二维码' : '页面'}</td>
         	<td>${channel.status=='1'?'开启':'关闭'}</td>
         	<td>${channel.sort}</td>
         	<td><fmt:formatDate value="${channel.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td><fmt:formatDate value="${channel.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${channel.id}" data-url="system/rechargeChannel/edit" href="">编辑</a>
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${channel.id}" data-url="system/rechargeChannel/delete" href="">删除</a>
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