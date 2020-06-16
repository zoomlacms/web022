<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="User_login, App_Web_odweewxl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head runat="server">
<meta charset="utf-8">
<title>用户登录-<%:Call.SiteName %></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/JS/ZL_ValidateCode.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link href="/App_Themes/User.css"rel="stylesheet" type="text/css"/>
<link href="/Template/Ke/style/global.css?Version=20150909" rel="stylesheet"/>
<script type="text/javascript">
var sts = 3;//登录后跳转等待时间;单位：秒
function sucse(s, url) {
    if (s == 1) {//成功
        document.getElementById("main_l").style.display = "none";
        document.getElementById("main_s").style.display = "";
        document.getElementById("sec").innerHTML = sts;
        setInterval(loacationgoto, 1000);
    }
    else {
        document.getElementById("main_l").style.display = "";
        document.getElementById("main_s").style.display = "none";
    }
}
function BtnTj() {
    var username = document.getElementById("TxtUserName");
    var userpass = document.getElementById("TxtPassword");
    var VCode = document.getElementById("VCode");
    if (username.value == "") {
        username.focus();
        return false;
    }
    if (userpass.value == "") {
        userpass.focus();
        return false;
    }
    if (VCode && VCode.value == "") {
        VCode.focus();
        return false;
    }
    return true;
}
</script>
<style>
.user_login{ background:none; color:#333;}
.user_login li #reg_btn:hover, .user_mimenu_left li #reg_btn:focus{ color:#333;}
</style>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\"/}");%>

<form id="form" runat="server">
<div class="user_mimenu hidden">
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
<div class="user_login">
<h1 class="text-center"><i class="fa fa-male fa-2x"></i> 登录设客</h1>
<ul class="list-unstyled">
<li><i class="fa fa-user"></i>
<asp:TextBox ID="TxtUserName" placeholder="用户名" onblur="CheckUserCode()" runat="server" CssClass="form-control"></asp:TextBox>
<asp:HyperLink ID="hlReg" runat="server" NavigateUrl="~/User/login.aspx?RegID=1" title="E-mail登录"><span class="glyphicon glyphicon-envelope"></span></asp:HyperLink>
<asp:HyperLink ID="uidReg" runat="server"  NavigateUrl="~/User/login.aspx?RegID=2" title="用户ID登录"><span class="glyphicon glyphicon-align-justify"></span></asp:HyperLink>
</li>
<li><i class="fa fa-lock"></i><asp:TextBox ID="TxtPassword" placeholder="密码" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></li>
<li><div class="form-group" visible="false" id="trVcodeRegister" runat="server">
<asp:TextBox ID="VCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control codestyle" style="display:inline;"></asp:TextBox>
<img id="VCode_img" title="点击刷新验证码" class="codeimg"  style="height:34px;margin-left:2px;width:25%;"/>
<input type="hidden" id="VCode_hid" name="VCode_hid" /></div></li>
<li id="usercode_li" style="display:none;">
    <asp:TextBox ID="UserCode_T" runat="server" placeholder="动态口令" CssClass="form-control"></asp:TextBox>
</li>
<li class="margin_top0"><input type="checkbox" name="checkbox" checked="checked" id="checkbox" />记住登录<a href="/User/GetPassword.aspx" id="nopasswd">忘记密码？</a></li>
<li><asp:Button ID="btnLogin" CssClass="btn btn-info" OnClientClick="return ajaxlogin();" runat="server" Text="登 录" onclick="btnLogin_Click" /></li>
<li><a class="btn btn-default" id="reg_btn" href="Register.aspx">点此注册</a></li>
<li>
<div id="alipayDIV">
<div class="text-left pull-left"><label id="AppTitle" runat="server" style="font-size:11px; font-weight:normal;">第三方平台登录：</label></div>
<div  class="applgntype">
<asp:LinkButton ID="appSina" ToolTip="新浪" runat="server" Style="background-image: url('/images/sina.png');background-repeat: no-repeat; background-size:25px 25px;" OnClick="appSina_Click"></asp:LinkButton>
<asp:LinkButton ID="appBaidu" ToolTip="百度" runat="server" style="background-image:url('/images/bdidu.png');background-repeat:no-repeat; background-size:25px 25px;"  OnClick="appBaidu_Click"></asp:LinkButton>
<asp:LinkButton ID="appKaiXin" ToolTip="开心网" runat="server"  style="background-image:url('/images/kaixin.png');background-repeat:no-repeat; background-size:25px 25px;" onclick="appKaiXin_Click1" ></asp:LinkButton>
<asp:LinkButton ID="appRenRen" ToolTip="人人网" runat="server" style="background-image:url('/images/renren.png');background-repeat:no-repeat; background-size:25px 25px;" onclick="appRenRen_Click1" ></asp:LinkButton>
<asp:LinkButton ID="appNetease" ToolTip="网易" runat="server" style="background-image:url('/images/wangyi.png');background-repeat:no-repeat; background-size:25px 25px;" OnClick="appNetease_Click1" ></asp:LinkButton>
<asp:LinkButton ID="appQQ" runat="server" Style="background-image: url('/images/qq.png'); background-repeat: no-repeat; background-size:25px 25px;" OnClick="appQQ_Click"></asp:LinkButton>
<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
</li>
</ul>
<div id="main_s" style="display:none">
<ul>
<li style="color:green; font-size:14px; font-weight:bold">欢迎您！登录成功</li>
<li style="margin-top:25px;">系统将在 <span id="sec">3</span> 秒后自动跳转到<a href="MemoView.aspx">会员首页</a></li>
</ul>
</div>
<div class="clearfix"></div>
<div class="login_type_div">
    <div hidden><a id="EMail_A" href="login.aspx?RegID=1" runat="server"><span class="glyphicon glyphicon-envelope"></span> 邮箱登录</a></div>
    <div hidden><a id="ID_A" runat="server" href="login.aspx?RegID=2"><span class="glyphicon glyphicon-info-sign"></span> ID登录</a></div>
    <div hidden><a id="User_A" runat="server" href="login.aspx"><span class="glyphicon glyphicon-user"></span> 用户登录</a></div>
