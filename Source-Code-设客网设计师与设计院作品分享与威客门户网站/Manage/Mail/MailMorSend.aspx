<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_MailMorSend, App_Web_aevlcxb5" enableviewstatemac="false" validaterequest="false" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件群发</title>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td align="center" colspan="3" class="spacingtitle"><b>邮件群发</b></td>
        </tr>
        <tr>
            <td align="right"><strong>邮件模板：</strong></td>
            <td>
                <asp:DropDownList ID="MailTemp" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="GetTempCon" Width="100px">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right"><strong>选择联系人组：</strong></td>
            <td>
                <asp:DropDownList ID="Type" runat="server" CssClass="form-control" AutoPostBack="True" Width="160px" OnSelectedIndexChanged="Type_SelectedIndexChanged">
                    <asp:ListItem Value="0">请选择</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"></td>
            <td style="text-align: left">
                <asp:ListBox ID="txtSendTo" runat="server" Width="300px" SelectionMode="Multiple" Height="108px" Visible="False"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><strong>主 题：</strong></td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtSubject" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtSubject" SetFocusOnError="false" ErrorMessage="*主题不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><strong>内 容：</strong></td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Height="300" Width="80%"></asp:TextBox>
            </td>
            <%=Call.GetUEditor("TxtContent",3) %>
        </tr>
        <tr>
            <td width="15%" align="right"><strong>发件人别名：</strong></td>
            <td style="text-align: left">
                <asp:TextBox ID="txtSendFrom" CssClass="form-control" runat="server" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right"><strong>回复Email：</strong></td>
            <td>
                <asp:TextBox CssClass="form-control" ID="TxtSenderEmail" runat="server" Width="350px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="ValeSenderEmail" runat="server" ControlToValidate="TxtSenderEmail" Display="None" ErrorMessage="回复Email不是有效的Email地址！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right"><strong>邮件优先级：</strong></td>
            <td>
                <asp:RadioButtonList ID="RadlPriority" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="2">高</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">普通</asp:ListItem>
                    <asp:ListItem Value="1">低</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" CssClass="btn btn-primary" />
                <asp:Button ID="BtnClear" runat="server" Text="清除" CssClass="btn btn-primary" OnClick="BtnClear_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script>
    <script type="text/javascript">
        function opendialog() {
            document.getElementById("FileUpload1").click();
        }
    </script>
</asp:Content>
