<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Admin.Prompt.ShowError, App_Web_0glw4r2n" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>错误提示信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<%=link %>
</head>
<body>
<form id="form1" runat="server">
<div class="container" style="margin-top:10%">
<div class="row">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-remove-circle pull-left"></span> 系统提示-来自可能错误的请求，可能的原因是：</h3>
        </div>
        <div class="panel-body text-center">
            <ul class="text-center list-unstyled">
                <asp:Literal ID="LtrSuccessMessage" runat="server"></asp:Literal>
            </ul>
        </div>
        <div class="panel-footer" style="text-align:center;">
            <a href="/" title="返回网站首页" style="margin-right:10px;" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span>网站首页</a>
            <asp:HyperLink ID="LnkReturnUrl" runat="server" class="btn btn-primary" ToolTip="返回上一页"><span class="glyphicon glyphicon-repeat"></span>返回上一页</asp:HyperLink>
        </div>
    </div>
 </div>
 </div>  
</div> 
    <style type="text/css">ul li{list-style-type:none;}</style>   
</form>
</body>
</html>