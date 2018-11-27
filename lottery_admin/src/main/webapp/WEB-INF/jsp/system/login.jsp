<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/login"></script>
    <script type="text/javascript" src="assets/js/require.config.js"></script>
</head>

<body class="gray-bg">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">H+</h1>
            </div>
            <h3></h3>

            <form class="m-t" role="form" id="login_form" action="">
                <div class="form-group">
                    <input type="text" name="username" id="username" class="form-control" placeholder="用户名" >
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="密码">
                </div>
                <div class="form-group">
                	<input type="text" name="vcode" id="vcode" class="form-control" placeholder="D令牌"> 
                    <!-- <div class="input-group">
                       <input type="text" name="vcode" id="vcode" class="form-control" placeholder="动态口令"> 
                       <span class="input-group-btn">
                            <img src="common/public/verifycode" alt="" title="看不清楚，换一张图片" onclick="this.src='common/public/verifycode/'+Math.random()">
                        </span>
                    </div> -->
                </div>
                <input type="submit" class="btn btn-primary block full-width m-b" value="登 录">
            </form>
            <span style="margin-top: 30px;']">Copyright &copy;  PG (盘古) Reserved</span>
        </div>
    </div>
</body>
</html>