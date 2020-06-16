<%@ page language="C#" autoeventwireup="true" inherits="manage_SystemCheck_, App_Web_v2egescv" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>浏览器检测</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table id="mainTB" class="table table-striped table-bordered table-hover"> 
    <tr><td class="text-right" style="width:120px;">浏览器版本：</td><td><%=browser%></td></tr>
    <tr><td class="text-right">客户端地址：</td><td><%=currentIP %></td></tr>
    <tr><td class="text-right">屏幕分辨率：</td><td><%=currentWindow%>  屏大小：(<script>document.write(window.screen.width + "px,"); document.write(window.screen.height + "px");</script>)</td></tr>
    <tr><td class="text-right">Cookies：</td><td><%=cookiesSurrport%></td></tr>
    <tr><td class="text-right">服务器Mac：</td><td id="tdMac" runat="server"></td></tr>
    <tr><td class="text-right">访问的网址：</td><td> <asp:Label ID="lbServerName" runat="server" /></td></tr>
    <tr><td class="text-right">服务器IIS版本：</td><td> <asp:Label ID="IISVersion_L"  runat="server" /></td></tr>
    <tr><td class="text-right">.NET 版本：</td><td> <asp:Label ID="NFVersion_L" runat="server" /></td></tr> 
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <style type="text/css">
        .info_url a {color:#1370b5;text-decoration:none;}
        .info_url a:hover {color:#ff6600;}
        #mainTB tr td {height:26px;line-height:26px;padding:1px;padding-left:8px;font-size:12px;font-family:'Microsoft YaHei';}
    </style>
</asp:Content>