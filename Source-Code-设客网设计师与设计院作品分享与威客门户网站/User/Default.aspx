<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" ClientIDMode="Static" %><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>会员中心</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<link href="/Template/Ke/style/global.css?Version=20150909" rel="stylesheet"/>
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script>
var groupid=<%Call.Label("{ZL.Label id=\"抽取当前会员的会员组\" /}"); %>;
if(groupid==1)
	window.location="/User/Default2.aspx";
if(groupid==2)
	window.location="/User/Default1.aspx";
</script>
</head>
<body>
 
<form id="form1" runat="server"> 
<!--左侧头部min菜单-->
<div class="navbar-fixed-top hidden">
<div class="u_top">
<div class="container">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
<a href="/" target="_blank"><img src="<%Call.Label("{$LogoUrl/}"); %>" class="img-responsive" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
</div>
<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 u_search">
<div class="u_top_btn">
<ul class="list-inline pull-right">
<li><div class="u_search_form"><input type="text" name="key" id="key" class="form-control" placeholder="快速搜索" onKeyDown="return IsEnter(this);" /><i class="glyphicon glyphicon-search" id="sub_btn" title="可按回车键快速检索"></i></div></li>
<li class="text-center"><i class="fa fa-user"></i><asp:Label ID="uName" runat="server"></asp:Label></li>
<li class="text-center"><a href="/User/Info/UserBase.aspx"><i class="glyphicon glyphicon-cog"></i></a></li>
<li class="text-center"><a href="/User/LogOut.aspx">退出</a></li>
</ul>
</div>
</div> 
</div>
</div>

</div>
<div class="user_banner">
<div class="container"> 
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
<a href="/User/Info/UserInfo.aspx"><asp:Image ID="imgUserPic" AlternateText="" onerror="this.src='/images/userface/noface.gif'" runat="server" /></a> </div> 
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
  <span><asp:Label ID="UserNameLb" runat="server" Text=""></asp:Label></span>
  <p><asp:Label ID="UserSignLb" runat="server" Text=""></asp:Label></p>
  </div>
  </div>
</div>
<div class="user_site">
<div class="container">
<ul class="list-inline">
<li><strong><a href="/PayOnline/SelectPayPlat.aspx" target="_blank"><asp:Label ID="UserYeLb" runat="server" Text=""></asp:Label></a></strong> <i class="fa fa-dot-circle-o">币</i></li>
</ul>
</div>
</div>
<div class="u_info hidden">
<div class="container">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 u_face">
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
</script>