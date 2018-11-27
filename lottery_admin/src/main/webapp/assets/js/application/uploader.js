define(["jquery", "WebUploader"],function($, WebUploader) {
        return function(opts) {
           var $upload=$("#"+opts.upload),
        	imgWidth=opts.width || 200,
        	imgHeight=opts.height || 200,
        	multi=opts.multi,
            limitNum=opts.limitNum || 20;
        var uploader = WebUploader.create({

            // 选完文件后，是否自动上传。
            auto: true,

            // swf文件路径
            swf: 'assets/js/plugins/webuploader/Uploader.swf',

            // 文件接收服务端。
            server: 'system/upload',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: $upload,

            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        var $list = $upload.parent().find(".uploader-list");
        var $li,$img;
        /*uploader.on('fileQueued', function(file) {
        	
        });*/
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        /*uploader.on('uploadSuccess', function(file) {
            var $info = $('#' + file.id).find(".info");
            $info.on("click",function(){
            	$(this).parent().remove();
            });
        });*/
        if($list.find(".file-item").length>=1){
                $list.off("click",".info");
                $list.on("click",".info",function(){
                    var index=$(this).parent(".file-item").index();
                    var imgFiles=$(this).closest('.uploader-list').next("input:hidden").val().split("|");
                    imgFiles.splice(index,1);
                    $(this).closest('.uploader-list').next("input:hidden").val(imgFiles.join("|"));
                    $(this).parent().remove();
                });
            }    
        uploader.on('uploadAccept', function( file, response ) {
           if(response.status==200){
                    var datafiles=response.data.imgUrl;//response.data.file
                    var showfiles=response.data.imgUrl;
                    if(!multi){//上传单张图片
                        // 创建缩略图
                        if($list.find(".file-item").length<=0){
                                $li = $(
                                        '<div class="file-item thumbnail">' +
                                        '<img>' +
                                        '<div class="info">点击删除</div>' +
                                        '</div>'
                                    );
                                 $img = $li.find('img');
                                // $list为容器jQuery实例
                                $list.append($li);
                                 $img.attr('src', showfiles);
                            }else{
                               $list.find(".file-item img").attr("src",showfiles); 
                            }        
                        $upload.parent().find("input:hidden").val(datafiles);
                        $list.off("click",".info");
                        $list.on("click",".info",function(){
                            $(this).closest('.uploader-list').next("input:hidden").val("");
                            $(this).parent().remove();
                        });
                    }else{
                        var upNum=$list.find(".file-item").length;
                        if(upNum<=limitNum){
                           $li = $(
                                        '<div class="file-item thumbnail">' +
                                        '<img>' +
                                        '<div class="info">点击删除</div>' +
                                        '</div>'
                                    );
                                 $img = $li.find('img');
                                // $list为容器jQuery实例
                                $list.append($li);
                                 $img.attr('src', showfiles);

                            if($upload.parent().find("input:hidden").val()==""){
                              $upload.parent().find("input:hidden").val(datafiles);  
                          }else{
                            var imgFiles=$upload.parent().find("input:hidden").val();
                            $upload.parent().find("input:hidden").val(imgFiles+"|"+datafiles);
                          }
                        }else{
                            alert("上传文件个数不能超过"+limitNum+"个");
                        }
                        $list.off("click",".info");
                        $list.on("click",".info",function(){
                            var index=$(this).parent(".file-item").index();
                            var imgFiles=$(this).closest('.uploader-list').next("input:hidden").val().split("|");
                            imgFiles.splice(index,1);
                            $(this).closest('.uploader-list').next("input:hidden").val(imgFiles.join("|"));
                            $(this).parent().remove();
                        });
                    }
           }else{
           	alert("上传失败");
           }
        });
        // 文件上传失败，显示上传出错。
        uploader.on('uploadError', function(file) {
            alert("上传失败");
        });
        };
    }
);