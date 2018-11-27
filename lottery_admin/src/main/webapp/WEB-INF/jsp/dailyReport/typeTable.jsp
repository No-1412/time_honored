<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/header.jsp" />
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
                                    		<label class="col-lbl-left">投注日期：</label>
                                        </div>
                                        <div class="col-sm-2 zero_pad_left" style="width: 120px;">
                                            <input type="text" id="date" name="date" value="${data}" class="input-sm form-control">
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="submit" class="btn btn-sm btn-primary" value="搜索"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </caption>
                            <thead>
                                <tr>
                                    <th width="50">序号</th>
                                    <th>彩种名称</th>
                                    <th>注单量</th>
                                    <th>投注金额</th>
                                    <th>中奖金额</th>
                                    <th>返水金额</th>
                                    <th>盈利(正会员赢)</th>
                                </tr>
                            </thead>
                            
                            <tbody id="tableId" url="system/report/getDailyTypeList">
								 <tr>
				                     <td colspan="7"><div class="not-data">数据加载中...</div></td>
				                  </tr>
	                        </tbody>
	                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <input type="hidden" id="is_load" value="0">
    
    <script type="text/javascript" src="assets/js/require.js" data-main="assets/js/application/table"></script>
	<script type="text/javascript" src="assets/js/require.config.js"></script>
</body>
</html>