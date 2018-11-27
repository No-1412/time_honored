requirejs(['jquery','uploader'],function ($,uploader) {
 uploader({upload:"multi_pic_upload",multi:true});//多图上传
 uploader({upload:"single_pic_upload"});//单图上传
});