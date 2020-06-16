<%@ page language="C#" autoeventwireup="true" inherits="Common_ShowFlash, App_Web_czxwn4p5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>在线浏览Swf</title>
<script type="text/javascript" src="../JS/jquery-1.9.1.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
    <div style="height:100%;">
        <embed id="Embed1"  src='<%=swfurl%>' pluginspage="http://www.macromedia.com/shockwave/download/" type="application/x-shockwave-flash" onscroll style="width:100%;height:100%;" />    
    </div>
</form>
<script type="text/javascript">
    $obj = $("#Embed1");
    $("#Embed1").css("height", window.screen.height * 0.9);
</script>
</body>
</html>