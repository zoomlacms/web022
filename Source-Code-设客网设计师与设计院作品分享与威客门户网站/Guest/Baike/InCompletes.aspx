<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Baike/Baike.master" clientidmode="Static" inherits="Guest_InCompletes, App_Web_mas3ijli" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>待完善词条-<%Call.Label("{$SiteName/}"); %>百科</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<ol class="breadcrumb margin_top10">
<li>您的位置：<a href="/">网站首页</a></li>
<li><a href="/Baike" target="_self">百科中心</a></li>
<li class="active">待完善词条</li>
</ol> 
<div>
<div>
<h3>待完善词条</h3>
<ul class="list-unstyled">
<li><span style="float: right">更新时间</span> 词条名称 </li>
<asp:Repeater runat="server" ID="Classification">
<ItemTemplate>
<li><span style="float: right"><%#Eval("AddTime","{0:yyyy-MM-dd}") %></span><a href="Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString())%>" target="_blank"><%#Eval("Tittle")%></a></li>
</ItemTemplate>
</asp:Repeater>
</ul>
<div style="text-align: center;">
共有词条<asp:Label ID="AllNum" runat="server" Text=""></asp:Label>个
<asp:Label runat="server" ID="Toppage"></asp:Label>
<asp:Label runat="server" ID="Nextpage"></asp:Label>
<asp:Label runat="server" ID="Downpage"></asp:Label>
<asp:Label runat="server" ID="Endpage"></asp:Label>
页次：<asp:Label ID="Nowpage" runat="server"></asp:Label>/<asp:Label ID="PageSize" runat="server"></asp:Label>页<asp:Label ID="Lable1" runat="server"></asp:Label>个记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList>页
</div>
</div>
<div class="conrig">
<div class="t1">如何完善词条</div>
<ul>
<li><strong>补充词条内容</strong>
增加词条文字内容、添加图片、填写参考资料，使词条内容更丰富。 </li>
<li><strong>修正词条内容</strong>
删除冗余词条文字内容、修改不正确的文字内容和开放分类、更换图片，保证词条内容的准确性。  </li>
<li><strong>增强词条可读性</strong>
为词条增加段落标题，使词条结构更清晰；添加词条链接、设置合理开放分类，加强词条间链接。 
</li>
</ul>
</div>
<asp:Literal runat="server" ID="createbaike" Visible="false"></asp:Literal>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</asp:Content>