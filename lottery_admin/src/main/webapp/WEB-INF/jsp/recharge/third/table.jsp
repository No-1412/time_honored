<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../common/header.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
       <div class="row clearfix">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table class="table table-bordered table-condensed">
                            <caption>
                            	<form action="" id="tableForm">
                                    <div class="row">
                                    <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">名称：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="name" class="input-sm form-control" value="${data.name}">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">商户号：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <input type="text" name="merid" class="input-sm form-control" value="${data.merid}">
                                        </div>
                                        <div class="col-lbl-1" >
                                    		<label class="col-lbl-left">类型：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left">
                                            <select cls="{required:true}" class="form-control" name="type1" >
                                            	<option value="0" label="全部" ${data.type1==0?"selected":""} />
                                            	<option value="1" label="微信" ${data.type1==1?"selected":""} />
                                            	<option value="2" label="支付宝" ${data.type1==2?"selected":""} />
                                            	<option value="3" label="QQ钱包" ${data.type1==3?"selected":""} />
                                            	<option value="4" label="网银" ${data.type1==4?"selected":""} />
                                            	<option value="5" label="其他" ${data.type1==5?"selected":""} />
                                            </select>
                                        </div>
                                        
                                         <div class="col-lbl-left"">
                                            <div class="input-group">
                                                 <input type="submit" class="btn btn-sm btn-primary" value="查找"></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="button" value="添加" class="btn btn-sm btn-primary add_link" data-url="system/rechargeThird/edit"></span>
                                                &nbsp;
                                                <input style="display: none;" type="submit" class="btn btn-sm btn-primary" value="刷新"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>类型</th>
                                    <th>商户号</th>
                                    <th>最小金额</th>
                                    <th>最大金额</th>
                                    <th>状态</th>
                                    <th>排序</th>
                                    <th>修改时间</th>
                                    <th width="150">操作</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/rechargeThird/getList">
								 <tr>
				                     <td colspan="9"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
	                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>