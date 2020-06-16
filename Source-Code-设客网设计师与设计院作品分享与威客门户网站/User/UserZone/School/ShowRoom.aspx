﻿<%@ page language="C#" autoeventwireup="true" inherits="User_UserZone_School_ShowRoom, App_Web_cmi5rog1" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="ControlRoomActive.ascx" TagName="ControlRoomActive" TagPrefix="uc7" %>
<%@ Register Src="ControlAuditingMemberList.ascx" TagName="ControlAuditingMemberList" TagPrefix="uc6" %>
<%@ Register Src="ControlProblemTop.ascx" TagName="ControlProblemTop" TagPrefix="uc5" %>
<%@ Register Src="ControlNotifyTop.ascx" TagName="ControlNotifyTop" TagPrefix="uc4" %>
<%@ Register Src="ControlRoomInfo.ascx" TagName="ControlRoomInfo" TagPrefix="uc3" %>
<%@ Register Src="ControlSchoolMessage.ascx" TagName="ControlSchoolMessage" TagPrefix="uc2" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>班级信息</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt;<a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx") %>' target="_parent">会员中心</a>&gt;&gt;<a href="mySchoolList.aspx">我的班级</a>&gt;&gt;班级信息
</div>
<uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
<br />
<div class="us_showinfo">
<div>
&nbsp;&nbsp;&nbsp;<%=RoomName %><hr />
</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td valign="top">
		<uc4:ControlNotifyTop ID="ControlNotifyTop1" runat="server" />
		<uc5:ControlProblemTop ID="ControlProblemTop1" runat="server" />
		<uc7:ControlRoomActive ID="ControlRoomActive1" runat="server" />
		<uc2:ControlSchoolMessage ID="ControlSchoolMessage1" runat="server" />
		</td>
	<td valign="top">
		<table>
			<tr>
				<td>
					<uc3:ControlRoomInfo ID="ControlRoomInfo1" runat="server" />
				</td>
			</tr>
			<tr>
				<td>
					<uc6:ControlAuditingMemberList ID="ControlAuditingMemberList1" runat="server"></uc6:ControlAuditingMemberList>
				</td>
			</tr>
			<tr>
				<td>
					<a href="RoomMemberList.aspx?Roomid=<%=RoomID %>">成员列表</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href='RoomList.aspx?schoolid=<%=schoolid %>'>查看更多班级</a>
				</td>
			</tr>
			<tr id="trStudent" runat="server">
				<td>
					<a href="UpFile.aspx?RoomID=<%=RoomID %>">我的作业</a></td>
			</tr>
			<tr id="trTh" runat="server">
				<td>
					<table>
						<tr>
							<td>
								<a href="UpFile.aspx?RoomID=<%=RoomID %>">上传试题</a></td>
						</tr>
						<tr>
							<td>
								<a href="StudentList.aspx?RoomID=<%=RoomID %>">提升班干部</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>