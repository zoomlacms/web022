<%@ page language="C#" autoeventwireup="true" inherits="MIS_File_Default, App_Web_yhzyfp3j" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>文件</title>
<link href="../../App_Themes/User.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script>
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
</script>
</head>
<body> 
<form id="form1" runat="server">      
<div id="Meno">
<table class="border" width="100%"  >
<tr height="25" class="title" style="background-color: #e7f3ff;"><th>ID</th><th>文件</th><th>用户</th><th>时间</th></tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr style="line-height:25px;"><td align="center" width="40"><%#Eval("ID") %></td><td><a href="/UploadFiles/<%#Eval("Content") %>"><%#Eval("Title") %></a></td><td><%#Eval("Inputer") %></td><td><%#Eval("CreateTime","{0:yy-MM-dd}") %></td></tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
<td class="tdbgleft" colspan="6" align="center" >共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条信息
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
页次：
<asp:Label ID="Nowpage" runat="server" Text="" />
/
<asp:Label ID="PageSize" runat="server" Text="" />
页
<asp:Label ID="pagess" runat="server" Text="" />
条信息/页 转到第
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
页 </td>
</tr> 
</table>
</div>
</form>
</body>
</html>
