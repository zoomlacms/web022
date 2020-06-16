<%@ page language="C#" autoeventwireup="true" inherits="User_SetSecondPWDWeb, App_Web_odweewxl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../App_Themes/UserThem/bidding.css" />
<link href="../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    您现在的位置：<a title="网站首页" href="/" target="_blank">
<asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a> &gt;&gt;<a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; 设置支付密码页面
    <div style="margin-top: 10px;">
    <div class="us_seta"  runat="server" >
    <table>
    <tr><td style="width:180px;font-size:large">页面功能</td><td style="width:80px;font-size:large">页面url</td><td style="width:380px;font-size:large">操作</td></tr>
    <tr><td style="width:180px;font-size:large">
        支付密码设置页面</td> <td style="width:80px;font-size:large">/user/SetSecondPwd.aspx</td><td style="width:80px;font-size:large"><asp:LinkButton runat="server" 
            ID="open" onclick="open_Click">开启</asp:LinkButton>
        <asp:LinkButton runat="server" ID="close" onclick="close_Click" Enabled="false" style="width:80px;font-size:large">关闭</asp:LinkButton></td></tr>
    </table>
    </div>
    </div>
    </form>
</body>
</html>
