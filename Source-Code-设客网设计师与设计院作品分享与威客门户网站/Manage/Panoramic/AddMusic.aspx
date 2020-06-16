<%@ page language="C#" autoeventwireup="true" inherits="manage_Panoramic_AddMusic, App_Web_rm1hbh3m" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加音乐</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="spacingtitle" align="center">
                <asp:Label ID="TitleLabel" runat="server" Text="添加音乐"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right" style="width: 300px">音乐名称: </td>
            <td>
                <asp:TextBox ID="musicname" runat="server" class="l_input"></asp:TextBox>
                输入音乐名称
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="musicname" ErrorMessage="请输入音乐名称"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right">音乐地址: </td>
            <td>
                <asp:TextBox ID="musicurl" runat="server" class="l_input" Width="356px"></asp:TextBox>
                请添加网络地址。如:http://网址
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="musicurl" ErrorMessage="请输入音乐地址"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdbgleft" align="right">是否启用: </td>
            <td>
                <asp:CheckBox ID="IsTrue" runat="server" Text="启用" Checked="true" />
                (停用则全景中无法选择此音乐) </td>
        </tr>
        <tr>
            <td class="tdbg" align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="添加" CssClass="btn btn-primary" OnClick="Button1_Click" />
                &nbsp;
          <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-primary" CausesValidation="false" OnClick="Button2_Click" /></td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="mid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>