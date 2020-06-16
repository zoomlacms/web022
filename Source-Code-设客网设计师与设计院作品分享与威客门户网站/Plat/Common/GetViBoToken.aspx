<%@ page language="C#" autoeventwireup="true" inherits="Plat_Common_GetViBoToken, App_Web_3ityhbgx" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="<%:ZoomLa.Components.PlatConfig.QQKey %>" data-callback="true" charset="utf-8"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>绑定进行中,请稍等片刻</div>
        <div style="display:none;">
        <asp:HiddenField runat="server" ID="OpenID_Hid" />
        <asp:HiddenField runat="server" ID="Token_Hid" />
        <asp:Button runat="server" ID="QQBind_Btn" OnClick="QQBind_Btn_Click" /></div>
        <script type="text/javascript">
            function QQBind() {
                QC.Login.getMe(function (openId, accessToken) {
                    $("#OpenID_Hid").val(openId);
                    $("#Token_Hid").val(accessToken);
                    $("#QQBind_Btn").click();
                });
            }
            QQBind();
        </script>
    </form>
</body>
</html>
