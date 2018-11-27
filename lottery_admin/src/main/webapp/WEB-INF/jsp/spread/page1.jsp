<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="spread" items="${data.items}">
	    <tr style="color:${spread.addTime==null?'red':''};background-color:${spread.isDanger==1?'#f5f5f5':''};">
	    	<td>${spread.tjr}</td>
	        <td>${spread.memberCode}</td>
	        <c:if test="${spread.addTime==null}"><td style="text-align: right;">总计:</td></c:if>
	        <c:if test="${spread.addTime!=null}"><td><fmt:formatDate value="${spread.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td></c:if>
	        <td>${spread.rechargeAmount}</td>
	        <td>${spread.withdrawAmount}</td>
	        <td>${spread.betAmount}</td>
         	<td>${spread.winAmount}</td>
         	<td>${spread.fdAmount}</td>
         	<td>${spread.realAmount}</td>
         	<td>${spread.tjAmount}</td>
         	<td>
         		<c:if test="${spread.isDanger==0}">
         		<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${spread.memberId}"
	        	   data-data="1"
	        	   data-msg="确定要把该会员置为风险会员？"
	        	   data-url="system/spread/danger" href="#">风险会员</a>
	        	</c:if>
	        	<c:if test="${spread.addTime != null && spread.isDanger!=0}">
         		<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${spread.memberId}"
	        	   data-data="1"
	        	   data-msg="确定要把该会员置为非风险会员？"
	        	   data-url="system/spread/unDanger" href="#">恢复</a>
	        	</c:if>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="11"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="11"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>