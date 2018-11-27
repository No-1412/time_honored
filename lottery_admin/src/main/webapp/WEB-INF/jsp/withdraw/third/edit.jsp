<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2{width: 120px;}
	</style>
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/withdrawThird/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型：</label>
                                        <div class="col-sm-5">
                                            <select id="pay_type" cls="{required:true}" class="form-control" name="type" >
                                            	<c:forEach var="item" items="${data.expand.thirdList}">
                                            	<option value="${item.key}" label="${item.value}" ${data.type==item.key?"selected":""} />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商户号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="merid" class="form-control" value="${data.merid}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">终端号：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="terid" class="form-control" value="${data.terid}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公钥：</label>
                                        <div class="col-sm-5">
                                            <textarea type="text" name="publicKey" class="form-control">${data.publicKey}</textarea>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">私钥：</label>
                                        <div class="col-sm-5">
                                        	<textarea type="text" name="privateKey" class="form-control">${data.privateKey}</textarea>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Api Key：</label>
                                        <div class="col-sm-5">
                                            <textarea type="text" name="apiKey" class="form-control">${data.apiKey}</textarea>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">通知域名：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="notifyUrl" class="form-control" value="${data.notifyUrl}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status" >
                                           		<option value="1" label="启用" ${data.status=='1'?"selected":""} />
                                           		<option value="-1" label="停用" ${data.status=='-1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">显示顺序：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="sort" class="form-control" value="${data.sort}">
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
	    requirejs(["jquery","form","UMeditor","um.zh"],function($,form,UM){
	        form();//表单
	    });
    </script>
</body>
</html>