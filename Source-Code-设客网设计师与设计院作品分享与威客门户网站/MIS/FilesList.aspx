<%@ page language="C#" autoeventwireup="true" inherits="MIS_FilesList, App_Web_5qibkz2g" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>文档列表</title>
<link href="../App_Themes/User.css" type="text/css" rel="stylesheet" />
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
 <div  class="Mis_pad">
<div class="Mis_Title"><strong><a href="javascript:void(0)" onclick="loadPage('see', '/Mis/AddFiles.aspx?ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"]%>&Type=<%=Request["Type"] %>')">新建文档</a></strong></div>
<div class="td_center">
<table class="border"  width="100%"  cellspacing="1" cellpadding="0" rules="all" border="0">
<tr class="title" style=" background:#e7f3ff" height="25"> <th>编号</th><th> 标题 </th><th>名称 </th><th>来源 </th><th>文件大小 </th><th>来源 </th><th> 操作人 </th><th> 操作时间  </th><th>操作 </th></tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate> 
<tr><td  width="25"><%#Eval("ID") %></td>
<td style="text-align:left" >  <a href="javascript:void(0)" onclick="loadPage('see', '/Mis/AddFiles.aspx?ID=<%#Eval("ID") %>&ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"]%>&Type=<%=Request["Type"] %>')" ><%#Eval("Title") %></a>     </td>
<td  width="100"><%#Eval("Content") %></td>
<td width="100"> 文档</td>
<td width="100"><%#FileSize(Eval("Content").ToString()) %> </td>
<td width="100"><%#GetStatus(Convert.ToInt32(Eval("Status"))) %> </td> 
<td width="80"><a href="javascript:void(0)" onclick="loadPage('see', '/Mis/AddFiles.aspx?ID=<%#Eval("ID") %>&ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"]%>&Type=<%=Request["Type"] %>')" >编辑</a>  </td> 
 </tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
<td class="tdbgleft" colspan="9" >共
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
</form>
</body>
</html>
