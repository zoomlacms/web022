<%@ page language="C#" autoeventwireup="true" inherits="User_UserShop_ShopLeft, App_Web_0mdweblp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("聚合功能导航")%></title>
<link href="../../App_Themes/UserThem/user.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="../../JS/UserDefault.js"></script>
</head>
<body class="user_left">
<div class="left_font"  onclick=" usershow('#td1','#span1')" >
<span id="span1" class="imgbgover img_icon" onclick="usershow('#td1','#span1')" ></span>
<%=lang.LF("聚合管理")%></div>
<ul  id="td1" class="tabtr">
<li> <a href="../../Space/SpaceManage.aspx" target="main_right" runat="server" id="a4"><%=lang.LF("我的聚合")%></a>  </li>
<li><a href="" target="main_right" runat="server" id="a1"><%=lang.LF("聚合首页")%></a>  </li>
<li><a href="" target="main_right" runat="server" id="a2"><%=lang.LF("聚合列表")%></a>  </li>
<li><a href="" target="main_right" runat="server" id="a3"><%=lang.LF("聚合内容")%></a>  </li>
</ul>

<div class="left_font" onclick="usershow('#td2','#span2')" > 
<span id="span2" class="imgbgout img_icon" onclick="usershow('#td2','#span2')" ></span>
<%=lang.LF("用户收藏")%></div>
<ul id="td2" class="tabtr">
<li><a href="/User/Content/MyFavori.aspx?type=1" target="main_right" runat="server" id="a5"><%=lang.LF("内容收藏")%></a></li>
<li><a href="/User/Content/MyFavite_Shop.aspx?type=2" target="main_right" runat="server" id="a6"><%=lang.LF("商品收藏")%></a></li>
<li><a href="/User/Content/MyFavite_UserShop.aspx?type=3" target="main_right" runat="server" id="a7"><%=lang.LF("网店收藏")%></a></li>
</ul>
</body>
</html>