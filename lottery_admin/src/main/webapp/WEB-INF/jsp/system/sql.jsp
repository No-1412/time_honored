<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body class="gray-bg">
	<div>
		<textarea id="sql" style="width:100%;" rows="3" type="text"></textarea>
		<div class="form-group" style="text-align: center;">
            <div class="col-sm-offset-2 col-sm-9">
              <input id="search_btn" type="submit" class="btn btn-info" value="查询">
            </div>
        </div>
	</div>
	<div id="result_table"></div>
	
	<script type="text/javascript" src="assets/js/require.js"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
	<script type="text/javascript">
		requirejs(['jquery','layer'], function($,layer) {
			$('#search_btn').on('click', function() {
			   $('#result_table').html('');
			   var index = layer.load();
	           $.ajax({
	               url: 'system/sql/execute',
	               type: "post",
	               data: {sql: $('#sql').val()}
	           }).done(function(results) {
	        	   layer.close(index);
	               if(results.status == "200") {
	            	   var data = results.data;
	            	   if(data.exception != 'NVL') {
	            		 $('#result_table').html(data.exception);
	            		 return;  
	            	   }
	            	   
	            	   var html = '';
	            	   var valueList = data.result;
	            	   for(var i=0;i<valueList.length;i++) {
	            		   html += '<tr>';
	            		   var obj = valueList[i];
		            	   for(var j=0;j<obj.length;j++) {
		            		   if(obj[j] != '' && obj[j] != null && obj[j].length>20) {
		            			    html = html + '<td style="width:50px;word-WRAP:break-word;">' + obj[j] + '</td>';
		            		   } else {
		            		   		html = html + '<td style="word-WRAP:break-word;">' + obj[j] + '</td>';
		            		   }
		            	   }
		            	   html += '</tr>';
	            	   }
	            	   
	            	   $('#result_table').html('<table border="1" style="width:100%;TABLE-LAYOUT:fixed;">' + html + '</table>');
	               } else {
	            	   layer.open({content:results.description});
	               }
	           });
			})
		})
	</script>
</body>
</html>