<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
	   <jsp:include page="../../common/quickTime.jsp"/>
	   
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                        		<form action="" id="tableForm">
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">开始日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timestart" name="timestart" value="${data.date} 00:00:00" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">结束日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timeend" name="timeend" value="${data.date} 23:59:59" class="input-sm form-control">
                                        </div>
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">会员账号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="code" class="input-sm form-control" value="${data.memberCode}">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">金额：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="number" name="amount" class="input-sm form-control" value="">
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-lbl-1" >
                                    		<label class="col-lbl-left">交易类型：</label>
                                        </div>
                                        <div id="deal_type" class="col-sm-2 zero_pad_left" style="margin-top: 5px;width:64%;">
                                            <input type="checkbox" name="type" value="1" checked><label>出款</label>
                                            <input type="checkbox" name="type" value="2" checked><label>入款</label>
                                            <input type="checkbox" name="type" value="3" checked><label>支出</label>
                                            <input type="checkbox" name="type" value="4" checked><label>收入</label>
                                            <input type="checkbox" name="type" value="5" checked><label>优惠</label>
                                            <input type="checkbox" name="type" value="9" checked><label>返水</label>
                                            <input type="checkbox" name="type" value="6" checked><label>彩金</label>
                                            <input type="checkbox" name="type" value="7" checked><label>签到赠送</label>
                                            <input type="checkbox" name="type" value="8" checked><label>推荐收益</label>
                                            
                                            <input id="select_all" type="button" value="全选">
                                            <input id="un_select_all" type="button" value="全不选">
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                	<th>会员账号</th>
                                	<th>金额</th>
                                    <th>余额</th>
                                    <th>类型</th>
                                    <th>备注</th>
                                    <th>时间</th>
                                    <th>操作者</th>
                                    <th>编号</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/memberAccount/getList">
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
    
    <input type="hidden" id="is_load" value="${data.memberCode != null ? 1 : 0}">
    <input id="s_type" type="hidden" value="${data.type}">
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
        requirejs(["jquery"],function($){
        	$('#select_all').on("click", function() {
        		$("#deal_type").find("input[type=checkbox]").each(function() {
        			$(this).prop("checked", true);
        		});
        	}),
        	
			$('#un_select_all').on("click", function() {
				$("#deal_type").find("input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
        		});
        	})
        	
        	var type = $('#s_type').val();
        	if(type != null && type != '' && type != 'null') {
        		$("#deal_type").find("input[type=checkbox]").each(function() {
        			if($(this).val() != type) {
        				$(this).prop("checked", false);
        			}
        		});
        	}
        });
    </script>
</body>
</html>