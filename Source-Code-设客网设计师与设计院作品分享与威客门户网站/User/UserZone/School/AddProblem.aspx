﻿<%@ page language="C#" autoeventwireup="true" inherits="User_UserZone_School_AddProblem, App_Web_1lgvjq1q" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>我的班级</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt;<a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx") %>' target="_parent">会员中心</a>&gt;&gt;<a href="mySchoolList.aspx"> 我的班级 </a>&gt;&gt;班级信息
</div>
<uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
<br />
<div class="us_showinfo">
<div>
		&nbsp;&nbsp;&nbsp;<a href="ShowRoom.aspx?Roomid=<%=Roomid%>"><%=RoomName %></a>
		&gt;&gt; <a href="ShowProblemList.aspx?Roomid=<%=Roomid%>">问题列表</a>&gt;&gt;提问<hr /></div>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td style="height: 24px" align="right">
			问题标题：
			</td>
			<td style="width:400px; height: 24px;">
				<asp:TextBox ID="txtTitle" runat="server" Width="400px"></asp:TextBox>
				</td>
				<td style="height: 24px">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入问题标题" ControlToValidate="txtTitle"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td align="right">
			问题内容：
			</td>
			<td style="width:400px">
			<asp:TextBox ID="txtContext" runat="server" Rows="8" TextMode="MultiLine" Width="400px"></asp:TextBox>
				</td>
				<td ><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入问题内容" ControlToValidate="txtContext"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
				<asp:Button ID="Button1" runat="server" Text="提 交" OnClick="Button1_Click" />
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>