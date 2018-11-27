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
                                <form role="form" class="form-horizontal" id="form" data-url="system/handDraw/thirdSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">彩种名称：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="name" class="form-control" value="${data.expand.lotteryTypeName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">期数：</label>
                                        <div class="col-sm-5">
                                            <input readonly type="text" name="period" class="form-control" value="${data.period}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开奖内容：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="content" class="form-control" value="${data.content}">开奖号码中间用逗号(,)隔开
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${data.num == 18}">
                                    	<div class="form-group">
	                                        <label class="col-sm-2 control-label">对应生肖：</label>
	                                        <div class="col-sm-5">
	                                            <input readonly type="text" name="originalContent" class="form-control" value="${data.originalContent}">对应生肖中间用逗号(,)隔开
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
                                    <c:if test="${data.num == 18}">
                                    <div class="form-group">
                                    	<b style="color: red;">温馨提示：如果六合彩开奖生肖不对，请到系统管理--系统参数设置，搜索“六合彩生肖号码”进行编辑修改，修改完后请点击上面的“确定”按钮，重新获取最新的生肖！<b><br>
                                    	<img style="width: 90%;" alt="" src="assets/images/lhc.png">
                                    	<img style="width: 90%;" alt="" src="assets/images/lhc1.png">
                                    </div>
                                    </c:if>
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