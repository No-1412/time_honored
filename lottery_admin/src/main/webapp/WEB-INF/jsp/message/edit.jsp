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
                                <form role="form" class="form-horizontal" id="form" data-url="member/message/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
									<input name="type" value="1" type="text" style="display:none;">
									
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员账号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="memberCode" class="form-control" value="${data.memberCode}" placeholder="">发送所有会员请填写ALL，发送多个会员用逗号,隔开
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="title" class="form-control" value="${data.title}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">内容：</label>
                                        <div class="col-sm-5">
                                        	<textarea rows="10" cols="70" name="content">${data.content}</textarea>
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
	    requirejs(["jquery","form","uploader","UMeditor","um.zh"],function($,form,uploader,UM){
	        form();//表单
	        UM.getEditor('detail',{initialFrameWidth:"100%"}).setContent(detail);
	        uploader({upload:"single_pic_upload"});//单图上传
	    });
    </script>
</body>
</html>