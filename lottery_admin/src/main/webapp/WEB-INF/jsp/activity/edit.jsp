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
                                <form role="form" class="form-horizontal" id="form" data-url="system/activity/editSubmit">
                                	<input name="id" value="${activity.id}" type="text" style="display:none;">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">活动标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="title" class="form-control" value="${activity.title}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">活动时间：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="adate" class="form-control" value="${activity.adate}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">活动对象：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="object" class="form-control" value="${activity.object}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">活动内容：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="content" class="form-control" value="${activity.content}" placeholder="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">活动开关：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:false}" class="form-control" name="status">
                                            	<option value="1" label="开启" ${activity.status==1?"selected":""} />
                                            	<option value="0" label="关闭" ${activity.status==0?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">排序：</label>
                                        <div class="col-sm-2">
                                          <input  required="required" name="order" class="form-control"  value="${activity.order}"   maxlength="4" type="text" onkeyup="value=value.replace(/[^\d]/g,'') " >
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">图片：</label>
                                        <div class="col-sm-5">
                                            <a href="javascript:;" id="single_pic_upload">选择上传图片</a>
                                            <div class="uploader-list">
                                            	<c:if test="${activity.image != ''}">
                                            		<div class="file-item thumbnail"><img src="${activity.image}"><div class="info">点击删除</div></div>
                                            	</c:if>
                                            </div>
                                            <input type="hidden" name="image" />
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">活动详情：</label>
                                        <div class="col-sm-7">
                                        <textarea style="width:100%;" rows="10" type="text" name="detail" class="form-control" placeholder="">${activity.detail}</textarea>
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
	    var detail = '${detail}';
	    requirejs(["jquery","form","uploader"],function($,form,uploader){
	        form();//表单
	        uploader({upload:"single_pic_upload"});//单图上传
	    });
    </script>
</body>
</html>