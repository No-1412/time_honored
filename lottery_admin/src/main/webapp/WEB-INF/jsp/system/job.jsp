<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<style type="text/css">
		label {width: 150px;text-align: right;}
	</style>
</head>

<body class="gray-bg">
	<br><br>
	<label>统计任务：</label><input id="count_day" type="text"><input id="count_btn" type="button" value="提交">
	
	<br><br><label>报表任务：</label><input id="report_day" type="text"><input id="report_btn" type="button" value="提交">
	
	<br><br><label>推荐收益任务：</label><input id="spread_day" type="text"><input id="spread_btn" type="button" value="提交">
	
	<br><br><label>试玩账号清理任务：</label><input id="clean_day" type="text"><input id="clean_btn" type="button" value="提交">
	
	<script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
		requirejs(['jquery','layer', "datepicker"], function($,layer) {
			$("#count_day").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
			$("#report_day").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
			$("#spread_day").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
			$("#clean_day").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
			
			$("#count_btn").on("click", function(e) {
				submit('count');
            });
			$("#report_btn").on("click", function(e) {
				submit('report');
            });
			$("#spread_btn").on("click", function(e) {
				submit('spread');
            });
			$("#clean_btn").on("click", function(e) {
				submit('clean');
            });
			
			function submit(jobCode) {
			   var countDate = $('#'+jobCode+'_day').val();
			   if(countDate == null || countDate == '') {
				   layer.msg("日期不能为空！", {icon: 1, time: 1000});
				   return;
			   }
			   var index = layer.load();
	           $.ajax({
	               url: 'system/job/submit',
	               type: "post",
	               data: {jobCode:jobCode, countDate:countDate}
	           }).done(function(results) {
	        	   layer.close(index);
	               if (results.status == "200") {
	                   layer.open({content:"操作成功"});
	               } else {
	            	   layer.open({content:"results.description"});
	               }
	           });
			}
		})
	</script>
</body>
</html>