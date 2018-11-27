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
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="memberCode" class="input-sm form-control" value="">
                                        </div>
                                        
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                            	<input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                            	 &nbsp;
	                                            <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="member/message/edit"></span>
	                                             &nbsp;
	                                            <input type="button" value="批量添加" class="btn btn-sm btn-primary add_link" data-url="member/message/batch"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th width="50">ID</th>
                                    <th width="80">会员账号</th>
                                    <th width="80">会员名称</th>
                                    <th width="120">标题</th>
                                    <th>活动内容</th>
                                    <th width="100">创建时间</th>
                                    <th width="100">修改时间</th>
                                    <th width="100">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="member/message/getList">
								 <tr>
				                     <td colspan="8"><div class="not-data">数据加载中...</div></td>
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