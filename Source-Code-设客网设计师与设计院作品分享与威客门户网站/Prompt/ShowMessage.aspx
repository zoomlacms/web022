<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.ShowMessage, App_Web_0glw4r2n" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>信息提示页</title>
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script> 
</head>
<body class="popup_body">
<form id="form1" runat="server">
    <div class="popup"> 
        <div class="popup_title text-center"><i class="fa fa-dollar"></i><asp:Label ID="LblMessageTitle" runat="server" Text="信息提示"></asp:Label></div>
        <div class="popup_cnt"><asp:Literal ID="LtrMessage" runat="server"></asp:Literal></div>
            <div class="popup_goon text-center"><asp:LinkButton ID="Link1"  OnClick="Link1_Click1" runat="server" Text="确定"></asp:LinkButton></div>
            <div class="popup_return">
                <ul class="list-inline pull-right">
                    <li><asp:HyperLink ID="LnkReturnUrl" runat="server"><i class="fa fa-arrow-circle-left"></i>返回上一页</asp:HyperLink></li>
                    <li><a href="/"><i class="fa fa-home"></i>首页</a></li>
                    <li><a href="/User/"><i class="fa fa-user"></i>会员中心</a></li>
                    </ul>
                </div>
            <div class="clearfix"></div>
        </div> 
</form> 
</body>
</html>