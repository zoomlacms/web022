<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa_WebSite_Manages_Worktable, App_Web_xjanfy1q" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title>我的工作台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/ICMS/alt.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<link type="text/css" href="/dist/css/font-awesome.min.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/V3.css" rel="stylesheet" />
<style type="text/css">
.litd { text-align: center; padding: 10px; float: left; }
.padding_l_r0 .panel-body li i{ font-size:3.5em;}
.broserinfo{ padding-top:30px; padding-bottom:20px;}
.broserinfo i{ font-size:1.4em; color:#f00;}
.broserinfo p{ margin-top:40px;}
.broserinfo font{ margin-left:5px; color:#999;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="container-fluid">
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<ol class="breadcrumb navbar-fixed-top hidden-sm hidden-xs" runat="server" id="BreadNav">
  <li><a href="../Main.aspx" style="color: #428bca;">工作台</a></li>
  <li class="active">版本信息&nbsp;&nbsp; <%=lang.LF("欢迎")%><strong>
    <asp:Literal runat="server" ID="litUserName"></asp:Literal>
    </strong>&nbsp;<%=lang.LF("今天是")%>:
    <asp:Literal runat="server" ID="litDate"></asp:Literal>
    <span id="times" name="times"></span><a href="../../Common/SelectChinaDay.html">[<%=lang.LF("万年历")%>]</a> </li>
  <%= Call.GetHelp(1) %>
</ol>
</div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding_l_r0 lg_padding_top_40">
  <div class="panel panel-info" style="margin-bottom:0.5em;">
    <div class="panel-heading"><%=lang.LF("欢迎进入")%><%:Call.SiteName.Trim() %>后台管理系统，
      <asp:Label ID="Version" runat="server"></asp:Label>。</div>
    <div class="panel-body">
      <ul style="list-style-type:none;">
        <li class="litd"><a href="../Config/SiteInfo.aspx"><i class="fa fa-cogs"></i></a><br />
          <a href="../Config/SiteInfo.aspx" target="_self"><%=lang.LF("网站配置")%></a></li>
        <li class="litd"><a href="../Content/ModelManage.aspx?ModelType=1"><i class="fa fa-edit"></i></a><br />
          <a href="../Content/ModelManage.aspx?ModelType=1" target="_self"><%=lang.LF("内容模型")%></a></li>
        <li class="litd"><a href="../Content/NodeManage.aspx"><i class="fa fa-university"></i></a><br />
          <a href="../Content/NodeManage.aspx" target="_self"><%=lang.LF("节点设置")%></a></li>
        <li class="litd"><a href="../Template/LabelManage.aspx"><i class="fa fa-tags"></i></a><br />
          <a href="../Template/LabelManage.aspx" target="_self"><%=lang.LF("标签设置")%></a></li>
        <li class="litd"><a href="../Template/TemplateSet.aspx"><i class="fa fa-cubes"></i><br />
          <a href="../Template/TemplateSet.aspx" target="_self"><%=lang.LF("模板设置")%></a></li>
        <li class="litd"><a href="../User/AdminManage.aspx"><i class="fa fa-lock"></i></a><br />
          <a href="../User/AdminManage.aspx" target="_self"><%=lang.LF("安全设定")%></a></li>
        <li class="litd"><a href="../Content/ContentManage.aspx"><i class="fa fa-file-text-o"></i></a><br />
          <a href="../Content/ContentManage.aspx" target="_self"><%=lang.LF("内容管理")%></a></li>
      </ul>
    </div> 
  </div>
  </div>
  
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 padding_l0">
<div class="panel panel-default">
    <div class="panel-heading">
        <span><%=lang.LF("浏览信息")%></span>
    </div>
  <div class="panel-body" style="height: 268px;">
      <iframe id="showiframe" src="../BrowserCheck.aspx" marginwidth="1" marginheight="1" scrolling="no" frameborder="0" style="border-style: none; border-color: inherit; border-width: medium; width: 100%; height: 250px;"></iframe>
  </div>
  <div class="panel-footer">
    <a href="http://www.zoomla.cn/help/web/1414.shtml" class="margin-15 hidden-xs" title="设置Cookie" target="_blank">设置Cookie</a>
    <a href="http://www.zoomla.cn/help/web/1413.shtml" class="margin-15 hidden-xs hidden-sm" title="设置脚本" target="_blank">设置网页脚本</a>
    <a href="<%:customPath2+"Common/SystemFinger.aspx" %>" title="服务器信息总览"><span style="margin-right:2px;">服务器信息总览</span><i class="fa fa-forward"></i></a>
  </div>
</div>
</div>
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 padding_l0">
<div class="panel panel-default">
  <div class="panel-heading"><i class="fa fa-book" style="margin-right:2px;"></i><span><%=lang.LF("备忘录")%></span></div>
  <div class="panel-body" style="height: 268px;">
     <asp:TextBox ID="NoteBook" runat="server" CssClass="form-control" TextMode="MultiLine" style="max-width:100%;height:243px;resize:none;" Columns="50"/>
   </div>
    <div class="panel-footer">
        <%--        <span class="hidden-sm hidden-xs">提示：记录随Cookies删除而消失，重要信息请进入<a href="../AddOn/ProjectAffairsCenter.aspx">[事务中心]</a>进行记录</span> <span class="visible-sm visible-xs">提示：记录随Cookies删除而消失</span>--%>
        <span>提示：记录随Cookies删除而消失</span>
    </div>
</div>
</div>

</div>
</div> 
<script>
    function ShowAD() {
        parent.ShowAD();
    }
   
    $(function () { 
        $("#NoteBook").bind("blur paste cut", function () {//keyup paste cut
            setTimeout(function () { window.localStorage.NoteBook = $("#NoteBook").val(); }, 100);
        });
        if (window.localStorage.NoteBook) { $("#NoteBook").val(window.localStorage.NoteBook); }
    })
    var diag = new ZL_Dialog();
    function CookieCheck() {
        if (IsPC()) {
            var agent = navigator.userAgent.toLowerCase();
            if (agent.split("safari").length > 1) {
                strcookie = document.cookie;
                var arrcookie = strcookie.split("&");
                var arr = arrcookie[0].split("=");//检测cookie中的ManageId 
                if (arr[1] != "ManageId") {
                    diag.title = "重置警示";
                    diag.width = "600";
                    diag.height = "400";
                    diag.maxbtn = "false";
                    diag.body = "<div class='broserinfo text-center'><i class='glyphicon glyphicon-warning-sign'></i> 检索到当前浏览器为Safari浏览器，需初台化后重新登录以获得正常应用：<p><a href='<%= CustomerPageAction.customPath2 %>SignOut.aspx' class='btn btn-primary'>确定操作</a><font>*点击后需要重新登陆</font></p></div>";
                    diag.ShowModal();
                } 
            } 
        } 
    }
    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
                    "SymbianOS", "Windows Phone",
                    "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }

</script> 
</form>
</body>
</html>