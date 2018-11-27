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
                                <form role="form" class="form-horizontal" id="form" data-url="daifu/editSubmit">
                                	<input name="id" value="${data.id}" type="text" style="display:none;">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商户号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="sysMerchNo" class="form-control" value="${data.sysMerchNo}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商户秘钥：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="publicKey" class="form-control" value="${data.publicKey}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">下发金额：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="applyAmt" class="form-control" value="${data.applyAmt}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">银行账号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payeeAcct" class="form-control" value="${data.payeeAcct}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">银行户名：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}" type="text" name="payeeName" class="form-control" value="${data.payeeName}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">证件类型：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="idtype" >
                                           		<option value="0" label="身份证" ${data.idtype.equals('0')?"selected":""} />
                                           		<option value="1" label="户口簿" ${data.idtype.equals('10')?"selected":""} />
                                            	<option value="2" label="护照" ${data.idtype.equals('2')?"selected":""} />
                                           		<option value="3" label="军官证" ${data.idtype.equals('3')?"selected":""} />
                                            	<option value="4" label="士兵证" ${data.idtype.equals('4')?"selected":""} />
                                           		<option value="5" label="港澳居民来往内地通行证" ${data.idtype.equals('5')?"selected":""} />
                                            	<option value="6" label="台湾同胞来往内地通行证" ${data.idtype.equals('6')?"selected":""} />
                                           		<option value="7" label="临时身份证" ${data.idtype.equals('7')?"selected":""} />
                                           		<option value="8" label="外国人居留证" ${data.idtype.equals('8')?"selected":""} />
                                           		<option value="9" label="警官证" ${data.idtype.equals('9')?"selected":""} />
                                           		<option value="X" label="其他证件" ${data.idtype.equals('X')?"selected":""} />
											</select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">证件号：</label>
                                        <div class="col-sm-5">
                                            <input cls="{required:true}"   type="text" name="idNumber" class="form-control" value="${data.idNumber}">
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">下发银行名称：</label>
                                        <div class="col-sm-5">
                                            <select cls="{required:true}" class="form-control" name="finaCode" >
                                         		<option value="102" label="中国工商银行" ${data.finaCode.equals('102')?"selected":""} />
												<option value="103" label="中国农业银行" ${data.finaCode.equals('103')?"selected":""} />
												<option value="104" label="中国银行" ${data.finaCode.equals('104')?"selected":""} />
												<option value="105" label="中国建设银行" ${data.finaCode.equals('105')?"selected":""} />
												<option value="201" label="国家开发银行" ${data.finaCode.equals('201')?"selected":""} />
												<option value="202" label="中国进出口银行" ${data.finaCode.equals('202')?"selected":""} />
												<option value="203" label="中国农业发展银行" ${data.finaCode.equals('203')?"selected":""} />
												<option value="301" label="交通银行" ${data.finaCode.equals('301')?"selected":""} />
												<option value="302" label="中信银行" ${data.finaCode.equals('302')?"selected":""} />
												<option value="303" label="中国光大银行" ${data.finaCode.equals('303')?"selected":""} />
												<option value="304" label="华夏银行" ${data.finaCode.equals('304')?"selected":""} />
												<option value="305" label="中国民生银行" ${data.finaCode.equals('305')?"selected":""} />
												<option value="306" label="广东发展银行" ${data.finaCode.equals('306')?"selected":""} />
												<option value="307" label="深圳发展银行" ${data.finaCode.equals('307')?"selected":""} />
												<option value="308" label="招商银行" ${data.finaCode.equals('308')?"selected":""} />
												<option value="309" label="兴业银行" ${data.finaCode.equals('309')?"selected":""} />
												<option value="310" label="上海浦东发展银行" ${data.finaCode.equals('310')?"selected":""} />
												<option value="313" label="城市商业银行" ${data.finaCode.equals('313')?"selected":""} />
												<option value="314" label="农村商业银行" ${data.finaCode.equals('314')?"selected":""} />
												<option value="315" label="恒丰银行" ${data.finaCode.equals('315')?"selected":""} />
												<option value="316" label="浙商银行" ${data.finaCode.equals('316')?"selected":""} />
												<option value="317" label="农村合作银行" ${data.finaCode.equals('317')?"selected":""} />
												<option value="318" label="渤海银行股份有限公司" ${data.finaCode.equals('318')?"selected":""} />
												<option value="319" label="徽商银行股份有限公司" ${data.finaCode.equals('319')?"selected":""} />
												<option value="320" label="镇银行有限责任公司" ${data.finaCode.equals('320')?"selected":""} />
												<option value="401" label="城市信用社" ${data.finaCode.equals('401')?"selected":""} />
												<option value="402" label="农村信用社（含北京农村商业银行）" ${data.finaCode.equals('402')?"selected":""} />
												<option value="403" label="中国邮政储蓄银行" ${data.finaCode.equals('403')?"selected":""} />
												<option value="501" label="汇丰银行" ${data.finaCode.equals('501')?"selected":""} />
												<option value="502" label="东亚银行" ${data.finaCode.equals('502')?"selected":""} />
												<option value="503" label="南洋商业银行" ${data.finaCode.equals('503')?"selected":""} />
												<option value="504" label="恒生银行（中国）有限公司" ${data.finaCode.equals('504')?"selected":""} />
												<option value="505" label="中国银行（香港）有限公司" ${data.finaCode.equals('505')?"selected":""} />
												<option value="506" label="集友银行有限公司" ${data.finaCode.equals('506')?"selected":""} />
												<option value="507" label="创业银行有限公司" ${data.finaCode.equals('507')?"selected":""} />
												<option value="509" label="星展银行（中国）有限公司" ${data.finaCode.equals('509')?"selected":""} />
												<option value="510" label="永亨银行（中国）有限公司" ${data.finaCode.equals('510')?"selected":""} />
												<option value="512" label="永隆银行" ${data.finaCode.equals('512')?"selected":""} />
												<option value="531" label="花旗银行（中国）有限公司" ${data.finaCode.equals('531')?"selected":""} />
												<option value="532" label="美国银行有限公司" ${data.finaCode.equals('532')?"selected":""} />
												<option value="533" label="摩根大通银行（中国）有限公司" ${data.finaCode.equals('533')?"selected":""} />
												<option value="561" label="三菱东京日联银行（中国）有限公司" ${data.finaCode.equals('561')?"selected":""} />
												<option value="563" label="日本三井住友银行股份有限公司" ${data.finaCode.equals('563')?"selected":""} />
												<option value="564" label="瑞穗实业银行（中国）有限公司" ${data.finaCode.equals('564')?"selected":""} />
												<option value="565" label="日本山口银行股份有限公司" ${data.finaCode.equals('565')?"selected":""} />
												<option value="591" label="韩国外换银行股份有限公司" ${data.finaCode.equals('591')?"selected":""} />
												<option value="594" label="韩国产业银行" ${data.finaCode.equals('594')?"selected":""} />
												<option value="595" label="新韩银行（中国）有限公司" ${data.finaCode.equals('595')?"selected":""} />
												<option value="596" label="韩国中小企业银行有限公司" ${data.finaCode.equals('596')?"selected":""} />
												<option value="597" label="韩亚银行（中国）有限公司" ${data.finaCode.equals('597')?"selected":""} />
												<option value="621" label="华侨银行（中国）有限公司" ${data.finaCode.equals('621')?"selected":""} />
												<option value="622" label="大华银行（中国）有限公司" ${data.finaCode.equals('622')?"selected":""} />
												<option value="623" label="星展银行（中国）有限公司" ${data.finaCode.equals('623')?"selected":""} />
												<option value="631" label="泰国盘谷银行（大众有限公司）" ${data.finaCode.equals('631')?"selected":""} />
												<option value="641" label="奥地利中央合作银行股份有限公司" ${data.finaCode.equals('641')?"selected":""} />
												<option value="651" label="比利时联合银行股份有限公司" ${data.finaCode.equals('651')?"selected":""} />
												<option value="652" label="比利时富通银行有限公司" ${data.finaCode.equals('652')?"selected":""} />
												<option value="661" label="荷兰银行" ${data.finaCode.equals('661')?"selected":""} />
												<option value="662" label="荷兰安智银行股份有限公司" ${data.finaCode.equals('662')?"selected":""} />
												<option value="671" label="渣打银行" ${data.finaCode.equals('671')?"selected":""} />
												<option value="672" label="英国苏格兰皇家银行公众有限公司" ${data.finaCode.equals('672')?"selected":""} />
												<option value="691" label="法国兴业银行（中国）有限公司" ${data.finaCode.equals('691')?"selected":""} />
												<option value="694" label="法国东方汇理银行股份有限公司" ${data.finaCode.equals('694')?"selected":""} />
												<option value="695" label="法国外贸银行股份有限公司" ${data.finaCode.equals('695')?"selected":""} />
												<option value="711" label="德国德累斯登银行股份有限公司" ${data.finaCode.equals('711')?"selected":""} />
												<option value="712" label="德意志银行（中国）有限公司" ${data.finaCode.equals('712')?"selected":""} />
												<option value="713" label="德国商业银行股份有限公司" ${data.finaCode.equals('713')?"selected":""} />
												<option value="714" label="德国西德银行股份有限公司" ${data.finaCode.equals('714')?"selected":""} />
												<option value="715" label="德国巴伐利亚州银行" ${data.finaCode.equals('715')?"selected":""} />
												<option value="716" label="德国北德意志州银行" ${data.finaCode.equals('716')?"selected":""} />
												<option value="732" label="意大利联合圣保罗银行股份有限公司" ${data.finaCode.equals('732')?"selected":""} />
												<option value="741" label="瑞士信贷银行股份有限公司" ${data.finaCode.equals('741')?"selected":""} />
												<option value="742" label="瑞士银行" ${data.finaCode.equals('742')?"selected":""} />
												<option value="751" label="加拿大丰业银行有限公司" ${data.finaCode.equals('751')?"selected":""} />
												<option value="752" label="加拿大蒙特利尔银行有限公司" ${data.finaCode.equals('752')?"selected":""} />
												<option value="761" label="澳大利亚和新西兰银行集团有限公司" ${data.finaCode.equals('761')?"selected":""} />
												<option value="771" label="摩根士丹利国际银行（中国）有限公司" ${data.finaCode.equals('771')?"selected":""} />
												<option value="775" label="联合银行（中国）有限公司" ${data.finaCode.equals('775')?"selected":""} />
												<option value="776" label="荷兰合作银行有限公司" ${data.finaCode.equals('776')?"selected":""} />
												<option value="781" label="厦门国际银行" ${data.finaCode.equals('781')?"selected":""} />
												<option value="782" label="法国巴黎银行（中国）有限公司" ${data.finaCode.equals('782')?"selected":""} />
												<option value="785" label="华商银行" ${data.finaCode.equals('785')?"selected":""} />
												<option value="787" label="华一银行" ${data.finaCode.equals('787')?"selected":""} />
												<option value="969" label="（澳门地区）银行" ${data.finaCode.equals('969')?"selected":""} />
												<option value="989" label="（香港地区）银行" ${data.finaCode.equals('989')?"selected":""} />
										</select>
                                        </div>
                                        <div class="col-sm-5 form-control-static"></div>
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
        requirejs(["jquery","form"],function($,form){
            form();
        });
    </script>
</body>
</html>