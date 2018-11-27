<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2 {
		    width: 12%;
		}
		.col-sm-5 {
		    width: 20%;
		}
	</style>
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-reload="0" data-url="system/tipVideo/submit" enctype="multipart/form-data">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<div class="form-group">
                                        <label class="col-sm-2 control-label">公司入款提示音：</label>
                                        <div class="col-sm-5">
                                            <input type="file" name="rechargeVideo1" class="form-control" value="${data.rechargeVideo}">
                                        </div>
                                        
                                        <label class="col-sm-2 control-label">提示音长度(秒)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="rechargeTime" class="form-control" value="${data.rechargeTime}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       <label class="col-sm-2 control-label">线上入款提示音：</label>
                                        <div class="col-sm-5">
                                            <input type="file" name="onlineVideo1" class="form-control" value="${data.onlineVideo}">
                                        </div>
                                        
                                        <label class="col-sm-2 control-label">提示音长度(秒)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="onlineTime" class="form-control" value="${data.onlineTime}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">出款提示音：</label>
                                        <div class="col-sm-5">
                                            <input type="file" name="withdrawVideo1" class="form-control" value="${data.withdrawVideo}">
                                        </div>
                                        
                                        <label class="col-sm-2 control-label">提示音长度(秒)：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="withdrawTime" class="form-control" value="${data.withdrawTime}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="保存">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
    <script type="text/javascript">
	    requirejs(["jquery","form","uploader","UMeditor","um.zh"],function($,form,uploader,UM){
	        form();
	        uploader({upload:"single_pic_upload"});
	    });
    </script>
</body>
</html>