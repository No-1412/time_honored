define(['jquery', 'layer', 'validate', 'jqform'], function($, layer) {
	return function(){
		var validator=$('#form').validate({
            submitHandler: function(form) {
                var index = layer.load();
                var needReload = $(form).attr("data-reload");
                $(form).ajaxSubmit({
                    url:$(form).attr("data-url"),
                    type:"post",
                    dataType: 'json',
                    success:function(results){
                        layer.close(index);
                        if(results.status=="200"){
                            layer.msg("提交成功",{icon:1,time:1000}, function() {
                            	if(needReload == undefined || needReload == null || needReload != 0) {
                            		parent.is_hand = 0;
                            		parent.$("#tableForm").find("input[type=submit]").click();
                            		parent.is_hand = 1;
                            	}
                            	$("#colse-btn").click();
                            });
                        }else{
                            layer.msg(results.description,{icon:2,time:2000});
                        }
                    }
                });
                return false;
            }
        });
		
		$("#colse-btn").on("click",function(e){
		    parent.$("#"+window.name).closest(".layui-layer").prev(".layui-layer-shade").remove();
		    parent.$("#"+window.name).closest(".layui-layer").remove();
		});
	};
});