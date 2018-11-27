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
                                <form role="form" class="form-horizontal" id="form" data-url="system/rechargeChannel/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">通道编码：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="code" class="form-control" value="${data.code}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">通道名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="type">
                                            	<option value="" label="请选择" />
                                            	<option value="1" label="微信" ${data.type == 1 ? "selected" : ""} />
                                            	<option value="2" label="支付宝" ${data.type == 2 ? "selected" : ""} />
                                            	<option value="3" label="微信+支付宝" ${data.type == 3 ? "selected" : ""} />
                                            	<option value="4" label="网银" ${data.type == 4 ? "selected" : ""} />
                                            	<option value="7" label="微信+支付宝+QQ钱包" ${data.type == 7 ? "selected" : ""} />
                                            	<option value="8" label="其它" ${data.type == 8 ? "selected" : ""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">返回类型：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="returnType" >
                                            	<option value="2" label="页面" ${data.returnType == 2 ? "selected" : ""} />
                                           		<option value="1" label="二维码" ${data.returnType == 1 ? "selected" : ""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">对应类名：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="clazzName" class="form-control" value="${data.clazzName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status" >
                                            	<option value="" label="请选择" />
                                            	<option value="1" label="开启" ${data.status == 1 ? "selected" : ""} />
                                           		<option value="0" label="关闭" ${data.status == 0 ? "selected" : ""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">排序：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="sort" class="form-control" value="${data.sort}">
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