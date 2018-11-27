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
                                <form role="form" class="form-horizontal" id="form" data-url="system/config/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">参数名：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">参数标识：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" ${data.id!=null||!data.expand.isAdmin?"readonly":""} type="text" name="nid" class="form-control" value="${data.nid}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">参数值：</label>
                                        <div class="col-sm-7">
                                        	<textarea style="width:100%;" type="text" name="value" class="form-control" placeholder="">${data.value}</textarea>
                                        </div>
                                        <div class="col-sm-3 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">参数值(图片)：</label>
                                        <div class="col-sm-5">
                                            <a href="javascript:;" id="single_pic_upload">选择上传图片</a>
                                            <div class="uploader-list">
                                            	<c:if test="${data.image != 'NVL'}">
                                            		<div class="file-item thumbnail"><img src="${data.image}"><div class="info">点击删除</div></div>
                                            	</c:if>
                                            </div>
                                            <input type="hidden" name="image" value="${data.image}"/>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${data.expand.isAdmin}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否显示：</label>
                                         <div class="col-sm-5">
                                            <select class="form-control" name="type">
                                            	<option value="1" ${data.type==1?"selected":""}>是</option>
                                            	<option value="0" ${data.type==0?"selected":""}>否</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-3 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">显示顺序：</label>
                                         <div class="col-sm-5">
                                            <input type="number" name="sort" class="form-control" value="${data.sort}" placeholder="">
                                        </div>
                                        <div class="col-sm-3 form-control-static"></div>
                                    </div>
                                    </c:if>
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
        requirejs(["jquery","form","uploader","UMeditor","um.zh"],function($,form,uploader,UM){
            form();//表单
            uploader({upload:"single_pic_upload"});//单图上传
        });
    </script>
    </script>
</body>
</html>