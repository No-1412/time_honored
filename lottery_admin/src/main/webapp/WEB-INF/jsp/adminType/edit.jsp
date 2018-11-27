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
                                <form role="form" class="form-horizontal" id="form" data-url="system/adminType/editSubmit">
                                	<input name="id" value="${data.adminType.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" style="text-align:left">名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.adminType.name}" placeholder="请输入名称">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" style="text-align:left">菜单权限：</label>
                                        <div class="col-sm-5">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:forEach var="menu" items="${data.menus}">
                                    	<div class="form-group">
                                    		<label class="col-sm-2 control-label">${menu.name}</label>
                                    		<div class="col-sm-5" style="width:80%;">
                                    			<c:forEach var="subMenu" items="${menu.subMenuList}">
	                                    			<label class="checkbox-inline">
	                                                	<input cls="{required:true}" name="menuId" type="checkbox" value="${subMenu.id}"  ${subMenu.checked}>${subMenu.name}
	                                                </label>
                                                </c:forEach>
                                    		</div>
                                    		<div class="col-sm-5 form-control-static"></div>
                                    	</div>
                                    </c:forEach>
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