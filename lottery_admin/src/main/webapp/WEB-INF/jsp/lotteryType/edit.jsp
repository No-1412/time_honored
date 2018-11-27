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
                                <form role="form" class="form-horizontal" id="form" data-url="system/lotteryType/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="name" class="form-control" value="${data.name}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">提前封盘时间(秒)：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="preCloseTime" class="form-control" value="${data.preCloseTime}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">房间：</label>
                                        <div class="col-sm-5">
                                        	<input cls="" name="roomId" disabled type="checkbox" value="${data.expand.defaultRoom.id}" checked>${data.expand.defaultRoom.name}，无返水</br>
                                        	<c:forEach var="room" items="${data.expand.roomList}">
                                        	<input name="roomId" type="checkbox" value="${room.id}" ${room.expand.checked}>${room.name},返水${room.reward}%</br>
                                        	</c:forEach>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">默认房间：</label>
                                        <div class="col-sm-5">
                                        	<select cls="{required:true}" class="form-control" name="defaultRoom">
                                        	<option value="${data.expand.defaultRoom.id}" label="${data.expand.defaultRoom.name}" ${data.defaultRoom==data.expand.defaultRoom.id?"selected":""} />
                                        	<c:forEach var="room" items="${data.expand.roomList}">
                                            	<option value="${room.id}" label="${room.name}" ${data.defaultRoom==room.id?"selected":""} />
                                           	</c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${data.num == 41 || data.num == 42 || data.num ==9}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">停开期数：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="number" name="stopPeriods" class="form-control" value="${data.stopPeriods}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">最大下注金额：</label>
                                        <div class="col-sm-5">
                                            <input type="number" name="maxAmount" class="form-control" value="${data.maxAmount}">0表示不限制
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">状态：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="status" >
                                           		<option value="1" label="正常" ${data.status=='1'?"selected":""} />
                                           		<option value="-1" label="维护中" ${data.status=='-1'?"selected":""} />
                                           		<option value="-2" label="关闭" ${data.status=='-2'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">显示顺序：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="sort" class="form-control" value="${data.sort}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否热门彩种：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="isHot" >
                                           		<option value="1" label="是" ${data.isHot=='1'?"selected":""} />
                                           		<option value="0" label="否" ${data.isHot!='1'?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">描述：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="hotDesc" class="form-control" value="${data.hotDesc}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <c:if test="${admin.isAdmin==1}">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开奖接口Url：</label>
                                        <div class="col-sm-5">
                                            <input type="text" name="apiUrl" class="form-control" value="${data.apiUrl}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    </c:if>
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
        requirejs(["jquery","form"],function($,form){
            form();
        });
    </script>
</body>
</html>