</div>
</div> 
</form>
    <%Call.Label("{ZL.Label id=\"全站底部\"/}"); %>
</body>
</html>
<script type="text/javascript">
    $().ready(function () {
        setTimeout("CheckUserCode()", 500);
        $("#VCode").ValidateCode();
        $("#TxtUserName").focus();
    });
//QC.Login({
//btnId: "qqLoginBtn",
//scope: "all",
//size: "C_S"
//}, function (reqData, opts) {//登录成功
//QC.Login.getMe(function (openId, accessToken) {
//$.post("/user/AppBack.aspx", { nickName: reqData.nickname, openId: openId,Type:""}, function (data) {
//if (data.result == 1)
//{
//location.href = "/user/default.aspx";   
//}
//else
//{
//// alert(data.result);
//location.href = "/user/AppBack.aspx?type=QQ&openId=" + openId + "&nickname=" + reqData.nickname;
//}
//}, "json");
//});//获取在线用户的信息           
//}, function (opts) {//注销成功
//alert('QQ登录 注销成功');
//}
//);
//if (QC.Login.check()) {//如果已登录
////这里可以调用自己的保存接口
////用JS SDK调用OpenAPI获取用户信息
//var paras = {};
//QC.api("get_user_info", paras)
////指定接口访问成功的接收函数，s为成功返回Response对象
//.success(function (s) {
////成功回调，通过s.data获取OpenAPI的返回数据
////alert("获取用户信息成功！当前用户昵称为：" + s.data.nickname);         
//})
////指定接口访问失败的接收函数，f为失败返回Response对象
//.error(function (f) {
////失败回调      
//})
////指定接口完成请求后的接收函数，c为完成请求返回Response对象
//.complete(function (c) {
////完成请求回调	    
//});
////调用自己的接口，保存信息
////......
//}
function CheckUserCode() {
    var bl = true;
    $.ajax({
        url: '/API/UserCheck.ashx',
        data: { action: 'CheckKey', uname: $("#TxtUserName").val() },
        type: 'POST',
        success: function (data) {
            if (data == '1') {
                $("#usercode_li").show();
                bl = false;
            } else {
                $("#usercode_li").hide();
            }
        }
    });
    return bl;
}
//登录
var loginflag = false;
function ajaxlogin() {
    if (BtnTj()) {
        if (!loginflag) {
            $.ajax({
                type: 'POST',
                data: { action: 'login', user: $("#TxtUserName").val(), pwd: $("#TxtPassword").val(), VCode_hid: $("#VCode_hid").val(), vcode: $("#VCode").val(), zncode: $("#UserCode_T").val() },
                success: function (data) {
                    if (data != "True") {
                        $("#btnLogin").popover({
                            animation: true,
                            placement: 'left',
                            content: '<span style="color:red;"><span class="glyphicon glyphicon-info-sign"></span> ' + data + '!</span>',
                            html: true,
                            trigger: 'manual',
                            delay: { show: 10000, hide: 100 }
                        });
                        $("#btnLogin").popover('show');
                        setTimeout(function () { $("#btnLogin").popover('destroy'); }, 2000);
                    } else {
                        loginflag = true;
                        $("#btnLogin").click();
                    }
                }
            });
        }
    } else {
        return false;
    }
    return loginflag;
}
$("#mimenu_btn").click(function(e) { 
	if($(".user_mimenu_left").width()>0){ 
 		$(".user_mimenu_left ul").fadeOut(100);
		$(".user_mimenu_left").animate({width:0},200); 	
	}
	else{ 
		$(".user_mimenu_left").animate({width:150},300); 
		$(".user_mimenu_left ul").fadeIn();
	}
});
</script>