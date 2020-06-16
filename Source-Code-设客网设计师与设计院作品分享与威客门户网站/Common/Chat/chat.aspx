<%@ page language="C#" autoeventwireup="true" inherits="test_chat, App_Web_trr1yflt" clientidmode="Static" validaterequest="false" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/Controls/B_User.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="chat.css" rel="stylesheet" />
    <style type="text/css">
        .chat_body{height:320px;}
        .form-control {max-width:200px; margin-bottom:10px;}
    </style>
    <title>在线聊天</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 600px; height: 550px; border: 1px solid #ddd; float: left;">
            <div class="list_body" style="float: left; width: 160px;">
                <div class="chat_header"><asp:TextBox CssClass="form-control" placeholder="搜索联系人" onkeyup="SearchUserList()" ID="UserSearch_T" runat="server"></asp:TextBox></div>
                <ul style="height:426px;overflow-y:auto;">
                    
                    <ul><li class="list_group" id="visitor_ul" visible="false" runat="server">
                                    <div class="list_group_title" >
                                        <span class="glyphicon glyphicon-chevron-right remindgray"></span>
                                        <span>游客</span>
                                        <span class="remindgray" style="float:right;margin-right:10px;">
                                            <asp:Label runat="server" ID="Unum_L"></asp:Label>
                                        </span>
                                        <div style="clear:both;height:8px;"></div>
                                    </div>
                                </li>
                                <ul class="list_item_body" id="visitorlist">
                                    <asp:Repeater runat="server" ID="Y_RPT">
                                        <ItemTemplate>
                                            <li onclick="ChangeTalker(<%#"'"+Eval("UserID")+"','"+Eval("UserName")+"'" %>);" class="list_item" id="list_item_<%#Eval("UserID") %>">
                                                <img src="<%#Eval("UserFace") %>" class="member_face" onerror="this.src='/Images/userface/noface.gif';" />
                                                <p class="member_nick"><%#Eval("UserName") %><br />
                                                    <span class="isonline remindgray isonline_<%#Eval("UserID") %>">(检测中)</span>
                                                    <span id="unread_<%#Eval("UserID") %>" class="badge"></span>
                                                </p>
                                                <div style="clear:both;"></div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </ul>
                    <ul><li class="list_group" id="customs_ul" visible="false" runat="server">
                                    <div class="list_group_title" >
                                        <span class="glyphicon glyphicon-chevron-right remindgray"></span>
                                        <span>客服人员</span>
                                        <span class="remindgray" style="float:right;margin-right:10px;">
                                            <asp:Label runat="server" ID="Label1" Text="0"></asp:Label>
                                        </span>
                                        <div style="clear:both;height:8px;"></div>
                                    </div>
                                </li>
                                <ul class="list_item_body">
                                    <asp:Repeater runat="server" ID="Customs_RPT">
                                        <ItemTemplate>
                                            <li onclick="ChangeTalker(<%#"'"+Eval("S_AdminID")+"','"+Eval("S_Name")+"'" %>);" class="list_item" id="list_item_<%#Eval("S_AdminID") %>">
                                                <img src="<%#Eval("S_FaceImg") %>" class="member_face" onerror="this.src='/Images/userface/noface.gif';" />
                                                <p class="member_nick"><%#Eval("S_Name") %><br />
                                                    <span class="isonline remindgray isonline_<%#Eval("S_AdminID") %>">(检测中)</span>
                                                    <span id="unread_<%#Eval("S_AdminID") %>" class="badge"></span>
                                                </p>
                                                <div style="clear:both;"></div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </ul>
                    <ul><li class="list_group">
                                    <div class="list_group_title">
                                        <span class="glyphicon glyphicon-chevron-right remindgray"></span>
                                        <span>我的好友</span>
                                        <span class="remindgray" style="float:right;margin-right:10px;">
                                            <asp:Label runat="server" ID="Friend_Num"></asp:Label>
                                        </span>
                                        <div style="clear:both;height:8px;"></div>
                                    </div>
                                </li>
                                <ul class="list_item_body myfriends" >
                                    <asp:Repeater runat="server" ID="Friend_RPT">
                                        <ItemTemplate>
                                            <li onclick="ChangeTalker(<%#"'"+Eval("Fid")+"','"+Eval("UserName")+"'" %>);" class="list_item" id="list_item_<%#Eval("Fid") %>">
                                                <img src="<%#Eval("UserFace") %>" class="member_face" onerror="this.src='/Images/userface/noface.gif';" />
                                                <p class="member_nick"><%#Eval("UserName") %><br />
                                                    <span class="isonline remindgray isonline_<%#Eval("Fid") %>">(检测中)</span>
                                                    <span id="unread_<%#Eval("Fid") %>" class="badge"></span>
                                                </p>
                                                <div style="clear:both;"></div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </ul>
                    <ul class="list_search" style="display:none;">

                    </ul>
                </ul>
            </div>
            <div class="chat_container"  style="float:right;">
                <div class="chat_header">
                    <span id="uinfo_name">请先选择用户</span>
                    <span style="float: right; margin-right: 10px;">
                        <span class="glyphicon glyphicon-list-alt opbtn" style="margin-right:5px;" onclick="ShowHistory();" title="历史记录"></span>
                        <span class="glyphicon glyphicon-remove opbtn" onclick="parent.ChatClose();" title="关闭"></span>
                    </span>
                </div>
                <div id="chat_body_list" style="height:320px;"></div>
                <div id="mymsg">
                    <textarea id="content" style="height: 135px;"></textarea>
                    <div style="padding:5px 5px 5px 10px;border-left:1px solid #ddd; background:#fff;">
                         <span class="remindgray">支持Ctrl+Enter快捷键发送信息</span>
                         <input type="button" id="sendbtn" class="btn btn-xs btn-primary" value="发送" disabled="disabled" onclick="SendMsg();" style="float:right;"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="alert alert-info" role="alert" style="width:600px;margin-top:10px;">您可以通过UID来指定聊天对象，如：/Common/Chat/Chat.aspx?uid=1
