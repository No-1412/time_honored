<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/agentLevel/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">分层：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}" placeholder="请输入分层名称">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="remark" class="form-control" value="${data.remark}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${data.id!='1'}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否启用：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status">
                                            	<option value="1" label="启用" ${data.status=='1'?"selected":""} />
                                            	<option value="-1" label="停用" ${data.status=='-1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
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
        requirejs(["jquery","form"],function($,form){
            form();//表单
        });
    </script>
</body>
</html>