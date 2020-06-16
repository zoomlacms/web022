<%@ page language="C#" autoeventwireup="true" inherits="MIS_Journal, App_Web_5rnga0to" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>日志</title>
<link href="/App_Themes/User.css" type="text/css" rel="stylesheet" /> 
<script src="/js/calendar-brown.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script type="text/javascript">
    function loadPage(id, url) {
        $("#" + id).addClass("loader");
        $("#" + id).append("Loading......");
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            error: function () { alert('加载页面' + url + '时出错！'); },
            success: function (msg) {
                $("#" + id).empty().append(msg);
                $("#" + id).removeClass("loader");
            }
        });
    }
    var myDate = new Date();
    loadPage("jouRight", "/Mis/Daily/AddDaily.aspx?Date=" + myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate());
</script>
</head>
<body>
<div id="jouMain"> 
<form id="form2" runat="server"> 
<div id="calendar-container" class="jouLeft">
<script type="text/javascript">
function dateChanged(calendar) {
    if (calendar.dateClicked) {
        var y = calendar.date.getFullYear();
        var m = calendar.date.getMonth(); // integer, 0..11
        var d = calendar.date.getDate(); // integer, 1..31
      //  alert(y + "-" + (m + 1) + "-" + d)
        loadPage("jouRight", "/Mis/Daily/AddDaily.aspx?Date=" + y + "-" + (m + 1) + "-" + d);
      
        //  window.open("/Class_70/NodeHot.aspx?name=admin&Data=" + y + "-" + (m + 1) + "-" + d, "jouRight");
    }
};
Calendar.setup(
{
    flat: "calendar-container", // ID of the parent element 
    flatCallback: dateChanged  // our callback function
} 
);
</script>
</div>
</form>
<div id="jouRight">

</div>
</div>
</body>
</html>
