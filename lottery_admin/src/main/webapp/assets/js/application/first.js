requirejs(['jquery', 'layer'], function($, layer) {
	setInterval(function() {
		myInterval(1);
	}, 5000);
	
	$('#refresh').on('click', function() {
		myInterval(2);
	});
	
	$('#recharge_verify').on('click', function() {
		parent.$('#recharge_verify').click();
	});
	
	$('#withdraw_verify').on('click', function() {
		parent.$('#withdraw_verify').click();
	});
	
	myInterval(2);
	function myInterval(type) {
		if(type == 2) {
			$("#refresh").attr("disabled","disabled");
			var index = layer.load();
		}
		$.ajax({
            url: 'system/first/count',
            type: "post",
            data:{type:type}
        }).done(function(results) {
        	if(type == 2) {
	        	layer.close(index);
	        	$("#refresh").removeAttr("disabled");
        	}
            if(results.status != "200") return;
            
        	var data = results.data;
        	if(type == 2) {
	        	//待办
	        	$('#recharage_count').text(data.rechargeCount);
	        	$('#withdraw_count').text(data.withdrawCount);
	        	
	        	//平台统计
	        	//$('#recharge_amount').text(data.total.recharge);
	        	//$('#withdraw_amount').text(data.total.withdraw);
	        	//$('#touzhu_amount').text(data.total.touzhu);
	        	//$('#win_amount').text(data.total.win);
	        	//$('#return_amount').text(data.total.fd);
	        	
	        	for(var p in data.tzMembers) {
	        		$('#tz_members_'+p).text(data.tzMembers[p]);
	        	}
	        	
	        	//用户统计
	        	$('#user_count').text(data.total.user);
	        	$('#user_proxy').text(data.total.agent);
	        	$('#user_member').text(data.total.member);
	        	$('#user_new_member').text(data.current.user);
//	        	$('#user_touzhu_amount').text(data.current.touzhu);
//	        	$('#user_win_amount').text(data.current.win);
//	        	$('#user_recharge_amount').text(data.current.recharge);
//	        	$('#user_withdraw_amount').text(data.current.withdraw);
	        	$('#user_online').text(data.online);
	        	$('#user_balance').text(data.userBalance);
        	}
        	
        	if(type == 1 && data.rechargeCount > 0) {
        		parent.$('.J_menuTab').each(function () {
	                if($(this).data('id') == 'system/recharge/verify') {
	                	parent.window.frames["iframe" + $(this).data('idx')].document.getElementById("back_refresh").click();
	                }
	            });
	            
	        	var audio='<audio id="audio1" style="display:none;" controls="controls" autoplay="autoplay" loop="loop" height="0" width="0"><source src="#SRC#" type="audio/mp3" /></audio>';
	            $("body").append(audio.replace('#SRC#', data.rechargeAudio));
	            setTimeout(function(){
	                $("#audio1").remove();
	            }, data.rechargeTime);
        	}
        	
        	if(type == 1 && data.withdrawCount > 0) {
        		parent.$('.J_menuTab').each(function () {
	                if($(this).data('id') == 'system/withdraw/verify') {
	                	//parent.window.frames["iframe" + $(this).data('idx')].document.getElementById("back_refresh").click();
	                }
	            });
        		
	        	var audio='<audio id="audio2" style="display:none;" controls="controls" autoplay="autoplay" loop="loop" height="0" width="0"><source src="#SRC#" type="audio/mp3" /></audio>';
	            $("body").append(audio.replace('#SRC#', data.withdrawAudio));
	            setTimeout(function(){
	                $("#audio2").remove();
	            }, data.withdrawTime);
        	}
        	
//        	if(type == 1 && data.onlineCount > 0) {
//	        	var audio='<audio id="audio3" style="display:none;" controls="controls" autoplay="autoplay" loop="loop" height="0" width="0"><source src="#SRC#" type="audio/mp3" /></audio>';
//	            $("body").append(audio.replace('#SRC#', data.onlineAudio));
//	            setTimeout(function(){
//	                $("#audio3").remove();
//	            }, data.onlineTime);
//        	}
        });
	}
});