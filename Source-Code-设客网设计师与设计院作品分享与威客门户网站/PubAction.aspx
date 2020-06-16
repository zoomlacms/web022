<%@ page language="C#" autoeventwireup="true" inherits="PubAction, App_Web_pk13pou2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>互动提交</title>
    <script>
        function ActionSec(obj, url) {
            console.log(obj,url);
            if (obj == -1) { alert("提交失败!"); }
            if (obj == 1) { alert("提交成功!"); }
            window.location.href = url;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server"></form>
</body>
</html>
