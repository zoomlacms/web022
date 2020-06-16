<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="User_Default" ClientIDMode="Static" %><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>设计机构-会员中心</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link href="/Template/Ke/style/global.css?Version=20150909" rel="stylesheet"/>
</head>
<body>
<div class="pep_top">
<div class="container">
<ul class="list-unstyled">
<li class="sitelogo"><a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a></li>
<li><a href="/User/">首页</a></li>
<li><a href="/Class_1/Default.aspx">找设计师</a></li>
<li><a href="/Class_2/Default.aspx">作品图库</a></li>
<li><a href="/index" class="borderno" target="_blank">设计论坛</a></li>
<li class="pep_search">
<form action="/Search/Searchlist.aspx" method="get" target="_blank">
<input type="text" name="keyword" class="form-control text_200" /><button type="submit"><i class="fa fa-search"></i></button>
</form>
</li>
<li class="pull-right dropdown" onMouseOver="javascript:$(this).addClass('open');" onMouseOut="javascript:$(this).removeClass('open');">
<i class="fa fa-bullhorn"></i> Hi <a href="/User/">我的设客</a>
<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="min-width:inherit; margin-top:-5px;">
<li><a href="/User/Info/UserInfo.aspx">个人资料</a></li>
<li><a href="/User/Content/MyProject.aspx?NodeID=14">我的项目</a></li>
<li><a href="/User/Logout.aspx">退出系统</a></li>
</ul>
</li>
</ul>
</div>
</div>
<div class="pep_nav">
<nav class="navbar navbar-default">
<div class="container">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 sitename">
<a href="/User/Default2.aspx"><asp:Label ID="uName" runat="server" hidden></asp:Label><i class="fa fa-leaf fa-2x"></i>企业工作台</a>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> 
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand visible-xs" href="#">快速导航</a>
</div>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/User/Info/UserInfo.aspx">资料管理</a></li>
<li><a href="/User/Content/MyProject.aspx?NodeID=14">项目管理</a></li>
<li><a href="/Class_12/Default.aspx">人才库</a></li>
<li><a href="/Class_4/NodePage.aspx">财务记录</a></li> 
</ul>
</div>
</div> 
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pep_atten">
<ul class="list-inline">
<li class="relative" onmouseover="javascript:$(this).find('img').show();" onmouseout="javascript:$(this).find('img').hide();"><a href="javascript:;"><i class="fa fa-weibo"></i></a><img src="/Template/Ke/style/images/weibo.jpg" style="display: none;" alt="微信二维码"></li>
<li class="relative" onmouseover="javascript:$(this).find('img').show();" onmouseout="javascript:$(this).find('img').hide();"><a href="javascript:;"><i class="fa fa-weixin"></i></a><img src="/Template/Ke/style/images/weixin.jpg" style="display: none;" alt="微信二维码"></li>
<li><a href="#"><img src="/Template/Ke/style/images/design_nav1.png"></a></li>
</ul> 
</div>
</div>
</nav>
<div class="clearfix"></div>
</div>
<form id="form1" runat="server">
<div class="user_banner hidden">
<div class="container">  
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
<asp:Image ID="imgUserPic" CssClass="hidden" AlternateText="" onerror="this.src='/images/userface/noface.gif'" runat="server" />
<span><asp:Label ID="UserNameLb" runat="server" Text=""></asp:Label></span>
<p><asp:Label ID="UserSignLb" runat="server" Text=""></asp:Label></p>
</div>
</div>
</div>
<div class="container">
<div class="pep_main"> 
<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 pep_main_l"> 
<div class="NoRegister">
<div class="alert alert-danger" role="alert">
尚未填写设计院资料，点击按钮<a href="/User/Info/InstituteBase.aspx" class="btn btn-warning">完善资料</a>立即前往填写设计院资料。
</div>
</div>
<div class="NoRenZ">
<div class="alert alert-danger" role="alert">
您尚未通过资料认证，无法发布项目,点击<a href="/User/Content/AddAttest.aspx?ModelID=57&NodeID=43" class="btn btn-warning">申请认证</a>立即前往申请认证！
</div>
</div>
<div class="NoRenS">
<div class="alert alert-danger" role="alert">您的资料认证真在审核，请耐心等待！</div>
</div>
<div class="text-center pep_main_l1 HasRegister" style="margin-top:50px;">
<div class="pep_pub_t">
<a href="/Class_13/NodePage.aspx">+立即发布项目，平台为您匹配最合适的设计师(推荐)</a>
<a href="/Class_2/Default.aspx">看看设计师的作品，选择合适的设计师</a>
<a href="/Class_1/Default.aspx">去设计师库看看，选择合适的设计师</a>
</div>
<div class="pep_pub_other">
</div>
<div class="clearfix"></div>
</div>
<div class="pep_main_l2 HasRegister">
<h1>我的项目进度<a href="/Class_5/NodeNews.aspx">+查看全部</a></h1> 
<table class="table table-responsive">
<%Call.Label("{ZL.Label id=\"输出我的项目进度_会员首页\" TitleNum=\"50\" ShowNum=\"6\" NodeID=\"13\" /}"); %>
</table>
</div>
</div> 
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pep_main_r"> 
<%Call.Label("{ZL.Label id=\"获取当前登录信息\" /}"); %>
</div>
<div class="clearfix"></div>  
</div>
</div>
<div class="container pep_main_l3 HasRegister">
<div class="pep_pub text-center">
<div class="pep_pub_t">
<a href="/Class_13/NodePage.aspx">+立即发布项目，平台为您匹配最合适的设计师(推荐)</a>
<a href="/Class_2/Default.aspx">看看设计师的作品，选择合适的设计师</a>
<a href="/Class_1/Default.aspx">去设计师库看看，选择合适的设计师</a>
</div>
</div>
</div>

