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
                                    		<label class="col-lbl-left">参数名：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="name" class="input-sm form-control" value="">
                                        </div>
                                        
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                                <c:if test="${data}">
                                                &nbsp;
                                                <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="system/config/edit"></span>
                                                </c:if>
                                                &nbsp;
                                                <input id="app_set" type="button" value="APP优惠活动管理" class="btn btn-sm btn-primary"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th width="180">参数名</th>
                                    <th width="100">参数标识</th>
                                    <th>参数值</th>
                                    <th width="150">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/config/getList">
								 <tr>
				                     <td colspan="4"><div class="not-data">数据加载中...</div></td>
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
	    requirejs(["jquery", 'layer'],function($, layer){
	    	$('#app_set').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "下载APP赠送彩金活动管理",
	     		  anim: 2,
	     		  area:['830px', '390px'],
	     		  content: ['system/config/app']
	     		});
            });
	    });
	</script>
</body>
</html>