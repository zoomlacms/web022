<%@ page language="C#" autoeventwireup="true" inherits="Common_OfficeToFlash, App_Web_czxwn4p5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>Office转Swf</title>
</head>
<body>
<form id="form1" runat="server">
<table style="border-style: none; border-color:inherit; border-width: 0; height: 20%; width: 100%">
<tr class="tdbg">
  <td valign="top"><asp:FileUpload ID="FupFile" runat="server" />
	<asp:Button ID="BtnUpload" runat="server"  Text="上传" OnClick="BtnUpload_Click" />
	<asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择上传路径" ControlToValidate="FupFile"></asp:RequiredFieldValidator>
	<asp:Label  ID="LblMessage" runat="server" ForeColor="red" Text=""></asp:Label>
	<asp:HiddenField ID="HiddenNodeDir" runat="server" />
	<asp:HiddenField ID="hfUpLoadDir" runat="server" />
	<span onclick="openswf();"  onmouseover="this.style.cursor='pointer';"">在线浏览</span></td>
</tr>
</table>
</form>
<script>
    function openswf()
    {
        var swfurl = parent.document.getElementById('txt_<%=ViewState["FieldName"] %>').value;
        swfurl = swfurl.replace("<%=UploadDir%>read/Swf/", "");
        window.open('ShowFlash.aspx?path=' + swfurl, '');
    }
</script>
</body>
</html>