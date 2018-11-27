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
                                    		<label class="col-lbl-left">通道名称：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="name" class="input-sms form-control" value="">
                                        </div>
                                        <div class="col-lbl-left">
                                            <div class="input-group">
                                                 <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
	                                            <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="system/rechargeChannel/edit"></span>
		                                     	&nbsp;
                                                <input style="display: none;" type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>通道编码</th>
                                    <th>通道名称</th>
                                    <th>类型</th>
                                    <th>返回类型</th>
                                    <th>状态</th>
                                    <th>显示顺序</th>
                                    <th>创建时间</th>
                                    <th>修改时间</th>
                                    <th width="150">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/rechargeChannel/getList">
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