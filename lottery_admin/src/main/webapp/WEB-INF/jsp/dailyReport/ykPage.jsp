<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="report" varStatus="idx" items="${data.items}">
	    <tr>
	    	<td>${data.pageSize*(data.pageNo-1)+idx.index+1}</td>
	        <td>${report.memberCode}</td>
	        <td>${report.amount}</td>
	        <td>${report.winAmount}</td>
	        <td>${report.fdAmount}</td>
	        <td>${report.bonus}</td>
	        <td>${report.specBonus}</td>
	        <td>
	        <input class="btn_confirm" data-id="${report.memberId}" type="button" value="赠送彩金">
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null}">
	<tr>
		<td colspan="8"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="8">
	    <input type="hidden" >
		<div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div>
	</td>
</tr>
<script type="text/javascript">
	requirejs(['jquery', 'layer',], function($, layer) {
		$('.btn_confirm').on('click', function() {
			var _that = $(this);
	        layer.confirm("确定要赠送彩金？", function() {
	        	var index = layer.load();
	            $.ajax({
	                url: 'system/report/activityExcuteSubmit',
	                type: "post",
	                data: {memberId: _that.attr("data-id"),addTime: $("#date").val()}
	            }).done(function(results) {
	            	layer.close(index);
	                if(results.status == "200") {
	                    layer.msg("赠送成功", {icon: 1, time: 1000});
	                } else {
	                    layer.msg(results.description, {icon: 2, time: 2000});
	                }
	            });
	        });
		});
	})
</script>