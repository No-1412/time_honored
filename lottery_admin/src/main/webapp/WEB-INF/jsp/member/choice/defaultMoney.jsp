<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body>
    <div class="ibox-content">
        <div class="row clearfix">
            <div class="col-sm-12">
	    		<form role="form" class="form-horizontal" id="form" data-reload="0" data-url="member/withdraw/defaultMoneySubmit">
	                <div class="form-group">
	                    <div class="form-group">
                            <label class="col-sm-2 control-label" style="float:left;padding-left: 20px;line-height: 30px;">金额：</label>
                            <div class="col-sm-5" style="padding-left: 0px;">
                            	<input type="number" value="${data.moneyFrom}" name="moneyFrom"> -- 
                            	<input type="number" value="${data.moneyTo}" name="moneyTo">
                            </div>
                        </div>
	                </div>
            	
	            	<div class="form-group">
		                 <div class="col-sm-offset-2 col-sm-9" style="text-align: center;">
		                   <input type="submit" class="btn btn-info" value="确定">
		                   <input type="hidden" id="colse-btn" class="btn btn-danger" value="取消">
		                 </div>
		            </div>
            	</form>
	    	</div>
        </div>
    </div>
    
    <script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
    <script type="text/javascript">
        requirejs(["jquery","form"],function($,form){
            form();
        })
    </script>
</body>
</html>