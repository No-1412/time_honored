requirejs(['jquery', 'tablePage','layer', "quickTime"], function($, tablePage,layer) {
   tablePage.pages("#tableId","#tableForm");//表格分页
   tablePage.time();//时间控件
   $(document).on("click", "a.cancel_link", function(e) {//删除
                    var that = $(this),
                        _id = that.attr("data-id"),
                        _url = that.attr("data-url");
                    e.preventDefault();
                    layer.confirm("是否删除？", function() {
                    	var index = layer.load();
                        $.ajax({
                            url: _url,
                            type: "post",
                            data: {
                                id: _id
                            }
                        }).done(function(results) {
                        	layer.close(index);
                            if (results.status == "200") {
                                layer.msg("删除成功", {
                                    icon: 1,
                                    time: 1000
                                }, function() {
                                	is_hand = 0;
                            		$("#tableForm").find("input[type=submit]").click();
                            		is_hand = 1;
                                });
                            } else {
                                layer.msg(results.description, {
                                    icon: 2,
                                    time: 2000
                                });
                            }
                        });
                    });
                });
   $(document).on("click", "a.custom_link", function(e) {
       var that = $(this),
           _url = that.attr("data-url"),
           _msg = that.attr("data-msg"),
           _id = that.attr("data-id");
           _data = that.attr("data-data");
       e.preventDefault();
       if(_msg == 'NVL') {
    	   var index = layer.load();
    	   $.ajax({
               url: _url,
               type: "post",
               data: {
            	   id: _id,
                   data: _data
               }
           }).done(function(results) {
        	   layer.close(index);
               if (results.status == "200") {
                   layer.msg("操作成功", {
                       icon: 1,
                       time: 1000
                   }, function() {
                	   	is_hand = 0;
	               		$("#tableForm").find("input[type=submit]").click();
	               		is_hand = 1;
                   });
               } else {
                   layer.msg(results.description, {
                       icon: 2,
                       time: 2000
                   });
               }
           });
       } else {
	       layer.confirm(_msg, function() {
	    	   var index = layer.load();
	           $.ajax({
	               url: _url,
	               type: "post",
	               data: {
	            	   id: _id,
	                   data: _data
	               }
	           }).done(function(results) {
	        	   layer.close(index);
	               if (results.status == "200") {
	                   layer.msg("操作成功", {
	                       icon: 1,
	                       time: 1000
	                   }, function() {
	                	   is_hand = 0;
	                   	   $("#tableForm").find("input[type=submit]").click();
	                   	   is_hand = 1;
	                   });
	               } else {
	                   layer.msg(results.description, {
	                       icon: 2,
	                       time: 2000
	                   });
	               }
	           });
	       });
       }
   });
   $(document).on("click", "a.custom_submit_link", function(e) {
       var that = $(this),
           _url = that.attr("data-url"),
           _msg = that.attr("data-msg"),
           _vars = that.attr("data-vars"),
           _data = that.attr("data-data"),
           _refresh = that.attr("data-refresh");
       
       var params = {};
       if(_vars != null && _vars != '' && _vars != undefined) {
    	   var arrs = _vars.split(',');
    	   for(var i=0;i<arrs.length;i++) {
    		   params[arrs[i]] = $("input."+arrs[i]+_data).val();
    	   }
       }
       e.preventDefault();
       layer.confirm(_msg, function() {
    	   var index = layer.load();
           $.ajax({
               url: _url,
               type: "post",
               data: params
           }).done(function(results) {
        	   layer.close(index);
               if (results.status == "200") {
                   layer.msg("操作成功", {
                       icon: 1,
                       time: 1000
                   }, function() {
                	   if(_refresh != '0') {
                		   	is_hand = 0;
                   			$("#tableForm").find("input[type=submit]").click();
                   			is_hand = 1;
                	   }
                   });
               } else {
                   layer.msg(results.description, {
                       icon: 2,
                       time: 2000
                   });
               }
           });
       });
   });
   $(document).on("click", "a.edit_link", function(e) {
                    var that = $(this),
                        _id = that.attr("data-id"),
                        _url = that.attr("data-url"),
                        _title = that.attr("data-title"),
                    	_width = that.attr("data-width"),
                    	_height = that.attr("data-height");
                    e.preventDefault();
                    var _index=layer.open({
					  type: 2,
					  title: _title != null ? _title : "编辑",
					  anim: 2,
					  area:[_width == null ? '800px' : _width, _height == null ? '550px' : _height],
					  content: [_url + '?id=' + _id]
					});
                });
   $(document).on("click", "input.add_link", function(e) {
       var that = $(this),
           _url = that.attr("data-url"),
           _width = that.attr("data-width"),
       	   _height = that.attr("data-height");
       e.preventDefault();
       var _index=layer.open({
		  type: 2,
		  title: "新增",
		  anim: 2,
		  area:[_width == null ? '800px' : _width, _height == null ? '550px' : _height],
		  content: [_url]
		});
   });
   
   $(document).on("click", "input.edit_link", function(e) {
       var that = $(this),
           _id = that.attr("data-id"),
           _url = that.attr("data-url"),
           _title = that.attr("data-title"),
       	   _width = that.attr("data-width"),
       	   _height = that.attr("data-height");
       e.preventDefault();
       var _index=layer.open({
		  type: 2,
		  title: _title != null ? _title : "编辑",
		  anim: 2,
		  area:[_width == null ? '800px' : _width, _height == null ? '550px' : _height],
		  content: [_url + '?id=' + _id]
		});
   });
});
