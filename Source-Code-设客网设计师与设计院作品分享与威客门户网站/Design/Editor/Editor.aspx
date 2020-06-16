<%@ page language="C#" autoeventwireup="true" inherits="Design_Editor_Editor, App_Web_rico3fwt" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <script src="/JS/jquery-1.9.1.min.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script src="/dist/js/bootstrap.min.js"></script>

    <script src="/Design/JS/Plugs/jqueryUI/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="/Design/JS/Plugs/menu/bootstrap-contextmenu.js"></script>
    <script src="/Design/JS/Plugs/covervid.js"></script>

    <script src="/JS/jquery-ui.min.js"></script>
    <script src="/JS/JqueryUI/jquery.ui.core.js"></script>
    <script src="/JS/JqueryUI/jquery.ui.widget.js"></script>
    <script src="/JS/JqueryUI/jquery.ui.mouse.js"></script>
    <script src="/JS/JqueryUI/jquery.ui.resizable.js"></script>
    
    <link href="/JS/JqueryUI/jquery.ui.resizable.css" rel="stylesheet" />
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/Design/JS/Plugs/jqueryUI/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
    <style type="text/css">
        * {font-family:'Microsoft YaHei';}
        #editor {width:100%;height:100%;}
        .candrag,.onlydrag,.onlyresize {cursor:move;border:2px solid rgba(0, 0, 0, 0.00);}
        .candrag.active,.onlydrag.active {border:2px dashed #0094ff;}
        .dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover {background:#0081c2;color:#fff;}
        .diy_drag_div {margin:20px;}
    </style>
    <title>页面修改</title>
</head>
<body>
    <form id="form1" runat="server">
        <div ng-app="app">
            <div id="mainBody" ng-controller="appController" class="container">
                <%--<div id="text_443190d4" ng-model="list.text_443190d4" class="candrag ui-draggable ui-resizable" style="position:absolute;top:30%;left:40%;"><h1 class="ng-binding">页面标题</h1><div class="ui-resizable-handle ui-resizable-e" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 1000;"></div></div>--%>
            </div>
        </div>
        <div id="tools">
            <div id="context-menu">
                <ul id="context-ul" class="dropdown-menu" role="menu">
                    <li data-cmd="edit"><a><i class="fa fa-pencil"></i> 修改</a></li>
                    <li data-cmd="remove"><a><i class="fa fa-remove"></i> 移除</a></li>
           <%--         <li data-cmd="align"><a><i class="fa fa-align-justify"></i> 对齐</a></li>--%>
                    <li class="divider"></li>
                    <li data-cmd="common"><a tabindex="-1"><i class="fa fa-th"></i> 通用属性</a></li>
                </ul>
            </div>
            <div id="diagBody">
                <iframe id="diagIfr" style="border:none;width:100%;min-height:350px;"></iframe>
            </div>
        </div>
        <script>
            //------------------------
            var editor = {
                app: null, scope: null, compile: null, diag: null, ShowDiag: function (url, diagParam) {
                    diag = editor.diag;
                    if (!diagParam || diagParam == "") { diagParam = { autoOpen: true, width: 600, height: 500 }; }
                    $("#diagIfr").attr("src", url);
                    $("#diagIfr").height(diagParam.height + "px");
                    diag.dialog(diagParam);
                },
                AutoHeight: function (obj) {
                }
            };
            editor.app = angular.module("app", [], function ($compileProvider) { }).controller("appController", function ($scope, $compile) {
                editor.scope = $scope;
                $scope.list = {};
                //添加前检测同名元素,有同名元素存在且不为null,则取消添加
                $scope.addDom = function (compObj) {
                    if ($scope.list[compObj.id]) { console.log("取消添加,有重名元素存在"); return; }
                    $scope.list[compObj.id] = compObj;
                    var html = compObj.AnalyToHtml();
                    var template = angular.element(html);
                    compObj.instance = $compile(template)($scope);
                    angular.element(document.getElementById("mainBody")).append(compObj.instance);
                }
                //元素需要另外清零,或元素一个指向其
                $scope.delDom = function (name) {
                    if ($scope.list[name]) {
                        $scope.list[name].instance.remove();
                        delete $scope.list[name];
                    }
                }
            });
            $(function () {
                EventBind();
                editor.diag = $('#diagBody').dialog({
                    autoOpen: false,
                    width: 500,
                    //buttons: { "确定": function () { $(this).dialog("close"); }, "关闭": function () { $(this).dialog("close"); } }
                });
            });
            //------------------------
            function EventBind() {
                $("#mainBody a").each(function () { $(this).click(function () { window.event.returnValue = false; }); });
                $(".candrag,.onlydrag").unbind("click");
                $(".candrag").draggable({}).resizable({
                    ghost: true,
                    start: function (event, ui) { },
                    stop: function (event, ui) { }
                });
                $(".onlydrag").draggable({});
                $(".onlyresize").resizable({ ghost: true });
                //单出后增加边框
                $(".candrag,.onlydrag").click(function () {
                    $(".candrag,.onlydrag").removeClass("active");
                    $(this).addClass("active");
                    //通知更新右侧边框
                    var comp = parent.page.compList.GetByID($(this).attr("id"));
                    comp.UpdateRootPanel();
                });
                //每个控件自实现自己的菜单,并写好功能
                //未选中控件则为当前page,否则为控件
                $(".candrag,.onlydrag").contextmenu({
                    target: "#context-menu",//根据不同元素,载入不同html后再加载右键
                    before: function (e, context) {
                        //e.preventDefault();
                        //var id = context[0].id;
                        //var comp = parent.page.compList.GetByID(id);
                        //console.log(comp.config.type);
                        //$("#context-ul").html('<li><a tabindex="-1">' + context[0].id + '</a></li>');
                    },
                    onItem: function (context, e) {
                        //每个控件自实现单击事件,可以建一些通用的指令,其余特殊的指令,代码自实现
                        //规则<li data-cmd="refresh">sfsf</li>
                        var id = context[0].id;
                        var cmd = $(e.currentTarget).data("cmd");
                        var comp = parent.page.compList.GetByID(id);
                        //1,监听者模式实现对事件的监控
                        //2,该处理整入组件,应由组件自完成
                        switch (cmd)
                        {
                            case "edit":
                                editor.ShowDiag("/Design/Diag/" + comp.config.type + "/Edit.aspx?id=" + id, comp.diagParam);
                                break;
                            case "remove":
                                comp.instance.remove();
                                comp.RemoveSelf(parent.page.compList);
                                break;
                            case "common":
                                editor.ShowDiag("/Design/Diag/Common/Edit.aspx?id=" + id);
                                break;
                        }
                        $("#context-menu").hide();
                    }
                });
            }
            function CloseDiag() {
                editor.diag.dialog("close");
            }
        </script>
    </form>
</body>
</html>
