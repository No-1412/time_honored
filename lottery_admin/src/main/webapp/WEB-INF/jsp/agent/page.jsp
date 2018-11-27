<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="agent" items="${data.items}">
	    <tr>
	        <td>${agent.id}</td>
	        <td>${agent.code}</td>
	        <td>${agent.name}</td>
         	<td>${agent.parentId=='0'?'':agent.parentId}</td>
         	<td>${agent.expression.levelName}</td>
         	<td>${agent.status=='1'?'启用':(agent.status=='0'?'待审核':'停用')}</td>
         	<td>${agent.extUrl}</td>
         	<td><fmt:formatDate value="${agent.updTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	        <td>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="4:${agent.name}"
	        	   data-width="1050px"
	        	   data-height="550px;"
	        	   data-title="会员资料"
	        	   data-url="system/member/index" href="">旗下会员</a>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${agent.memberId}"
	        	   data-title="重置密码"
	        	   data-height="300px"
	        	   data-url="system/member/resetPassword" href="">重置密码</a>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${agent.id}" data-url="system/agent/edit" href="">编辑</a>
	         	<%-- <c:if test="${agent.id!=888}">
	         	<a class="btn btn-sm btn-danger cancel_link" data-id="${agent.id}" data-url="system/agent/delete" href="">删除</a>
	         	</c:if> --%>
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
