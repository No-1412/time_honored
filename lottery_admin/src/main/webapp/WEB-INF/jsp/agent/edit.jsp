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
                                <form role="form" class="form-horizontal" id="form" data-url="system/agent/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<input name="memberId" value="${data.memberId}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">真实姓名：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">代理分层：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="level">
                                            	<c:forEach var="item" items="${data.expand.agentLevel}">
                                            	<option value="${item.key}" label="${item.value}" ${item.key==data.level?"selected":""} />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员分层：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="userLevel">
                                            	<c:forEach var="item" items="${data.expand.levelList}">
                                            	<option value="${item.level}" label="${item.name}" ${item.level==data.userLevel?"selected":""} />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否启用：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status">
                                            	<option value="0" label="待审核" ${data.status=='0'?"selected":""} />
                                            	<option value="1" label="启用" ${data.status=='1'?"selected":""} />
                                            	<option value="-1" label="停用" ${data.status=='-1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">QQ：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="qq" class="form-control" value="${data.qq}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮箱：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="email" class="form-control" value="${data.email}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">手机：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="phone" class="form-control" value="${data.phone}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">推广链接：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="extUrl" class="form-control" value="${data.extUrl}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否显示欢迎页：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="isShowWelcome">
                                            	<option value="0" label="不显示" ${data.isShowWelcome=='0'?"selected":""} />
                                            	<option value="1" label="显示" ${data.isShowWelcome=='1'?"selected":""} />
                                            </select>
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
            form();//表单
        });
    </script>
</body>
</html>