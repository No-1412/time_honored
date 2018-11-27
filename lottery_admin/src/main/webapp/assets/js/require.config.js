requirejs.config({ //配置
    baseUrl: 'assets/js/application',
    paths: {
        jquery: '../plugins/jquery/jquery.min',
        metisMenu: '../plugins/metisMenu/jquery.metisMenu',
        slimscroll: '../plugins/slimscroll/jquery.slimscroll.min',
        bootstrap: '../plugins/bootstrap/bootstrap.min',
        layer: '../plugins/layer/layer.min',//弹窗
        pagination: '../plugins/pagination/jquery.pagination',//分页
        validate: '../plugins/validate/jquery.validate',//表单验证
        jqform: '../plugins/form/jquery.form',
        datepicker: '../plugins/datepicker/WdatePicker',//时间控件
        WebUploader: '../plugins/webuploader/webuploader',//上传图片
        fancybox: '../plugins/fancybox/jquery.fancybox',//图片预览
        UMeditor: '../plugins/umeditor/umeditor',//编辑框
        "umeditor.config": '../plugins/umeditor/umeditor.config',//编辑框
        "um.zh": '../plugins/umeditor/lang/zh-cn/zh-cn',//编辑框
        "placeholder": '../plugins/placeholder/jquery.placeholder',
        quickTime: '../plugins/time/quickTime'
    },
    shim:{
    	metisMenu:["jquery"],
    	slimscroll:["jquery"],
    	bootstrap:["jquery"],
    	pagination:["jquery"],
    	validate:["jquery"],
    	jqform:["jquery"],
        datepicker:["jquery"],
    	placeholder:["jquery"],
        UMeditor:{//编辑器
            deps:["jquery","umeditor.config",'css!../plugins/umeditor/themes/default/css/umeditor.min.css'],
            exports:"UM"
        },
        "um.zh":["UMeditor"],
    	WebUploader:{
    		deps:["jquery"],
    		exports:"WebUploader"
    	},
    	layer:{
    		deps:[
    		"jquery",
    		'css!../plugins/layer/skin/layer.css'
    		],
    		exports:"layer"
    	},
    	fancybox:{
    		deps:[
    		"jquery",
    		'css!../plugins/fancybox/jquery.fancybox.css'
    		]
    	},
    	quickTime:["jquery"]
    },
    map: {
        '*': {
            'css': '../require-css/css'
        }
    }
});
