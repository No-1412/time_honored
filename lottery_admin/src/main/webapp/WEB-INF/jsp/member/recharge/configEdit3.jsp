<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2{width: 20%;}
		.col-sm-5{width: 40%;}
	</style>
</head>

<body>
    <div class="row clearfix">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <form role="form" class="form-horizontal" id="form" data-reload="1" data-url="system/recharge/configEditSubmit3">
                            	<div class="form-group">
                                    <label class="col-sm-2 control-label">活动开关：</label>
                                    <div class="col-sm-5">
                                        <label class="radio-inline">
                                            <input id="r_open" type="radio" ${data.recharge_activity3_set=='3-1'?"checked":""} value="3-1" name="isOpen">开启</label>
                                        <label class="radio-inline">
                                            <input id="r_close" type="radio" ${data.recharge_activity3_set=='3-0'?"checked":""} value="3-0" name="isOpen">关闭</label>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">活动时间：</label>
                                    <div class="col-sm-5" style="width: 20%;">
                                        <input class="form-control" id="spread_day1" type="text" name="dateTo" value="${data.recharge_activity3_dateTo}">
                                    </div>
                                     <div class="col-sm-5" style="width: 20%;">
                                        <input class="form-control" id="spread_day2" type="text" name="dateEnd" value="${data.recharge_activity3_dateEnd}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">需达打码量倍数：</label>
                                    <div class="col-sm-5">
                                    	<input type="number" name="dmlTimes" class="form-control" value="${data.recharge_activity3_allTimes}" placeholder=""></input>
                                    </div>
                                    <div class="col-sm-5 form-control-static">(0表示不计算活动打码量)</div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">彩金打码量倍数：</label>
                                    <div class="col-sm-5">
                                    	<input type="number" name="addDmlTimes" class="form-control" value="${data.recharge_activity3_dml_times}" placeholder=""></input>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-9">
                                      <input type="submit" class="btn btn-info btnSubmit" value="保存">
                                      <input type="button" id="colse-btn" class="btn btn-danger" style="display: none;" value="取消">
                                      <jsp:useBean id="time" class="java.util.Date"/>  
                                      <fmt:formatDate value="${time}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="nowDate"/> 
                                      <fmt:formatDate value="${time}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" var="nowTime"/> 
                                      
                                      <c:if test="${nowDate gt data.recharge_activity3_dateEnd}">
                                      	 <c:if test="${nowTime gt data.recharge_activity3_excuteTime}">
                                      		<input type="button" class="btn btn-info btnExcute" value="执行派送">
                                      	</c:if>
                                      </c:if>
                                      
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
    <script type="text/javascript">
	    requirejs(["jquery","form"],function($,form){
	        form();
	        
	        $('#r_open').on('click', function() {
	        	$('#form').find("input[type=number]").each(function() {
					$(this).prop("disabled", false);
        		});
	        	
	        	$("#spread_day1").prop("disabled", false);
	        	$("#spread_day2").prop("disabled", false);
	        	$(".btnExcute").prop("disabled", false);
	        	
	        })
	        
	        $('#r_close').on('click', function() {
	        	$('#form').find("input[type=number]").each(function() {
					$(this).prop("disabled", true);
        		});
	        	$("#spread_day1").prop("disabled", true);
	        	$("#spread_day2").prop("disabled", true);
	        	$(".btnExcute").prop("disabled", true);
	        })
	        
	        if($('#r_close').prop('checked')) {
	        	$('#form').find("input[type=number]").each(function() {
					$(this).prop("disabled", true);
        		});
	        	
	        	$("#spread_day1").prop("disabled", true);
	        	$("#spread_day2").prop("disabled", true);
	        	$(".btnExcute").prop("disabled", true);
	        }
	    });
	    
	    requirejs(['jquery','layer', "datepicker"], function($,layer) {
			
			$("#spread_day1").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
			
			$("#spread_day2").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
			
			 $(".btnSubmit").on("click", function(e) {
				 var spread_day1 = $('#spread_day1').val();
				 var spread_day2 = $('#spread_day2').val();
				
			   if(spread_day1 == null || spread_day1 == '') {
				   layer.msg("开始日期不能为空！", {icon: 1, time: 1000});
				   return false;
			   }
			   if(spread_day2 == null || spread_day2 == '') {
				   layer.msg("结束日期不能为空！", {icon: 1, time: 1000});
				   return false;
			   }
			});
			 
			 $(".btnExcute").on("click", function(e) {
			   	var spread_day1 = $('#spread_day1').val();
				var spread_day2 = $('#spread_day2').val();
				layer.confirm("活动时间："+spread_day1+"至："+spread_day2+",是否执行派送？", function() {
                	var index = layer.load();
                    $.ajax({
                    	url: 'system/job/activityExcuteSubmit',
                        type: "post"
                    }).done(function(results) {
                    	layer.close(index);
                    	if (results.status == "200") {
                            layer.msg("执行派送成功", {
                                icon: 1,
                                time: 1000
                            }, function() {
                            	$(".btnExcute").prop("disabled", true);
                            });
                        } else {
                            layer.msg(results.description, {
                                icon: 2,
                                time: 2000
                            });
                        }
                    });
                });
			});
		})
    </script>
</body>
</html>