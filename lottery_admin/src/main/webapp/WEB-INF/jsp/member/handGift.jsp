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
                                <form role="form" class="form-horizontal" id="form" data-url="system/member/handGiftSubmit">
                                	<input name="memberId" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号：</label>
                                        <div class="col-sm-5">
                                            <input ${data.id != null?"readonly":""} name="code" type="text" class="form-control" value="${data.code}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">彩金金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="giftAmount" class="form-control" value="">
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;width: 35%;">>=1</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">本金金额：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="amount" class="form-control" value="">
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;width: 35%;">只用于计算打码量,没有其它作用</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">打码量倍数：</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="times">
                                            	<option value="0" label="不计算" />
                                            	<option value="1" label="1倍" selected />
                                            	<<c:forEach begin="2" end="50" var="i" step="1">
                                            	<option value="${i}" label="${i}倍" />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;width: 35%;">打码量=(本金+彩金)*打码量倍数</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="remark" class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;width: 35%;">请仔细填写备注信息,给玩家知道原因</label>
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