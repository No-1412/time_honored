<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
</head>

<body>
    <div class="wrapper wrapper-content">
        <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row clearfix">
                            <div class="col-sm-12">
                                <form role="form" class="form-horizontal" id="form" data-url="system/member/handRechargeSubmit">
                                	<input name="memberId" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">会员账号：</label>
                                        <div class="col-sm-5">
                                            <input ${data.id != null?"readonly":""} type="text" name="code" class="form-control" value="${data.code}">
                                        </div>
                                        <div class="col-sm-5">
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.type==0?"checked":""} value="0" name="rechargeType">默认</label>
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.type==1?"checked":""} value="1" name="rechargeType">微信</label>
	                                        <c:forEach var="item" items="${data.wechatNumList}">
	                                        	<label class="radio-inline">
	                                            <input type="radio" ${data.type==item?"checked":""} value="${item}" name="rechargeType">微信${item-29}</label>
	                                        </c:forEach>
	                                        <label class="radio-inline">
	                                            <input type="radio" ${data.type==2?"checked":""} value="2" name="rechargeType">支付宝</label>
	                                            
	                                        <input id="setting_btn" type="button" value="设置">
	                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="amount" class="form-control" value="">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">存款赠送优惠：</label>
                                        <div class="col-sm-5">
                                        	 <select class="form-control" name="add">
                                            	<option value="1" label="赠送" />
                                            	<option value="-1" label="不赠送" selected />
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;">比率(%)：${data.rate}</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">存款赠送彩金：</label>
                                        <div class="col-sm-5">
                                        	 <select class="form-control" name="gift">
                                            	<option value="1" label="赠送" />
                                            	<option value="-1" label="不赠送" selected />
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;">比率(%)：${data.gift}</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">计算打码量：</label>
                                        <div class="col-sm-5">
                                        	 <select class="form-control" name="countDml">
                                            	<option value="1" label="计算" selected/>
                                            	<option value="-1" label="不计算" />
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;">打码量${data.dml}倍</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">计算输赢额：</label>
                                        <div class="col-sm-5">
                                        	 <select class="form-control" name="countWin">
                                            	<option value="1" label="计算" />
                                            	<option value="-1" label="不计算" />
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;width: 35%;">增加与金额相等的输赢额</label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">备注：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="remark" class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label" style="text-align: left;width: 35%;">请仔细填写备注信息,给玩家知道原因</label>
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
        requirejs(["jquery","form","layer"],function($,form,layer){
            form();
            
            $('#setting_btn').on('click', function() {
	            var _index = layer.open({
				  type: 2,
				  title: "手动存款类型设置",
				  anim: 2,
				  area:['360px', '165px'],
				  content: ['member/recharge/handRecharge']
				});
            });
        });
    </script>
</body>
</html>