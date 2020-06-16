<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Baike/Baike.master" clientidmode="Static" inherits="Guest_baiclassification, App_Web_mas3ijli" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>词条分类-<%Call.Label("{$SiteName/}"); %>百科</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<ol class="breadcrumb margin_top10">
    <li>您的位置：<a href="/">网站首页</a></li>
    <li><a href="/Baike" target="_self">百科中心</a></li>
    <li class="active">词条分类</li>
</ol>
<div> 
<asp:Repeater runat="server" ID="Classification">
<ItemTemplate> 
<table cellspacing="0" cellpadding="0" border="0">
<tbody>
<tr ><td><h2><a href="Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>" target="_blank"><%#Eval("Tittle")%></a></h2>
<div><%#NoHTML(Eval("Contents").ToString()) %>...</div>
<div><%#Eval("AddTime","{0:yyyy-MM-dd}") %> <%#Eval("UserName") %></div>
</td>
</tr>
</tbody>
</table>
</ItemTemplate>
</asp:Repeater>   
<asp:Literal runat="server" ID="createbaike" Visible="false"></asp:Literal>  
<div id="page">共<asp:Label ID="AllNum" runat="server" Text=""></asp:Label>条记录
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