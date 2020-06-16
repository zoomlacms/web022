<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Baike/Baike.master" clientidmode="Static" inherits="Guestbook_BkSearch, App_Web_mas3ijli" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>搜索词条-<%Call.Label("{$SiteName/}"); %>百科</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<ol class="breadcrumb margin_top10">
    <li>您的位置：<a href="/">网站首页</a></li>
    <li><a href="/Baike" target="_self">百科中心</a></li>
    <li><a href="CreatBaike.aspx">创建词条</a></li>
</ol>
<p><asp:Label runat="server" ID="lblTittle">百科</asp:Label></p>
<div style="border-top: 2px solid #3171af; padding: 25px 0 10px 0;">
<asp:Repeater runat="server" ID="repSearch">
<ItemTemplate>
<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tbody>
<tr>
<td class="f">
<h2><a target="_blank" href="Details.aspx?action=new&soure=user&tittle=<%# 
Server.HtmlEncode(Server.UrlEncode(Eval("Tittle").ToString()))%>"><%#Server.HtmlEncode(Eval("Tittle").ToString())%></a>
</h2>
<div class="abstract"><%#Eval("Contents").ToString()%></div>
<div class="fs"><%#Eval("AddTime","{0:yyyy-MM-dd}")%>
<a class="lkgn" target="_blank" href="javascript:void(0)"><%#Eval("UserName")%></a></div>
</td>
</tr>
</tbody>
</table>
<br>
</ItemTemplate>
</asp:Repeater>
<div style="text-align:center">共<asp:Label ID="AllNum" runat="server" Text=""></asp:Label>条记录
<asp:Label runat="server" ID="Toppage"></asp:Label>
<asp:Label runat="server" ID="Nextpage"></asp:Label>
<asp:Label runat="server" ID="Downpage"></asp:Label>
<asp:Label runat="server" ID="Endpage"></asp:Label>
页次：<asp:Label ID="Nowpage" runat="server"></asp:Label>/<asp:Label ID="PageSize" runat="server" ></asp:Label>页<asp:Label ID="Lable1" runat="server"></asp:Label>条记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList>页
</div>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</asp:Content>
