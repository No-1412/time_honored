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
                                    		<label class="col-lbl-left">彩种名称：</label>
                                        </div>
                                    	<div class="col-sm-2 zero_pad_left">
                                    		<select id="num" class="form-control" name="num">
                                    			<c:forEach var="lotteryType" items="${data.lotteryTypeList}">
                                            	<option value="${lotteryType.num}" label="${lotteryType.name}" ${lotteryType.num==18?"selected":""} />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-3" style="width: 70%;">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                                <c:if test="${data.isAdmin==1}">
                                                &nbsp;
                                                <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="system/handDraw/edit?type=1"></span>
                                                &nbsp;
                                                <input type="button" value="撤单" class="btn btn-sm btn-primary add_link" data-url="system/handDraw/edit?type=2"></span>
                                                </c:if>
                                                <c:if test="${data.isAdmin==1 || (isSelfControlOpen==1 && data.isAdmin==2)}">
                                                &nbsp;
                                                <input id="sfc_draw_type" type="button" value="三分时时彩" class="btn btn-sm btn-primary"></span>
                                                &nbsp;
                                                <input id="sfc_jsssc_draw_type" type="button" value="极速时时彩" class="btn btn-sm btn-primary"></span>
                                                &nbsp;
                                                <input id="sfc_pk10_draw_type" type="button" value="三分PK10" class="btn btn-sm btn-primary"></span>
                                                &nbsp;
                                                <input id="js_pk10_draw_type" type="button" value="极速PK10" class="btn btn-sm btn-primary"></span>
                                                &nbsp;
                                                <input id="xyk3_draw_type" type="button" value="幸运快三" class="btn btn-sm btn-primary"></span>
                                                &nbsp;
                                                <input id="jslhc_draw_type" type="button" value="极速六合彩" class="btn btn-sm btn-primary"></span>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <c:if test="${data.isAdmin==1}">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">更新日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="datestart" name="dateFrom" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left"> --&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="dateend" name="dateTo" class="input-sm form-control">
                                        </div>
                                        <div class="col-sm-3" style="width: 50%;">
                                            <div id="hand_draw" class="input-group">
                                                <a data-type="1" class="btn btn-sm btn-primary hand_draw_link">更新开奖</a>
                                                &nbsp;<a data-type="2" class="btn btn-sm btn-primary hand_draw_link">平台开奖</a>
                                                &nbsp;<a data-type="3" class="btn btn-sm btn-primary hand_draw_link">更新走势</a>
                                                &nbsp;<a data-type="4" class="btn btn-sm btn-primary hand_draw_link">更新缓存</a>
                                                &nbsp;<a data-type="5" class="btn btn-sm btn-primary hand_draw_link">删除缓存</a>
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>彩种名称</th>
                                    <th>期数</th>
                                    <th>开奖时间</th>
                                    <th>开奖内容</th>
                                    <th>第三方开奖状态</th>
                                    <th>平台开奖状态</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/handDraw/getList">
								 <tr>
				                     <td colspan="6"><div class="not-data">数据加载中...</div></td>
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
	    	$('#sfc_draw_type').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "三分时时彩开奖方式",
	     		  anim: 2,
	     		  area:['800px', '180px'],
	     		  content: ['system/config/sfcDrawType']
	     		});
            });
	    	
	    	$('#sfc_jsssc_draw_type').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "极速时时彩开奖方式",
	     		  anim: 2,
	     		  area:['800px', '180px'],
	     		  content: ['system/config/sfcJssscDrawType']
	     		});
            });
	    	
	    	$('#sfc_pk10_draw_type').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "三分PK10开奖方式",
	     		  anim: 2,
	     		  area:['800px', '180px'],
	     		  content: ['system/config/sfpk10DrawType']
	     		});
            });
	    	
	    	$('#js_pk10_draw_type').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "极速PK10开奖方式",
	     		  anim: 2,
	     		  area:['800px', '180px'],
	     		  content: ['system/config/jspk10DrawType']
	     		});
            });
	    	
	    	$('#xyk3_draw_type').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "幸运快三开奖方式",
	     		  anim: 2,
	     		  area:['800px', '180px'],
	     		  content: ['system/config/xyk3DrawType']
	     		});
            });
	    	
	    	$('#jslhc_draw_type').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "极速六合彩开奖方式",
	     		  anim: 2,
	     		  area:['800px', '180px'],
	     		  content: ['system/config/jslhcDrawType']
	     		});
            });
	    	
	    	function getNextDay(d){
	            var date = new Date(d);
	            date = + date + 1000*60*60*24;
	            date = new Date(date);
	            
	            var day = date.getDate();
	            var month = date.getMonth() + 1;
	            return date.getFullYear() + "-" + (month < 10 ? ('0' + month) : month) + "-" + (day < 10 ? '0' + day : day);
	    	}
	    	
	    	function update(index) {
	    	   start = dateArr[idx >= dateLength ? dateLength : idx];
   			   end = dateArr[idx + 2 >= dateLength ? dateLength : (idx + 2)];
    		   
   			   idx += 3;
    		   if(end == dateTo) {isEnd = true;}
	    	   $.ajax({
 	               url: 'system/handDraw/updateDrawHistory',
 	               type: "post",
 	               data: {
 	            	   num: $('#num').val(),
 	            	   dayFrom: start,
 	            	   dayTo: end,
 	            	   type: _type
 	               }
 	           }).done(function(results) {
 	        	  if(isEnd && index != null) {
 	        		  layer.close(index);
 	        	  }
 	              if(results.status == "200") {
                	  layer.msg(start + "~" + end + "更新成功", {
	                      icon: 1,
	                      time: 1000
	                  }, function() {
	                	  if(!isEnd) update(index);
	                  });
 	              } else {
 	            	 layer.close(index);
	                  layer.msg(results.description, {
	                      icon: 2,
	                      time: 3000
	                  });
 	              }
 	           });
	    	}
	    	
	    	var idx = 0;
	    	var _type = 0;
	    	var dateArr = [];
    	    var isEnd = false;
    	    var dateLength = 0;
    	    var start = '', end = '', dateTo = '';
	    	$(document).on("click", "a.hand_draw_link", function(e) {
	    		e.preventDefault();
	    		
	    		_type = $(this).attr("data-type");
	    		dateTo = $('#dateend').val();
	    		var dateFrom = $('#datestart').val();
	    		if(dateFrom == null || dateFrom== '') {
	    			layer.msg('更新日期从不能为空！', {icon: 2, time: 2000});
	    			return;
	    		}
	    		if(dateTo == null || dateTo== '') {
	    			layer.msg('更新日期到不能为空！', {icon: 2, time: 2000});
	    			return;
	    		}
	    		
	    		dateArr = [];
	    		if(dateFrom == dateTo) {
	    			dateArr.push(dateFrom);
	    		} else {
	    			var temp = dateFrom;
	    			while(temp <= dateTo) {
	    				dateArr.push(temp);
	    				
	    				temp = getNextDay(temp);
	    			}
	    		}
	    		
	    		idx = 0;
	    		end = '';
	    		start = '';
	    		isEnd = false;
	    		dateLength = dateArr.length - 1;
    	       	layer.confirm('确定要更新？', function() {
    	       	   var index = layer.load();
    	    	   
    	    	   var idx = 0;
    	    	   var isEnd = false;
    	    	   var start = '', end = '';
    	    	   var dateLength = dateArr.length - 1;
    	    	   
   	    		   update(index);
    	       });
	    	})
	    });
    </script>
</body>
</html>