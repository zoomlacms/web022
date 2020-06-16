<%@ page language="C#" autoeventwireup="true" inherits="FreeHome.User.MessageRestore, App_Web_yfgwqtud" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>无标题页</title>
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td align="center">内容:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TEXTAREA1"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                    <td>
                        <textarea cols="30" rows="6" id="TEXTAREA1" class="form-control" runat="server"></textarea></td>
                </tr>
                <tr>
                    <td width="16%" align="center"></td>
                    <td width="84%">
                        <asp:Button ID="savebtn" CssClass="btn btn-primary" runat="server" OnClick="savebtn_Click" Text="回复" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
