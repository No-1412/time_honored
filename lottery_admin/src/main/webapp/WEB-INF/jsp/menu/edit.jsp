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
                                <form role="form" class="form-horizontal" id="form" data-url="system/menu/editSubmit">
                                	<input name="id" value="${data.menu.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">菜单名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.menu.name}" placeholder="请输入名称">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">菜单类型：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="lx">
                                            	<option value="1" label="菜单" ${data.menu.pid!=null?"selected":""} />
                                            	<option value="0" label="菜单组" ${data.menu.pid==null?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">上级菜单：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:false}" class="form-control" name="pid">
                                            	<option value="" label="请选择" />
                                            	<c:forEach var="op" items="${data.topMenu}">
                                            		<option value="${op.id}" label="${op.name}" ${data.menu.pid.toString().equals(op.id.toString())?"selected":""} />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">菜单URL：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:false}" type="text" name="url" class="form-control" value="${data.menu.url}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">顺序：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="sort" class="form-control" value="${data.menu.sort}">
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
        requirejs(["jquery","form"],function($,form){
            form();
        });
    </script>
</body>
</html>