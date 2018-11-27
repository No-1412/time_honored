var is_hand = 1;
define(["jquery","layer", "datepicker", "pagination"], function($,layer) {
    return {
        time: function() {
            $("#timestart").on("click", function(e) {
                e.preventDefault();
                WdatePicker({startDate:'%y-%m-%d 00:00:00', dateFmt:'yyyy-MM-dd HH:mm:ss', maxDate: '#F{$dp.$D(\'timeend\')}' });
            });
            $("#timeend").on("click", function(e) {
                e.preventDefault();
                WdatePicker({startDate:'%y-%m-%d 23:59:59', dateFmt:'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'timestart\')}' });
            });
            $("#date").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ });
            });
            $("#datestart").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ maxDate: '#F{$dp.$D(\'dateend\')}' });
            });
            $("#dateend").on("click", function(e) {
                e.preventDefault();
                WdatePicker({ minDate: '#F{$dp.$D(\'datestart\')}' });
            });
        },
        pages: function(_var, _form) {
        	var isLoad = $('#is_load').val();
        	if(isLoad == undefined || isLoad != 0) {
        		_list(0, _var, _form);
        	} else {
        		$('#tableId div').text('');
        	}
            function _list(page, _var, _form) {
                _url = $(_var).attr("url");
                _url = (_form && $(_form).length > 0) ? _url + "?" + $(_form).serialize() : _url;
                var index = page == null ? null : layer.load();
                $.ajax({
                    url: _url,
                    type: "get",
                    data: "page=" + (page ==  null ? 0 : page),
                    dataType: "html",
                    success: function(data) {
                        if(index != null) {layer.close(index);}
                        $(_var).html(data);
                        _pages(_var, _form);
                    }
                });
            }
            searchForm(_var, _form); 	
            function _pages(_var, _form) {
                $("#pages").pagination(parseInt($("#pages").attr('data-total')), {
                    callback: pageselectCallback, //PageCallback() 为翻页调用次函数。
                    prev_text: "上一页",
                    next_text: "下一页",
                    items_per_page: parseInt($("#pages").attr('data-epage')), //每页的数据个数
                    num_display_entries: 3, //两侧首尾分页条目数
                    current_page: parseInt($("#pages").attr('data-page')), //当前页码
                    //current_page:0,
                    num_edge_entries: 5,
                    load_first_page: false
                });

                function pageselectCallback(page_id, jq) {
                    _list(page_id, _var, _form);
                    return false;
                }
            }

            function searchForm(_var, _form) {
                $(_form).find("input[type=submit]").on("click", function(e) {
                    e.preventDefault();
                    var page = parseInt($("#pages").attr('data-page'));
                    _list(is_hand==1?0:page, _var, _form);
                });
                
                $('#back_refresh').on("click", function(e) {
                    e.preventDefault();
                    _list(null, _var, _form);
                });
            }
        }
    };
});
