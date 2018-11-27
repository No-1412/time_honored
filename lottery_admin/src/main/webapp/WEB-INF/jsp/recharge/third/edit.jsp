<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2{width: 120px;}
	</style>
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/rechargeThird/editSubmit">
                                	<input id="third_id" name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">类型：</label>
                                        <div class="col-sm-5">
                                            <select id="pay_type" cls="{required:true}" class="form-control" name="type" >
                                            	<c:forEach var="item" items="${data.expand.thirdList}">
                                            	<option value="${item.code}" label="${item.name}" ${data.type==item.code?"selected":""} />
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div id="select_type1" class="col-sm-5" style="width: 150px;">
                                            <select cls="{required:true}" class="form-control" name="type1" >
                                            	<option value="0" label="全部" ${data.type1==0?"selected":""} />
                                            	<option value="1" label="微信" ${data.type1==1?"selected":""} />
                                            	<option value="2" label="支付宝" ${data.type1==2?"selected":""} />
                                            	<option value="3" label="QQ钱包" ${data.type1==3?"selected":""} />
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="pay_title" class="form-group">
                                        <label class="col-sm-2 control-label">标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="title" class="form-control" value="${data.title}">
                                        </div>
                                        #name#表示微信或支付宝
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="pay_desc" class="form-group">
                                        <label class="col-sm-2 control-label">描述：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="desc" class="form-control" value="${data.desc}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商户号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="merid" class="form-control" value="${data.merid}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">终端号：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="terid" class="form-control" value="${data.terid}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                    	<c:if test="${data.type==36}">
                                        <label class="col-sm-2 control-label">微信子商户号：</label>
                                        <div class="col-sm-5">
                                            <textarea type="text" name="key" class="form-control">${data.key}</textarea>
                                            <label style="color:red;">格式:H5子商户号;公众号子商户号;扫码子商户号，auto表示自动轮换</label>
                                        </div>
                                        <a href="javascript:;" id="pool_query">查询子商户号</a><br>
                                        <a href="javascript:;" id="pool_refresh">刷新子商户号缓存</a>
                                        </c:if>
                                        <c:if test="${data.type!=36}">
                                        <label class="col-sm-2 control-label">商户安全码：</label>
                                        <div class="col-sm-5">
                                            <textarea type="text" name="key" class="form-control">${data.key}</textarea>
                                        </div>没有安全码无需填写
                                        </c:if>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${data.type==36}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">支付宝子商户号：</label>
                                        <div class="col-sm-5">
                                            <textarea type="text" name="alipayKey" class="form-control">${data.alipayKey}</textarea>
                                        </div>
                                         <a href="javascript:;" id="pool_query2">查询子商户号</a><br>
                                         <a href="javascript:;" id="pool_refresh2">刷新子商户号缓存</a>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公钥：</label>
                                        <div class="col-sm-5">
                                            <textarea type="text" name="publicKey" class="form-control">${data.publicKey}</textarea>
                                        </div>MD5加密，密钥填写在公钥，私钥无需填写
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">私钥：</label>
                                        <div class="col-sm-5">
                                        	<textarea type="text" name="privateKey" class="form-control">${data.privateKey}</textarea>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">支付URL：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="payUrl" class="form-control" value="${data.payUrl}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div  id="pay_isH5" class="form-group">
                                        <label class="col-sm-2 control-label">第三方是否支持H5：</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="payIsh5" >
                                            	<option value="-1" label="不支持" ${data.payIsh5=='-1'?"selected":""} />
                                           		<option value="1" label="支持" ${data.payIsh5=='1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">最小金额：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="minAmount" class="form-control" value="${data.minAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">最大金额：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="maxAmount" class="form-control" value="${data.maxAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">赠送优惠(%)：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="addAmount" class="form-control" value="${data.addAmount}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status" >
                                           		<option value="1" label="启用" ${data.status=='1'?"selected":""} />
                                           		<option value="-1" label="停用" ${data.status=='-1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">充值随机金额：</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="radomNum" >
                                           		<option value="1" label="开启" ${data.radomNum=='1'?"selected":""} />
                                           		<option value="0" label="关闭" ${data.radomNum=='0'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">显示顺序：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="sort" class="form-control" value="${data.sort}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="确定">
                                          <input type="button" id="colse-btn" class="btn btn-danger" value="取消">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
    <script type="text/javascript">
	    requirejs(["jquery",'layer',"form","UMeditor","um.zh"],function($,layer,form,UM){
	        form();//表单
	        
	        $('#pay_type').on('change', function() {
	        	if(parseInt($('#pay_type').val())%2==0) {
		        	$('#pay_title').show();
		        	$('#pay_desc').show();
		        	$('#pay_isH5').show();
		        } else {
		        	$('#pay_title').hide();
		        	$('#pay_desc').hide();
		        	$('#pay_isH5').hide();
		        }
	        }),
	        
	        $('#pool_query').on('click', function() {
	        	$.ajax({
                    url: 'system/rechargeThird/poolQuery',
                    type: "post",
                    data: {
                        id: $('#third_id').val(),
                        type:1
                    }
                }).done(function(results) {
                    if(results.status == "200") {
                    	layer.confirm(results.data);
                    } else {
                        layer.msg(results.description, {
                            icon: 2,
                            time: 2000
                        });
                    }
                });
	        }),
	        
	        $('#pool_query2').on('click', function() {
	        	$.ajax({
                    url: 'system/rechargeThird/poolQuery',
                    type: "post",
                    data: {
                        id: $('#third_id').val(),
                        type:2
                    }
                }).done(function(results) {
                    if(results.status == "200") {
                    	layer.confirm(results.data);
                    } else {
                        layer.msg(results.description, {
                            icon: 2,
                            time: 2000
                        });
                    }
                });
	        }),
	        
	        $('#pool_refresh').on('click', function() {
	        	$.ajax({
                    url: 'system/rechargeThird/poolRefresh',
                    type: "post",
                    data: {
                        id: $('#third_id').val(),
                        type: 1
                    }
                }).done(function(results) {
                    if(results.status == "200") {
                    	layer.msg('刷新成功！', {
                            icon: 1,
                            time: 2000
                        });
                    } else {
                        layer.msg(results.description, {
                            icon: 2,
                            time: 2000
                        });
                    }
                });
	        }),
	        
	        $('#pool_refresh2').on('click', function() {
	        	$.ajax({
                    url: 'system/rechargeThird/poolRefresh',
                    type: "post",
                    data: {
                        id: $('#third_id').val(),
                        type: 2
                    }
                }).done(function(results) {
                    if(results.status == "200") {
                    	layer.msg('刷新成功！', {
                            icon: 1,
                            time: 2000
                        });
                    } else {
                        layer.msg(results.description, {
                            icon: 2,
                            time: 2000
                        });
                    }
                });
	        })
	        
	        if(parseInt($('#pay_type').val())%2==0) {
	        	$('#pay_title').show();
	        	$('#pay_desc').show();
	        	$('#pay_isH5').show();
	        	
	        } else {
	        	$('#pay_title').hide();
	        	$('#pay_desc').hide();
	        	$('#pay_isH5').hide();
	        }
	    });
    </script>
</body>
</html>