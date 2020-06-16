﻿<%@ page language="C#" autoeventwireup="true" inherits="Common_Upload, App_Web_czxwn4p5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>上传文件</title>
</head>
<body class="tdbg">
<form id="form1" runat="server" enctype="multipart/form-data">
<table style="height: 100%; border: 0; width: 100%">
	<tr class="tdbg">
		<td valign="top">
		<asp:FileUpload ID="FupFile" runat="server" />
		<asp:Button ID="BtnUpload" runat="server" Text="上传" OnClick="BtnUpload_Click" />
		<asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择上传路径" ControlToValidate="FupFile"></asp:RequiredFieldValidator>
		<asp:HiddenField ID="HdnCID" runat="server" onvaluechanged="HdnCID_ValueChanged" />
		<asp:HiddenField ID="HdnType" runat="server" onvaluechanged="HdnType_ValueChanged" />
	   </td>
	</tr>
</table>
</form>
</body>
</html>