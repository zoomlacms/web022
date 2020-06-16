<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchList.aspx.cs" Inherits="ZoomLa.WebSite.SearchList" EnableViewState="false" %><!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>搜索结果</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/App_Themes/V3.css" rel="stylesheet" />
<link href="/Template/Ke/style/global.css?Version=20150909" rel="stylesheet"/>
<script src="/js/scrolltopcontrol.js" type="text/javascript"></script>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\"/}");%>
    
<div class="container searchbuttom" style="padding-top:20px;">
<div class="row">
<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
<form runat="server" id="myform">
<div style="width: 500px;">
<asp:DropDownList ID="DDLNode" runat="server" CssClass="form-control pull-left text_md" onchange="UpdateNode();" Visible="false"></asp:DropDownList>
<div class="input-group pull-left text_md">
<asp:TextBox ID="TxtKeyword" runat="server" Width="150" paceholder="请输入关键字" CssClass="form-control"></asp:TextBox>
<span class="input-group-btn">
<input type="button" value="搜  索" onclick="UpdateSkey();" class="btn btn-default" />
</span>
</div>
</div>
</form>
</div>
<div class="col-lg-4 col-md-7 col-sm-7 col-xs-12">
<div class="dropdown" style="float:left;">
<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
<span id="node_dr">按栏目检索</span>
<span class="caret"></span>
</button>
<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
<li><a class="skey" data-type="node" data-val="0" href="javascript:;">所有栏目</a></li>
<asp:Repeater ID="nodeList" runat="server">
<ItemTemplate>
<li><a class="skey" data-type="node" data-val="<%#Eval("nodeid") %>" href="javascript:;"><%#Eval("NodeName") %></a></li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
<div class="dropdown" style="float:left;">
<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
<span id="order_dr">按时间</span><span class="caret"></span>
</button>
<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
<li role="presentation"><a class="skey" role="menuitem" tabindex="-1" data-type="order" data-val="0" href="javascript:;">按时间</a></li>
<li role="presentation"><a class="skey" role="menuitem" tabindex="-1" data-type="order" data-val="1" href="javascript:;">点击数</a></li>
</ul>
</div>
</div>
</div>
</div>
<div class="container" id="searchlist">
<div id="rpt_div" class="searchlist margin_t10"></div>
</div>
<%Call.Label("{ZL.Label id=\"全站底部\"/}");%>
</body>
</html>
<script>
var skeyMod = { keywrod: "<%=KeyWord%>", node: "<%=NodeID%>", order: "<%=Order%>" },
	waitdiv = '<div id="wait_div" style="position: absolute; top: 40%; left: 30%;"><i class="fa fa-spinner fa-spin" style="font-size: 40px;"></i></div>';
function LoadPage() {
	$("#rpt_div").html(waitdiv);
	var url = "SearchBody.aspx?keyword=" + encodeURI(skeyMod.keywrod) + "&node=" + skeyMod.node + "&order=" + skeyMod.order + " #main";
	$("#rpt_div").load(url);
}
function LoadByAjax(query, page) {
	$("#rpt_div").html(waitdiv);
	var url = "SearchBody.aspx" + query + "page=" + page;
	$("#rpt_div").load(url + " #main");
}
function UpdateNode() {
	skeyMod.node = $("#DDLNode").val();
	LoadPage();
}
function UpdateSkey() {
	skeyMod.keywrod = $("#TxtKeyword").val();
	LoadPage();
}
$(function () {
	$(".skey").click(function () {
		var obj = $(this);
		switch (obj.data("type"))
		{
			case "node":
				skeyMod.node = obj.data("val");
				$("#node_dr").text(obj.text());
				break;
			case "order":
				skeyMod.order = obj.data("val");
				$("#order_dr").text(obj.text());
				break;
		}
		LoadPage();
	});
	$("#TxtKeyword").keydown(function () {
		if (event.keyCode == 13) { UpdateSkey(); return false; }
	});
	LoadPage();
});
$().ready(function(e) {
    $("#topname").html("全站检索");
});
</script>