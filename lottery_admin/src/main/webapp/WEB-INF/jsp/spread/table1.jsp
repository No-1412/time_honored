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
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                日期：${data.timestart} -- ${data.timeend}<input style="display: none;" type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                            </div>
                                        </div>
                                        <input type="hidden" name="memberId" value="${data.memberId}">
                                        <input type="hidden" name="memberCode" value="${data.memberCode}">
                                        <input type="hidden" name="timestart" value="${data.timestart}">
                                        <input type="hidden" name="timeend" value="${data.timeend}">
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>推荐人</th>
                                	<th>会员账号</th>
                                	<th>注册时间</th>
                                	<th>充值</th>
                                    <th>提款</th>
                                    <th>下注</th>
                                    <th>中奖</th>
                                    <th>返水</th>
                                    <th>输赢</th>
                                    <th>可获收益</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/spread/getList1">
								 <tr>
				                     <td colspan="11"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
                        </table>
                        <span style="color:red">每天7点生成前一天的统计数据，当天的统计数据需要到第二天的7点后才能查询</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>