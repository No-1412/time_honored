<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="spread" items="${data.items}">
	    <tr style="color:${spread.addTime==null?'red':''};background-color:${spread.isDanger==1?'#f5f5f5':''};">
	    	<td>${spread.tjr}</td>
	        <c:if test="${spread.addTime==null}"><td style="text-align: right;">总计:</td></c:if>
	        <c:if test="${spread.addTime!=null}">
	        	<td><a class="edit_link"
	        	   data-id="${dataid}--${spread.tjr}"
	        	   data-width="1050px"
	        	   data-height="550px;"
	        	   data-title="会员推荐管理"
	        	   data-url="system/spread/index1" href="">${spread.totalSize}</a></td>
	        </c:if>
	        <td>${spread.rechargeAmount}</td>
	        <td>${spread.withdrawAmount}</td>
	        <td>${spread.betAmount}</td>
         	<td>${spread.winAmount}</td>
         	<td>${spread.fdAmount}</td>
         	<td>${spread.realAmount}</td>
         	<td>${spread.tjAmount}</td>
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