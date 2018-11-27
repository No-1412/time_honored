<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="member" items="${data.items}">
	    <tr>
	    	<td>${member.code}<br>${member.id}</td>
	        <td>${member.name}</td>
	        <td>
	        	<c:if test="${member.status == -1}">
	        	<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${member.id}"
	        	   data-data="1"
	        	   data-msg="确定要启用会员【${member.name}】？"
	        	   data-url="system/member/updateStatus" href="#">启用</a>
	        	</c:if>
	        	<c:if test="${member.status != -1}">
	        	<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${member.id}"
	        	   data-data="-1"
	        	   data-msg="确定要停用会员【${member.name}】？"
	        	   data-url="system/member/updateStatus" href="#">停用</a>
	        	</c:if>
	        	<c:if test="${member.lockStatus == 1}">
	        	<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${member.id}"
	        	   data-data="-11"
	        	   data-msg="确定要冻结会员【${member.name}】？"
	        	   data-url="system/member/updateStatus" href="#">冻结</a>
	        	</c:if>
	        	<c:if test="${member.lockStatus != 1}">
	        	<a class="btn btn-sm btn-info custom_link"
	        	   data-id="${member.id}"
	        	   data-data="11"
	        	   data-msg="确定要解冻会员【${member.name}】？"
	        	   data-url="system/member/updateStatus" href="#">解冻</a>
	        	</c:if>
	        </td>
	        <td>
	        	${member.levelName}
	        	<br>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-height="250px"
	        	   data-title="调整分层"
	        	   data-url="system/member/updateLevel" href="">调整分层</a>
	        </td>
	        <td>${member.amount}</td>
	        <td>${member.freezeAmount}</td>
	        <td>${member.winAmount}</td>
	        <td>
	        	${member.realAmount}<br>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-height="430px"
	        	   data-title="调整打码量"
	        	   data-url="system/member/updateDml" href="">调整打码量</a>
	        </td>
	        <td>
	        	${member.agentName}
	        	<c:if test="${admin.isAdmin>=1}">
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-height="250px"
	        	   data-title="修改代理"
	        	   data-url="system/member/updateAgent" href="">修改</a>
	        	</c:if>
	        </td>
	        <td>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-height="450px"
	        	   data-title="登录日志"
	        	   data-url="system/member/loginLog" href="">登录日志</a>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.code}"
	        	   data-width="1050px"
	        	   data-height="550px;"
	        	   data-title="资金流水"
	        	   data-url="system/memberAccount/index" href="">资金流水</a>
	        </td>
         	<td><fmt:formatDate value="${member.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>
         		${member.remark}<br><c:if test="${member.remark1!=null}">${member.remark1}<br></c:if>
         		<c:if test="${member.tjr!=0}">
         		<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.tjr}------"
	        	   data-width="1050px"
	        	   data-height="550px;"
	        	   data-title="会员推荐管理"
	        	   data-url="system/spread/index1" href="">推荐人</a>
         		</c:if>
         	</td>
	        <td>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-title="重置密码"
	        	   data-height="300px"
	        	   data-url="system/member/resetPassword" href="">重置密码</a>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-title="资料修改"
	        	   data-url="system/member/edit" href="">资料修改</a>
	        	<br>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-title="赠送彩金"
	        	   data-height="450px"
	        	   data-url="system/member/handGift" href="">赠送彩金</a>
	        	<a class="btn btn-sm btn-info edit_link"
	        	   data-id="${member.id}"
	        	   data-title="手动存款"
	        	   data-url="system/member/handRecharge" href="">手动存款</a>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="13"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="13"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>