<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="lotteryType" items="${data.items}">
	    <tr>
	        <td>${lotteryType.name}</td>
	        <td>${lotteryType.openRate}</td>
	        <td>${lotteryType.dayPeriod}</td>
	        <td>${lotteryType.preCloseTime}</td>
	        <td>${lotteryType.expand.roomInfo}</td>
	        <td>${lotteryType.expand.defaultRoom}</td>
	        <td>${lotteryType.sort}</td>
         	<td>${lotteryType.status=='1'?'正常':(lotteryType.status==-1?'维护中':'已关闭')}</td>
         	<td><fmt:formatDate value="${lotteryType.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${lotteryType.id}" data-url="system/lotteryType/edit" href="">编辑</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="10"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="10"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>