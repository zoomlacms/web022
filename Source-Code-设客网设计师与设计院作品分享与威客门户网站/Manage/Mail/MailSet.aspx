<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_MailSet, App_Web_li2c4mic" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮箱设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td align="center" colspan="2" class="spacingtitle"><b>设置邮箱</b></td>
        </tr>
        <tr>
            <td width="180" align="right"><strong>别名：</strong></td>
            <td>
                <asp:TextBox ID="tbxUserName" runat="server" class="form-control" Width="180"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" SetFocusOnError="false" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="180" align="right"><strong>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</strong></td>
            <td>
                <asp:TextBox ID="tbxUserMail" runat="server" class="form-control" Width="180"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqTxtEmail" runat="server" ControlToValidate="tbxUserMail" SetFocusOnError="false" ErrorMessage="邮箱不能为空"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxUserMail" ErrorMessage="邮箱地址不规范" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right"><strong>选择分类：</strong></td>
            <td>
                <asp:DropDownList ID="Type" CssClass="form-control" runat="server" AutoPostBack="True" Width="150px">
                    <asp:ListItem Value="0">请选择</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="确定" />
                <input type="button" class="btn btn-primary" value="返回" onclick="javascript: history.go(-1);" />
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>

