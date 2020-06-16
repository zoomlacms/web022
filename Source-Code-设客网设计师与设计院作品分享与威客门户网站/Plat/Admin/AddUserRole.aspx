<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_AddUserRole, App_Web_ilbgbtjb" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>权限信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">能力中心</a></li>
<li><a href="/Plat/Admin/">管理中心</a></li>
<li><a href="/Plat/Admin/UserRole.aspx">角色管理</a></li>
</ol>
<table class="table table-bordered table-hover table-striped">
<tr>
  <td class="menu">角色名称：</td>
  <td><asp:TextBox CssClass="form-control" ID="RoleName_T" runat="server"></asp:TextBox></td>
</tr>
<tr>
  <td class="menu">备注：</td>
  <td><asp:TextBox CssClass="form-control" ID="RoleDesc_T" TextMode="MultiLine" runat="server" style="width:400px;height:100px;"></asp:TextBox></td>
</tr>
<tr>
  <td colspan="2"><asp:Button runat="server" Text="添加角色" ID="Save_Btn" CssClass="btn btn-primary" OnClick="Save_Btn_Click" /></td>
</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
.menu { width: 8%; }
</style>
</asp:Content>
