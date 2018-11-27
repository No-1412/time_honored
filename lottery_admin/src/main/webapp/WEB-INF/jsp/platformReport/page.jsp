<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data.page != null && data.page.items != null}">
	<c:forEach var="admin" items="${data.page.items}">
	    <tr>
	        <td>${admin.id}</td>
	        <td>${admin.expand.platformName}</td>
	        <td>${admin.reportMonth}</td>
         	<td>${admin.reportAmount}</td>
         	<td>${admin.finalAmount}</td>
         	<td>${admin.status==0?"未付":(admin.status==2?"部分支付":(admin.status==3?"不收":"已付"))}</td>
         	<td>${admin.serviceFee}</td>
         	<td>${admin.serviceFeeRemark}</td>
         	<td>${admin.subFee}</td>
         	<td>${admin.subFeeRemark}</td>
         	<td>${admin.countExpression}</td>
	        <td>
	         	<a class="btn btn-sm btn-info edit_link" data-id="${admin.id}" data-url="system/platformReport/edit" href="">编辑</a>
	         	<%-- <a class="btn btn-sm btn-danger cancel_link" data-id="${admin.id}" data-url="system/platform/delete" href="">删除</a> --%>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data.page == null || data.page.items == null}">
	<tr>
		<td colspan="12"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="12">
		<div id="pages" data-page="${data.page.pageNo-1}" data-total="${data.page.totalSize}" data-epage="${data.page.pageSize}"></div>
		<b style="float: left;margin-left: 5px;margin-top: 12px;color: blue;font-size: 14px;">
			应收金额总计：${data.totalAmount}<br>
			<label style="color: red;">注：每年的3、6、9、12月需加收系统维护费，三个月一收，每月20000</label>
		</b>
	</td>
</tr>
