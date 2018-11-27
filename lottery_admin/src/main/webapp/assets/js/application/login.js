requirejs(['jquery', 'layer', 'validate', 'jqform', 'placeholder'], function($, layer) {
	var exr = {
		username:$("#username"),
		password:$("#password"),
		valicode:$("#vcode")
	};
	
	$('#login_form').on('submit',function(){
		if(exr.username.val()==="" || exr.password.val()===""){
			layer.msg("用户名和密码不能为空", {icon: 2, time: 2000});
		} else if(exr.valicode.val()===""){
			layer.msg("动态口令不能为空", {icon: 2, time: 2000});
		} else {
		    var index = layer.load();
		    $.ajax({
		    	url:"common/login/submit",
		    	type:"post",
		    	dataType:"json",
		    	data:$(this).serialize(),
		    	success:function(results){
		    		layer.close(index);
		    		if(results.status != "200") {
		    			layer.msg(results.description, {icon: 2, time: 2000});
		    		} else {
		    			layer.msg("登录成功", {icon:1, time:1000}, function(){
		    				top.location.href=document.getElementById("base_path").href + "system/index";
		    			});
		            }
		    	}
		    });
	    }
	    return false;
	});
	
    $('input').placeholder();
});