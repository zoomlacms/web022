<%@ page language="C#" autoeventwireup="true" inherits="User_StationGuid, App_Web_nr3m1mx2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("站群功能导航")%></title>
<link href="../App_Themes/UserThem/user.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../js/UserDefault.js" type="text/javascript" ></script>
</head>
<body class="user_left">
<form id="form1" runat="server">
<div class="left_font" onclick=" usershow('#td1','#span1')">
<span id="span1" class="imgbgover img_icon" onclick=" usershow('#td1','#span1')" ></span>
<%=lang.LF("企业黄页")%></div>
<ul id="td1" class="tabtr">
<li><a href="Pages/Default.aspx" target="main_right"><%=lang.LF("企业黄页")%></a></li>
<li><a href="Pages/Modifyinfo.aspx" target="main_right"><%=lang.LF("配置黄页")%></a></li>
<li><a href="Pages/ClassManage.aspx" target="main_right"><%=lang.LF("栏目管理")%></a></li>
<li><a href="Pages/ChangeSkins.aspx"target="main_right"><%=lang.LF("设置黄页风格")%></a></li>
<li><a href="Info/CompanyInfo.aspx" target="main_right"><%=lang.LF("公司信息")%></a></li>
<li><a href="Info/Certificate.aspx" target="main_right"><%=lang.LF("公司证书")%></a></li>
</ul>

<div class="left_font"  onclick=" usershow('#td4','#span4')"> 
<span id="span4" class="imgbgout img_icon" onclick=" usershow('#td4','#span4')" ></span>
<%=lang.LF("站群管理")%></div>
<ul id="td4" class="tabtr">
<li><a href="/User/Develop/SiteAdmin/Default.aspx" target="_blank"><%=lang.LF("智能建站")%></a></li>
<li><a href="javascript:void(0)" target="main_right"><%=lang.LF("我的子站")%></a></li>
<li><a href="javascript:void(0)"target="main_right"><%=lang.LF("信息审核")%></a></li>
</ul>            
</form>
</body>
</html>