<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="User_Default" ClientIDMode="Static" %><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>设计师-会员中心</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script src="/js/scrolltopcontrol.js" type="text/javascript"></script>
<link href="/Template/Ke/style/global.css?Version=20150909" rel="stylesheet"/>
<style>
.mypeo_comp_l { top:auto; right:auto; max-width:none; z-index:10; display:none;}
</style>
</head>
<body>
<div class="pep_top">
<div class="container">
<ul class="list-unstyled">
<li class="sitelogo"><a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a></li>
<li><a href="/">首页</a></li>
<li><a href="/Class_1/Default.aspx">找设计师</a></li>
<li><a href="/Class_2/Default.aspx">作品图库</a></li>
<li><a href="/index" class="borderno">设计论坛</a></li>
<li class="pep_search">
<form action="/Search/Searchlist.aspx" method="get" target="_blank">
<input type="text" name="keyword" class="form-control text_200" /><button type="submit"><i class="fa fa-search"></i></button>
</form>
</li>
<li class="pull-right dropdown" onMouseOver="javascript:$(this).addClass('open');" onMouseOut="javascript:$(this).removeClass('open');">
<i class="fa fa-bullhorn"></i> Hi <a href="/User/">我的设客</a>
<a href="/User/Info/UserInfo.aspx" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false" hidden><asp:Image ID="imgUserPic" AlternateText="" onerror="this.src='/images/userface/noface.gif'" runat="server" /><span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="min-width:inherit; margin-top:-5px;">
<li><a href="/User/Info/UserInfo.aspx">个人资料</a></li>
<li><a href="/User/Content/MyContent.aspx?NodeID=13">我的项目</a></li>
<li><a href="/User/Logout.aspx">退出系统</a></li>
</ul>
</li>
</ul>
</div>
</div>
<div class="user_banner1" style="margin-bottom:20px;"><a href="/Class_13/Default.aspx">去找项目>></a></div>
<div class="container">
<div class="row padding5">
<div class="col-lg-2 col-md-2 col-xs-2 col-xs-3 padding10">
<div class="user_left">
<div class="user_left_title"><i class="fa  fa-paint-brush"></i>功能导航</div>
<ul class="list-unstyled">
<li><a href="/Class_1/NodeHot.aspx">项目管理</a></li>
<li><a href="/Mis/ke/DailyPlan.aspx" target="_blank">计划管理</a></li>
<li><a href="/User/Content/MyComment.aspx">评价管理</a></li>
<li><a href="<%Call.Label("{ZL.Label id=\"输出当前用户设计师主页链接\" /}");%>">个人主页</a></li>
<li><a href="/User/Info/UserInfo.aspx">我的资料</a></li>
<li><a href="/User/Content/MyContent.aspx?NodeID=2">我的作品</a></li>
<li><a href="/User/Message/Message.aspx">我的私信</a></li>
<li><a href="/Class_22/NodePage.aspx">财务记录</a></li>
<li><a href="/User/LogOut.aspx">退出登录</a></li>
</ul>
</div>
<div class="ad">
<a href="#"><img src="/Template/Ke/style/images/ad1.jpg" class="center-block img-responsive" alt="设计广告" /></a> 
<a href="#"><img src="/Template/Ke/style/images/ad2.jpg" class="center-block img-responsive" alt="设计广告" /></a>
<a href="#"><img src="/Template/Ke/style/images/ad3.jpg" class="center-block img-responsive" alt="设计广告" /></a>
</div>
</div>
<div class="col-lg-10 col-md-10 col-xs-10 col-xs-9 padding10">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%=Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
</ol>
<div class="user_nopro">
<h3><span>我的项目进度</span></h3>
<h4>+还没有进行中的项目，去项目池中看看吧 <i class="fa fa-paper-plane-o"></i></h4>
<p>
<a href="/Class_2/Default.aspx" class="btn btn-info">设计图库</a>
<a href="#" class="btn btn-primary">设计公司库</a>
</p>
</div>
<div class="alert alert-danger alert-2" role="alert" style="margin-top:0; display:none;">
尚未填写设计师资料，点击按钮<a href="/User/Content/MyContent1.aspx" class="btn btn-warning">完善资料</a>立即前往填写设计师资料。
</div>
<div class="alert alert-warning alert0" role="alert" style="margin-top:0;display:none;">设计师资料正在审核，请耐心等待</div>
<div class="alert alert-info alert99" role="alert" style="margin-top:0;display:none;">您提交的设计师资料已通过审核，若需修改资料可点击<a href="/User/Content/EditDesigners.aspx?GeneralID=<%Call.Label("{ZL.Label id=\"获取当前用户设计师ID\" /}");%>" class="btn btn-danger">修改资料</a></div>
<div class="user_project user_haspro">
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">正在进行的项目</a></li>
<li><a href="/Class_11/NodeNews.aspx">已投标项目</a></li>
<li><a href="/Class_11/NodeHot.aspx">未中标项目</a></li>
</ul> 
<div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="home">
<div class="row">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出当前用户进行中项目列表\" NodeID=\"37\" TitleNum=\"30\" ShowNum=\"2\" /}"); %>
<div class="clearfix"></div>
</ul>
</div>
<div class="text-center" style="margin-top:20px;"><a href="/Class_1/NodeHot.aspx" class="btn btn-warning">查看更多</a></div>
</div>
<div role="tabpanel" class="tab-pane" id="profile">

