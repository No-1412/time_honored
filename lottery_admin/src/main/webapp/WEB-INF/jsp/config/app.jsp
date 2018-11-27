<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2{width: 16%;}
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
                            <form role="form" class="form-horizontal" id="form" data-reload="1" data-url="system/config/appSubmit">
                            	<div class="form-group">
                                    <label class="col-sm-2 control-label">活动开关：</label>
                                    <div class="col-sm-5">
                                        <label class="radio-inline">
                                            <input id="r_open" type="radio" ${data.app_download_set==1?"checked":""} value="1" name="isOpen">开启</label>
                                        <label class="radio-inline">
                                            <input id="r_close" type="radio" ${data.app_download_set==0?"checked":""} value="0" name="isOpen">关闭</label>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">赠送彩金：</label>
                                    <div class="col-sm-5">
                                    	<input type="number" name="amount" class="form-control" value="${data.app_download_amount}" placeholder=""></input>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">打码量倍数：</label>
                                    <div class="col-sm-5">
                                    	<input type="number" name="dmlTimes" class="form-control" value="${data.app_download_dml_times}" placeholder=""></input>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">最低充值金额：</label>
                                    <div class="col-sm-5">
                                    	<input type="number" name="recharge" class="form-control" value="${data.app_download_dml_recharge}" placeholder=""></input>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                               
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-9">
                                      <input type="submit" class="btn btn-info" value="保存">
                                      <input type="button" id="colse-btn" class="btn btn-danger" style="display: none;" value="取消">
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
	    var content = '${content}';
	    requirejs(["jquery","form"],function($,form){
	        form();
	        
	        $('#r_open').on('click', function() {
	        	$('#form').find("input[type=number]").each(function() {
					$(this).prop("disabled", false);
        		});
	        })
	        
	        $('#r_close').on('click', function() {
	        	$('#form').find("input[type=number]").each(function() {
					$(this).prop("disabled", true);
        		});
	        })
	        
	        if($('#r_close').prop('checked')) {
	        	$('#form').find("input[type=number]").each(function() {
					$(this).prop("disabled", true);
        		});
	        }
	    });
    </script>
</body>
</html>