<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content" style="padding-top: 10px;">
	   <jsp:include page="../common/quickTime.jsp"/>
       
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
                                            <input type="text" id="timestart" name="dateFrom" value="${data.dateFrom}" class="input-sm form-control">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">结束日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" id="timeend" name="dateTo" value="${data.dateTo}" class="input-sm form-control">
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="提交"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>收入项目</th>
                                    <th>收入金额</th>
                                    <th>支出项目</th>
                                    <th>支出金额</th>
                                </tr>
                            </thead>
                            
                            <tbody>
								 <tr>
								 	<td style="color:green;">公司入款(<b style="color:red;">${data.cNum}</b>)</td>
								 	<td>${data.cAmount}<a id="c_r_detail" style="float:right;" class="btn btn-sm btn-info edit_link" href="javascript:;">详细</a></td>
								 	<td>会员出款(<b style="color:red;">${data.mNum}</b>)</td>
								 	<td>${data.mAmount}<a id="withdraw_detatil" style="float:right;" class="btn btn-sm btn-info edit_link" href="javascript:;">详情</a></td>
				                  </tr>
				                  
				                  <tr>
								 	<td style="color:green;">线上支付(<b style="color:red;">${data.oNum}</b>)</td>
								 	<td>${data.oAmount}<a id="o_r_detail" style="float:right;" class="btn btn-sm btn-info edit_link" href="javascript:;">详细</a></td>
								 	<td>返水(<b style="color:red;">${data.fdNum}</b>)</td>
								 	<td>${data.fdAmount}<a id="fd_detail" style="float:right;" class="btn btn-sm btn-info edit_link" href="javascript:;">详情</a></td>
				                  </tr>
				                  
				                  <tr>
								 	<td style="color:green;">取款手续费(<b style="color:red;">${data.feeNum}</b>)</td>
								 	<td>${data.feeAmount}</td>
								 	<td>优惠(<b style="color:red;">${data.addNum}</b>)</td>
								 	<td>${data.addAmount}<a id="add_detail" style="float:right;" class="btn btn-sm btn-info edit_link" href="javascript:;">详情</a></td>
				                  </tr>
				                  
				                  <tr>
								 	<td style="color:green;">取款行政费(<b style="color:red;">${data.feeAdminNum}</b>)</td>
								 	<td>${data.feeAdminAmount}</td>
								 	<td>彩金(<b style="color:red;">${data.giftNum}</b>)</td>
								 	<td>${data.giftAmount}<a id="gift_detail" style="float:right;" class="btn btn-sm btn-info edit_link" href="javascript:;">详情</a></td>
				                  </tr>
				                  
				                  <tr>
								 	<td width="200" style="color:green;">手动存款(<b style="color:red;">${data.hNum}</b>)</td>
								 	<td width="400">${data.hAmount}<br>其中：微信${data.handWechat} 支付宝${data.handAlipay}</td>
								 	<td width="200">手动扣款(<b style="color:red;">${data.aNum}</b>)</td>
								 	<td>${data.aAmount}</td>
				                  </tr>
	                        </tbody>
	                        
	                        <tfoot>
	                        	<tr>
	                        		<td colspan="4">
	                        			<span>项目入款(公司入款+在线支付+手动存款): <b>${data.pAmount}</b></span><br>
										<span>虚拟存入(返水+优惠+彩金): <b>${data.vAmount}</b></span><br>
										<span>实际收入(公司入款+在线支付+手动存款-会员出款): <b style="color:${data.rAmount<0?'red':'green'};">${data.rAmount}</b></span><br>
										<span style="color:red;">注：本页内容仅供记账参考，不作其它用途。</span>
									</td>
								</tr>
	                        </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div id="c_r_list" class="ibox-content" style="display: none;">
        <table class="table table-bordered table-condensed">
        	<thead>
        		<tr><th colspan="4" style="text-align: center;">公司入款 分析</th></tr>
        		<tr>
        			<th>渠道</th>
        			<th>账号</th>
        			<th>笔数</th>
        			<th>金额</th>
        		</tr>
        	</thead>
        	<tbody>
        		<c:forEach var="item" items="${data.cList}">
        			<tr>
        				<td>${item.name}</td>
        				<td>${item.code}</td>
        				<td>${item.num}</td>
        				<td>${item.amount}</td>
        			</tr>
        		</c:forEach>
        	</tbody>
        </table>
    </div>
    
    <div id="o_r_list" class="ibox-content" style="display: none;">
        <table class="table table-bordered table-condensed">
        	<thead>
        		<tr><th colspan="4" style="text-align: center;">在线充值 汇总</th></tr>
        		<tr>
        			<th>渠道</th>
        			<th>商户编号</th>
        			<th>笔数</th>
        			<th>金额</th>
        		</tr>
        	</thead>
        	<tbody>
        		<c:forEach var="item" items="${data.oList}">
        			<tr>
        				<td>${item.name}</td>
        				<td>${item.code}</td>
        				<td>${item.num}</td>
        				<td>${item.amount}</td>
        			</tr>
        		</c:forEach>
        	</tbody>
        </table>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
		var needSet = 0;
	    requirejs(["jquery", 'layer', "datepicker", "quickTime"],function($, layer){
	    	$("#timestart").on("click", function(e) {
                e.preventDefault();
                WdatePicker({startDate:'%y-%m-%d 00:00:00', dateFmt:'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'timeend\')}' });
            });
            $("#timeend").on("click", function(e) {
                e.preventDefault();
                WdatePicker({startDate:'%y-%m-%d 23:59:59', dateFmt:'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'timestart\')}' });
            });
            
            $('#c_r_detail').on('click', function() {
            	layer.open({
                    type: 1,
                    title: "详细",
                    skin: 'layui-layer-rim',
                    area: ['830px', '400px'],
                    content: $('#c_r_list')
                });
            });
            
            $('#o_r_detail').on('click', function() {
            	layer.open({
                    type: 1,
                    title: "详细",
                    skin: 'layui-layer-rim',
                    area: ['830px', '400px'],
                    content: $('#o_r_list')
                });
            });
            
            $('#withdraw_detatil').on('click', function() {
	            var _index = layer.open({
	     		  type: 2,
	     		  title: "会员出款详情",
	     		  anim: 2,
	     		  area:['1050px', '550px'],
	     		  content: ['system/memberAccount/index?type=1&timeStart='+$('#timestart').val()+'&timeEnd='+$('#timeend').val()]
	     		});
            });
            
            $('#fd_detail').on('click', function() {
            	var _index = layer.open({
  	     		  type: 2,
  	     		  title: "返水详情",
  	     		  anim: 2,
  	     		  area:['1050px', '550px'],
  	     		  content: ['system/memberAccount/index?type=9&timeStart='+$('#timestart').val()+'&timeEnd='+$('#timeend').val()]
  	     		});
            });
            
			$('#add_detail').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "优惠详情",
	     		  anim: 2,
	     		  area:['1050px', '550px'],
	     		  content: ['system/memberAccount/index?type=5&timeStart='+$('#timestart').val()+'&timeEnd='+$('#timeend').val()]
	     		});
            });
            
			$('#gift_detail').on('click', function() {
				var _index = layer.open({
	     		  type: 2,
	     		  title: "彩金详情",
	     		  anim: 2,
	     		  area:['1050px', '550px'],
	     		  content: ['system/memberAccount/index?type=6&timeStart='+$('#timestart').val()+'&timeEnd='+$('#timeend').val()]
	     		});
			});
	    });
    </script>
</body>
</html>