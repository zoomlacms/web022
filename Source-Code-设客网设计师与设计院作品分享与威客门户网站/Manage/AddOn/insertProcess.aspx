<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_AddOn_InputProcess, App_Web_tfdav4no" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>导入流程</title>
<script>
	function onstr() {
		var mainright = window.top.main_right;
		if (mainright.frames["main_right_" + parent.nowWindow] != null) {
			mainright.frames["main_right_" + parent.nowWindow].location.reload();
		} else {
			mainright.frames["main_right_" + window.top.nowWindow].location.reload();
		}
		parent.Dialog.close();
	}

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
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-responsive table-hover">
	<tr class="tdbg">
		<td colspan="3" class="title" width="100%">
			流 程 列 表
		</td>
	</tr>
	<tr class="tdbg">
		<td class="tdbgleft" style="height: 24px; width: 5%; font-weight: bold">
			<asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />ID
		</td>
		<td class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
			流程名称
		</td>
		
		<td class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
			操作
		</td>
	</tr>
	<asp:Repeater ID="Repeater1" runat="server">
		<ItemTemplate>
			<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
				<td style="height: 24px;">
					<input name="Item" type="checkbox" value='<%# Eval("WorkID")%>' /><%#Eval("WorkID")%>
				</td>
				<td style="height: 24px;">
					<%#Eval("WorkName")%>
				</td>
				<td style="height: 24px;">
					<a href="?menu=select&id=<%#Eval("WorkID") %>&projectID=<%=Request.QueryString["ProjectID"] %>">选择</a>
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
	<tr class="tdbg">
		<td class="tdbg" style="height: 24px;" colspan="3">
			共
			<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
			条信息
			<asp:Label ID="Toppage" runat="server" Text="" />
			<asp:Label ID="Nextpage" runat="server" Text="" />
			<asp:Label ID="Downpage" runat="server" Text="" />
			<asp:Label ID="Endpage" runat="server" Text="" />
			页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
				Text="" />页
			<asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第<asp:DropDownList ID="DropDownList1"
				runat="server" AutoPostBack="True">
			</asp:DropDownList>
			页
		</td>
	</tr>
</table>
<asp:Button ID="Button1" runat="server" Text="批量导入" CssClass="btn btn-primary" 
	onclick="Button1_Click" />
</asp:Content>

