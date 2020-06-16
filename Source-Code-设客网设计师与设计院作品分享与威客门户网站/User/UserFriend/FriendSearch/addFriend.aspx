<%@ page language="C#" autoeventwireup="true" inherits="User_UserFriend_FriendSearch_addFriend, App_Web_x3jrugup" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>添加好友</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table table-striped table-bordered table-hover">
                <tr align="center">
                    <td colspan="2" class="text-center">添加好友
                    </td>
                </tr>
                <tr class="WebPart">
                    <td align="right" style="width: 24%; vertical-align:middle;">请选择你的好友组： </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" style="max-width:150px;" CssClass="form-control" runat="server"></asp:DropDownList>
                        <div class="alert alert-danger fade in" style="margin-top:10px;">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4>Tips!</h4>
                            <p>提示:当前添加的好友为你关注的朋友，只有对方同意才能变为好友</p>
                        </div>
                    </td>
                </tr>
                <tr class="WebPart">
                    <td align="right" style="width: 24%">
                        <strong></strong>
                    </td>
                    <td>
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="提交" OnClick="Button1_Click" />
                        <asp:HiddenField ID="HiddenUserid" runat="server" />
                        <asp:HiddenField ID="HiddenUsername" runat="server" />
                        <asp:HiddenField ID="HiddenUid" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
