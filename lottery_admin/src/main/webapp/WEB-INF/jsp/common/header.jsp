<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	String basePath = null;
	String scheme = request.getHeader("X-Http-Scheme");
	if(scheme == null) {
		basePath = "http://"+request.getServerName();
	} else {
		basePath = scheme +"://"+request.getServerName();
	}
	if(Integer.valueOf(request.getServerPort()) >= 8080) {
		basePath = basePath+":"+request.getServerPort();
	}
	basePath = basePath+request.getContextPath()+"/";
%>
	<base id="base_path" href="<%=basePath%>">
	
	<meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <meta name="renderer" content="webkit">
    
    <title>Welcome</title>
    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">