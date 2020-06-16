<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.indexSearch, App_Web_tdl2wacn" enableviewstatemac="false" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html runat="server">
<head id="Head1">
<meta charset="utf-8" />
<title>全站搜索_<%=GetName()%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link href="../dist/css/bootstrap.min.css" rel="stylesheet"/>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script src="../js/jquery-1.11.0.min.js.js"></script>
<script src="../dist/js/bootstrap.min.js"></script>
<link href="../dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="../App_Themes/V3.css" rel="stylesheet" />
</head>
<body runat="server">
<form runat="server" id="myform">
<div id="Div1" runat="server">
<div class="container">
    <h1 class="search_logo"><a href="/"><img src="<%= Call.LogoUrl %>" alt="<%= Call.SiteName %>" class="img-responsive" /></a></h1>
    <div class="search_index">
    <div class="pull-left">
        <asp:DropDownList ID="DDLNode" runat="server" CssClass="form-control pull-right input-sm " Width="200" data-container="body"></asp:DropDownList>
    </div>
        <div class="input-group" style="width:300px;">
            <asp:TextBox ID="TxtKeyword" runat="server" onclick="setEmpty(this)" onblur="settxt(this)" Text="请输入关键字" CssClass="form-control input-sm"></asp:TextBox>
            <span class="input-group-btn">
                <asp:Button ID="btnSearch" runat="server" Width="50" Text="搜索" OnClick="btnSearch_Click" CssClass="btn btn-default input-sm" />
            </span>
        </div><!-- /input-group -->
</div><div class="clearfix"></div>
</div>
</div>
</form>
<script type="text/javascript">
    function setEmpty(obj) {
        if (obj.value == "请输入关键字") {
            obj.value = "";
        }
    }
    function settxt(obj) {
        if (obj.value == "") {
            obj.value = "请输入关键字";
        }
    }
</script>
</body>
</html>