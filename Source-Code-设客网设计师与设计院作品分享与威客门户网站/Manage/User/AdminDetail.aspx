<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AdminDetail, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>管理员预览</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr><td class="tdbgleft td_l">管理员名：</td>
            <td><asp:Label ID="tbdName" runat="server"></asp:Label></td></tr>
        <tr><td class="tdbgleft">真实姓名：</td>
            <td><asp:Label ID="txtAdminTrueName" runat="server"></asp:Label></td></tr>
        <tr><td class="tdbgleft">选项设置：</td>
            <td><asp:Label ID="cb1" runat="server"></asp:Label>
                <asp:Label ID="cb2" runat="server"></asp:Label>
                <asp:Label ID="cb3" runat="server"></asp:Label></td>
        </tr>
        <tr><td class="tdbgleft">管理员角色：</td><td><asp:Label ID="cblRoleList1" runat="server"></asp:Label></td></tr>
        <tr><td class="tdbgleft">默认节点控制权限：</td><td><asp:Label ID="DropDownList11" runat="server"></asp:Label></td></tr>
        <tr><td class="tdbgleft">是否前台审核互动：</td><td><asp:Label ID="CheckBox1" runat="server"></asp:Label></td></tr>
        <tr><td class="tdbgleft">发布内容默认状态：</td><td><asp:Label ID="DefaultStart1" runat="server"></asp:Label></td></tr>
        <tr>
            <td class="tdbgleft"></td>
            <td>
                <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="重新修改" />
                <asp:Button ID="btnAdd" runat="server" class="btn btn-primary" Text="继续添加管理员" OnClick="btnAdd_Click" />
                <asp:Button ID="btnList" class="btn btn-primary" runat="server" Text="返回列表" OnClientClick="location.href='AdminManage.aspx';return false;" />
            </td>
        </tr>
    </table>
  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