<div class="u_info hidden">
<div class="container">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 u_face">
<asp:Label ID="UserYeLb" runat="server" Text=""></asp:Label>
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 u_syn">
<ul class="list-unstyled">
<li>
<ul class="list-unstyled">
<li>等级：<span id="LvIcon_Span" runat="server"></span> <asp:Label ID="UserLvLb" runat="server" Text=""></asp:Label></li>
<li>加入时间：<asp:Label ID="UserRegTimeLb" runat="server" Text=""></asp:Label></li>
</ul>
</li>
<li><i class="glyphicon glyphicon-map-marker"></i>地址：<asp:Label ID="UserAddressLb" runat="server" Text=""></asp:Label></li>
<li>
<ul class="list-unstyled">
<li><i class="glyphicon glyphicon-usd"></i></li>
<li>银币：<asp:Label ID="UserJbLb" runat="server" Text=""></asp:Label></li><li>积分：<asp:Label ID="UserJfLb" runat="server" Text=""></asp:Label></li>
</ul>
</li>
</ul>
</div>
</div>
</div> 
<div class="container hidden">  
<div class="u_menu">
<asp:Literal ID="UserApp_Li" runat="server" EnableViewState="false"></asp:Literal>
<div class="clearfix"></div>
</div>
</div> 
<div class="u_menu_more text-center hidden">
<a href="javascript:;" id="more_btn"><i class="fa fa-angle-double-down"></i></a>
</div>
<div class="user_menu_sub"> 
<ul class="list-unstyled text-center">
<asp:Literal runat="server" ID="onther_lit" EnableViewState="false"></asp:Literal>
</ul>
<div class="clearfix"></div>
</div> 
<div class="myfav">
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#favpep" aria-controls="favpep" role="tab" data-toggle="tab">我关注的设计师</a></li>
<li role="presentation"><a href="#favcnt" aria-controls="favcnt" role="tab" data-toggle="tab">合作过的设计师</a></li>
</ul>  
<div class="tab-content" style="height:260px;">
<div role="tabpanel" class="tab-pane" id="favcnt">
<iframe src="/CLass_4/NodeNews.aspx" scrolling="no" frameborder="0" width="100%" style="height:260px;"></iframe>
</div>
<div role="tabpanel" class="tab-pane active" id="favpep">
<iframe src="/CLass_4/NodeHot.aspx" scrolling="no" frameborder="0" width="100%" style="height:260px;"></iframe>
</div> 
</div>
</div>
</form>
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
</body>
</html>
<script>
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
//会员菜单更多显示/隐藏
$("#more_btn").click(function(e) {
	if($(".user_menu_sub").css("display")=="none"){  
	    $(".user_menu_sub").slideDown();
		$(this).find("i").removeClass("fa-angle-double-down");
		$(this).find("i").addClass("fa-angle-double-up");
	}
	else {  
	    $(".user_menu_sub").slideUp(200); 
		$(this).find("i").removeClass("fa-angle-double-up");
		$(this).find("i").addClass("fa-angle-double-down");
	}
});
//会员搜索
$("#sub_btn").click(function(e) { 
    if($("#key").val()=="")
		alert("搜索关键字为空!");
	else
		window.location="/User/SearchResult.aspx?key="+escape($("#key").val());	
});
//搜索回车事件
function IsEnter(obj) {
	if (event.keyCode == 13) {
		$("#sub_btn").click(); return false;
	}
}
var nums='<%Call.Label("{ZL.Label id=\"输出我的项目总数\" /}");%>';
if(nums>0)
{
	$(".pep_main_l1").hide();
}
else
{
	$(".pep_main_l2").hide();
	$(".pep_main_l3").hide();
}
var status="<%Call.Label("{ZL.Label id=\"获取当前设计院资料状态\" /}");%>";
var rstatus="<%Call.Label("{ZL.Label id=\"输出当前用户认证资料状态\" /}");%>";
if(status=="0")
{
	$(".HasRegister").remove();
	$(".NoRenS").remove();
	$(".NoRenZ").remove();
}
else
{
	$(".NoRegister").remove();
	if(rstatus=="")
	{
		$(".HasRegister").remove();
		$(".NoRenS").remove();
	}
	else if(rstatus=="0")
	{
		$(".HasRegister").remove();
		$(".NoRenZ").remove();
	}
}
$().ready(function(e) {
    $(".jbpay0").remove();
});
$(".pro_status").each(function(index, element) {
    if($(this).data("ying")>0)
	{
		if($(this).data("zhong")>0)
		{
			if($(this).data("pay")>0)
				$(this).html("(已应标)");
			else
				$(this).html("(已中标)");
		}
		else
			$(this).html("(已应标)");
	}
	else
		$(this).html("(未应标)");
});
</script>