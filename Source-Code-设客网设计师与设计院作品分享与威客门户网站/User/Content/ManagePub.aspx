<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_ManagePub, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>互动管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="pub"></div>
<div class="container margin_t10">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">我的互动</li>
</ol>
</div>
<ul>
<li style="width: 260px; float: left; line-height: 30px; text-align: right">
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</li>
<li>
<table width="100%">
<tr>
<td width="200" valign="top">
<table class="table table-striped table-bordered table-hover">
<tr>
<td><b>分类名称</b></td>
</tr>
<tr>
<td><a href="managepub.aspx">全部</a></td>
</tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr>
<td><a href="?pubID=<%#Eval("pubID","{0}")%>"><%#Eval("PubName","{0}")%></a></td>
</tr>
</ItemTemplate>
</asp:Repeater>

</table>
</td>
<td valign="top">
<table class="table table-striped table-bordered table-hover">
<tr align="center">
<td width="2%" class="title">
<b>ID</b>
</td>
<td width="15%"><b>所属分类</b>
</td>
<td class="style10" width="20%">
<b>互动标题</b>
</td>
<td class="style10" width="35%">
<b>互动内容</b>
</td>
<td align="center" width="20%">
<b>发表时间</b>
</td>
<td width="8%" class="title">
<b>操作</b>
</td>
</tr>
<asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
<ItemTemplate>
<tr id="<%#Eval("ID") %>" ondblclick="ShowTabs(this.id)">
<td  align="center">
<%#Eval("ID")%>
</td>
<td  align="center">
<%#GetPubInfo(Eval("Pubupid","{0}"))%>
</td>
<td  align="left">
<%#ZoomLa.Common.BaseClass.Left(Eval("PubTitle","{0}"),45)%>
</td>
<td  align="left">
<%#ZoomLa.Common.BaseClass.Left(Eval("PubContent","{0}"),45)%>
</td>
<td align="center">
<%#Eval("PubAddTime")%>
</td>
<td  align="center">
<a href="Reply.aspx?pubid=<%#Eval("Pubupid")+"&id="+Eval("ID") %>">回复</a>|
<asp:LinkButton runat="server" ID="Del2" CommandArgument='<%#Eval("ID")+":"+Eval("Pubupid") %>' 
CommandName="Del" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</asp:LinkButton>
</td>
</tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
<td  colspan="5" align="center" class="tdbg">共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
个信息
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
Text="" />页
<asp:Label ID="pagess" runat="server" Text="" />条信息/页
</td>
</tr>
</table>
</td>
</tr>
</table>
</li>
</ul>
</asp:Content>
