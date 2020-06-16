<%@ page language="C#" autoeventwireup="true" inherits="MIS_Target_ProList, App_Web_d43b2j55" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
</head>
<body>
<form   runat="server">
<div class="left_ico"><img src="../../App_Themes/UserThem/images/Mis/jian.jpg" /></div>
<div class="left_Pro">
    <a href="javascript:void(0)" onclick="Prolist('<%=Request["ID"] %>','7')">项目</a>
</div>
<div class="Right_Pro">
    <table> 
    <asp:Repeater ID="Repeater3" runat="server">
    <ItemTemplate>
    <tr><td>  <a href="../Project/ProjectView.aspx?ID=<%#Eval("ID") %>"><%#Eval("Name") %>sss</a></td></tr>
    </ItemTemplate>
    </asp:Repeater>
    </table>
</div>
</form> 
</body>
</html>
