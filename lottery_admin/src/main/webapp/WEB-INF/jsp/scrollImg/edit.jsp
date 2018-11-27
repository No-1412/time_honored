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
                                <form role="form" class="form-horizontal" id="form" data-url="system/scrollImg/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
									<div class="form-group">
                                        <label class="col-sm-2 control-label">是否显示：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:false}" class="form-control" name="status">
                                            	<option value="1" label="显示" ${data.status==1?"selected":""} />
                                            	<option value="0" label="不显示" ${data.status==0?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">排序：</label>
                                        <div class="col-sm-2">
                                          <input  required="required" name="order" class="form-control"  value="${data.order}"   maxlength="4" type="text" onkeyup="value=value.replace(/[^\d]/g,'') " >
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">PC图片：</label>
                                        <div class="col-sm-5">
                                            <a href="javascript:;" id="single_pic_upload_pc">选择上传图片</a>
                                            <div class="uploader-list">
                                            	<c:if test="${data.pc != ''}">
                                            		<div class="file-item thumbnail"><img src="${data.pc}"><div class="info">点击删除</div></div>
                                            	</c:if>
                                            </div>
                                            <b style="color:red">大小(px):743 x 285</b>
                                            <input type="hidden" name="pc" />
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">WAP图片：</label>
                                        <div class="col-sm-5">
                                            <a href="javascript:;" id="single_pic_upload_wap">选择上传图片</a>
                                            <div class="uploader-list">
                                            	<c:if test="${data.wap != ''}">
                                            		<div class="file-item thumbnail"><img src="${data.wap}"><div class="info">点击删除</div></div>
                                            	</c:if>
                                            </div>
                                            <b style="color:red">大小(px):375 x 157</b>
                                            <input type="hidden" name="wap" />
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
	    requirejs(["jquery","form","uploader"],function($,form,uploader){
	        form();
	        
	        uploader({upload:"single_pic_upload_pc"});
	        uploader({upload:"single_pic_upload_wap"});
	    });
    </script>
</body>
</html>