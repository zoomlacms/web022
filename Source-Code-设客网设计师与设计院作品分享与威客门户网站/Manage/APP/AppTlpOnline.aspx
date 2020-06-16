<%@ page language="C#" autoeventwireup="true" inherits="Manage_APP_AppTlpOnline, App_Web_krmjq4vt" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的模板</title>
</head>
<body>
    <form id="form1" runat="server">
        <iframe src="http://app.zoomla.cn/App/AppTlp/MyTlpList.aspx" style="width:100%;height:100%; border:none;"></iframe>
        <script>
            $().ready(function () {
                $('iframe').height($(parent.document).find('#main_right').height()-20);
            });
        </script>
    </form>
</body>
</html>
