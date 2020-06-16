<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite._Login, App_Web_pk13pou2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>会员登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" /> 
<link href="/App_Themes/User.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script  type="text/javascript"  src="/CounterLink.aspx"></script>
<script type="text/javascript" src="/js/jqueryajax.js"></script>
<script>
var frmin = "";
function loginSec(obj) {
	//obj ==0 为登录成功,-1你的帐户未通过验证或被锁定，请与网站管理员联系
    window.onload = function () { sybot(); }
    //if (obj == 0)
    //{
    //    self.parent.location.reload();
    //}
}
function sybot(url) {
	setTimeout(changeurl, 1000);
}

function changeurl() {
	document.getElementById("pasd").src = document.getElementById("script").value;
}
</script>
<style>
body{ FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f5f5f5,endColorStr=#fff); /*IE 6 7 8*/ 
background: -ms-linear-gradient(top, #f5f5f5,  #fff) no-repeat;        /* IE 10 */
background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#f5f5f5), to(#fff)) no-repeat;/*谷歌*/ }
.h_user_top{ padding-top:0.5em; padding-bottom:0.5em; background:#f5f5f5; box-shadow:0 2px 5px #eee;}
.h_user_top .pull-right{ margin-top:20px;}
.h_user_top .pull-right a{ margin-top:10px; padding:5px 10px 5px 10px; border-radius:4px; border:1px solid #ddd; font-family:"微软雅黑";}
.h_user_top .pull-right a:hover{ background:#31b0d5; transition-duration:0.5s; color:#fff; border-color:#31b0d5; text-decoration:none;}
.h_login{ margin:auto; margin-top:10%; padding:20px; width:340px; max-width:100%; box-shadow:0 0 10px 1px rgba(115,255,255,0.3); background:linear-gradient(#fff,#f5f5f5);}
.h_login h1{ margin-bottom:20px; padding-left:5px; font-size:1.5em; font-family:"微软雅黑"; }
.h_login li{ position:relative; margin-top:10px; margin-bottom:10px;}
.h_login li i{ position:absolute; top:10px; left:10px; font-size:1.2em; color:#337AB7;}
.h_login li .form-control{ padding-left:40px; border:none;} 
.h_login .form-control:focus{ box-shadow:none;}
#BtnLogin{ width:100%;}
</style>
</head>
<body>
<form id="form1" runat="server">
<asp:Panel ID="PnlLogin" runat="server">
<div class="h_user_top">
<div class="container">
<span class="pull-left"><a href="/"><img src="<%=Call.LogoUrl %>" alt="<%=Call.SiteName %>" /></a></span>
<span class="pull-right"><a href="/User/Register.aspx">注册</a></span>
</div>
</div> 
<div class="h_login">
<h1>登 录</h1>
<ul class="list-unstyled">
<li><i class="glyphicon glyphicon-user"></i><asp:TextBox ID="TxtUserName" class="form-control" placeholder="帐号"  runat="server"></asp:TextBox></li>
<li><i class="glyphicon glyphicon-lock"></i><asp:TextBox ID="TxtPassword" class="form-control" placeholder="密码" runat="server" TextMode="Password"></asp:TextBox></li>
<li> <asp:Button ID="BtnLogin" runat="server" class="center-block btn btn-primary" Text="登录" OnClick="BtnLogin_Click" /></li> 
<li><asp:PlaceHolder ID="PhValCode" runat="server">验证码：<asp:TextBox ID="TxtValidateCode" MaxLength="6" Width="60" class="l_input" runat="server" onfocus="this.select();"></asp:TextBox>     <asp:Image ID="VcodeLogin" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px" /></asp:PlaceHolder> 
</li>  
<li>
<a href="User/GetPassword.aspx" target="_top">忘记密码</a>
</li>
    </ul>
</div>
    <asp:RequiredFieldValidator ID="ValrUserName" runat="server" ErrorMessage="请输入用户名！" ControlToValidate="TxtUserName" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="ValrPassword" runat="server" ErrorMessage="请输入密码！" ControlToValidate="TxtPassword" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="ValrValidateCode" runat="server" ErrorMessage="请输入验证码！"  ControlToValidate="TxtValidateCode" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Panel>
<asp:Panel ID="PnlLoginStatus" runat="server">
    <div class="h_login">
        <ul>
          <li><asp:Literal ID="LitUserName" runat="server"></asp:Literal>，您好！</li>             
          <li><asp:Literal ID="LitMessage" runat="server">0</asp:Literal></li>
          <li><asp:Literal ID="LitLoginTime" runat="server">0</asp:Literal></li> 
          <li><asp:Literal ID="LitLoginDate" runat="server">0</asp:Literal></li>               
          <li><a href="User/Default.aspx" target="_top">会员中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0);" onClick="logout()" target="_top">退出登录</a></li>
        </ul>
    </div>
    <iframe name="pasd" id="pasd" width="0px" height="0px"></iframe>
</asp:Panel>
<asp:Panel ID="PnlLoginMessage" runat="server" Visible="false">
  <ul>
    <asp:Literal ID="LitErrorMessage" runat="server"></asp:Literal>
    <li><asp:Button ID="BtnReturn" runat="server" class="C_input" Text="返回" OnClick="BtnReturn_Click" /></li>
  </ul>
</asp:Panel>
</form>
<script type="text/javascript">
function logout(){
	ZoomLa.ajaxlogout(function(){
	    window.location = "/login.aspx?Style=" +Style;
	});
}
	//登录样式 1为纵向 2为横向
    var Style = "<%=style%>";
	if(Style=="2")
	{
		//登录前
		var Login=document.getElementById("login");
		if(Login!=null){
			Login.className="horizontal";
		}
		//登录后
		var Logged=document.getElementById("logged");
		if(Logged!=null)
		{
			Logged.className = "horizontal";
		}
		//登录错误
		var PnlLoginMessage=document.getElementById("PnlLoginMessage");
		if(PnlLoginMessage!=null){
			PnlLoginMessage.className="horizontal";	
		}
	}
</script>
</body>
</html>