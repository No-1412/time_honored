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
	    		<form role="form" class="form-horizontal" id="form" data-url="member/withdraw/verifyChoiceSubmit">
	                <div class="form-group" style="background-color: #ddd;width: 98%;margin-left: 1px;">
	                    <label class="col-sm-2 control-label" style="text-align:left">分 层 ：</label>
	                    <div class="col-sm-5" style="float: right;">
	                    	<input id="select_all" type="button" value="全选">
                            <input id="un_select_all" type="button" value="全不选">
	                    </div>
	                    
	                    <div id="level_div" style="width: 100%; padding-left: 50px;">
		                    <c:forEach items="${data}" var="item">
		                    <div style="width: 120px;float: left;"><input name="level" type="checkbox" value="${item.value}" ${item.checked} style="color: red;">${item.name}</div>
		                    </c:forEach>
	                    </div>
	                </div>
            	
	            	<div class="form-group">
		                 <div class="col-sm-offset-2 col-sm-9" style="text-align: center;margin-top: 15px;">
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
            
            $('#select_all').on("click", function() {
        		$("#level_div").find("input[type=checkbox]").each(function() {
        			$(this).prop("checked", true);
        		});
        	}),
        	
			$('#un_select_all').on("click", function() {
				$("#level_div").find("input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
        		});
        	})
        })
    </script>
</body>
</html>