<%@ page language="C#" autoeventwireup="true" inherits="MIS_Mail_MailMenber, App_Web_2kkdf3ql" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>联系人</title>
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
<div id="Meno" class="Mis_pad">  
<div class="Mis_Title"><strong><a href="javascript:void(0)" onclick="loadPage('Meno', 'NewMail.aspx')">新建邮件</a></strong></div>
<div id="Mail_left" class="left_menu">
<ul>
<li><a href="NewMail.aspx">写信</a></li>
<li><a href="Default.aspx">收信</a></li>
<li><a href="MailMenber.aspx">联系人</a></li>
</ul>
<ul><li><a href="Default.aspx">收件箱(<asp:Label ID="ENum" runat="server"></asp:Label>)</a></li>
<li><a href="Default.aspx">草稿箱 </a></li>
<li><a href="Default.aspx">已发邮件 </a></li>
<li><a href="Default.aspx">已删除   </a></li>
<li><a href="Default.aspx">垃圾邮件(86)  </a></li>
<li><a href="Default.aspx">附件管理 </a></li>
<li><a href="Default.aspx">手机短信提醒  </a></li>
</ul>
<ul>
<li><a href="MailSetList.aspx">邮箱设置 </a></li>
</ul>
</div>
<div id="Mail_rig" class="rig_main  td_center"> 
<div class="cont_left">
<div class="bggrey">联系人</div>
<div class="cont_type">
<div class="cont_Ltit"><a href=""> 所有联系人</a></div>
<ul>
<asp:Repeater ID="Repeater2" runat="server"><ItemTemplate>
<li><a href="MailMenber.aspx?gid=<%#Eval("ID") %>"> <%#Eval("Name") %></a></li>
</ItemTemplate> 
</asp:Repeater></ul>
[<a href="">新建</a>]
</div> 
</div>
<div  class="cont_rig">
<div ><strong><a href="AddMenber.aspx">新建联系人</a></strong> <strong><a href="/user/UserZone/AddStructure.aspx?Group=2">新建联系组</a></strong> <strong><a href="javascript:history.go(-1);">[返回]</a></strong></div>
<table width="100%" class="border" >
<tr><th></th width="5%"><th>联系人名称</th> <th>email </th> <th>手机/电话 </th></tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate><tr><td  width="5%"><input type="checkbox" value="1" /></td><td><a href="AddMenber.aspx?ID=<%#Eval("ID") %>"><%#Eval("Name") %></a></td><td><%#Eval("email") %></td><td><%#Eval("Tel") %></td></tr>
</ItemTemplate>
</asp:Repeater> 
<tr class="tdbg">
<td class="tdbgleft" colspan="6" >共
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
</div>
</div>
</form>
</body>
</html>
