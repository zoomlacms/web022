<%@ Page Language="C#" MasterPageFile="~/User/Default.master"  AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="ZoomLa.WebSite.User.UserInfo" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>注册信息</title>
    </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class=" margin_t5"> 
<ol class="breadcrumb">
<li>您现在的位置：<a href="/" title="网站首页"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">注册信息</li> 
</ol> 
</div> 
<div class="">
<div runat="server" id="Login" class="us_seta" visible="false">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
</tr>
<tr>
<td>
<asp:TextBox runat="server" ID="Second" CssClass="form-control pull-right" TextMode="Password"></asp:TextBox>
</td>
<td style="width:50%;">
<asp:Button runat="server" ID="sure" CssClass="btn btn-primary" Text="确定" OnClick="sure_Click" />
</td>
</tr>
</table>
</div>  
<div runat="server" id="DV_show">
<div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
<ul class="nav nav-tabs">
<li class="active"><a href="UserInfo.aspx">注册信息</a></li>
<li class="g1"><a href="InstituteBase.aspx">基本信息</a></li>
<li class="g2"><a href="/User/Content/EditDesigners.aspx?GeneralID=<%Call.Label("{ZL.Label id=\"获取当前用户基本资料链接\" /}");%>">基本信息</a></li>
<li class="g1"><a href="InstituteBase.aspx?sel=Tabs1">头像设置</a></li>
<li class="g2"><a href="UserBase.aspx?sel=Tabs1">头像设置</a></li>
</ul>
<table class="table table-striped table-bordered table-hover">
<tr><td class="text-center" colspan="4">注册信息</td></tr>
<tr>
<td style="width: 200px; text-align: right">用户名：</td>
<td style="width: 250px; "><asp:Label ID="LblUser" runat="server" ></asp:Label></td>
<td style="width: 200px; text-align: right">Email：</td>
<td style="width: 250px; "><asp:Label ID="LblEmail" runat="server" ></asp:Label></td>
</tr>
<tr>
<td style="width: 200px; text-align: right">所属用户组：</td>
<td style="width: 250px; ">
<asp:Label ID="LblGroup" runat="server" ></asp:Label></td>
<td style="width: 200px; text-align: right">加入用户组时间：</td>
<td style="width: 250px; "><asp:Label ID="LblJoinTime" runat="server" ></asp:Label></td>
</tr>
<tr>
<td style="width: 200px; text-align: right">注册时间：</td>
<td style="width: 250px; "><asp:Label ID="LblRegTime" runat="server" ></asp:Label></td>
<td style="width: 200px; text-align: right">登录次数：</td>
<td style="width: 250px; "><asp:Label ID="LblLoginTimes" runat="server" ></asp:Label></td>
</tr>
<tr>
<td style="width: 200px; text-align: right">最近修改密码时间：</td>
<td style="width: 250px; "><asp:Label ID="LblLastModify" runat="server" ></asp:Label></td>
<td style="width: 200px; text-align: right">最近被锁定时间：</td>
<td style="width: 250px; "><asp:Label ID="LblLastLock" runat="server" ></asp:Label></td>
</tr>
<tr>
<td style="width: 200px; text-align: right">余额：</td>
<td style="width: 250px; ">
<a href="ConsumeDetail.aspx?SType=1" title="点击查看变更详情"><asp:Label ID="Purse_L" runat="server"></asp:Label></a>
</td>
<td style="width: 200px; text-align: right">银币：</td>
<td style="width: 250px; ">
<a href="ConsumeDetail.aspx?SType=2" title="点击查看变更详情"><asp:Label ID="Sicon_L" runat="server"></asp:Label></a>
</td>
</tr>
<tr>
<td style="width: 200px; text-align: right">积分：</td>
<td style="width: 250px; ">
<a href="ConsumeDetail.aspx?SType=3" title="点击查看变更详情"><asp:Label ID="Point_L" runat="server"></asp:Label></a></td>
<td style="width: 200px; text-align: right">点券：</td>
<td style="width: 250px; ">
<a href="ConsumeDetail.aspx?SType=4" title="点击查看变更详情"><asp:Label ID="UserPoint_L" runat="server"></asp:Label></a>
</td>
</tr>
<tr hidden>
<td style="width: 200px; text-align: right">虚拟币：</td>
<td style="width: 250px; ">
<a href="ConsumeDetail.aspx?SType=5" title="点击查看变更详情"><asp:Label ID="DummyPurse_L" runat="server"></asp:Label></a>
</td>
<td style="width: 200px; text-align: right">卖家积分：</td>
<td style="width: 250px; "><asp:Label ID="LblboffExp" runat="server" ></asp:Label></td>
</tr>
<tr hidden>
<td style="width: 200px; text-align: right">消费积分：</td>
<td style="width: 250px; "><asp:Label ID="LblConsumeExp" runat="server" ></asp:Label></td>
<td style="width: 200px; text-align: right">等级：</td>
<td style="width: 250px; "><span id="LvIcon_Span" runat="server"></span> <asp:Label ID="gradeTxt" runat="server" ></asp:Label></td>
</tr>
<tr>
</tr>
<tr hidden>
<td style="width: 200px; text-align: right">最近登录时间：</td>
<td style="width: 250px; "><asp:Label ID="LblLastLogin" runat="server" ></asp:Label></td>
<td style="width: 200px; text-align: right">推荐人：</td>
<td style="" colspan="3"><asp:Label ID="LblParentUserID" runat="server" Text=""></asp:Label></td>
<td style="width: 200px; text-align: right">最近登录IP：</td>
<td style="width: 250px; "><asp:Label ID="LblLastIP" runat="server" ></asp:Label></td>
</tr>
<asp:Literal runat="server" ID="GroupModelField_Li"></asp:Literal>
<tr>
<td class=" text-center" colspan="4">
<a class="btn btn-primary g2" href="/User/Content/EditDesigners.aspx?GeneralID=<%Call.Label("{ZL.Label id=\"获取当前用户基本资料链接\" /}");%>">基本信息</a>
<a class="btn btn-primary g1" href="UserBase.aspx">基本信息</a>
<input id="Button17" type="button" value="修改密码" class="btn btn-primary" onclick="javascript: location.href = '/User/ChangPSW.aspx'" />
<input id="Button3" type="button" value="充值金额" class="btn btn-primary" onclick="javascript: window.open('/PayOnline/SelectPayPlat.aspx')" />
<input id="Button10" type="button" value="金额明细" class="btn btn-primary" onclick="javascript: location.href = 'MoneyInfo.aspx'" />
<input id="Button8" type="button" value="积分明细" class="btn btn-primary" onclick="javascript: location.href = 'ExpHis.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="u_sign" id="u_UserInfo"></div>      
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
if("<%Call.Label("{ZL.Label id=\"抽取当前会员的会员组\" /}");%>"=="1")
	$(".g2").remove();
else
	$(".g1").remove();
</script> 
</asp:Content>