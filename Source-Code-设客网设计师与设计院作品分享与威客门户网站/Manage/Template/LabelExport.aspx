<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.LabelExport, App_Web_mq0353cm" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>标签升级</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="text-align:center">
<div style="width:100%;text-align:left" class="table-bordered">
    <br />
    升级标签：<br />
    <br />
    升级状态：<span style="color:Red"><asp:Label ID="Label1" runat="server" Text="状态"></asp:Label></span><br />
    <br />
    <asp:Button ID="Button1" runat="server"  class="btn btn-primary" Text="升级标签" OnClick="Button1_Click" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