</div>
        <div style="float: left; padding-left: 10px;display:none;">
            <input type="button" value="获取在线用户" onclick="GetOnlineList();" />
            <div><audio src="msg.mp3" id="msg_ad"/></div>
            <ul>
                <li>
                    <img src="" id="myfaceimg" style="width: 80px; height: 80px;" onerror="this.src='/Images/userface/noface.gif';" /></li>
                <li>名字:<input type="text" id="myname_t" /></li>
                <li>ID:<input type="text" id="myid_t" /></li>
                <li>
                      在线用户：<textarea id="onlineids_text" style="height: 100px;"></textarea>
                </li>
                <li>
                     与谁聊:<input type="text" id="ReceUser_Hid" />
                    <input type="button" value="测试" onclick="testF();" />
                    <input type="button" value="接收" onclick="GetMsg();" />
                </li>
                <li>获取在线用户:</li>
            </ul>
            <input type="text" id="test_fid" /><button type="button" onclick="AddFriend()">添加好友</button>
        </div>
        <%=Call.GetUEditor("content",5) %>
        <div class="modal fade" id="modeldiv" data-backdrop="static" style="top:20%;left:20%;">
            <div class="modal-dialog" style="width: 300px;">
                <div class="modal-content">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab0" data-toggle="tab">用户登录</a></li>
                        <li><a href="#tab1" data-toggle="tab">游客登录</a></li>
                    </ul>
                    <div class="modal-body">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab0">
                                <input type="text" id="uname_t" class="form-control" placeholder="用户名" onkeyup="GetEnterCode('focus','pwd_t');" />
                                <input type="password" id="pwd_t" class="form-control" onkeyup="GetEnterCode('click','ulogin_btn');"/>
                                <input type="button" id="ulogin_btn" value="登录" class="btn btn-primary" onclick="AJAXLogin(); disBtn(this,2000);" />
                                <input type="button" value="注册" class="btn btn-default" onclick="GetToReg();" />
                            </div>
                            <div class="tab-pane" id="tab1">
                                <input type="text" id="visname_t" class="form-control" value="游客" onkeyup="GetEnterCode('click','vlogin_btn');"/>
                                <input type="button" id="vlogin_btn" class="btn btn-primary" value="游客登录" onclick="VisitorLogin(); disBtn(this, 2000);" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField runat="server" ID="Wel_Hid" />
        <script type="text/javascript" src="/js/ZL_Chat.js"></script>
        <script type="text/javascript">
             var buser = new B_User();
             var zl_chat = new ZL_Chat();
             function GetToReg() {
                 if (parent)
                 { parent.location = "/User/Register.aspx"; }
                 else { location = "/User/Register.aspx"; }
             }
             function AJAXLogin() {
                 buser.Login({ name: $("#uname_t").val(), pwd: $("#pwd_t").val() }, function (data) {
                     //将信息填充入隐藏字段用户ID:用户名:用户头像
                     if (data == "" || data == -1) {alert("用户名或密码错误!!");}
                     else {zl_chat.AddOnline();}
                 });
             }
             function VisitorLogin(name) {
                 var uname = $("#visname_t").val();
                 zl_chat.AddOnline(uname);
                 location = location;
             }
             function VisitorToLogin(name, uid)
             {
                 //管理员后台请求与用户聊天
                 zl_chat.AddOnline(name, uid);
                 //location = location;
             }
             function ShowModal() {
                 $("#modeldiv").modal({ keyboard: false });
             }
             
             //仅刷新游客列表,加上新登录的游客,10秒检测一次
             function GetOnlineList() {
                 zl_chat.GetOnlineList();
             }
             function BeginInit() {
                 zl_chat.BeginInit();
             }
             function SetMyInfo(uid,uname,uface)
             {
                 zl_chat.myinfo.UserID = uid;
                 zl_chat.myinfo.UserName = uname;
                 zl_chat.myinfo.UserFace = uface;
                 zl_chat.myinfo.CDate = "00:00:00";
                 $("#myfaceimg").attr("src", zl_chat.myinfo.UserFace);
                 $("#myid_t").val(zl_chat.myinfo.UserID);
                 $("#myname_t").val(zl_chat.myinfo.UserName);
             }
             //显示欢迎信息
             function ShowWel(uname) {
                 var $cbody = zl_chat.GetBodyByID(0);
                 var msg = zl_chat.TlpReplace(zl_chat.othertlp, { UserFace: "", UserName: uname, CDate: "<%=DateTime.Now%>" }, $("#Wel_Hid").val());
                 $($cbody).append(msg);
                 setTimeout(zl_chat.setScrollBottom, 1);
             }
        </script>
        <script type="text/javascript">
            var interval = null;
            $(function () {
                $(".list_group").click(function () {
                    $(this).parent().find(".list_item_body").toggle("fast");
                })
                setTimeout(function () {
                        UE.getEditor("content").addListener("keydown", function (type, e) {
                            if (e.ctrlKey && e.keyCode == 13)
                            { zl_chat.SendMsg(); }
                        });
                }, 1000);
                $("#uname_t").focus();
            });
            //------------------------------
            function SendMsg() {
                zl_chat.SendMsg();
            }
            function ChangeTalker(uid, uname)//支持切换
            {
                return zl_chat.ChangeTalker(uid, uname);
            }
            function ShowHistory()
            {
                var cuid = $("#ReceUser_Hid").val();
                if (!cuid || cuid == "") { alert("尚未选定用户"); return; }
                window.open("/Common/Chat/ChatHistory.aspx?suid=" + cuid);
            }
            function GetParam2() {
                var index = location.href.indexOf("#");
                var r = "";
                if (index > -1) {
                    r = location.href.substring((index + 1), location.href.length);
                }
                return r;
            }
            //---------------------------------
            //用户好友列表
            var userlist;
            function InitUserList(obj) {
                userlist = obj;
            }
            function SearchUserList() {
                var text = $("#UserSearch_T").val();
                $('#list_search').html('');
                if (text != "") {
                    $('.list_group').hide();
                    $('.list_item_body').hide();
                    $('.list_search').show();
                    var listhtml = "";
                    var temp = "<li onclick=\"ChangeTalker(@fid,'@UserName');\" class='list_item' id='list_item_@fid'><img src='@UserFace' class='member_face' onerror=\"this.src='/Images/userface/noface.gif';\" /><p class='member_nick'>@UserName<br /><span class='isonline remindgray isonline_@fid'>(检测中)</span><span id='unread_@fid' class='badge'></span></p><div style='clear:both;'></div></li>";
                    for (var i = 0; i < userlist.length; i++) {
                        if (userlist[i].UserName.indexOf(text) > -1) {
                            listhtml += temp.replace(/@fid/g, userlist[i].Fid).replace(/@UserName/g, userlist[i].UserName).replace(/@UserFace/g, userlist[i].UserFace);
                        }
                    }
                    $('.list_search').html(listhtml);
                } else {
                    $('.list_group').show();
                    $('.list_search').hide();
                }
            }
            //添加好友
            function AddFriend() {
                $.ajax({
                    type: 'POST',
                    url: '/API/UserCheck.ashx',
                    data: { action: 'AddFriend', value: $('#test_fid').val() },
                    success:function(data){
                        if (data != "[]" && data != "-1") {
                            var obj = JSON.parse(data);
                            userlist.push(obj[0]);
                            var temp = "<li onclick=\"ChangeTalker(@fid,'@UserName');\" class='list_item' id='list_item_@fid'><img src='@UserFace' class='member_face' onerror=\"this.src='/Images/userface/noface.gif';\" /><p class='member_nick'>@UserName<br /><span class='isonline remindgray isonline_@fid'>(检测中)</span><span id='unread_@fid' class='badge'></span></p><div style='clear:both;'></div></li>";
                            var html = temp.replace(/@fid/g, obj[0].Fid).replace(/@UserName/g, obj[0].UserName).replace(/@UserFace/g, obj[0].UserFace);
                            $('.myfriends').append(html);
                            $("#Friend_Num").text(parseInt($("#Friend_Num").text()) + 1);
                        }
                    }
                });
            }
        </script>
    </form>
</body>
</html>
