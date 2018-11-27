<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
	   	<label class="col-lbl-left" style="margin-bottom: 0px;line-height: 25px;">快捷选时：</label>
		<input id="time_yesterday" type="button" value="昨天">
		<input id="time_week" type="button" value="本周">
		<input id="time_last_week" type="button" value="上周">
		<input id="time_month" type="button" value="本月">
		<input id="time_last_month" type="button" value="上月">
	   
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">开始日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="datestart" name="timestart" value="" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">结束日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="dateend" name="timeend" value="" class="input-sm form-control">
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">推荐人：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="memberCode" class="input-sm form-control" value="">
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                            </div>
                                        </div>
                                        <input type="hidden" name="memberId" value="${data}">
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>推荐人</th>
                                	<th>会员数</th>
                                	<th>充值</th>
                                    <th>提款</th>
                                    <th>下注</th>
                                    <th>中奖</th>
                                    <th>返水</th>
                                    <th>输赢</th>
                                    <th>可获收益</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/spread/getList">
								 <tr>
				                     <td colspan="9"><div class="not-data">数据加载中...</div></td>
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
	<script type="text/javascript">
		var today = '';
		var yesterday = '${quickTime.yesterday}';
		var weekBegin = '${quickTime.weekBegin}';
		var weekEnd = '${quickTime.weekEnd}';
		var lastWeekBegin = '${quickTime.lastWeekBegin}';
		var lastWeekEnd = '${quickTime.lastWeekEnd}';
		var monthBegin = '${quickTime.monthBegin}';
		var monthEnd = '${quickTime.monthEnd}';
		var lastMonthBegin = '${quickTime.lastMonthBegin}';
		var lastMonthEnd = '${quickTime.lastMonthEnd}';
	</script>
</body>
</html>