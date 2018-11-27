<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${data != null && data.items != null}">
	<c:forEach var="lotteryPlay" items="${data.items}">
	    <tr>
	    	<td>香港⑥合彩</td>
	        <td>
	        	${lotteryPlay.playName1}<c:if test="${lotteryPlay.playName2 != null && lotteryPlay.playName2 != ''}">--${lotteryPlay.playName2}</c:if>
	        	<c:if test="${lotteryPlay.bonus != null}">（返水${lotteryPlay.bonus}%）</c:if>
	        </td>
	        <td>
	        	<!-- 正码特 -->
	        	<c:if test="${lotteryPlay.playNum1 == 8}">
	        		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="8-1"
	           			data-title="赔率设置(正码特-正一特})"
	           			data-url="system/lotteryPlaySix/edit" href="">正一特</a>
           			<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="8-2"
	           			data-title="赔率设置(正码特-正二特})"
	           			data-url="system/lotteryPlaySix/edit" href="">正二特</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="8-3"
	           			data-title="赔率设置(正码特-正三特})"
	           			data-url="system/lotteryPlaySix/edit" href="">正三特</a><br>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="8-4"
	           			data-title="赔率设置(正码特-正四特})"
	           			data-url="system/lotteryPlaySix/edit" href="">正四特</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="8-5"
	           			data-title="赔率设置(正码特-正五特})"
	           			data-url="system/lotteryPlaySix/edit" href="">正五特</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="8-6"
	           			data-title="赔率设置(正码特-正六特})"
	           			data-url="system/lotteryPlaySix/edit" href="">正六特</a>
	        	</c:if>
	        	<!-- 连肖连尾 -->
	        	<c:if test="${lotteryPlay.playNum1 == 16}">
	        		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-1"
	           			data-title="赔率设置(连肖连尾-2连肖})"
	           			data-url="system/lotteryPlaySix/edit" href="">2连肖</a>
           			<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-2"
	           			data-title="赔率设置(连肖连尾-3连肖})"
	           			data-url="system/lotteryPlaySix/edit" href="">3连肖</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-3"
	           			data-title="赔率设置(连肖连尾-4连肖})"
	           			data-url="system/lotteryPlaySix/edit" href="">4连肖</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-4"
	           			data-title="赔率设置(连肖连尾-5连肖})"
	           			data-url="system/lotteryPlaySix/edit" href="">5连肖</a><br>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-5"
	           			data-title="赔率设置(连肖连尾-2连尾})"
	           			data-url="system/lotteryPlaySix/edit" href="">2连尾</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-6"
	           			data-title="赔率设置(连肖连尾-3连尾})"
	           			data-url="system/lotteryPlaySix/edit" href="">3连尾</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-7"
	           			data-title="赔率设置(连肖连尾-4连尾})"
	           			data-url="system/lotteryPlaySix/edit" href="">4连尾</a>
	           		<a class="btn btn-sm btn-info edit_link" 
		        		data-width="1050px",
	           			data-id="16-8"
	           			data-title="赔率设置(连肖连尾-5连尾})"
	           			data-url="system/lotteryPlaySix/edit" href="">5连尾</a>
	        	</c:if>
	        	<c:if test="${lotteryPlay.playNum1 != 8 && lotteryPlay.playNum1 != 16 && lotteryPlay.playName2 != null && lotteryPlay.playName2 != ''}">
	        	<a class="btn btn-sm btn-info edit_link" 
	        		data-width="1050px",
           			data-id="${lotteryPlay.playNum1}-${lotteryPlay.playNum2}"
           			data-title="赔率设置(${lotteryPlay.playName1}-${lotteryPlay.playName2})"
           			data-url="system/lotteryPlaySix/edit" href="">设置赔率</a>
           		</c:if>
           		<c:if test="${lotteryPlay.playNum1 != 8 && lotteryPlay.playNum1 != 16 && (lotteryPlay.playName2 == null || lotteryPlay.playName2 == '')}">
	        	<a class="btn btn-sm btn-info edit_link" 
	        		data-width="1050px",
           			data-id="${lotteryPlay.playNum1}-${lotteryPlay.playNum2}"
           			data-title="赔率设置(${lotteryPlay.playName1})"
           			data-url="system/lotteryPlaySix/edit" href="">设置赔率</a>
           		</c:if>
	        </td>
	    </tr>
    </c:forEach>
</c:if>

<c:if test="${data == null || data.items == null}">
	<tr>
		<td colspan="3"><div class="not-data">暂无数据</div></td>
	</tr>
</c:if>

<tr>
	<td colspan="3"><div id="pages" data-page="${data.pageNo-1}" data-total="${data.totalSize}" data-epage="${data.pageSize}"></div></td>
</tr>