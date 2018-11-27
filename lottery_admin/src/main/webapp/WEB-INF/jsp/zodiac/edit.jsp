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
                                <form role="form" class="form-horizontal" id="form" data-url="system/zodiac/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">年份：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" type="text" name="lhcYear" class="form-control" style="width:100px">
                                            	<option value="" label="请选择"/>
                                            	<option value="2015" label="2015" ${data.lhcYear.equals('2015')?"selected":""} />
                                           		<option value="2016" label="2016" ${data.lhcYear.equals('2016')?"selected":""} />
                                           		<option value="2017" label="2017" ${data.lhcYear.equals('2017')?"selected":""} />
                                           		<option value="2018" label="2018" ${data.lhcYear.equals('2018')?"selected":""} />
                                           		<option value="2019" label="2019" ${data.lhcYear.equals('2019')?"selected":""} />
                                           		<option value="2020" label="2020" ${data.lhcYear.equals('2020')?"selected":""} />
                                           		<option value="2021" label="2021" ${data.lhcYear.equals('2021')?"selected":""} />
                                           		<option value="2022" label="2022" ${data.lhcYear.equals('2022')?"selected":""} />
                                           		<option value="2023" label="2023" ${data.lhcYear.equals('2023')?"selected":""} />
                                           		<option value="2024" label="2024" ${data.lhcYear.equals('2024')?"selected":""} />
                                           		<option value="2025" label="2025" ${data.lhcYear.equals('2025')?"selected":""} />
                                            </select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">生肖：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="lhcAnimals" class="form-control" style="width:340px" value="${data.lhcAnimals}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-9">
                                          <input type="submit" class="btn btn-info" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          <input type="button" id="colse-btn" class="btn btn-danger" value="取消">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
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
    <script type="text/javascript">
//     onload = function ()
//     {
//          var year=new Date().getFullYear(); //获取当前年份
         
//        var sel = document.getElementById ('lhcYear');//获取select下拉列表
//        for ( var i = 2010; i < year+10; i++)//循环添加2010到当前年份加10年的每个年份依次添加到下拉列表
//        {
//            var option = document.createElement ('option');
//            option.value = i;
//            var txt = document.createTextNode (i);
//            option.appendChild(txt);
//            sel.appendChild (option);
//        }
//        alert(sel);
//     }
</script>
</body>
</html>