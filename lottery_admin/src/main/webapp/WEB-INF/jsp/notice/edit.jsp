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
                                <form role="form" class="form-horizontal" id="form" data-url="system/notice/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公告标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="title" class="form-control" value="${data.title}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否弹窗提示：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:false}" class="form-control" name="isPop">
                                            	<option value="1" label="是" ${data.isPop==1?"selected":""} />
                                            	<option value="0" label="否" ${data.isPop==0?"selected":""} />
                                            </select>
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