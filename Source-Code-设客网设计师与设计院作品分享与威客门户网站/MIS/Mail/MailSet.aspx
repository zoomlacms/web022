<%@ page language="C#" autoeventwireup="true" inherits="MIS_Mail_MailSet, App_Web_2kkdf3ql" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>邮箱设置</title>
<link href="../../App_Themes/User.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script>
    function loadPage(id, url) {
        $("#" + id).addClass("loader");
        $("#" + id).append("Loading......");
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            error: function () { alert('加载页面' + url + '时出错！'); },
            success: function (msg) {
                $("#" + id).empty().append(msg);
                $("#" + id).removeClass("loader");
            }
        });
    }
    loadPage("Mail_left", "/Mis/Mail/Mail_Left.aspx");
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="Meno" class="Mis_pad">  
<div class="Mis_Title"><strong><a href="javascript:void(0)" onclick="loadPage('Meno', 'NewMail.aspx')">新建邮件</a></strong></div>
<div id="Mail_left" class="left_menu">
 </div>
<div id="Mail_rig" class="rig_main">
<strong>邮箱设置：</strong> <br />
SMTP： <asp:TextBox ID="tbxSmtpServer" runat="server"></asp:TextBox><br />
POP3： <asp:TextBox ID="tbxPOP3Server" runat="server"></asp:TextBox><br />
邮 箱： <asp:TextBox ID="tbxUserMail" runat="server"></asp:TextBox> <br />
<asp:Label ID="Labpwd" runat="server">密 码：</asp:Label>   <asp:TextBox ID="txbPassword" runat="server"  TextMode="Password"></asp:TextBox><br />
<asp:Button ID="Button1" CssClass="i_bottom" runat="server" OnClick="Button1_Click" Text="确定" />   &nbsp;<input type="button" class="i_bottom" value="返回" onclick="javascript:history.go(-1);" />
</div>
    </div>
</form>
</body>
</html>
