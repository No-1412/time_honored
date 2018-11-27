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
                            <caption  style="display: none;">
                            	<form action="" id="tableForm">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>彩种名称</th>
                                    <th>开奖频率</th>
                                    <th>每天开奖期数</th>
                                    <th>提前封盘时间(秒)</th>
                                    <th>房间</th>
                                  	<th>默认房间</th>
                                    <th>显示顺序</th>
                                    <th>状态</th>
                                    <th>修改时间</th>
                                    <th width="150">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/lotteryType/getList">
								 <tr>
				                     <td colspan="10"><div class="not-data">数据加载中...</div></td>
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