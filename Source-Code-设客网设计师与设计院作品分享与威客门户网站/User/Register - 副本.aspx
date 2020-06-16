<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.User_Register, App_Web_nr3m1mx2" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<title>用户注册-<%:Call.SiteName %></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/App_Themes/User.css" rel="stylesheet" />  
<link href="/Template/Ke/style/global.css?Version=20150909" rel="stylesheet"/>  
<%--<script type="text/javascript" src="/JS/Common.js"></script>--%>
<script type="text/javascript" src="/JS/PassStrong.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/ZL_ValidateCode.js"></script>
<script type="text/javascript" src="http://code.zoomla.cn/Area.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_PCC.js"></script> 
<script type="text/javascript" src="/JS/ZL_Regex.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<style>
.footer{ position:relative; bottom:0; width:100%; background:#fff;}
.reg_sub{ background:none; color:#333;}
.reg_sub_t{ color:#fff;}
.reg_sub label{ color:#333;}
.reg_sub li input.form-control{ color:#666;}
.reg_sub li select.form-control{ color:#666;}
.register_modeltable tr td{ color:#333;}
.reg_sub_item{ box-shadow:0 0 3px 1px rgba(0,0,0,0.1);}
.reg_sub #BtnSubmit{ background:none; color:#333;}
</style>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\"/}");%>
<form id="form1" runat="server">
<div id="backimg_div" style="/*background:url(http://code.zoomla.cn/user_login.jpg);*/background-repeat:no-repeat;background-size:cover;">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="user_mimenu">
<div class="navbar navbar-fixed-top" role="navigation">
<button type="button" class="btn btn-default" id="mimenu_btn">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<div class="user_mimenu_left">
<ul class="list-unstyled">
<li><a href="/" target="_blank">首页</a></li>
<li><a href="/Home" target="_blank">能力</a></li>
<li><a href="/Index" target="_blank">社区</a></li>
<li><a href="/Ask" target="_blank">问答</a></li>
<li><a href="/Guest" target="_blank">留言</a></li>
<li><a href="/Baike" target="_blank">百科</a></li>
<li><a href="/Office" target="_blank">OA</a></li>
</ul>
</div>
<div class="navbar-header">
<button class="navbar-toggle in" type="button" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">移动下拉</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</div>
</div> 
</div> 
        <div class="container" style="padding-top: 30px; ">
            <div id="reg_main">
                <asp:Literal ID="LitControlTreeInfo" runat="server"></asp:Literal>
                <asp:Panel ID="PnlRegStep0" runat="server" Visible="false" Width="100%">未开放注册，请和网站管理员联系！</asp:Panel>
                <asp:Panel ID="PnlRegStep1" runat="server" Visible="false" Width="100%">
                    <h1>第一步：服务条款和声明</h1>
                    <textarea name="textarea" cols="20" rows="2" readonly style="font-weight: normal; font-size: 9pt; width: 99%; line-height: normal; font-style: normal; height: 372px; font-variant: normal"><asp:Literal ID="LitProtocol" runat="server"></asp:Literal></textarea>
                    <div class="rsubmit">
                        <asp:Button ID="BtnRegStep1" CssClass="btn btn-primary" runat="server" Text="同意" OnClick="BtnRegStep1_Click" />
                        <asp:Button ID="BtnRegStep1NotApprove"  CssClass="btn btn-primary" runat="server" Text="不同意" OnClick="BtnRegStep1NotApprove_Click"/>
                    </div>
                    <asp:HiddenField ID="hfUrl" runat="server" />
                    <!--第二轮开始 -->
                    <script type="text/javascript">
                        var secs = 9;
                        var wait = secs * 1000;
                        var btnId = "BtnRegStep1";
                        document.getElementById(btnId).disabled = true;

                        function regload() {
                            document.getElementById(btnId).value = "我同意[" + secs + "]";
                            for (i = 1; i <= secs; i++) {
                                window.setTimeout("Update(" + i + ")", i * 1000);
                            }
                            window.setTimeout("Timer()", wait);
                        }

                        function Update(num) {
                            if (num != secs) {
                                printnr = (wait / 1000) - num;
                                document.getElementById(btnId).value = "我同意[" + printnr + "]";
                            }
                        }
                        function Timer() {
                            document.getElementById(btnId).disabled = false;
                            document.getElementById(btnId).value = "我同意";
                        }
                        function endbtn() {
                            document.getElementById(btnId).disabled = false;
                        }
                    </script>
                </asp:Panel>
                <asp:Panel ID="PnlMRegStep1" runat="server">
                    <div id="MobileRegis" class="reg_sub" runat="server">
                        <h1>第一步：手机验证</h1>
                        <asp:Label ID="lbmob" runat="server"></asp:Label>
                        <ul>
                            <li>
                                <div class="form-group">
                                    <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">手机号：</label>
                                    <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                        <asp:TextBox ID="TxtMobile1" runat="server" CssClass="form-control" value="222"></asp:TextBox>
                                        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                                    </div>
                                    <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                                        <asp:RequiredFieldValidator ID="rg1" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="手机号码不能为空" SetFocusOnError="false" ControlToValidate="TxtMobile1" />
                                        <asp:RegularExpressionValidator ID="rg4" Display="Dynamic" ForeColor="Red" runat="server" ControlToValidate="TxtMobile1" ErrorMessage="请输入正确的手机号码" ValidationExpression="^1(?:3|5|8)\d{9}$" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">短信验证码：</label>
                                    <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0 text-left">
                                        <asp:Button ID="sendBtn" runat="server" Text="获取验证码" OnClick="SendMob_Click" CssClass="btn btn-info" />
                                    </div>
                                </div>
                            </li>
                            <li>
                                <asp:Button ID="Button1" runat="server" Text="下一步" OnClick="BtnMRegStep1_Click" CssClass="btn btn btn-primary" Style="margin-top: 10px;" />
                            </li>
                        </ul>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PnlRegStep2" runat="server" Visible="false" Width="100%">
                    <div class="border_right">
                        <script type="text/javascript">
                            var btnId2 = "BtnSubmit";//提交按钮ID
                            function checkreg(obj) {
                                if (document.getElementById("CheckBox1").checked) {
                                    document.getElementById(btnId2).disabled = false;
                                }
                                else {
                                    document.getElementById(btnId2).disabled = true;
                                }
                            }
                            //后台调用
                            function dispbtn() {
                                disBtn(btnId2);
                            }
                            function PostToCS(a,v,func)
                            {
                                $.ajax({
                                    type:"Post",
                                    data:{action:a,value:v},
                                    success:function(data)
                                    {
                                        func(data);
                                    },
                                    error:function(data)
                                    {
                                        alert("错误"+data);
                                    }
                                });
                            }
                            function SyncPost(json,callback) {
                                //{ action: "ParentUser", value: args.Value }
                                $.ajax({
                                    type: "Post",
                                    async: false,
                                    data: json,
                                    success: function (data) {
                                        callback(data);
                                    },
                                    error: function (data) {
                                        alert("错误" + data);
                                    }
                                });
                            }
                            //----Register User
                            function CheckUser()
                            {
                                var userName = document.getElementById("TxtUserName");
                                var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                checkUserNameMessage.className = "";
                                checkUserNameMessage.innerHTML = "";
                                if(userName.value.toString().replace(" ","")!="")
                                {
                                    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                    checkUserNameMessage.className = "";
                                    checkUserNameMessage.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";        
                                    PostToCS("UserIsExist",userName.value,ReceiveServerData);
                                }
                            } 
                            function ReceiveServerData(result)
                            { 
                                var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                checkUserNameMessage.innerHTML="";
                                if(result == "true")
                                {
                                    checkUserNameMessage.innerHTML = "用户名已经被注册了！";
                                    checkUserNameMessage.className = "d_err";
                                }
                                if (result == "error") {
                                    checkUserNameMessage.innerHTML = "用户名长度不符合规定的长度！";
                                    checkUserNameMessage.className = "d_err";
                                }
                                if(result == "disabled")
                                {
                                    checkUserNameMessage.innerHTML = "该用户名禁止注册！";
                                    checkUserNameMessage.className = "d_err";
                                }
                                if(result == "false"||result == "Fidtrue2"||result == "Fno"||result == "Fidtrue"||result=="Fyidtrue"||result=="Fcidtrue"||result=="Fxidtrue")
                                {
                                    checkUserNameMessage.innerHTML = "恭喜您，用户名可以使用！";
                                    checkUserNameMessage.className = "d_ok";
                                }
                            }
                            //--------推荐人
                            function CheckParent(sender, args) {
                                SyncPost({ action: "ParentUser", value: args.Value }, function (data) {
                                    if (data == 0)
                                        args.IsValid = false;
                                    else
                                        args.IsValid = true;
                                });
                            }
                            function CheckParentUser()
                            {
                                var userName = document.getElementById("TxtParentUserID");
                                var checkUserNameMessage = document.getElementById("CheckParentUserMessage");  
                                if(userName!="")
                                {
                                    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                    checkUserNameMessage.className = "";
                                    checkUserNameMessage.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";        
                                    PostToCS("ParentUser",userName.value,ReceiveServerDataParent);
                                }
                            }
                            function CheckParentUserID() {
                                    var userName = document.getElementById("TxtParentUser");
                                    var checkUserNameMessage = document.getElementById("CheckParentUserIDMessage");
                                    if (userName != "") {
                                        var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                        checkUserNameMessage.className = "";
                                        checkUserNameMessage.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";
                                        PostToCS("ParentUserID", userName.value, ReceiveServerDataParentID);
                                    }
                            }
                            function ReceiveServerDataParent(result)
                            {    
                                GetParentUserMsg("CheckParentUserMessage", result);
                            }
                            function GetParentUserMsg(msgid, result) {
                                var checkcardmsg = document.getElementById(msgid);
                                if (result == "1") {
                                    checkcardmsg.innerHTML = "该用户存在有效，请继续注册！";
                                    checkcardmsg.className = "d_err";
                                }
                                else if (result == "0") {
                                    checkcardmsg.innerHTML = "该用户不存在！";
                                    checkcardmsg.className = "";
                                }
                                else if (result == "-1") {
                                    checkcardmsg.innerHTML = "";
                                    checkcardmsg.className = "";
                                }
                            }
                            function ReceiveServerDataParentID(result) {
                                GetParentUserMsg("CheckParentUserIDMessage", result);
                            }
                            //--------邀请码
                            function CheckInvite(sender, args)
                            {
                                SyncPost({ action: "InvitCode", value: args.Value }, function (data) {
                                    if (data == 0)
                                        args.IsValid = false;
                                    else
                                        args.IsValid = true;
                                });
                            }
                            function CheckInvitCode() {
                                var code = $("#TxtInvitCode").val();
                                var msg_labeel = document.getElementById("InvitCodeMsg");
                                if (code != "") {
                                    $("#InvitCodeMsg").removeClass().html("<img src=\"images/loading.gif\" align=\"absmiddle\" />");
                                    PostToCS("InvitCode", code, ReceiveInvitCode);
                                }
                                else { ReceiveInvitCode("-1"); }
                            }
                            function ReceiveInvitCode(result) {
                                var checkcardmsg = document.getElementById("InvitCodeMsg");
                                switch (result)
                                {
                                    case "1":
                                        checkcardmsg.innerHTML = "邀请码有效！";
                                        checkcardmsg.className = "d_err";
                                        break;
                                    case "0":
                                        checkcardmsg.innerHTML = "邀请码无效！";
                                        checkcardmsg.className = "";
                                        break;
                                    default:
                                        checkcardmsg.innerHTML = "";
                                        checkcardmsg.className = "";
                                        break;
                                }
                            }
                            //--------
                            function Checkyes() {
                                var idCard = document.getElementById("TxtIDCard");
                                var checkcardmsg = document.getElementById("checkcard");
                                if (!ZL_Regex.isIDCard(idCard)) {
                                    checkcardmsg.innerHTML = "身份证格式不正确";
                                    checkcardmsg.className = "d_err";
                                }
                                else {
                                    //后端验证
                                }
                            }
                            //显示或关闭选填信息
                            function SwicthSelectFill()
                            {
                                var selectFill = document.getElementById("TableRegisterSelect");
                                var selectFill2 = document.getElementById("TableRegisterSelect2");
                                if(selectFill.style.display=="none")
                                {
                                    selectFill.style.display="";
                                    selectFill2.style.display="";
                                    $("#disBtn").removeClass("metro").addClass("metroed");
                                }
                                else
                                {
                                    selectFill.style.display="none";
                                    selectFill2.style.display="none";
                                    $("#disBtn").removeClass("metroed").addClass("metro");
                                }
                            }
                            function hidenbtn()
                            {
                                var selectFill = document.getElementById("TableRegisterSelect");
                                var selectFill2 = document.getElementById("TableRegisterSelect2");
                                selectFill.style.display="none";
                                selectFill2.style.display="none";
                                document.getElementById("checkSelectFill").checked=false;
                            }
                        </script>
                        <div class="reg_sub"><!--注册用户--补全信息--注册成功(替换为图片形式)-->
                        <h1 class="text-center">注册会员</h1>
                            <div class="reg_sub_item">
                            <div class="reg_sub_t"><i class="fa fa-user"></i> 基本信息</div>
                            <ul class="list-unstyled">
                            <li>
                            <div class="col-md-3 col-xs-5"><label>用户名</label></div>
                            <div class="col-md-6 col-xs-7 padding0"><asp:TextBox ID="TxtUserName" CssClass="form-control" runat="server" onblur="CheckUser();" /></div>
                            <div class="col-md-3 col-xs-12 padding5">
                            <span class="d_err" id="CheckUserNameMessage"></span>
                                            <asp:RegularExpressionValidator ID="R4" runat="server" ControlToValidate="TxtUserName" ErrorMessage="不能包含特殊字符" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" Display="Dynamic" ForeColor="Red"/>
                                            <asp:RequiredFieldValidator ID="ReqTxtUserName" runat="server" ControlToValidate="TxtUserName" ErrorMessage="用户名不能为空" ValidationGroup="userVaid" Display="Dynamic" ForeColor="Red" />
                                            <asp:Literal ID="usertip" runat="server"></asp:Literal>
                                            <span runat="server" visible="false">用户名在
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>～<asp:Literal ID="Literal1" runat="server"></asp:Literal>个字符之间</span>
                            </div>
                            <div class="clearfix"></div>
                            </li>
                            <li>
                            <div class="col-md-3 col-xs-5"><label>密码</label></div>
                            <div class="col-md-6 col-xs-7 padding0"><asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" CssClass="form-control" onfocus=" focusinput();" onkeyup="f_checkrank();" /></div>
                            <div class="col-md-3 col-xs-12 padding5">
                                <div id="valPass">
                                    <span class="spantxt"><a id="idshow" class="atxt"></a></span><span class="spantxt"><a id="apass1" class="a_bor visible-xs"></a><a id="apass2" class="a_bor visible-xs"></a><a id="apass3" class="a_bor visible-xs"></a></span><span style="margin-left: 10px;"><br/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="TxtPassword"
                                            ValidationExpression="[\S]{6,}" ValidationGroup="userVaid" ErrorMessage="密码至少6位" Display="Dynamic" ForeColor="Red" />
                                        <asp:RequiredFieldValidator ID="ReqTxtPassword" runat="server" ControlToValidate="TxtPassword"
                                            SetFocusOnError="false" ValidationGroup="userVaid" ErrorMessage="密码不能为空" Display="Dynamic" ForeColor="Red" />
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            </li>
                            <li>
                            <div class="col-md-3 col-xs-5"><label>确认密码</label></div>
                            <div class="col-md-6 col-xs-7 padding0">
                            <asp:TextBox ID="TxtPwdConfirm" TextMode="Password" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-3 col-xs-12 padding5">
                            <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TxtPwdConfirm" ValidationGroup="userVaid" SetFocusOnError="false" Display="Dynamic" ErrorMessage="确认密码不能为空" ForeColor="Red" />
                                 <asp:CompareValidator ID="req2" runat="server" ControlToValidate="TxtPwdConfirm" ControlToCompare="TxtPassword"
                                      Operator="Equal" SetFocusOnError="false" ValidationGroup="userVaid" ErrorMessage="两次密码输入不一致" Display="Dynamic" ForeColor="Red" />
                            </div>
                            <div class="clearfix"></div>     
                            </li>
                            <li id="regVcodeRegister" runat="server" visible="false">
                            <div class="col-md-3 col-xs-5"><label>验证码</label></div>
                            <div class="col-md-6 col-xs-7 padding0">
                                <div class="form-group" id="trVcodeRegister" runat="server">
                                <asp:TextBox ID="VCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control codestyle" ></asp:TextBox>
                                </div>
                            </div>    
                            <div class="col-md-3 col-xs-12 padding5">
                            <img id="VCode_img" title="点击刷新验证码" class="codeimg img-responsive"  style="height:34px;margin-left:2px;"/>
                                <input type="hidden" id="VCode_hid" name="VCode_hid" /> 
                            </div>  
                            </li>          
                            </ul>
                            <div class="clearfix"></div>
                            </div>
                            <div class="reg_sub_item">
                            <div class="reg_sub_t"><i class="fa fa-lock"></i> 安全设置</div>
                            <ul class="list-unstyled">
                            <li>   
                            <div class="col-md-3 col-xs-5"><label>密码问题</label></div>
                            <div class="col-md-6 col-xs-7 padding0">  
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem>最喜欢的运动是什么？</asp:ListItem>
                                <asp:ListItem>最喜欢的运动员是谁？</asp:ListItem>
                                <asp:ListItem>我最喜欢的物品的名称？</asp:ListItem>
                                <asp:ListItem>我最喜欢的歌曲？</asp:ListItem>
                                <asp:ListItem>我最喜欢的食物？</asp:ListItem>
                                <asp:ListItem>我最爱的人的名字？</asp:ListItem>
                                <asp:ListItem>我最爱的电影？</asp:ListItem>
                                <asp:ListItem>我妈妈的生日？</asp:ListItem>
                                <asp:ListItem>我的初恋日期？</asp:ListItem>
                            </asp:DropDownList>
                        	</div> 
                            <div class="col-md-3 col-xs-12"></div> 
                            <div class="clearfix"></div>
                            </li>     
                            <li>   
                            <div class="col-md-3 col-xs-5"><label>问题答案</label></div>
                            <div class="col-md-6 col-xs-7 padding0">     
                            <asp:TextBox ID="TxtAnswer" runat="server" CssClass="form-control required" />                            
                            </div>  
                            <div class="col-md-3 col-xs-12 padding5">
                            <asp:RequiredFieldValidator ID="ReqAnswer" ForeColor="Red" runat="server" ValidationGroup="userVaid" ControlToValidate="TxtAnswer" SetFocusOnError="false" Display="Dynamic" ErrorMessage="问题答案不能为空" /></div>
                            <div class="clearfix"></div> 
 							</li> 
                            <li id="regEmail" runat="server">   
                            <div class="col-md-3 col-xs-5"><label>Email</label></div>
                            <div class="col-md-6 col-xs-7 padding0">     
                            <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-3 col-xs-12">
                            <asp:RequiredFieldValidator ID="ReqTxtEmail" runat="server" ValidationGroup="userVaid" ControlToValidate="TxtEmail" ForeColor="Red" Display="Dynamic" ErrorMessage="Email不能为空" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="邮件地址不规范" ValidationGroup="userVaid" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" />
                            </div>
                            </li>
                            </ul>
                            <div class="clearfix"></div>
                            </div>
                            <ul>  
                            <li id="regParent" runat="server">
                                <div class="form-group">
                                </div>
                            </li>
                            </ul> 
                            <ul> 
                             <li>
                             <div class="col-md-3 col-xs-5"><label>用户类型</label></div>
                             <div class="col-md-6 col-xs-7 padding0">
                                   <asp:RadioButtonList ID="UserGroup" runat="server" CssClass="register_modeltable" RepeatDirection="Horizontal" RepeatColumns="3"></asp:RadioButtonList>
                             </div>
                             <div class="col-lg-3 col-xs-12"></div>
                             </li>
                                <li>
                                     <table style="width:100%;" border="0">
                                          <asp:Literal ID="modelhtml" runat="server"></asp:Literal>
                                    </table>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <table id="TableRegisterMust" class="register_modeltable" runat="server" border="0" width="100%">
                                        <tr id="usergroupss" runat="server" class="hidden" style="display: none;">
                                            <td class="tdbgleft" style="width: 20%"></td>
                                        </tr>
                                    </table>
                                    <table id="ModelFiled_table" class="register_modeltable" border="0" style="width:100%;"></table>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                            <div class="reg_sub_item sel_reg">
                            <div class="reg_sub_t" onclick="SwicthSelectFill();" id="disBtn"><i class="glyphicon glyphicon-grain"></i> 选填信息</div>
                            <ul class="list-unstyled"> 
                        	<table style="border-collapse: collapse; display: none;" id="TableRegisterSelect" cellspacing="1" cellpadding="2" width="100%" border="0" runat="server"> 
                                <tr id="trSwicthSelectFill" runat="server">
                                    <td style="width: 25%" class="tdbgleft" onclick="SwicthSelectFill()"></td>
                                    <td></td>
                                </tr>
                            </table>
                            </ul>
                            </div>
                            <ul>
                                <li>
                                    <div>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <table style="border-collapse: collapse; display: none" id="TableRegisterSelect2"
                                                    name="TableRegisterSelect2" width="100%" border="0">
                                                    <asp:Label ID="reghtml" runat="server"></asp:Label>
                                                    <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <table style="border-collapse: collapse" width="100%"
                                            border="0">
                                            <tr class="tdbgleft">
                                                <td><span class="r_red">以上所有信息除选填项都必须先正确填写后才能成功注册。</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" 同意并接受注册协议" onclick="checkreg()" style="color:#fff;" /> 
                                                    <div class="clearfix"></div>
                                                    <asp:Button ID="BtnSubmit" runat="server" Text="注 册" CssClass="btn btn-default" ValidationGroup="userVaid" OnClick="BtnSubmit_Click"  />
                                                    <p class="pull-right login_remind">已有帐号，立即<a href="login.aspx">登录</a></p>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="display: none" id="TableRegister" width="100%" border="0" runat="server">
                                            <tbody>
                                                <tr id="TRParentUserID" runat="server" visible="false">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">推荐人</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtParentUserID" runat="server" CssClass="form-control" onblur="CheckParentUser()"></asp:TextBox>
                                                                <asp:Literal ID="musttrParentUserID" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="CheckParentUserMessage" style="color: red;"></label>
                                                                <asp:CustomValidator runat="server" ID="PUR" ControlToValidate="TxtParentUserID" Display="None" ValidateEmptyText="true" ErrorMessage="推荐人不存在!" ForeColor="Red" SetFocusOnError="true" ClientValidationFunction="CheckParent" />
                                                                <asp:RequiredFieldValidator ID="ReqTxtParentUserID" runat="server" Display="None" ErrorMessage="推荐人不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtParentUserID" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="TRParentUser" runat="server" visible="false">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">推荐人ID</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtParentUser" runat="server" CssClass="form-control" onblur="CheckParentUserID()"></asp:TextBox>
                                                                <asp:Literal ID="musttrParentUser" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="CheckParentUserIDMessage" style="color: red;"></label>
                                                                 <asp:RequiredFieldValidator ID="ReqTxtParentUser" runat="server" Display="None" ErrorMessage="推荐人ID不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtParentUserID" />
                                                                  <asp:RegularExpressionValidator ValidationExpression="\d*" ID="ReqNumTxtParentUser" runat="server" ErrorMessage="推荐人ID必须为有效数字" SetFocusOnError="true" ControlToValidate="TxtParentUserID"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr id="TRInvitCode" runat="server" visible="false">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">邀请码</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtInvitCode" runat="server" CssClass="form-control" onblur="CheckInvitCode()"></asp:TextBox>
                                                                <asp:Literal ID="musttrInvitCode" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="InvitCodeMsg" style="color: red;"></label>
                                                                <asp:CustomValidator runat="server" ID="ReqInvitCode" ControlToValidate="TxtInvitCode" Display="None" ValidateEmptyText="true" ErrorMessage="邀请码不存在!" ForeColor="Red" SetFocusOnError="true" ClientValidationFunction="CheckInvite" />
                                                                <asp:RequiredFieldValidator ID="ReqTxtInvitCode" runat="server" Display="None" ErrorMessage="邀请码不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtInvitCode" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trUserSex" runat="server">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">性别</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:DropDownList ID="DropSex" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Text="男" Value="1" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="女" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Literal ID="musttrUserSex" runat="server"></asp:Literal>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr id="trBirthday" runat="server">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">出生日期</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtBirthday" runat="server" onblur="vaildDate()" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" CssClass="form-control" Text="1985-05-12" />
                                                                <asp:Literal ID="musttrBirthday" runat="server"></asp:Literal>
                                                                <asp:RequiredFieldValidator ID="ReqTxtBirthday" runat="server" ErrorMessage="出生日期不能为空"
                                                                    SetFocusOnError="false" ControlToValidate="TxtBirthday" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                            <div class="col-sm-3 col-lg-3 col-md-3 col-xs-12 text-left">
                                                                <span id="vaildate" class="d_err"></span>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr id="trHomepage" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">主页</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtHomepage" runat="server" CssClass="form-control">http://</asp:TextBox>
                                                                <asp:Literal ID="musttrHomepage" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtHomepage" runat="server" ErrorMessage="主页地址不能为空" SetFocusOnError="false" ControlToValidate="TxtHomepage" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr id="trQQ" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">QQ号码</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtQQ" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrQQ" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtQQ" runat="server" ErrorMessage="QQ号码不能为空" SetFocusOnError="false" ControlToValidate="TxtQQ" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trICQ" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-5">ICQ号码</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtICQ" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrICQ" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtICQ" runat="server" ErrorMessage="ICQ号码不能为空" SetFocusOnError="false" ControlToValidate="TxtICQ" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trMSN" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">MSN帐号</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtMSN" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrMSN" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtMSN" runat="server" ErrorMessage="MSN帐号不能为空" SetFocusOnError="false" ControlToValidate="TxtMSN" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trYahoo" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">雅虎通帐号</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtYahoo" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrYahoo" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtYahoo" runat="server" ErrorMessage="雅虎通帐号不能为空" SetFocusOnError="false" ControlToValidate="TxtYahoo" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trUC" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">UC帐号</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtUC" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrUC" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtUC" runat="server" ErrorMessage="UC号码不能为空" SetFocusOnError="false" ControlToValidate="TxtUC" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trOfficePhone" runat="server">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">办公电话</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtOfficePhone" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrOfficePhone" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtOfficePhone" runat="server" ErrorMessage="办公电话不能为空"
                                                                    SetFocusOnError="false" ControlToValidate="TxtOfficePhone" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trHomePhone" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">家庭电话：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtHomePhone" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrHomePhone" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtHomePhone" runat="server" ErrorMessage="家庭电话不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtHomePhone" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trFax" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">传真号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtFax" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrFax" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtFax" runat="server" ErrorMessage="传真号码不能为空" SetFocusOnError="false" ControlToValidate="TxtFax" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trMobile" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">手机号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrMobile" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtMobile" runat="server" ErrorMessage="手机号码不能为空" SetFocusOnError="false" ControlToValidate="TxtMobile" Display="Dynamic" ForeColor="Red" />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtMobile" ErrorMessage="请输入正确的手机号码" ValidationExpression="^1(?:3|5|8)\d{9}$" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trPHS" runat="server">
                                                    <td colspan="2" >

                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">小灵通号码</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtPHS" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrPHS" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtPHS" runat="server" ErrorMessage="小灵通号码不能为空" SetFocusOnError="false" ControlToValidate="TxtPHS" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trAddress" runat="server">
                                                    <td colspan="2">

                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">联系地址</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrAddress" runat="server"></asp:Literal>
                                                                <asp:RequiredFieldValidator ID="ReqTxtAddress" runat="server" ErrorMessage="联系地址不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtAddress" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trZipCode" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">邮政编码</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtZipCode" runat="server" MaxLength="6" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrZipCode" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtZipCode" ValidationGroup="userVaid" runat="server" ErrorMessage="邮政编码不能为空" SetFocusOnError="false" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtZipCode" />
                                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="userVaid" ErrorMessage="请输入正确的邮政编码" ControlToValidate="TxtZipCode" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trTrueName" runat="server">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">真实姓名</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtTrueName" runat="server" CssClass="form-control" />
                                                                <asp:Literal ID="musttrTrueName" runat="server"></asp:Literal>
                                                                <asp:RequiredFieldValidator ID="ReqTxtTrueName" runat="server" ControlToValidate="TxtTrueName"
                                                                    ErrorMessage="真实姓名不能为空" SetFocusOnError="false" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trIDCard" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">身份证号码</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtIDCard" runat="server" CssClass="form-control" onblur="Checkyes()"></asp:TextBox>
                                                                <asp:Literal ID="musttrIDCard" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="checkcard" style="color: red;"></label>
                                                                必须18位且未在本系统注册过，不足18位请以X替代
                              <asp:RequiredFieldValidator ID="ReqTxtIDCard" runat="server" Display="None" ErrorMessage="身份证号码不能为空" SetFocusOnError="false" ControlToValidate="TxtIDCard"></asp:RequiredFieldValidator>
                                                                <div style="display: none;">
                                                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="(^\d{15}$)|(^\d{17}([0-9]|X)$)" ControlToValidate="TxtIDCard" ErrorMessage="请输入正确格式"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trUserFace" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">头像地址</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 text-left padding0">
                                                                <asp:TextBox ID="TxtUserFace" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrUserFace" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtUserFace" runat="server" Display="None" ErrorMessage="头像地址不能为空" SetFocusOnError="false" ControlToValidate="TxtUserFace"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trProvince" runat="server">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">省市县</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <select name="selprovince" id="selprovince" class="form-control"></select>
                                                                <select name="selcity" id="selcity" class="form-control"></select>
                                                                <select name="selcoutry" id="selcoutry" class="form-control"></select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trFaceWidth" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5 text-right padding0">头像宽度</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 text-left">
                                                                <asp:TextBox ID="TxtFaceWidth" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrFaceWidth" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtFaceWidth" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="只能为数字" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator ID="ReqTxtFaceWidth" runat="server" Display="None" ErrorMessage="头像宽度不能为空" SetFocusOnError="false" ControlToValidate="TxtFaceWidth"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trFaceHeight" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">头像高度</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtFaceHeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrFaceHeight" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="TxtFaceHeight" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="只能为数字" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator ID="ReqTxtFaceHeight" runat="server" Display="None" ErrorMessage="头像高度不能为空" SetFocusOnError="false" ControlToValidate="TxtFaceHeight"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trSign" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">签名档</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:TextBox ID="TxtSign" runat="server" TextMode="MultiLine" Height="60" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrSign" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtSign" runat="server" Display="None" ErrorMessage="签名档不能为空" SetFocusOnError="false" ControlToValidate="TxtSign"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trPrivacy" runat="server">
                                                    <td colspan="2" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 col-lg-3 col-md-3 col-xs-5">隐私设定</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-7 padding0">
                                                                <asp:DropDownList ID="DropPrivacy" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Text="公开信息" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="只对好友公开" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="完全保密" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Literal ID="musttrPrivacy" runat="server"></asp:Literal>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <asp:Panel ID="PnlStep3" runat="server" Visible="false">
                <div class="reg">
                    <h1 class="text-center"><span class="glyphicon glyphicon-user" style="font-size: 2em; margin-right: 10px; color: #00CCFF;"></span><span style="margin-left: 10px;">会员帐号信息</span></h1>
                    <%--<h2>第三步：注册结果<img src="/App_Themes/UserThem/images/regl3.gif" alt="" /></h2>--%>
                    <ul id="userinfo">
                        <li>
                            <asp:Literal ID="LitRegResult" runat="server"></asp:Literal>
                        </li>
                        <li>您的会员名：<span><%= Get(0) %></span></li>
                        <li>您的密码是：<span><%= Get(2) %></span></li>
                        <li>注册邮箱是：<span><%= Get(1) %></span></li>
                        <li>请您妥善保存您的信息，如忘记密码在<a href="/User/GetPassword.aspx" target="_blank">密码找回页</a>凭邮箱找回。</li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </asp:Panel>
            <div></div>
        </div>
        <asp:HiddenField ID="hfReturnUrl" runat="server" />
    </div>
    </form> 
    <style type="text/css"> 
    .d_ok {color:green;}
    .d_err {color:red;}
    .cms2login .codestyle { width:100%; }
    </style>
    <script type="text/javascript">
        var curflag = true;
        $(function () {
            var pcc = new ZL_PCC("selprovince", "selcity", "selcoutry");
            pcc.ProvinceInit();
            initModelFied();
            //验证码
            $("#VCode").ValidateCode();
            //边栏事件
            $("#mimenu_btn").click(function (e) {
                if ($(".user_mimenu_left").width() > 0) {
                    $(".user_mimenu_left ul").fadeOut(100);
                    $(".user_mimenu_left").animate({ width: 0 }, 200);
                }
                else {
                    $(".user_mimenu_left").animate({ width: 150 }, 300);
                    $(".user_mimenu_left ul").fadeIn();
                }
            });
        })
        function TimeClose() {
            if (i > 0) {
                i--;
                document.getElementById("sendBtn").value = "(" + i + "秒后)重发验证码";
                document.getElementById("sendBtn").disabled = "true";
            }
            else {
                document.getElementById("sendBtn").value = "重新获取验证码";
                document.getElementById("sendBtn").disabled = "false";
            }
            window.setTimeout(function () { TimeClose() }, 1000);
        }
        function code() {
            v = $("#VCode").val();
            var flag = codeIsRight(v);
            if (!flag) {
                $("#VCode").focus();
            }
            else {
                $("#BtnSubmit").trigger("click");
            }
        }
        function ShowUserModelHtml(html) {
            $("#ModelFiled_table").html(html);
        }
        //初始化用户组模型字段
        function initModelFied() {
            PostToCS("GetModelFied", $("#UserGroup input:checked").val(), ShowUserModelHtml);
            //ModelFiled_table;
            $("#UserGroup input").click(function () {
                if ($(this)[0].checked)
                    PostToCS("GetModelFied", $(this).val(), ShowUserModelHtml);
            });
        }
        //验证出生日期
        function vaildDate() {
            $.post("Register.aspx", { action: "birthdate", value: $("#TxtBirthday").val() }, function (data) {
                ReceiveServerDataID(data);
            });
        }
        function ReceiveServerDataID(result) {
            var checkcardmsg = document.getElementById("vaildate");
            switch (result) {
                case "1":
                    checkcardmsg.innerHTML = "您超过了150岁？-吉尼斯世界纪录最长寿的人是132岁！";
                    checkcardmsg.className = "d_err";
                    curflag = false;
                    break;
                case "2":
                    checkcardmsg.innerHTML = "出生日期不能为空！";
                    checkcardmsg.className = "d_err";
                    curflag = false;
                    break;
                case "0":
                    checkcardmsg.innerHTML = "";
                    checkcardmsg.className = "d_ok";
                    curflag = true;
                    break;
            }
        }
        //-------------------------
        var i = 60;//倒计时
        var ms = 5;
        function gotouser() {window.setTimeout(function () { location = document.getElementById("hfReturnUrl").value }, 5000);}
        function setTimeShow() {
            document.getElementById("spanTime").innerHTML = "还剩" + ms + "秒跳转到登录";
            ms--;
            if (ms <= 0) {
                window.location.href = "login.aspx";
            }
            window.setTimeout("setTimeShow()", 5000);
        }
        $().ready(function () {
            $("#backimg_div").css('min-height', $(window).height());
        });
    </script> 
</body>
</html>
