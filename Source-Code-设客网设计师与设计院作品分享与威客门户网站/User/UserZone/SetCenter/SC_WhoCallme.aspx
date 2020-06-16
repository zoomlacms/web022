﻿<%@ page language="C#" autoeventwireup="true" inherits="User_UserZone_SetCenter_SC_WhoCallme, App_Web_i3gk4wbd" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlSetCenterTop.ascx" TagName="WebUserControlSetCenterTop" TagPrefix="uc1" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>设置中心</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script src='<%=ResolveUrl("~/JS/DatePicker/WdatePicker.js")%>' type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="s_bright" >
<!-- str -->
<div class="us_topinfo">
<div class="us_pynews">
您现在的位置：<a title="网站首页" href="/" target="_top"><asp:Label ID="LblSiteName" runat="server" Text=""></asp:Label></a>&gt;&gt;<a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx")%>' target="_parent">会员中心</a>&gt;&gt;设置中心&gt;&gt;谁能联系我（V） 
</div>
</div>
<uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
<uc1:WebUserControlSetCenterTop ID="WebUserControlSetCenterTop" runat="server" />
<br />

<div class="us_topinfo">
<table  border="0"  class="us_showinfo" width="100%" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>谁能联系我（V） </td>
	</tr>
</table></div>
</div>
</form>
</body>
</html>