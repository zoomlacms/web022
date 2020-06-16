<%@ page language="C#" autoeventwireup="true" inherits="manage_Search_DirectoryManage, App_Web_gd4pihcl" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>定义全文检索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
<tr align="left">
<td>欢迎您使用<%=SiteName %>系统全文检索功能模块；本系统将帮助您为数据库创建全文索引目录。使用本功能您可以：
<ul><li>创建待索引的表</li><li>选择待索引的列</li><li>在现有目录中添加数据库表</li></ul>
</td>
</tr>
</table>
<table class="table table-striped table-bordered table-hover">
  <tr class="title" align="center">
	<td width="5%" class="title"></td>
	<td width="20%" class="title">检索名称</td>
	<td width="15%" >表名</td>
	<td width="15%" class="title">列</td>
	<td width="20%" class="title">全文目录名</td>
	<td width="10%" class="title"> 创建时间</td>
	<td width="15%" class="title"> 操作</td>
  </tr>
	<asp:Repeater ID="gvCard" runat="server">       
		<ItemTemplate>
		  <tr>
			<td height="22" align="center"></td>
			<td height="22" align="center"></td>
			 <td height="22" align="center"></td>
			<td height="22" align="left"></td>
			<td height="22" align="center"></td>
			<td height="22" align="center"></td>
			<td height="22" align="center">添加 修改 删除</td>
		  </tr>
		</ItemTemplate>
	</asp:Repeater>
	<tr class="tdbg">
        <td style="text-align:center"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
		<td colspan="6" align="center" class="tdbg">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条信息
		<asp:Label ID="Toppage" runat="server" Text="" />
		<asp:Label ID="Nextpage" runat="server" Text="" />
		<asp:Label ID="Downpage" runat="server" Text="" />
		<asp:Label ID="Endpage" runat="server" Text="" />
		页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
		<asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页
		</td>
  </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
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
</script>
</asp:Content>