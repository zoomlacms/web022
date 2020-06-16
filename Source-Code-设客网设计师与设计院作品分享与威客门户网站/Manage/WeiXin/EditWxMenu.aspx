<%@ page language="C#" autoeventwireup="true" inherits="Manage_WeiXin_EditWxMenu, App_Web_ycbxry5x" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>自定义菜单</title>
<style>
.Conent_fix #toTop { position:fixed; margin-left:10px; bottom:5px; font-size:12px;}
.Conent_fix #toTop i { font-size:16px; }
.add_diag{width:400px;}
.menu_option{font-size:16px;}
#menu_ul li{cursor:pointer;}
#menu_ul li:hover{background-color:#eee;}
#menu_ul .li_active{background-color:#ccc;}
.control_panel{height:700px;}
.option_panel{margin-top:30px; text-align:center;}
.control_panel .items{margin:70px; text-align:center;}
.control_panel .items h3{color:#ccc;}
.control_panel .items li{ padding-left:10px; padding-right:10px; text-align:center;}
.control_panel .items .option{border:solid #ccc 1px; border-radius:50%; height:200px; padding-top:55px;  color:white; background-color:#0092bc; cursor:pointer;}
.control_panel .items .option:hover{background-color:#0072bc;}
.control_panel .items .option span{font-size:60px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
<div class="container-fluid" style="padding:0 0 0 0;">
        <div class="row">
        <div class="col-md-3">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">菜单管理 
                    <div class="pull-right menu_option">
                        <a href="javascript:;" onclick="ShowAddMenu(-1)"><span class="glyphicon glyphicon-plus"></span></a>
                        <a href="javascript:;" onclick="SaveMenu()"><span class="glyphicon glyphicon-floppy-open"></span></a>
                    </div>
                    </div>
                <!-- List group -->
                <ul class="list-group" id="menu_ul">
                
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">设置动作 <div class="pull-right"></div></div>
                <div class="panel-body">
                    <div class="control_panel">
                        <div class="items">
                            <h3 id="tip">提示</h3>
                            <div class="container-fluid option_panel">
                                <div class="row">
                                    <ul>
                                        <li class="col-md-3 col-sm-4 col-xs-5"><div data-tip="点击为选中项创建子菜单" onclick="ShowAddMenu(curMenu.index)" class="option parent"><span class="glyphicon glyphicon-edit"></span><br /> <b>创建子菜单</b></div></li>
                                         <li class="col-md-3 col-sm-4 col-xs-5"><div class="option child" data-tip="用户点击该菜单后，立即回复消息"><span class="glyphicon glyphicon-comment"></span><br /> <b>推送消息</b></div></li>
                                         <li class="col-md-3 col-sm-4 col-xs-5"><div data-tip="用户点击该菜单后,客户端立即跳转页面" class="option child"><span class="glyphicon glyphicon-link"></span><br /> <b>跳转链接</b></div></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="pre_div" style="display:none;">
                            <iframe id="pre_ifr" src="" style="width:330px; margin-left:30%; border:none; height:700px;"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
     </div>
    <input type="hidden" id="preview_hid" />
    <div class="Conent_fix">
        <button type="button" class="btn btn-primary" onclick="SaveMenu()"><i class="glyphicon glyphicon-floppy-open"></i> 保存</button>
        <button type="button" class="btn btn-primary" onclick="PreViewMenu()"><i class="glyphicon glyphicon-eye-open"></i> 预览</button>
    </div>
    <div id="AddMenu" style="display:none;">
        <div class="container-fluid text-center">
            <input type="text" id="menuname_t" class="form-control" placeholder="输入菜单按钮名称" /><br />
            <button type="button" class="btn btn-default margin_t5" onclick="AddMenu()">确定</button>
            <button type="button" onclick="CloseAddMenu()" class="btn btn-default margin_t5">取消</button>
        </div>
    </div>
    <script src="/JS/Controls/ZL_Dialog.js" type="text/javascript"></script>
    <script>
        var menudata = [];
        var curMenu = {};//当前选中的菜单
        $().ready(function () {
            InitMenu();
            GetWxData();
            BindMenuEvent();
            BindOptionEvent();
        });
        function BindMenuEvent() {
            $("#menu_ul li").click(function () {
                $(".items").show();
                $(".pre_div").hide();
                $("#menu_ul li").removeClass('li_active');
                $(this).addClass('li_active');
                GetSelMenu();
            });
        }
        //检查并选中菜单对象
        function GetSelMenu() {
            $(".option").hide();//隐藏所有选项
            if ($("#menu_ul .li_active")[0] && $("#menu_ul .li_active").data('index')>=0) {
                var $active = $("#menu_ul .li_active");
                curMenu = menudata[parseInt($active.data('index'))];
                curMenu.index = $active.data('index');
                if ($active.data('pindex')>=0) {//选中的菜单为子菜单
                    curMenu = curMenu.sub_button[parseInt($active.data('pindex'))];
                    curMenu.pindex = $active.data('pindex');
                    $('.child').show();//显示子菜单动作选项
                    $("#tip").text('请选择用户点击菜单时的动作!');
                } else if (curMenu.sub_button && curMenu.sub_button.length > 0) {//判断该菜单是否已添加了子菜单
                    $('.parent').show();
                    $("#tip").text('该菜单已有子菜单，不能设置其他动作!');
                } else {
                    $('.option').show();
                    $("#tip").text('请选择用户点击菜单时的动作!');
                }
            } else {
                $("#tip").text('请选中要设置的菜单!');
            }
        }
        //绑定动作选项事件
        function BindOptionEvent() {
            $(".option").hover(function () {
                $("#tip").text($(this).data("tip"));
            }, function () {
                $("#tip").text('提示');
            });
        }
        function GetWxData() {
            $.ajax({
                type: 'POST',
                data: { action: 'get' },
                success: function (data) {
                    console.log(data);
                    var obj = JSON.parse(data);
                    menudata = obj.menu.button;
                    InitMenu();
                }
            });
        }
        //初始化微信菜单
        function InitMenu() {
            var tlp = "<li class='list-group-item' @data>@menutlp</li>";
            var menutlp = "<span class='glyphicon glyphicon-list-alt'></span> @name "//父菜单模板
                          + "<div class='pull-right'><a href='javascript:;' onclick='ShowAddMenu(@index)'><span class='glyphicon glyphicon-plus'></span></a> "
                          +"<a href='javascript:;' onclick='removeMenu(@index)'><span class='glyphicon glyphicon-trash'></span></a></div>";
            var childtlp = "<span class='glyphicon glyphicon-chevron-right'></span> <span class='glyphicon glyphicon-edit'></span>  @name"//子菜单模板
                            + "<div class='pull-right'><a href='javascript:;' onclick='removeChMenu(@index,@pindex)'><span class='glyphicon glyphicon-trash'></span></a></div>"
            var listhtml = "";
            var menucout = 18;//微信规定最大菜单数为18个
            for (var i = 0; i < menucout; i++) {
                var menuname = "<span class='glyphicon glyphicon-minus gray_c'></span>";//菜单名字，默认-
                if (menudata[i]) {
                    menuname = menutlp.replace(/@name/g, menudata[i].name).replace(/@index/g, i);
                    listhtml += tlp.replace(/@menutlp/g, menuname).replace(/@data/g,"data-index="+i);
                    if (menudata[i].sub_button) {
                        for (var j = 0; j < menudata[i].sub_button.length; j++) {//遍历子菜单
                            menuname = childtlp.replace(/@name/g, menudata[i].sub_button[j].name);
                            listhtml += tlp.replace(/@menutlp/g, menuname).replace(/@index/g,i).replace(/@pindex/,j).replace(/@data/g,"data-index="+i+" data-pindex="+j);
                            menucout--;//减去子菜单占掉的菜单数
                        }
                    }
                } else {
                    listhtml += tlp.replace(/@menutlp/g, menuname);
                }
            }
            $("#menu_ul").html(listhtml);
            BindMenuEvent();
            GetSelMenu();//检查选中菜单
        }
        //移除菜单
        function removeMenu(index) {
            menudata.splice(index,1);
            InitMenu();
        }
        //移除子菜单
        function removeChMenu(index, cindex) {
            menudata[index].sub_button.splice(cindex, 1);
            if (menudata[index].sub_button.length <= 0)
                delete menudata[index].sub_button;
            InitMenu();
        }
        var diag = new ZL_Dialog();
        function ShowAddMenu(index) {
            if (index >= 0 && (menudata[index].sub_button && menudata[index].sub_button.length >= 5)) {
                alert("微信二级菜单数量最多为5个!");
                return;
            } else if(menudata.length>=3&&index<0) {
                alert("微信一级菜单数量最多为3个!");
                return;
            }
            diag.title = '添加菜单';
            diag.width = 'add_diag';
            diag.content = 'AddMenu';
            diag.ShowModal();
            $("#menuname_t").val('');
            $("#menuname_t").data('index', index);//数据索引，用于判断添加菜单类型(子级、父级)
        }
        function CloseAddMenu() {
            diag.CloseModal();
        }
        function AddMenu() {
            var index = parseInt($("#menuname_t").data('index'));
            if (index < 0) {//添加父菜单
                menudata.push({ name: $("#menuname_t").val() });
            } else {
                if (!menudata[index].sub_button)//添加子菜单
                    menudata[index].sub_button = [];
                menudata[index].sub_button.push({name: $("#menuname_t").val() });
            }
            InitMenu();
            diag.CloseModal();
        }
        function SaveMenu() {
            if (menudata.length > 0) {
                CheckData();
                $.ajax({
                    type: 'POST',
                    data: { action: 'create', menus: JSON.stringify(menudata) },
                    success: function (data) {
                        var obj = JSON.parse(data);
                        if (obj.errmsg == "ok") {
                            alert('保存成功!');
                        } else {
                            alert("保存出错!")
                        }
                    }
                });
            } else {
                alert("请添加菜单!");
            }

        }
        //检测数据(不完整数据如:缺少type字段等将使用默认值代替)
        function CheckData() {
            for (var i = 0; i < menudata.length; i++) {
                if (!menudata[i].type && !menudata[i].sub_button) {//没有子菜单的情况下默认将它设为按钮类型
                    menudata[i].type = "click";
                    menudata[i].key = "button_" + i;
                } else if (menudata[i].sub_button) {//遍历子菜单
                    for (var j = 0; j < menudata[i].sub_button.length; j++) {
                        if (!menudata[i].sub_button[j].type) {//对没有设置类型的子菜单将它默认设为按钮类型
                            menudata[i].sub_button[j].type = "click";
                            menudata[i].sub_button[j].key = "menu_"+i+"_btn_"+j;
                        }
                    }
                }
            }
        }
        function PreViewMenu() {
            $("#preview_hid").val("{\"menu\":{\"button\":" + JSON.stringify(menudata) + "}}");
            $(".items").hide();
            $(".pre_div").show();
            $("#pre_ifr").attr('src', 'MenuPreView.aspx?Cid=preview_hid');
        }
    </script>
</asp:Content> 
