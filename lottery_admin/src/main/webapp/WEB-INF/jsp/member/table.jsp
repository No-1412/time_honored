<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content" style="padding-top: 2px;padding-right: 2px;padding-left: 2px;">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">条件：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select class="form-control1" name="idx">
	                                       		<option value="1" label="账号" ${data.key != null && data.key == '1'? "selected" : ""}/>
	                                       		<option value="2" label="ID" />
	                                       		<option value="3" label="姓名" />
	                                       		<option value="4" label="代理商" ${data.key != null && data.key == '4'? "selected" : ""}/>
	                                       		<option value="5" label="余额大于" />
	                                       		<option value="6" label="打码量大于" />
	                                       		<option value="7" label="输赢大于" />
	                                       		<option value="8" label="输赢小于" />
	                                       		<option value="9" label="分层" />
	                                       		<option value="14" label="手机号" />
	                                       		<option value="10" label="QQ" />
	                                       		<option value="11" label="备注" />
	                                       		<option value="12" label="注册IP" />
	                                       		<option value="13" label="登录IP" />
	                                       	</select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">:：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="value" class="input-sm form-control" value="${data.value}">
                                        </div>
                                        <div class="col-lbl-1">
                                    		<label class="col-lbl-left" style="margin-left: 10px;">会员类型：</label>
                                        </div>
                                        <div class="col-sm-2 col-sm-a zero_pad_left" style="width: 120px;">
                                        	<select name="memberType" class="form-control1">
	                                        	<option value="0">会员</option>
	                                        	<option value="2">试玩账号</option>
	                                        	<option value="-1">冻结会员</option>
	                                        	<option value="-2">停用会员</option>
	                                        </select>
                                        </div>
                                        
                                        <div class="col-sm-2 zero_pad_left" style="margin-top: 5px;width:320px;margin-left: 15px;">
                                            <input type="checkbox" name="isValid" value="1"><label>有效会员</label>
                                            <input type="checkbox" name="sortByWin" value="1"><label>按输赢排序</label>
<!--                                             <label>按充值金额:</label><input type="text" style="width:60px;" value="" name="newAmount"> -->
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">时间：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select class="form-control1" name="dateType">
	                                       		<option value="1" label="注册时间" />
	                                       		<option value="2" label="登录时间" />
	                                       	</select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">:：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timestart" name="dateFrom" value="" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">--&nbsp;</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timeend" name="dateTo" value="" class="input-sm form-control">
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                                &nbsp;
                                                <input type="button" class="btn btn-sm btn-primary add_link" value="添加测试账号" data-url="system/member/test"></span>
                                                <c:if test="${admin.isAdmin==1}">
                                                &nbsp;
                                                <input type="button" class="btn btn-sm btn-primary edit_link"
                                            		   data-height="160px"
                                            		   data-width="450px;"
                                            		   data-title="调整代理"
                                            		   data-url="system/member/adjustAgent" value="调整代理">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th width="100">账号/ID</th>
                                    <th width="100">姓名</th>
                                    <th width="40">启用/<br>冻结</th>
                                    <th>分层</th>
                                    <th>余额</th>
                                    <th>冻结金额</th>
                                    <th>输赢/正赢</th>
                                    <th width="100">提款打码量</th>
                                    <th width="60">代理商</th>
                                    <th width="45">登录日志</th>
                                    <th width="85">注册时间</th>
                                    <th width="70">备注</th>
                                    <th width="160">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/member/getList">
								 <tr>
				                     <td colspan="14"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
		var today = null;
	</script>
</body>
</html>