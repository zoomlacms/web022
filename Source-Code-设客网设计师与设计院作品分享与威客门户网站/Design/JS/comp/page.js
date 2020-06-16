define(function (require, exports, module) {
    var $ = require("jquery");
    var ZLArray = require("array");
    var page = {
        instance: null,//指向页面实例
        guid: "",
        mode: "new",//new,edit,preview(disuse)
        title: "",
        meta: "",
        bgconfig: { type: "", url: "", post: "" },
        compList: [],//组件实体,通过双绑+重缓实时更新,作为最终保存对象
        compData: [],//用于初始化compList的数据,用于修改和预览时
        labelArr: "",
        extendData:[],//现用于存标签模块的数据
        init: function () {
            var ref = this;
            ref.SetBackGround();
            ZLArray.MyArr = ref.extendData;
            for (var i = 0; i < ref.compData.length; i++) {
                var data = JSON.parse(ref.compData[i]);
                if (data.config.type == "label") {
                    //找到对应的解析后的html
                    var labelMod = ZLArray.GetByID(data.dataMod.label, "label");
                    if (labelMod) { data.htmlTlp = labelMod.labelHtml; }
                }
                //普通解析
                var compObj = ref.GetCompObj(data);
                ref.compList.push(compObj);
            }
        },
        SetBackGround: function (bgmodel) {
            if (!bgmodel) { bgmodel = page.bgconfig; }
            if (bgmodel.url == "") { return; }
            page.instance.find("#page_bkdiv").remove(); //移除旧背景
            var $div = $('<div id="page_bkdiv"></div>');
            switch (bgmodel.type)
            {
                case "minimg":
                    {
                        $div.attr("style", 'position:fixed;top:0px;height:100%;width:100%;background-image:url(' + bgmodel.url + ');background-size:auto;background-repeat:repeat;z-index:-1;');
                    }
                    break;
                case "image":
                    {
                        $div.attr("style", 'background:url(' + bgmodel.url + ');background-position: center;left:0;top:0;right:0;bottom:0; position: fixed; background-repeat:no-repeat;background-size:cover;z-index:-1;');
                    }
                    break;
                case "video":
                    {
                        $div.attr("style", "position:fixed;top:0;left:0;z-index:-1;background-color:#fff;");
                        var html = '<video class="covervid-video" autoplay loop poster="' + bgmodel.post + '">';
                        html += '<source src="' + bgmodel.url + '" type="video/mp4">';
                        $div.append(html);
                    }
                    break;
                default:
                    alert("背景类型错误"); return;
                    break;
            }
            page.bgconfig = bgmodel;
            page.instance.find("#mainBody").append($div);
        },
        GetCompObj: function (model) {
            //依靠其中参数,类型,初始化为对应的对象并返回
            var compObj = null;
            //必须用静态字符串,需要解决方案
            switch (model.config.type) {
                case "text":
                    compObj = new (new require("text")())();
                    break;
                case "image":
                    compObj = new (new require("image")())();
                    break;
                case "button":
                    compObj = new (new require("button")())();
                    break;
                case "menu":
                    compObj = new (new require("menu")())();
                    break;
                case "gallery":
                    compObj = new (new require("gallery")())();
                    break;
                case "label":
                    compObj = new (new require("label")())();
                    break;
                case "video":
                    compObj = new (new require("video")())();
                    break;
                default:
                    alert(model.config.type + "未命中");
                    break;
            }
            compObj.Init(model);
            return compObj;
        },
        PreSave: function (callback) {
            //Converting circular structure to JSON,有递归互引
            //处理:PreSave后返回json即可
            var compArr = [];
            for (var i = 0; i < page.compList.length; i++) {
                var data = page.compList[i].PreSave(page);
                compArr.push(JSON.stringify(data));
            }
            //改为for var 拷贝
            var pageData = { title: page.title, bgconfig: page.bgconfig };
            $.post("/WebAPI/Design/Save", { guid: page.guid, "labelArr": page.labelArr, "page": JSON.stringify(pageData), "comp": JSON.stringify(compArr) }, function (data) {
                callback(data);
            })
        }
    };
    module.exports = page;
});