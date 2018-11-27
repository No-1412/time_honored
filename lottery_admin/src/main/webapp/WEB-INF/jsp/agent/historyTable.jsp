<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                        	<caption>
	                   			<form action="" id="tableForm">
	                   				<div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left"></label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select class="form-control1" name="yearMonth">
	                                        	<c:forEach var="item" items="${data}">
	                                       		<option value="${item}" label="${item}" />
	                                       		</c:forEach>
	                                       	</select>
                                        </div>
	                                   <div class="col-sm-3">
	                                       <div class="input-group">
	                                       		<input type="submit" class="btn btn-sm btn-primary" value="搜索"></span>
	                                       </div>
	                                   </div>
	                           		</div>
	                           </form>
	                       </caption>
                       
                            <thead>
                                <tr>
                                     <th>代理商</th>
                                    <th>输赢</th>
                                    <th>虚拟入款</th>
                                    <th>出款费用</th>
                                   	<th>入款总额</th>
                                   	<th>出款总额</th>
                                   	<th>总返水</th>
                                   	<th>佣金比例</th>
                                   	<th>可获佣金</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="agent/back/getHistoryList">
								 <tr>
				                     <td colspan="9"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
	                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>