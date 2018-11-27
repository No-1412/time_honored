<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/wechat/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                	<div class="form-group">
                                        <label class="col-sm-2 control-label">类型：</label>
                                        <div class="col-sm-5">
                                            <label class="radio-inline">
	                                            <input id="type_scan" type="radio" ${data.payType == null || data.payType==2?"checked":""} value="2" name="payType">扫码</label>
	                                        <label class="radio-inline">
	                                            <input id="type_add" type="radio" ${data.payType==3?"checked":""} value="3" name="payType">加好友</label>
	                                        <label class="radio-inline">
	                                            <input id="type_transfer" type="radio" ${data.payType==5?"checked":""} value="5" name="payType">转账到银行卡</label>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="wechat_code" class="form-group">
                                        <label class="col-sm-2 control-label">微信账号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="code" class="form-control" value="${data.code}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="wechat_name" class="form-group">
                                        <label class="col-sm-2 control-label">微信名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="wechat_bank" class="form-group" style="display: none;">
                                        <label class="col-sm-2 control-label">银行账号：</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="bankId">
                                        	<option value="" label="">
                                   			<c:forEach var="bank" items="${data.expand.bankList}">
                                   			<option value="${bank.id}" label="${bank.accountCode}(${bank.accountName}) -- ${bank.bankName}" ${data.bankId==bank.id?"selected":""}>
                                            </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">充值方式标题：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payName" class="form-control" value="${data.payName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">充值方式描述：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payDesc" class="form-control" value="${data.payDesc}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="min_amount" class="form-group">
                                        <label class="col-sm-2 control-label">最小充值金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payMin" class="form-control" value="${data.payMin}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div id="max_amount" class="form-group">
                                        <label class="col-sm-2 control-label">最大充值金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payMax" class="form-control" value="${data.payMax}">
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
                                        <label class="col-sm-2 control-label">二维码：</label>
                                        <div class="col-sm-5">
                                            <a href="javascript:;" id="single_pic_upload">选择上传图片</a>
                                            <div class="uploader-list">
                                            	<c:if test="${data.payImg != 'NVL'}">
                                            		<div class="file-item thumbnail"><img src="${data.payImg}"><div class="info">点击删除</div></div>
                                            	</c:if>
                                            </div>
                                            <input type="hidden" name="payImg" value="${data.payImg}"/>
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
	    requirejs(["jquery","form","uploader","UMeditor","um.zh"],function($,form,uploader,UM){
	       form();//表单
	       uploader({upload:"single_pic_upload"});//单图上传
	        
	       $('#type_scan').on('click', function(){
	    	   $('#wechat_code').css('display', 'block');
	    	   $('#wechat_name').css('display', 'block');
	    	   $('#min_amount').css('display', 'block');
	    	   $('#max_amount').css('display', 'block');
	    	   $('#pay_desc').css('display', 'block');
	    	   
	    	   $('#wechat_bank').css('display', 'none');
	       });
	        
		   $('#type_add').on('click', function(){
			   $('#wechat_code').css('display', 'block');
	    	   $('#wechat_name').css('display', 'block');
	    	   $('#min_amount').css('display', 'none');
	    	   $('#max_amount').css('display', 'none');
	    	   $('#pay_desc').css('display', 'none');
	    	   
	    	   $('#wechat_bank').css('display', 'none');
	       });
		   $('#type_transfer').on('click', function(){
	    	   $('#wechat_code').css('display', 'none');
	    	   $('#wechat_name').css('display', 'none');
	    	   $('#min_amount').css('display', 'block');
	    	   $('#max_amount').css('display', 'block');
	    	   $('#pay_desc').css('display', 'block');
	    	   
	    	   $('#wechat_bank').css('display', 'block');
	       });
		   
		   if(($('#type_scan').attr("checked"))) {
			   $('#wechat_code').css('display', 'block');
			   $('#wechat_name').css('display', 'block');
	    	   $('#min_amount').css('display', 'block');
	    	   $('#max_amount').css('display', 'block');
		   } else if(($('#type_add').attr("checked"))){
			   $('#wechat_code').css('display', 'block');
			   $('#wechat_name').css('display', 'block');
	    	   $('#min_amount').css('display', 'none');
	    	   $('#max_amount').css('display', 'none');
	    	   $('#pay_desc').css('display', 'none');
		   } else {
			   $('#wechat_code').css('display', 'none');
			   $('#wechat_name').css('display', 'none');
	    	   $('#min_amount').css('display', 'block');
	    	   $('#max_amount').css('display', 'block');
	    	   $('#pay_desc').css('display', 'block');
	    	   
	    	   $('#wechat_bank').css('display', 'block');
		   }
	    });
    </script>
</body>
</html>