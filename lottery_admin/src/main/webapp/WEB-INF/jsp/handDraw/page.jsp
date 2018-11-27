<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="draw" items="${data.items}">
	    <tr>
	        <td>${lotteryTypeName}</td>
	        <td>${draw.period}</td>
	        <td>${draw.openTime}</td>
	        <c:if test="${draw.num==18 || isAdmin == 1}">
	        <td>${draw.content}
        		<a class="btn btn-sm btn-info edit_link" 
           			data-id="${draw.id}"
           			data-width="1000px"
           			data-url="system/handDraw/third" href="">${draw.status==1?"更改":"添加"}</a>
           		<c:if test="${draw.num==18}"><br><b style="color:red;">${draw.originalContent}</b></c:if>
	        </td>
	        </c:if>
	        <c:if test="${draw.num!=18 && isAdmin != 1}">
	        <td>${draw.content}
           		<c:if test="${draw.num==18}"><br><b style="color:red;">${draw.originalContent}</b></c:if>
	        </td>
	        </c:if>
	        <c:if test="${draw.status==1}"><td>已开奖</td></c:if>
	        <c:if test="${draw.status!=1}">
	        <td>未开奖
           		<c:if test="${isAdmin >= 1 && draw.expand.zhudan != 0}">
           			<a class="btn btn-sm btn-primary custom_link"
           				data-msg="确定要撤销该期数的所有注单？"
           				data-data="${draw.num}-${draw.period}" data-url="system/handDraw/cancel" href="#">撤销注单</a>
           		</c:if>
           		<c:if test="${isAdmin >= 1 && draw.expand.zhudan == 0}">
           			<a class="btn btn-sm btn-primary custom_link"
           				data-msg="确定要删除该开奖记录？"
           				data-data="${draw.id}" data-url="system/handDraw/delete" href="#">删除</a>
           		</c:if>
           	</td>
           	</c:if>
	        <c:if test="${draw.status1==0}">
	        	<c:if test="${draw.status!=1}"><td>未开奖</td></c:if>
	        	<c:if test="${draw.status==1}">
	        		<td>
	        			<a class="btn btn-sm btn-primary custom_link" data-msg="请先确认开奖内容再结算，一旦结算数据将无法恢复！！！" data-data="${draw.id}" data-url="system/handDraw/platFormSubmit" href="#">确定开奖</a>
           			</td>
	        	</c:if>
	       	</c:if>
	        <c:if test="${draw.status1!=0}"><td>已开奖</td></c:if>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="6"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="6"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>