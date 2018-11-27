<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/index"></script>
    <script type="text/javascript" src="assets/js/require.config.js"></script>
    
   
</head>

<body class="fixed-sidebar full-height-layout gray-bg skin-1">
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close">
            	<i class="fa fa-times-circle"></i>
            </div>
            
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            	<span class="clear">
	                               	<span class="block m-t-xs"><strong style="color:white;"> ${data.admin.code} ${data.admin.name}</strong></span>
                                </span>
                            </a>
                        </div>
                    </li>
                   
                    <c:forEach var="menu" items="${data.menuList}">
                    	<li class="${menu.name=='资金管理'?'active':''}">
	                        <a href="#">
	                            <i class="fa fa ${menu.image}"></i>
	                            <span class="nav-label">${menu.name}</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                        	<c:forEach var="subMenu" items="${menu.subMenuList}">
	                        		<c:choose>
	                        			<c:when test="${subMenu.url=='system/recharge/verify'}"><li><a style="color:red;" id="recharge_verify" class="J_menuItem" href="${subMenu.url}">${subMenu.name}</a></li></c:when>
	                        			<c:when test="${subMenu.url=='system/withdraw/verify'}"><li><a style="color:red;" id="withdraw_verify" class="J_menuItem" href="${subMenu.url}">${subMenu.name}</a></li></c:when>
	                        			<c:otherwise><li><a class="J_menuItem" href="${subMenu.url}">${subMenu.name}</a></li></c:otherwise>
	                        		</c:choose>
	                        	</c:forEach>
	                        </ul>
                    	</li>
                    </c:forEach>
                </ul>
            </div>
        </nav>
        
<!--         <div class="pulltab" onclick="pulltabclick()" style="margin-left: 220px;"> -->
<!-- 	     	<span>《</span> -->
<!-- 	    </div> -->
	    
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="system/first">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <button class="roll-nav roll-right dropdown J_tabClose">
                	<span class="dropdown-toggle">关闭操作<span class="caret"></span></span>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </button>
                <a href="common/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            
			<div class="row J_mainContent" id="content-main">
		    	<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="system/first" frameborder="0" data-id="system/first" seamless></iframe>
           	</div>
            <div class="footer">
                <div class="text-center">Copyright &copy;  PG (盘古)彩票 Reserved</div>
            </div>
            
        </div>
    </div>
   
    
    <input type="hidden" id="new_recharge_for_verify" value="">
    <input type="hidden" id="new_withdraw_for_verify" value="">
    <input type="hidden" id="lhc_periods" value="${data.num}">
    
    <script type="text/javascript">

	  /*--左边导航栏收缩按钮--*/
		var awidth70 = "0px";
		var awidth220 = "220px"
	
		function pulltabclick(){
		var bwidth = $(".navbar-static-side").css("width");
		if(bwidth == awidth220){
// 			$(".navbar-static-side").stop().animate({"width":awidth70},300,function(){
// 				$("#page-wrapper").css("margin","0px");
// 			});	
			
			$(".pulltab").stop().animate({"margin-left":"0px"},300);	
			$(".navbar-static-side").stop().animate({"width":awidth70},300);	
			$("#page-wrapper").stop().animate({"margin":"0px"},300);
		}else if(bwidth == awidth70){
			$(".navbar-static-side").stop().animate({"width":awidth220},300);	
			$("#page-wrapper").stop().animate({"margin":"0 0 0 220px"},300);
			$(".pulltab").stop().animate({"margin-left":"220px"},300);	
		}
		
	};
	</script>
</body>

</html>