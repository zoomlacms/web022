<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="BBS_GuestShow, App_Web_cwwreljs" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>阅读留言-<%Call.Label("{$SiteName/}"); %>留言</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link type="text/css" href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/App_Themes/Guest.css" rel="stylesheet" type="text/css" />
<script src="/JS/ZL_ValidateCode.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script>
    $(function(){
        $("#VCode").ValidateCode();
    })
function CheckDirty() {
	var value = Date.now;
	var TxtValidateCode = document.getElementById("VCode").value;

	if (value == "" || TxtValidateCode == "") {
		if (value == "") {
			var obj2 = document.getElementById("sp2");
			obj2.innerHTML = "<font color='red'>回复内容不能为空！</font>";
		}
		else {
			var obj2 = document.getElementById("sp2");
			obj2.innerHTML = "";
		}
		if (TxtValidateCode == "") {
			var obj3 = document.getElementById("sp1");
			obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
		} else {
			var obj3 = document.getElementById("sp1");
			obj3.innerHTML = "";
		}
		return false;
	}
	else {
		var obj = document.getElementById("sp2");
		obj.innerHTML = "";
		var obj3 = document.getElementById("sp1");
		obj3.innerHTML = "";
		return true;
	}
}
</script> 
<style> 
#g_show{ margin-bottom:10px; border:1px solid #eee;}
#g_show ul{ margin-bottom:0;}
#g_show li{ padding:10px;}
#g_show li h4{ padding-bottom:5px; border-bottom:1px solid #eee; }
#g_show li:nth-child(2n){ background:#fafafa;}
#replyDiv{ margin-top:20px;}
</style>
</head>
<body>
<div id="ask_top">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="ask_top_l">
          <ul class="list-inline">
            <li><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('{$SiteURL/}');" href="javascript:;">设为首页</a></li>
            <li><a href="javascript:;" hrehtype="button" id="dropdownMenu1" data-toggle="dropdown">官网频道<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <%Call.Label("{ZL.Label id=\"输出根节点下一级栏目列表\" ShowNum=\"8\" /}");%>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="ask_top_r">
          <ul class="list-inline">
            <li><i class="fa fa-graduation-cap"></i><a href="/Baike" >百科</a></li>
            <li><i class="fa fa-envelope"></i><a href="/Guest">留言</a></li> 
            <li><i class="fa fa-question-circle"></i><a href="/Ask">问答</a></li>
            <li><i class="fa fa-paw"></i><a href="/Index" >贴吧</a></li>
            <li>
              <div class="dropdown"> <a id="dLabel" data-target="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <asp:Label runat="server" ID="Label1"></asp:Label>
                </a><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的空间</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的帖子</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/User/Content/MyFavori.aspx" target="_blank">我的喜欢</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的关注</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的投票</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/User/Info/UserBase.aspx" target="_blank">个人设置</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="/user/Logout.aspx">安全退出</a></li>
                </ul>
              </div>
            </li>
            <li><a href="/User/Login.aspx?ReturnUrl=/guest/" target="_blank">登录</a>|<a href="/User/Register.aspx?ReturnUrl=/Guest/" target="_blank">注册</a></li>
          </ul>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<form id="form1" runat="server">
<div class="container">
  <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ask_logo"><a href="/Guest/Ask/Default.aspx"><img src='<%Call.Label("{$LogoUrl/}"); %>' alt="<%Call.Label("{$SiteName/}"); %>留言系统" /></a></div>
  <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 padding0">  
        <div class="padding10" style="margin-top:3em;">
          <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12"></div> 
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 padding0">
            <asp:DropDownList ID="Gtype" runat="server" CssClass="form-control" >                
              <asp:ListItem>留言标题</asp:ListItem>
              <asp:ListItem>留言ID</asp:ListItem>
            </asp:DropDownList>
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 padding0">
            <div class="input-group">
              <asp:TextBox runat="server" ID="txtName" onmouseover="this.focus()" autocomplete="off" class="form-control" tabindex="1"></asp:TextBox>
              <span class="input-group-btn">
                 <input type="button" class="btn btn-primary" value="搜索" onclick="SearchFunc();" />                  
              </span> </div>
          </div> 
    </div>
  </div>
</div>
  <div style="position:relative;">
    <div class="navbar navbar-default navbar-static-top" role="navigation" id="guest_nav">
      <div class="container"> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/Guest/Default.aspx">留言反馈</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="Default.aspx" title="留言首页">留言首页</a></li>
            <asp:Repeater ID="Repeater2" runat="server"><ItemTemplate> <li  > <%#GetDataItem()%>  </li> </ItemTemplate></asp:Repeater> 
          </ul>
        </div>
      </div>
    </div>
  </div>



<div class="container content">
<div class="dh">您的位置：<a href="/">网站首页</a>>><a href="/guest/">留言中心</a>>>查看留言</span></div></div>

<div class="container">
<div class="s_body">
<div id="g_show">
<ul class="list-unstyled">
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<li>
<h4><span>[发布者：<%# GetUserName(Eval("UserID","{0}")) %>]</span>留言标题：<%# Eval("Title")%></h4>
<div class="g_show_txt"><%# Eval("TContent")%><span>发表日期：<%# Eval("GDate")%></span></div>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
<div id="Pager1" runat="server"></div>
<!--留言分页 -->
<div id="g_send" class="rg_inout">
<div id="banAnony" class="alert alert-danger" role="alert" runat="server" visible="false">你好请先登录，再发布留言!<a href="/user/Login.aspx?ReturnUrl=/guest/" style="color:#133db6;">[点击登录]</a></div>    
<div id="replyDiv" runat="server">
<table class="table table-bordered">
<tr>
<td>发表回复:</td>
<td><textarea id="TxtContents" style="width:100%; height:300px;" name="TxtTContent" runat="server"></textarea>
<span id="sp2"></span>
<%=Call.GetUEditor("TxtContents") %>
<input type="hidden" id="txt_Config\" value="" />
<asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
<asp:HiddenField ID="HdnCateID" runat="server" />
<asp:HiddenField ID="HdnGID" runat="server" /></td>
</tr>
<tr>
<td>验证码</td>
<td><asp:TextBox ID="VCode" MaxLength="6" CssClass="form-control" runat="server" Style="width: 100px; height:34px; display:inline; " autocomplete="off" />
<img id="VCode_img" title="点击刷新验证码" class="code"  style="height:34px;"/>
<input type="hidden" id="VCode_hid" name="VCode_hid" /></td>
</tr>
<tr>
<td colspan="2" align="center"><asp:Button ID="EBtnSubmit2" runat="server"  CssClass="btn btn-primary i_bottom" Text="发表回复" OnClick="EBtnSubmit_Click" OnClientClick="return CheckDirty()" Style="margin-top: 10px;" /></td>
</tr>
</table>  
</div><!--replyDiv end-->
</div>

</div>
</div>
<div class="ask_bottom">
      <p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
      <p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
  </div>
</form>
</body>
</html>
<script>
    function SearchFunc() {
        var skey = $("#txtName").val().replace(/ /g, "");
        if (skey == "") { alert("不能为空"); return false; }
        location = "/Guest/Default.aspx?Skey=" + escape(skey);
    }
</script>