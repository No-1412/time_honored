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
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">条件：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select class="form-control1" name="idx">
	                                       		<option value="1" label="账号" />
	                                       		<option value="2" label="ID" />
	                                       		<option value="3" label="推广链接" />
	                                       	</select>
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">:：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="value" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">状态：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 12%;">
	                                        <select class="form-control1" name="status">
	                                        	<option value="" label="全部" />
	                                       		<option value="0" label="待审核" />
	                                       		<option value="1" label="正常" />
	                                       		<option value="-1" label="停用" />
	                                       	</select>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="搜索"></span>
                                                &nbsp;
                                                <!-- <input type="submit" value="添加" class="btn btn-sm btn-primary add_link" data-url="system/agent/edit"></span> -->
                                            </div>
                                        </div>
                                    </div>
                                    代理商专属推广地址是:http://域名/?p=ID号,独立域名的代理商不受此限制
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>账号</th>
                                    <th>姓名</th>
                                    <th>上层ID</th>
                                    <th>分层</th>
                                    <th>状态</th>
                                    <th>推广链接</th>
                                    <th>创建时间</th>
                                    <th width="250">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/agent/getList">
								 <tr>
				                     <td colspan="9"><div class="not-data">数据加载中...</div></td>
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
</body>
</html>