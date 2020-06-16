<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_MailType, App_Web_li2c4mic" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>类别设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td align="center" colspan="2" class="spacingtitle"><b>类别设置</b></td>
        </tr>

        <tr>
            <td width="180" align="right"><strong>类别名称：</strong></td>
            <td>
                <asp:TextBox ID="tbxTypeName" runat="server" class="form-control" Width="180"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxTypeName" SetFocusOnError="false" ErrorMessage="类别名不能为空"></asp:RequiredFieldValidator>
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