</div>
<div role="tabpanel" class="tab-pane" id="messages">...</div>
<div role="tabpanel" class="tab-pane" id="settings">...</div>
<div role="tabpanel" class="tab-pane" id="cancel">...</div>
</div> 
<div class="clearfix"></div>
</div>
<div class="all_project">
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#mypro" aria-controls="mypro" role="tab" data-toggle="tab">推送给我的项目</a></li>
<li role="presentation"><a href="#otherpro" aria-controls="otherpro" role="tab" data-toggle="tab">平台项目池</a></li> 
<li class="pull-right"><a href="/Class_11/NodeElite.aspx">更多>></a></li>
</ul>
<div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="mypro">
<ul class="list-unstyled mypro_item">
    <ZL:ExRepeater runat="server" ID="RPT1" PageSize="5" PagePre="<div class='clearfix'></div><div class='text-center'>" PageEnd="</div>">
        <ItemTemplate>
            <li>
                <div class="media">
                    <div class="media-left media-middle">
                        <a href="/Item/<%#Eval("GeneralID") %>.aspx?type=1" title="<%#Eval("Title") %>"><img src="<%# GetUserFace() %>" onerror="javascript:this.src='/UploadFiles/nopic.gif';" alt="<%#Eval("Title") %>"></a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="/Item/<%#Eval("GeneralID") %>.aspx" title="><%#Eval("Title") %>"><%#Eval("Title") %></a><span class="tuoguan<%#GetTuoGuan() %>">项目已托管</span></h4>
                        <div class="mypro_item_t"><span><%#Eval("CreateTime") %></span><a href="/Item/<%#Eval("GeneralID") %>.aspx?type=1" class="btn btn-default btn-sm">立即应标</a><a href="/Item/<%#Eval("GeneralID") %>.aspx" class="btn btn-default btn-sm">查看详情</a></div>
                        <div class="mypro_item_p">
                            阶段：<span class="node<%#Eval("NodeID") %>"></span>
                            地点：<span><%#Eval("xmdd") %></span>
                            类型：<span><%#Eval("xmlx") %></span>
                            风格：<span><%#Eval("sjfg") %></span>
                            规模：<span><%#Eval("xmgm") %></span>
                            费用：<span><%#Eval("sjfy") %><%#Eval("jffs") %></span>
                        </div>
                        <div class="mypro_item_f">发包方<a href="#"><%#Eval("Inputer") %></a>邀请您承接项目，立刻参与竞标吧。</div>
                    </div>
                </div>
            </li>
        </ItemTemplate>
    </ZL:ExRepeater>
