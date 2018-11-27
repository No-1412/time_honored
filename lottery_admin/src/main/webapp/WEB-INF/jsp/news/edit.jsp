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
                                <form role="form" class="form-horizontal" id="form" data-url="system/news/editSubmit">
                                	<input name="id" value="${news.id}" type="text" style="display:none;">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="type" class="form-control" value="${news.type}" placeholder="新闻|技巧">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">来源：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="source" class="form-control" value="${news.source}" placeholder="转载">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="title" class="form-control" value="${news.title}" placeholder="请输入标题">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">摘要：</label>
                                        <div class="col-sm-5">
                                            <textarea cls="{required:true}" type="text" name="zhaiYao" class="form-control" placeholder="请输入摘要">${news.zhaiYao}</textarea>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">排序：</label>
                                        <div class="col-sm-2">
                                          <input  required="required" name="order" class="form-control"  value="${news.order}"   maxlength="4" type="text" onkeyup="value=value.replace(/[^\d]/g,'') " >
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">内容：</label>
                                        <div class="col-sm-7">
                                        <textarea style="width:100%;" type="text" id="content" name="content" class="form-control" placeholder="请输入内容"></textarea>
                                        </div>
                                        <div class="col-sm-3 form-control-static"></div>
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
	    var content = '${content}';
	    requirejs(["jquery","form","uploader","UMeditor","um.zh"],function($,form,uploader,UM){
	        form();//表单
	        UM.getEditor('content',{initialFrameWidth:"100%"}).setContent(content);
	    });
    </script>
</body>
</html>