<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_AddOn_InputProcess, App_Web_p113t05q" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>导入流程</title>
<script>
function onstr() {
	parent.Dialog.close();
}
function setvalue(objname, valuetxt) {
	parent.document.getElementById(objname).value = valuetxt;
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-hover table-responsive">
	<tr class="tdbg">
		<td colspan="3" class="title" width="100%">流 程 列 表</td>
	</tr>
	<tr>
		<td class="tdbgleft">ID</td>
		<td class="tdbgleft">流程名称</td>
		<td class="tdbgleft">操作</td>
	</tr>
	<asp:Repeater ID="Repeater1" runat="server">
		<ItemTemplate>
			<tr>
				<td><%#Eval("WorkID")%></td>
				<td><%#Eval("WorkName")%></td>
				<td><a href="InputProcess.aspx?menu=select&id=<%#Eval("WorkID") %>">选择</a></td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
	<tr class="tdbg">
		<td align="center" class="tdbg" style="height: 24px;" colspan="3">
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
</asp:Content>


