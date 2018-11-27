<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="member/message/batchSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
									<input name="type" value="1" type="text" style="display:none;">
									
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员层级：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="level" class="form-control" value="0" placeholder="">发送所有分层请填写0
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">代理ID：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="agent" class="form-control" value="" placeholder="">发送所有代理请填写0
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="title" class="form-control" value="" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">内容：</label>
                                        <div class="col-sm-5">
                                        	<textarea rows="10" cols="70" name="content"></textarea>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="确定">
                                          <input type="button" id="colse-btn" class="btn btn-danger" value="取消">
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
	    var detail = '${detail}';
	    requirejs(["jquery","form","UMeditor","um.zh"],function($,form,UM){
	        form();//表单
	    });
    </script>
</body>
</html>