</ul>
</div>
<div role="tabpanel" class="tab-pane" id="otherpro">
<ul class="list-unstyled mypro_item">
    <ZL:ExRepeater runat="server" ID="RPT" PageSize="5" PagePre="<div class='clearfix'></div><div class='text-center'>" PageEnd="</div>">
        <ItemTemplate>
            <li>
                <div class="media">
                    <div class="media-left media-middle">
                        <a href="/Item/<%#Eval("GeneralID") %>.aspx" title="<%#Eval("Title") %>"><img src="<%# GetUserFace() %>" onerror="javascript:this.src='/UploadFiles/nopic.gif';" alt="<%#Eval("Title") %>"></a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><%#Eval("Title") %><span class="tuoguan<%#GetTuoGuan() %>">项目已托管</span></h4>
                        <div class="mypro_item_t"><span><%#Eval("CreateTime") %></span><a href="/Item/<%#Eval("GeneralID") %>.aspx?type=1" class="btn btn-default btn-sm">立即应标</a><a href="/Item/<%#Eval("GeneralID") %>.aspx" class="btn btn-default btn-sm">查看详情</a></div>
                        <div class="mypro_item_p">
                            阶段：<span class="node<%#Eval("NodeID") %>"></span>
                            地点：<span><%#Eval("xmdd") %></span>
                            类型：<span><%#Eval("xmlx") %></span>
                            风格：<span><%#Eval("sjfg") %></span>
                            规模：<span><%#Eval("xmgm") %></span>
                            费用：<span><%#Eval("sjfy") %><%#Eval("jffs") %></span>
                        </div>
                        <div class="mypro_item_f">发包方<a href="#"><%#Eval("Inputer") %></a>邀请您承接项目，立刻参与竞标吧。</div>
                    </div>
                </div>
            </li>
        </ItemTemplate>
    </ZL:ExRepeater>
</ul>
</div> 
</div>
<div class="clearfix"></div>
</div>
</div>
</div>
</div>

<div class="myfav">
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#favcnt1" aria-controls="favcnt1" role="tab" data-toggle="tab">我收藏的作品</a></li>
<li role="presentation"><a href="#favpep1" aria-controls="favpep1" role="tab" data-toggle="tab">我收藏的设计师</a></li>
</ul>  
<div class="tab-content" style="height:260px;">
<div role="tabpanel" class="tab-pane active" id="favcnt1">
<iframe src="/Class_22/NodeNews.aspx" scrolling="no" frameborder="0" width="100%" style="height:260px;"></iframe>
</div>
<div role="tabpanel" class="tab-pane" id="favpep1">
<iframe src="/CLass_1/NodeNews.aspx" scrolling="no" frameborder="0" width="100%" style="height:260px;"></iframe>
</div> 
</div>
</div>
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
<div class="user_banner hidden">
<div class="container"> 
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
<a href="/User/Info/UserInfo.aspx"></a> </div> 
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
<span><asp:Label ID="UserNameLb" runat="server" Text=""></asp:Label></span>
<p><asp:Label ID="UserSignLb" runat="server" Text=""></asp:Label></p>
</div>
</div>
</div>
<div class="user_site hidden">
<div class="container">
<ul class="list-inline">
<li><span>您已在设客上衣成交18单</span></li>
<li><strong><a href="/PayOnline/SelectPayPlat.aspx" target="_blank"><asp:Label ID="UserYeLb" runat="server" Text=""></asp:Label></a></strong> <i class="fa fa-dot-circle-o">币</i></li>
<li><img src="/Template/Ke/style/images/coin1.jpg" alt="主页" /></li>
<li><img src="/Template/Ke/style/images/coin2.jpg" alt="主页" /></li>
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
<div class="user_menu_sub hidden"> 
<ul class="list-unstyled text-center">
<asp:Literal runat="server" ID="onther_lit" EnableViewState="false"></asp:Literal>
</ul>
</div>  
</form>
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
</body>
</html>
<script>
$().ready(function(e) {
    $(".mypro_item li h4 .tuoguan0").remove();
    $(".node14").html("概念方案");
    $(".node15").html("实施方案");
    $(".node16").html("初步设计");
    $(".node36").html("施工图设计");
    $(".node38").html("施工服务");
});
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
var status='<%Call.Label("{ZL.Label id=\"获取当前用户是否注册设计师\" /}");%>';
if(status==""||status==-2)
{
	$(".alert-2").show();
	$(".all_project").remove();
	$(".user_project").remove();
}
else if(status==0)
{
	$(".alert0").show();
	$(".all_project").remove();
	$(".user_project").remove();
}
else if(status==99)
{
	//$(".alert99").show();
}
var pronum='<%Call.Label("{ZL.Label id=\"获取当前用户项目总数\" /}");%>';
if(pronum<=0)
{
	$(".user_nopro").hide();
	$(".user_haspro").hide();
	$(".all_project").css("margin-top","0");
}
else
{
	$(".user_nopro").hide();
	$(".user_haspro").show();
}
$().ready(function(e) {
    $(".jbpay0").remove();
    $(".paynum0").html("");
});
</script>