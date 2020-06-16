<%@ page language="C#" autoeventwireup="true" inherits="User_Questions_ExamGuide, App_Web_uqfrsqus" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title><%=lang.LF("教育模块")%></title>
<link href="../../App_Themes/UserThem/user.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="../../JS/UserDefault.js"></script>
</head>
<body class="user_left">
<div class="left_font" onclick=" usershow('#td1','#span1')" >
<span id="span1" class="imgbgover img_icon" onclick=" usershow('#td1','#span1')" ></span>
<%=lang.LF("考试管理") %></div>
<ul id="td1"  class="tabtr">
<li><a href="../../User/Questions/Default.aspx" target="main_right" runat="server"><%=lang.LF("我的课程") %></a></li>
<li><a href="../../User/Questions/ApplicationCourese.aspx" target="main_right" runat="server" ><%=lang.LF("申请新课")%></a></li>
<li><a href="../../User/Questions/MyMarks.aspx" target="main_right" runat="server"><%=lang.LF("我的考试")%></a></li>
<li><a href="../../User/Questions/SelectAllStudent.aspx" target="main_right" runat="server"><%=lang.LF("我的成绩")%></a></li>
</ul>
</body>
</html>
