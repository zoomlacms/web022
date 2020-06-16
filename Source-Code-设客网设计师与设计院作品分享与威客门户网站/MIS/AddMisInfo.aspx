<%@ page language="C#" autoeventwireup="true" inherits="MIS_AddMisInfo, App_Web_5qibkz2g" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>新建协商</title>
<link href="/App_Themes/User.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>  
</head>
<body>
<form id="form1" runat="server">
<div class="Mis_Title"><strong> 新建协商 </strong> <a href="MisInfo.aspx?ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"] %>&Type=5">[返回]</a></div> 
<table width="100%" class="dialog" style="width: 740px;" border="0" cellSpacing="8" cellPadding="0">
<tr> 
<th width="6%" noWrap="">主题* :</th>
<td><asp:TextBox ID="TxtTit" class="M_input" runat="server" ></asp:TextBox> </td>
</tr>
<tr> 
<th width="6%" noWrap="">内容* :</th>
<td><asp:TextBox TextMode="MultiLine" ID="TxtContent1" runat="server" width="580px" height="200px"></asp:TextBox>  
</td>
</tr>
<tr> 
<th width="6%" noWrap="">附件 :</th>
<td> <asp:FileUpload ID="Files" runat="server" class="M_input" onkeydown="event.returnValue=false;"   onpaste="return false" /></td>
</tr>
<tr><td colspan="2"> <asp:Button ID="Button1" CssClass="i_bottom" OnClick="Button1_Click" runat="server" Text="提交" />
&nbsp;<asp:Button ID="concle" CssClass="i_bottom" runat="server" Text="取消" /></td></tr>
</table> 
</form>
</body>
</html>
