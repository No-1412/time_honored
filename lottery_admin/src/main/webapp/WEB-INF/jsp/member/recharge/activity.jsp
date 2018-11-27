<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
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
                                    	<div class="col-sm-2">
                                    		 <select class="form-control" name="type" id="typeVal" onchange="changeType();">
	                                    			<c:forEach var="types" items="${data}">
	                                            		<option value="${types.index}" label="${types.typeName}" />
	                                            	</c:forEach>
	                                            </select>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input id="activity_add" type="button" value="添加" class="btn btn-sm btn-primary"></span>
                                                &nbsp;
                                                <input style="display: none;" type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
<!--                                                 <input id="activity_set" type="button" value="充值优惠管理" class="btn btn-sm btn-primary"></span> -->
                                                 &nbsp;
                                                <input id="activity3_set" type="button" value="活动管理" class="btn btn-sm btn-primary"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>充值金额</th>
                                    <th>赠送金额</th>
                                    <th>修改时间</th>
                                    <th width="250">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/recharge/getActivityList">
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
 	    	$('#activity_add').on('click', function() {
 	    		var title="";
 	    		var typeVal= $("#typeVal").val();
		    	if(typeVal==2){
		    		title="充值优惠管理";
		    	}else if(typeVal==3){
		    		title="双节充值优惠管理";
		    	}else if(typeVal==4){
		    		title="盈亏优惠管理";
		    	}else if(typeVal==5) {
		    		title="累计充值优惠管理";
		    	}
		    	
 				var _index = layer.open({
 	     		  type: 2,
 	     		  title: title,
 	     		  anim: 2,
 	     		  area:['830px', '360px'],
	     		  content: ['system/recharge/activityEdit?type=' + typeVal]
	     		});
            });
	    	
	    	$('#activity3_set').on('click', function() {
	    		var typeVal= $("#typeVal").val();
		    	var url=""
		    	var title="";
		    	if(typeVal==2){
		    		url="system/recharge/configEdit";
		    		title="充值优惠管理";
		    	}else if(typeVal==3){
		    		url="system/recharge/configEdit3";
		    		title="双节充值优惠管理";
		    	}else if(typeVal==4){
		    		url="system/recharge/configEdit4";
		    		title="盈亏优惠管理";
		    	}else if(typeVal==5) {
		    		url="system/recharge/configEdit5";
		    		title="累计充值优惠管理";
		    	}
				var _index = layer.open({
	     		  type: 2,
	     		  title: title,
	     		  anim: 2,
	     		  area:['830px', '360px'],
	     		  content: [url]
	     		});
            });
	    });
	   
	    function changeType(){
	    	$("#tableForm").find("input[type=submit]").click();
	    }
	</script>
</body>
</html>