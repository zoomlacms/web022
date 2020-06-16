<%@ page language="C#" autoeventwireup="true" inherits="User_FindPwd, App_Web_odweewxl" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>找回密码</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</head>
<body>


    <form id="form1" runat="server">
        <center style="background: url(http://code.zoomla.cn/user_login.jpg); background-position: center; left: 0; top: 0; right: 0; bottom: 0; position: absolute; background-repeat: no-repeat; background-size: cover;">
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

            <div class="user_login" id="changpwd_div" runat="server">
                <div style="margin-bottom: 4em; width: 300px; text-align: center;">
                    <img src="<%:Call.LogoUrl%>" alt="<%:Call.SiteName%>_后台管理系统" />
                </div>
                <div style="margin-bottom: 10px;">
                    <div class="pull-left">
                        <span class="glyphicon glyphicon-user" style="font-size: 2em; color: #00ccff;"></span>
                    </div>
                    <div class="pull-left" style="margin-left: 10px;">
                        <asp:Label ID="UserName_L" runat="server" Style="font-size: 1.5em;"></asp:Label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div style="margin-bottom: 20px;">
                    <asp:TextBox ID="PassWord_T" TextMode="Password" CssClass="form-control" Style="max-width: 300px;" onkeydown="return GetEnterCode('focus','RPassWord_T');" runat="server" placeholder="密码"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="PassWord_T" ForeColor="Red" runat="server" ErrorMessage="不能为空！" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="PassWord_T" ValidationExpression="[\S]{6,}" ErrorMessage="密码至少6位" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div style="margin-bottom: 20px;">
                    <asp:TextBox ID="RPassWord_T" TextMode="Password" CssClass="form-control" Style="max-width: 300px;" onkeydown="return GetEnterCode('click','ChangPwd_Btn');" runat="server" placeholder="确认密码"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="RPassWord_T" ForeColor="Red" runat="server" ErrorMessage="不能为空！" Display="Dynamic" />
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="RPassWord_T" ControlToCompare="PassWord_T" ForeColor="Red" ErrorMessage="密码不一致！" Display="Dynamic" runat="server" />
                </div>
                <div>
                    <asp:Button ID="ChangPwd_Btn" CssClass="btn btn-primary" Width="300" runat="server" OnClick="ChangPwd_Btn_Click" Text="修改密码" />
                </div>
            </div>
        </center>
    </form>
    <style>
        .pwdtop ul li a { color:#fff;}
        .pwdtop ul li a:hover{ color:#004b9b;}
        #table td{border:none;}
    </style>
</body>
</html>
