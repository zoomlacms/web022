<%@ page language="C#" autoeventwireup="true" inherits="User_Cloud_NewFolder, App_Web_kh00etpl" masterpagefile="~/User/Empty.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>新建文件夹</title>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/jquery.windows-engine.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="margin-top: 20px; margin-left: 20px;">
    <input type="text" class="form-control" id="Name" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Name" runat="server" ErrorMessage="目录名不能为空"></asp:RequiredFieldValidator>
    <asp:Button ID="New" CssClass="btn btn-primary" Text="确定" runat="server" OnClick="New_Click" />
</div>
</asp:Content>

