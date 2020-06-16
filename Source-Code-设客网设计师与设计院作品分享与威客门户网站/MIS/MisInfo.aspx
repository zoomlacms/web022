<%@ page language="C#" autoeventwireup="true" inherits="MIS_MisInfo, App_Web_5qibkz2g" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>协商信息</title>
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
<div class="tab">
<ul>
<li class="log_tab"> <a href="ProjectView.aspx" class="clk">项目概览</a></li>
<li ><a href="MisInfo.aspx?ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"] %>&Type=5" >协商</a></li>
<li ><a  href="FilesList.aspx?ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"] %>&Type=7" >文档</a></li>
<li ><a href="javascript:void(0)"  class="clk">人员</a></li>
<li ><a href="subProject.aspx"  class="clk">子项目</a></li>
<li  ><a href="javascript:void(0)"  class="clk">活动记录</a></li>
</ul></div> 
<div id="see">
<div class="Mis_Title"><strong><a href="javascript:void(0)" onclick="loadPage('see', 'AddMisInfo.aspx?ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"]%>&Type=<%=Request["Type"] %>')">新建协商</a></strong></div>
<div class="td_center">
<table width="100%"  cellspacing="1" cellpadding="0" rules="all" border="0" class="border"  >
<tr class="title" style=" background:#e7f3ff" height="25"> 
    <th width="25"></th>
    <th>标题 </th>
    <th width="100">消息</th>
    <th width="100">创建人</th>
    <th width="100">最近更新</th>
    <th width="100">状态</th>
    <th width="80">操作</th> 
</tr>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemBind">
<ItemTemplate>
<tr> 
    <td  width="25"><%#Eval("ID") %></td>
<td style="text-align:left" >  <a href="javascript:void(0)" onclick="loadPage('see', 'MisInfoView.aspx?ID=<%#Eval("ID") %>&ProID=<%=Request["ProID"] %>&MID=<%=Request["MID"]%>&Type=<%=Request["Type"] %>')" ><%#Eval("Title") %></a>     </td>
<td  width="100">0</td>
<td width="100"> <%#Eval("Inputer") %></td>
<td width="100"><%#Eval("CreateTime") %></td>
<td width="100"><%#GetStatus(Convert.ToInt32(Eval("Status"))) %> </td> 
<td width="80"><asp:LinkButton ID="lbt" runat="server"  Text="结束"  OnClientClick="return confirm('确定吗？')" CommandName="chStatus" CommandArgument='<%#Eval("ID") %>'></asp:LinkButton>  </td> 
</tr>
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
</form>
</body>
</html>