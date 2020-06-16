<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_ShopRemark, App_Web_t4b0mnki" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>评论管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
<tbody>
  <tr>
	<td width="33%" align="center"></td>
	<td width="33%" align="center"></td>
	<td width="33%" align="center"></td>
  </tr>
</tbody>
</table>
<div class="clearbox"></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#userremark" onclick="showTabs('userremark')" data-toggle="tab">用户评论
  <asp:Literal ID="Label2" runat="server"></asp:Literal>
  </a></li>
<li><a href="#proremark" onclick="showTabs('proremark')" data-toggle="tab">商品评论
  <asp:Literal ID="Label3" runat="server"></asp:Literal>
  </a></li>
<li><a href="#orderremark" onclick="showTabs('orderremark')" data-toggle="tab">交易评论
  <asp:Literal ID="Label4" runat="server"></asp:Literal>
  </a></li>
</ul>
<table class="table table-striped table-bordered table-hover">
<asp:Panel ID="proremark" runat="server" Width="100%">
  <tr>
	<td width="4%" align="center" class="title"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
	<td width="4%" align="center" class="title"><span>ID</span></td>
	<td width="34%" align="center" class="title"><span>评论标题</span></td>
	<td width="6%" align="center" class="title"><span>商品ID</span></td>
	<td width="17%" align="center" class="title"><span>商品名称</span></td>
	<td width="13%" align="center" class="title"><span>作者</span></td>
	<td width="16%" align="center" class="title"><span>提交时间</span></td>
	<td width="6%" align="center" class="title"><span>操作</span></td>
  </tr>
  <asp:Repeater ID="proremarklist" runat="server">
	<ItemTemplate>
	  <tr ondblclick="deleteRemark('<%# Eval("ID") %>')">
		<td align="center"><input name="Item" type="checkbox" value="<%#Eval("ID") %>"></td>
		<td align="center"><%#Eval("ID") %></td>
		<td align="left"><a href="ShopremarkItem.aspx?id=<%#Eval("ID") %>"><%#Eval("Comtitle") %></a></td>
		<td align="center"><%#Eval("Proid") %></td>
		<td align="center"><%#Eval("ProName") %></td>
		<td align="center"><%#Eval("ComUser").ToString()==""? "<font color=green>(匿名)</font>" : Eval("ComUser")%></td>
		<td align="center"><%#Eval("Addtime") %></td>
		<td align="center"><a href="?menu=del&actions=<%#Getaction()%>&id=<%#Eval("ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a></td>
	  </tr>
	</ItemTemplate>
  </asp:Repeater>
  </asp:Panel>
<asp:Panel ID="userremark" runat="server" Width="100%">
  <tr>
	<td width="4%" align="center" class="title"><asp:CheckBox ID="CheckBox1" onclick="javascript:CheckAll(this);" runat="server" /></td>
	<td width="4%" align="center" class="title"><span>ID</span></td>
	<td width="30%" align="center" class="title"><span>评论标题</span></td>
	<td width="10%" align="center" class="title"><span>受论用户ID</span></td>
	<td width="17%" align="center" class="title"><span>受论用户</span></td>
	<td width="13%" align="center" class="title"><span>作者</span></td>
	<td width="16%" align="center" class="title"><span>提交时间</span></td>
	<td width="6%" align="center" class="title"><span>操作</span></td>
  </tr>
  <asp:Repeater ID="userremarklist" runat="server">
	<ItemTemplate>
	  <tr ondblclick="deleteRemark('<%# Eval("ID") %>')">
		<td align="center"><input name="Item" type="checkbox" value="<%#Eval("ID") %>"></td>
		<td align="center"><%#Eval("ID") %></td>
		<td align="left"><a href="ShopremarkItem.aspx?id=<%#Eval("ID") %>"><%#Eval("Comtitle") %></a></td>
		<td align="center"><%#Eval("CUserid") %></td>
		<td align="center"><%#Getusername(Eval("CUserid","{0}")) %></td>
		<td align="center"><%#Eval("ComUser").ToString()==""? "<font color=green>(匿名)</font>" : Eval("ComUser")%></td>
		<td align="center"><%#Eval("Addtime")%></td>
		<td align="center"><a href="?menu=del&actions=<%#Getaction()%>&id=<%#Eval("ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a></td>
	  </tr>
	</ItemTemplate>
  </asp:Repeater>
  </asp:Panel>
<asp:Panel ID="orderremark" runat="server" Width="100%">
  <tr>
	<td width="4%" align="center" class="title"><asp:CheckBox ID="CheckBox2" onclick="javascript:CheckAll(this);" runat="server" /></td>
	<td width="4%" align="center" class="title"><span>ID</span></td>
	<td width="22%" align="center" class="title"><span>评论标题</span></td>
	<td width="18%" align="center" class="title"><span>交易ID</span></td>
	<td width="7%" align="center" class="title"><span>店铺店主</span></td>
	<td width="7%" align="center" class="title"><span>作者</span></td>
	<td width="10%" align="center" class="title"><span>评论类型</span></td>
	<td width="15%" align="center" class="title"><span>提交时间</span></td>
	<td width="6%" align="center" class="title"><span>操作</span></td>
  </tr>
  <asp:Repeater ID="orderremarklist" runat="server">
	<ItemTemplate>
	  <tr ondblclick="deleteRemark('<%# Eval("ID") %>')">
		<td align="center"><input name="Item" type="checkbox" value="<%#Eval("ID") %>"></td>
		<td align="center"><%#Eval("ID") %></td>
		<td align="left"><a href="ShopremarkItem.aspx?id=<%#Eval("ID") %>"><%#Eval("Comtitle") %></a></td>
		<td align="center"><%#Eval("COrderid") %></td>
		<td align="center"><%#Getstorename(Eval("Storeid","{0}")) %></td>
		<td align="center"><%#Eval("ComUser").ToString()==""? "<font color=green>(匿名)</font>" : Eval("ComUser")%></td>
		<td align="center"><%#Getoption(Eval("ComOption","{0}"))%></td>
		<td align="center"><%#Eval("Addtime")%></td>
		<td align="center"><a href="?menu=del&actions=<%#Getaction()%>&id=<%#Eval("ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a></td>
	  </tr>
	</ItemTemplate>
  </asp:Repeater>
  </asp:Panel>
<tr>
  <td colspan="9" align="center">共
	<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
	个
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
	个/页
	转到第
	<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
	页 </td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td style="height: 21px">&nbsp;
	<asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" Text="批量删除" CommandName="5" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" OnClick="Button3_Click" /></td>
</tr>
<tr>
  <td></td>
</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script>
	$().ready(function () {
		if (getParam("actions")) {
			$("li a[href='#" + getParam("actions") + "']").parent().addClass("active").siblings("li").removeClass("active");
		}
	})
	function CheckAll(spanChk)//CheckBox全选
	{
		var oItem = spanChk.children;
		var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
		xState = theBox.checked;
		elm = theBox.form.elements;
		for (i = 0; i < elm.length; i++)
			if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
				if (elm[i].checked != xState)
					elm[i].click();
			}
	}
	function showTabs(action) {
		location.href = '?actions=' + action;
	}
	function deleteRemark(id) {
		if (confirm('不可恢复性删除数据,你确定将该数据删除吗？'))
			location.href = "?menu=del&actions=<%#Getaction()%>&id=" + id;
	}
</script>
</asp:Content>
