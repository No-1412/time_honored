<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2{width: 16%;}
		.col-sm-5{width: 40%;}
	</style>
</head>

<body>
    <div class="row clearfix">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <form role="form" class="form-horizontal" id="form" data-reload="1" data-url="system/config/jslhcDrawTypeSubmit">
                            	<c:if test="${admin.isAdmin==1}">
                            	<div class="form-group">
                                    <label class="col-sm-2 control-label">开奖方式：</label>
                                    <div class="col-sm-5">
                                        <label class="radio-inline">
                                            <input type="radio" ${data.draw_self_jslhc_type==1?"checked":""} value="1" name="type">自动</label>
                                        <label class="radio-inline">
                                            <input type="radio" ${data.draw_self_jslhc_type==0?"checked":""} value="0" name="type">手动</label>
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                </c:if>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">随机开奖次数：</label>
                                    <div class="col-sm-5">
                                    	<input type="number" value="${data.draw_self_jslhc_random_times}" name="times">
                                    </div>
                                    <div class="col-sm-5 form-control-static"></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-9">
                                      <input type="submit" class="btn btn-info" value="保存">
                                      <input type="button" id="colse-btn" class="btn btn-danger" style="display: none;" value="取消">
                                    </div>
                                </div>
                            </form>
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