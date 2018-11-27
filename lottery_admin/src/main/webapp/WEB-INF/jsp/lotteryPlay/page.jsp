<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="lotteryPlay" items="${data.items}">
	    <tr>
	        <td>${lotteryPlay.name}</td>
	        <td>${lotteryPlay.playName1}</td>
	        <c:forEach var="room" items="${roomList}">
	        <td>
	        	<c:if test="${lotteryPlay.needSetBonus != '0'}">
           		<a class="btn btn-sm btn-info edit_link" 
           			data-id="${lotteryPlay.num}-${lotteryPlay.playNum1}-${room.id}"
           			data-title="赔率设置(${lotteryPlay.name}-${lotteryPlay.playName1}-${room.name}(返水${room.reward}%))"
           			data-url="system/lotteryPlay/edit" href="">设置赔率</a>
           		</c:if>
            </td>
            </c:forEach>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="${roomSize}"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="${roomSize}"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>