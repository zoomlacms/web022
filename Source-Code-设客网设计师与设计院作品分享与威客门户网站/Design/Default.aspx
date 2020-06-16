<%@ page language="C#" autoeventwireup="true" inherits="Design_Default, App_Web_l1ynlgj5" enableviewstate="false" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>在线设计</title>
<style type="text/css">
    /*.top-bar {height:48px;line-height:48px;width:100%;background:#fff;
                position:fixed;top:0px;left:0px;min-width:600px;z-index:1450;
                transition:0.6s cubic-bezier(0.645, 0.045, 0.355, 1) top;
                box-shadow:0 0 15px 0 rgba(22, 45, 61, 0.5);padding:0 20px 0 20px;
    }*/
    .left-bar {position:fixed;top:72px;left:12px;z-index:1000;
                transition:0.6s cubic-bezier(0.645, 0.045, 0.355, 1) left;
    }
    .left-bar-items {
        display:inline-block;list-style:none;margin:0;padding:0;
    }
    .left-bar-items .left-bar-item {
        font-size:2em;background:linear-gradient(to bottom, rgba(255, 255, 255, 0.96) 0%, rgba(238, 238, 238, 0.96) 100%);
        box-shadow:0 2px 5px 0 rgba(22, 45, 61, 0.58);border-radius:24px;line-height:48px;height:48px;width:150px;text-align:left;padding-left:20px;color:#2b5672;
        position:relative;cursor:pointer;margin-bottom:12px;
    }
    .left-bar-items .left-bar-item:hover {color:#428bca;
    }
    .left-bar-items .left-bar-item .fontsp {
        font-size:0.6em;color:#162d3d;padding-left:10px;font-family:'Microsoft YaHei';
    }
    .left-bar-item.disabled {color:#ccc;cursor:default;}
    .left-bar-item.disabled:hover {color:#ccc;}
    .left-bar-item.disabled .fontsp {color:#ccc;}
    .rootcomp-toolbar {font-size:14px;position:fixed;border-radius:8px;background-color:rgba(255, 255, 255, 0.94);
                        width:96px;z-index:1000;box-shadow:0 0 14px 0 rgba(22, 45, 61, 0.36);
    }
    .rootcomp-toolbar .header {height:30px;line-height:30px;font-size:16px;
    }
    .rootcomp-toolbar .header i {margin-left:13px;cursor:pointer;color:#2d4150;
    }
    .rootcomp-toolbar .header .drag-zone {
        height:30px;cursor:move;width:100%;
    }
    .rootcomp-toolbar .inner {
        text-align:center;display:block;
    }
    .rootcomp-toolbar .sperator {
        margin:0 0 9px 0;width:100%;box-sizing:border-box;border-bottom:1px solid #f0f3f5;
    }
    .rootcomp-toolbar .button-grid .button {
        display:inline-block;width:33px;height:33px;border:0;border-radius:6px;
        color:#2d4150;font-size:15px;line-height:33px;margin:3px;padding:0px;vertical-align:top;text-align:center;cursor:pointer;
    }
    .rootcomp-toolbar .button-grid .button.disabled {color:#bcbcbc;}
    .rootcomp-toolbar .inner.form {
        text-align:left;padding:0 12px;padding-right:6px;padding-bottom:8px;color:#2b5672;
    }
    .rootcomp-toolbar .inner.form .fontsp {
        line-height:30px;padding:0 7px 0 7px;font-size:12px;
    }
    .rootcomp-toolbar .inner.form .form-control {
        border-radius:8px;border:1px solid transparent;position:relative;text-align:center;display:inline-block;
        background-color:rgba(0, 0, 0, 0.00);padding:0 2px !important;cursor:pointer;
    }
    .rootcomp-toolbar .inner.form .form-control:hover {
        background-color:#d3edff;
    }
    /*----------------*/
    #preview {width:100%;border:0;margin-top:48px;overflow-x:hidden;overflow-y:hidden;}
    /*顶部栏,左工具条,右通用组件栏,详细信息存弹出框中*/
    /*common*/
    .form-control.small {width:45px;}
    .wid1200 {width:1200px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
            <nav class="navbar navbar-default" style="position:fixed;width:100%;">
            <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-th"></span></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active cmd_page"><a href="javascript:;"><i class="fa fa-paste"></i> 页面设置<span class="sr-only">(current)</span></a></li>
                        <li class="cmd_labellist"><a href="javascript:;"><i class="fa fa-flag"></i> 页面标签管理</a></li>
                        <li class="cmd_pagelist">
                            <a href="javascript:;"><i class="fa fa-list"></i> 我的页面 <span class="caret"></span></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                         <li class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                <i class="fa fa-user"></i> <span id="uname_sp" runat="server"></span> <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu" style="min-width:10px;">
                                <li><a href="/User/Info/UserInfo.aspx" target="_blank">我的信息</a></li>
                                <li><a href="/User/Info/UserInfo.aspx" target="_blank">修改信息</a></li>
                                <li class="divider"></li>
                                <li><a href="/User/Logout.aspx">退出登录</a></li>
                            </ul>
                        </li>
                        <li style="padding-top:8px;">
                            <input type="button" class="btn btn-primary" onclick="if (confirm('要保存当前修改吗')) { PreSave(); }" value="保存页面"/>
                            <input type="button" class="btn btn-primary" onclick="PreView();" value="预览页面"/>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="left-bar menu-collapsed-wrapper">
            <ul class="left-bar-items menu-collapsed">
                <li class="left-bar-item cmd_addbk">
                    <i class="fa fa-square-o"></i><span class="fontsp">设置背景</span>
                </li>
                <li class="left-bar-item cmd_addcomp">
                    <i class="fa fa-plus-circle"></i><span class="fontsp">添加组件</span>
                </li>
                 <li class="left-bar-item cmd_addlabel"><i class="fa fa-flag"></i><span class="fontsp">引入标签</span></li>
                 <li class="left-bar-item cmd_addhtml"><i class="fa fa-html5"></i><span class="fontsp">插入Html</span></li>
                 <li class="left-bar-item disabled">
                    <i class="fa fa-shopping-cart"></i><span class="fontsp">组件市场</span>
                </li>
                 <li class="left-bar-item disabled">
                    <i class="fa fa-cloud-upload"></i><span class="fontsp">上传资源</span>
                </li>
            </ul>
        </div>
        <div style="right:84px;top:72px;" class="candrag rootcomp-toolbar slide-right custom-position">
            <div class="header">
                <div class="drag-zone">
                    <i class="fa fa-lightbulb-o" title="提示"></i>
                    <i class="fa fa-navicon" title="拖动"></i>
                    <i class="fa fa-remove" title="关闭"></i>
                </div>
            </div>
            <div class="sperator"></div>
            <div class="inner button-grid">
                <i class="button disabled fa fa-copy"></i>
                <i class="button disabled fa fa-paste"></i>
                <i class="button disabled fa fa-file-text"></i>
                <i class="button disabled fa fa-trash"></i>
            </div>
            <div class="sperator"></div>
            <div class="inner button-grid">
               <i class="button fa fa-dedent" title="对齐"></i>
               <i class="button fa fa-align-justify" title="文字"></i>
            </div>
            <div class="sperator"></div>
            <div class="inner form">
                <i class="fontsp fa fa-send" title="角度"></i>
                <input type="text" value="0" class="form-control small" maxlength="4" />
            </div>
            <div class="sperator"></div>
            <div class="inner form">
                <div class="text-center">Size</div>
                <div>
                    <span class="fontsp" title="宽">W</span>
                    <input id="root_width_t" type="text" value="0" class="form-control small" maxlength="4" />
                </div>
                <div>
                    <span class="fontsp" style="padding-left:8px;" title="高">H</span>
                    <input id="root_height_t" type="text" value="0" class="form-control small" maxlength="4" />
                </div>
            </div>
            <div class="sperator"></div>
            <div class="inner form">
                <div class="text-center">Position</div>
                <div>
                    <span class="fontsp">X</span>
                    <input id="root_x_t" type="text" value="0" class="form-control small" maxlength="4" />
                </div>
                <div>
                    <span class="fontsp" style="padding-left:8px;">Y</span>
                    <input id="root_y_t" type="text" value="0" class="form-control small" maxlength="4" />
                </div>
            </div>
            <div class="sperator"></div>
        </div>
        <div class="editor-animation-manager-wrapper">
            <div class="editor-wrapper" style="position:static;">
                <iframe id="preview" style="height: calc(100% - 48px);"></iframe>
            </div>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/JS/jquery-ui.min.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script src="/Design/JS/sea.js"></script>
    <script src="/Design/JS/comp/page.js"></script>
            <script id="testregion">
                function ShowCompList() {
                    for (var i = 0; i < page.compList.length; i++) {
                        var model=page.compList[i];
                        console.log(model.dataMod, model.config);
                    }
                }
        </script>
        <script>
            var lgDiag=new ZL_Dialog({backdrop:true,width:"wid1200"});lgDiag.maxbtn=false;
            var page = {};
            $(function () {
                if (window.comdiag) {comdiag.maxbtn = false; }
                $(".cmd_addcomp").click(function () {CloseDiag();comdiag.reload=true;  ShowComDiag("Diag/AddComp.aspx", "添加组件"); });
                $(".cmd_addbk").click(function () {CloseDiag(); ShowComDiag("Diag/Background/AddBK.aspx", "设置背景"); });
                $(".cmd_addlabel").click(function(){CloseDiag(); lgDiag.reload=true;lgDiag.ShowModal("Diag/Label/LabelManage.aspx","引入标签");});
                $(".cmd_addhtml").click(function(){CloseDiag();lgDiag.reload=true;lgDiag.ShowModal("Diag/Label/LabelCall.aspx","插入Html"); });
                $(".cmd_page").click(function(){
                    CloseDiag(); 
                    //如未保存,则先保存生成Guid再打开
                    if(page.guid==""){
                        PreSave(function(){
                            ShowComDiag("Diag/Page.aspx?id="+page.guid, "页面配置");
                        });}
                    else{ ShowComDiag("Diag/Page.aspx?id="+page.guid, "页面配置");}
                });
                $(".cmd_pagelist").click(function(){
                    CloseDiag();
                    lgDiag.reload=true;
                   
                    lgDiag.ShowModal("PageList.aspx","页面管理");
                });
                $(".cmd_labellist").click(function(){
                    CloseDiag();ShowComDiag("Diag/LabelList.aspx","标签管理");
                });
                $(".candrag").draggable({});
                seajs.use(["page"], function (instance) {
                    page = instance;
                    page.guid = "<%:Mid%>";
                    if (page.guid != "")//修改
                    {
                        var pageMod = <%=pageMod.page%>;
                        page.title = pageMod.title;
                        page.bgconfig = pageMod.bgconfig;
                        page.extendData=<%=extendData%>;
                        page.compData = <%=compData%>;
                        $("#preview").load(function(){
                            page.instance = $(this).contents();
                            page.init();
                            for (var i = 0; i < page.compList.length; i++) {
                                IfrHelper.addDomToIfr(page.compList[i]); 
                            }
                        });
                    }else
                    { 
                        $("#preview").load(function(){
                            page.instance = $(this).contents();                  
                        });
                    }
                    $("#preview").attr("src","Editor/Editor.aspx");
                    page.AddLabel=function(label){
                        console.log(label);
                    }
                });
            })
            //----------------------------
            var waitDiag = new ZL_Dialog();
            waitDiag.closebtn = false; waitDiag.backdrop = true;
            //附带具体的信息
            function AddComponent(model) {
                CloseDiag();
                //1,根据类型获取到对应的组件对象,并将对象初始化
                var compObj = page.GetCompObj(model);
                //2,将其附加入目标页面,由页面html引擎解析,并将其初始化展示
                IfrHelper.addDomToIfr(compObj);
                page.compList.push(compObj);
            }
            function PreSave(callback) {
                waitDiag.ShowMask("正在保存中");
                page.PreSave(function (data) {
                    waitDiag.CloseModal();
                    page.guid = data;
                    if(callback){callback(data);}
                });
            }
            //先保存,后支持预览
            function PreView() {
                waitDiag.ShowMask("正在准备预览");
                page.PreSave(function (data) {
                    waitDiag.CloseModal();
                    page.guid = data;
                    window.open("/Design/PreView.aspx?id=" + page.guid, "_preview");
                });
            }
            function CloseDiag()
            {
                comdiag.CloseModal();
                lgDiag.CloseModal();
                IfrHelper.getIfrObj().CloseDiag();
            }
            var loginDG=new ZL_Dialog();
            function AjaxLogin() {
                loginDG.title="用户登录";
                loginDG.url = "/login_Ajax.aspx";
                loginDG.maxbtn = false;
                loginDG.width = "width350";
                loginDG.closebtn = false;
                loginDG.backdrop = true;
                loginDG.ShowModal();
            }
            function LoginSuccess(model) {
                $("#uname_sp").text(model.name);
                loginDG.CloseModal();
            }
            //----------------------------Tools
            var IfrHelper = {
                config: { id: "preview" },
                addDomToIfr: function (compObj) {
                    var _ref = this;
                    var obj = _ref.getIfrObj();
                    obj.editor.scope.addDom(compObj);
                    setTimeout(function () {
                        compObj.UpdateRootPanel();
                        obj.EventBind();
                    }, 500);
                },
                getIfrObj: function () {
                    //返回的这个对象,用于直接调用ifr中的方法
                    var _ref = this;
                    return document.getElementById(_ref.config.id).contentWindow;
                },
                find: function (filter) {
                    //根据filter,jquery筛选返回,必须加载完后再执行
                    var _ref = this;
                    return $("#" + _ref.config.id).contents().find(filter);
                }
            };
        </script>
</asp:Content>