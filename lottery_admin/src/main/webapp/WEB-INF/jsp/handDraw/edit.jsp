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
                                <form role="form" class="form-horizontal" id="form" data-url="system/handDraw/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<input name="type" value="${type}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">彩种ID：</label>
                                        <div class="col-sm-5">
                                            <select id="num" class="form-control" name="num">
                                    			<c:forEach var="lotteryType" items="${lotteryTypeList}">
                                            	<option value="${lotteryType.num}" label="${lotteryType.name}" />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">期数：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="period" class="form-control" value="${data.period}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${type==2}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员账号：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="memberCode" class="form-control" value="">
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