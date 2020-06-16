<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_Watermark_HtmlToJPG, App_Web_wk3qhtsd" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link href="/App_Themes/User.css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
</head>
<body>
<form runat="server">
<div class="container text-center"><img runat="server" ID="CerPic_Img" src="/UploadFiles/User/UserFunc/ukr.jpg" CssClass="center-block" /></div>
<div class="container text-center btn_green"><asp:Button runat="server" CssClass="btn btn-primary" Text="保存图片" ID="SaveImage" OnClick="SaveImage_Click" /></div>
</form>
</body>
</html>
