<%@ page language="C#" autoeventwireup="true" inherits="User_Guild_CommunityLeft, App_Web_odweewxl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("互动功能导航")%></title>
<link href="../../App_Themes/UserThem/user.css"rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="../../JS/UserDefault.js"></script>
</head>
<body  class="user_left">
<div class="left_font" onclick="usershow('#td1','#span1')" > <span id="span1" class="imgbgover img_icon" onclick="usershow('#td1','#span1')" ></span> <%=lang.LF("社区互动")%></div>
<ul id="td1"  class="tabtr">
     <li><a href="UserZone/Structure.aspx" target="main_right">企业结构</a></li>
  <li><a href="UserZone/Default.aspx" target="main_right"><%=lang.LF("我的空间")%></a></li>
  <li><a href="UserZone/UserQuestFriend.aspx" target="main_right" ><%=lang.LF("社区交友")%></a></li>
  <li><a href="Survey/SurveyAll.aspx" target="main_right" ><%=lang.LF("问卷投票")%></a></li>
  <li><a href="Magazine/AddMagazine.aspx" target="main_right">电子杂志</a></li>
</ul>
<div class="left_font" onclick="usershow('#td2','#span2')" > <span id="span2" class="imgbgout img_icon" onclick="usershow('#td2','#span2')" ></span><%=lang.LF("聊天系统")%></div>
<ul id="td2"  class="tabtr">
  <li><a href="javascript:void(0);" onclick="window.open('/user/Usertalk/TalkIndex.aspx?'+Math.random(), 'newwindow', 'height=730, width=1028, top=0, left=0, toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');" ><%=lang.LF("在线聊天")%></a> </li>
  <li><a href="javascript:void(0);" onclick="window.open('/Plugins/chat/Default.aspx');" ><%=lang.LF("在线视频")%></a> </li>
  <li><a href="javascript:void(0);" onclick="window.open('/Plugins/Chat/room/Videos.html?MID=3&UID=8');" ><%=lang.LF("一对一聊天")%></a></li>

</ul>
<div class="left_font" onclick="usershow('#td3','#span3')" > <span id="span3" class="imgbgout img_icon" onclick="usershow('#td2','#span2')" ></span><%=lang.LF("助写平台")%></div>
<ul id="td3"  class="tabtr">
  <li><a href="../Edit/Default.aspx?ID=0" target="main_right" ><%=lang.LF("写作助理")%></a></li>
  <li><a href="../Edit/EditList.aspx" target="main_right" ><%=lang.LF("作品列表")%></a></li>
</ul>
</body>
</html>