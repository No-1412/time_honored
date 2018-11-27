<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="recharge" items="${data.items}">
	    <tr>
	    	<td>${recharge.orderNo}</td>
	        <td>${recharge.inUser}</td>
	        <td>${recharge.expand.levelname}</td>
         	<td>${recharge.realAmount==null?recharge.amount:recharge.realAmount}</td>
         	<td>${recharge.name}</td>
         	<td>${recharge.code}</td>
         	<td><fmt:formatDate value="${recharge.addTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>${recharge.verifyUser}</td>
         	<c:choose>
         		<c:when test="${recharge.status==1}"><td>已存入</td></c:when>
         		<c:when test="${recharge.status==-1}"><td>已取消</td></c:when>
         		<c:when test="${recharge.status==0}">
	         		<td><input class="btn_confirm" data-id="${recharge.id}" type="button" value="确定"><input class="btn_cancel" data-id="${recharge.id}" type="button" value="取消" style="margin-left: 5px;"></td>
         		</c:when>
         	</c:choose>
         	<td><fmt:formatDate value="${recharge.verifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
         	<td>${recharge.inBank}</td>
         	<td style="word-break:break-all;word-wrap:break-word;">${recharge.tradeNo}</td>
         	<td>${recharge.expand.regip}</td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="13"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="13">
		<b style="float: left;margin-left: 5px;margin-top: 12px;">有效金额总计：${data.params}</b>
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>

<script type="text/javascript">
	requirejs(['jquery', 'layer',], function($, layer) {
		$('.btn_confirm').on('click', function() {
			var _that = $(this);
	        layer.confirm("确定要审核通过该笔记录？", function() {
	        	var index = layer.load();
	            $.ajax({
	                url: 'system/recharge/onlineVerify',
	                type: "post",
	                data: {id: _that.attr("data-id"), status: 1}
	            }).done(function(results) {
	            	layer.close(index);
	                if(results.status == "200") {
	                    layer.msg("确认成功", {icon: 1, time: 1000}, function() {
	                    	is_hand = 0;
	                		$("#tableForm").find("input[type=submit]").click();
	                		is_hand = 1;
	                    });
	                } else {
	                    layer.msg(results.description, {icon: 2, time: 2000});
	                }
	            });
	        });
		});
		
		$('.btn_cancel').on('click', function() {
			var _that = $(this);
	        layer.confirm("确定要取消该笔记录？", function() {
	        	var index = layer.load();
	            $.ajax({
	                url: 'system/recharge/onlineVerify',
	                type: "post",
	                data: {id: _that.attr("data-id"), status: -1}
	            }).done(function(results) {
	            	layer.close(index);
	                if(results.status == "200") {
	                    layer.msg("取消成功", {icon: 1, time: 1000}, function() {
	                    	is_hand = 0;
	                		$("#tableForm").find("input[type=submit]").click();
	                		is_hand = 1;
	                    });
	                } else {
	                    layer.msg(results.description, {icon: 2, time: 2000});
	                }
	            });
	        });
		})
	})
</script>