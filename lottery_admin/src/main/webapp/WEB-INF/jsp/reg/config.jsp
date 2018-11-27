<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
	
	<style type="text/css">
		.col-sm-2 {
		    width: 13%;
		}
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
                                <form role="form" class="form-horizontal" id="form" data-reload="0" data-url="system/reg/configSubmit">
                                	<div class="form-group">
                                        <label class="col-sm-2 control-label">手机号：</label>
                                        <div class="col-sm-5">
                                            <label class="radio-inline">
                                                <input type="radio" ${data.phone==0?"checked":""} value="0" name="phone">不显示</label>
                                            <label class="radio-inline">
                                                <input type="radio" ${data.phone==1?"checked":""} value="1" name="phone">显示,非必输</label>
                                            <label class="radio-inline">
                                                <input type="radio" ${data.phone==2?"checked":""} value="2" name="phone">必输</label>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">邮箱：</label>
                                        <div class="col-sm-5">
                                            <label class="radio-inline">
                                                <input type="radio" ${data.email==0?"checked":""} value="0" name="email">不显示</label>
                                            <label class="radio-inline">
                                                <input type="radio" ${data.email==1?"checked":""} value="1" name="email">显示,非必输</label>
                                            <label class="radio-inline">
                                                <input type="radio" ${data.email==2?"checked":""} value="2" name="email">必输</label>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">QQ：</label>
                                        <div class="col-sm-5">
                                            <label class="radio-inline">
                                                <input type="radio" ${data.qq==0?"checked":""}  value="0" name="qq">不显示</label>
                                            <label class="radio-inline">
                                                <input type="radio" ${data.qq==1?"checked":""} value="1" name="qq">显示,非必输</label>
                                            <label class="radio-inline">
                                                <input type="radio" ${data.qq==2?"checked":""} value="2" name="qq">必输</label>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">代理加盟联系QQ：</label>
                                        <div class="col-sm-5">
                                        	<input style="width: 50%;" type="text" value="${data.reg_agent_rel_qq}" class="form-control" name="regAgentRelQQ">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">推荐收益转换率：</label>
                                        <div class="col-sm-5">
                                        	<input style="width: 50%;" type="text" value="${data.spread}" class="form-control" name="spread">
                                        	收益=推荐会员的有效投注额度总和 ÷ 100 × 0.1(转换率),小数部份四舍五入!
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="保存">
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
	    var content = '${content}';
	    requirejs(["jquery","form"],function($,form){
	        form();
	    });
    </script>
</body>
</html>