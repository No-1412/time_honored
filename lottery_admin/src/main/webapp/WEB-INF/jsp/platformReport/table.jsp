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
                                    		<label class="col-lbl-left">平台名称：</label>
                                        </div>
                                    	<div class="col-sm-2 zero_pad_left">
                                    		<select id="platform_id" class="form-control" name="platformId">
                                    			<option value="" label="全部" />
                                    			<c:forEach var="platform" items="${data.platform}">
                                            	<option value="${platform.id}" label="${platform.name}" />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">报表月份：</label>
                                        </div>
                                    	<div class="col-sm-2 zero_pad_left">
                                    		<select id="report_month" class="form-control" name="reportMonth">
                                    			<option value="" label="请选择" />
                                    			<c:forEach var="month" items="${data.monthList}">
                                            	<option value="${month}" label="${month}" />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">支付状态：</label>
                                        </div>
                                    	<div class="col-sm-2 zero_pad_left">
                                    		<select class="form-control" name="status">
                                    			<option value="" label="请选择" />
                                    			<option value="0" label="未付" />
                                    			<option value="1" label="已付" />
                                    			<option value="2" label="部分支付" />
                                    			<option value="3" label="不收" />
                                            </select>
                                        </div>
                                        
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input id="btn_refresh" type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                                &nbsp;
                                                <a class="btn btn-sm btn-primary gen-report">生成报表</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>平台名称</th>
                                    <th>报表月份</th>
                                    <th>报表金额</th>
                                    <th>应收金额</th>
                                    <th>状态</th>
                                    <th>系统维护费</th>
                                    <th>维护费备注</th>
                                    <th>优惠</th>
                                    <th>优惠备注</th>
                                    <th>计算公式</th>
                                    <th width="80">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/platformReport/getList">
								 <tr>
				                     <td colspan="12"><div class="not-data">数据加载中...</div></td>
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
	<script type="text/javascript">
	 requirejs(["jquery", 'layer'],function($, layer){
		$(document).on("click", "a.gen-report", function(e) {
			e.preventDefault();
			
			var platformId = $('#platform_id').val();
			var reportMonth = $('#report_month').val();
			if(reportMonth == null || reportMonth== '') {
				layer.msg('报表月份不能为空！', {icon: 2, time: 2000});
				return;
			}
			
	       	layer.confirm('确定要生成'+reportMonth+'的报表？', function() {
	       	   var index = layer.load();
	    	   
	       	$.ajax({
	               url: 'system/platformReport/genReport',
	               type: "post",
	               data: {
	            	   platformId: platformId,
	            	   reportMonth: reportMonth
	               }
	           }).done(function(results) {
	        	  layer.close(index);
	              if(results.status == "200") {
             	  	  layer.msg("报表生成成功", {
	                      icon: 1,
	                      time: 1500
	                  }, function() {
	                	  $("#tableForm").find("input[type=submit]").click();
	                  });
	              } else {
	                  layer.msg(results.description, {
	                      icon: 2,
	                      time: 3000
	                  });
	              }
	           });
	       });
		})
	 });
	</script>
</body>
</html>