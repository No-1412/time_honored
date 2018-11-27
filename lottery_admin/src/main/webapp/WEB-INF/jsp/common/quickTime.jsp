<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<label class="col-lbl-left" style="margin-bottom: 0px;line-height: 25px;">快捷选时：</label>
<input id="time_today" type="button" value="今天">
<input id="time_yesterday" type="button" value="昨天">
<input id="time_week" type="button" value="本周">
<input id="time_last_week" type="button" value="上周">
<input id="time_month" type="button" value="本月">
<input id="time_last_month" type="button" value="上月">

<script type="text/javascript">
	var today = '${quickTime.today}';
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