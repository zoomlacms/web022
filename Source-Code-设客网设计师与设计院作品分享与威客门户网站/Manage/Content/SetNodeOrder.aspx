<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.SetNodeOrder, App_Web_tln5ra1b" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>节点排序</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
<table class="table table-striped table-bordered table-hover" align="center">
	<tr class="gridtitle" align="center" style="height: 25px;">
		<td style="width: 10%; height: 20px;">
			<strong>节点ID</strong>
		</td>
		<td style="width: 20%; height: 20px;">
			<strong>节点名</strong>
		</td>
		<td style="width: 20%">
			<strong>节点目录</strong>
		</td>
		<td style="width: 20%">
			<strong>节点类型</strong>
		</td>
        <td style="width: 10%">
			<strong>手动排序</strong>
		</td>
		<td style="width: 20%">
			<strong>排序</strong>
		</td>
	</tr>
	<asp:Repeater ID="RepSystemModel" runat="server" OnItemCommand="Repeater1_ItemCommand">
		<ItemTemplate>
			<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
				<td align="center">
					<%#Eval("NodeID")%>
				</td>
				<td align="center">
					<%#Eval("NodeName")%>
				</td>
				<td align="center">
					<%# Eval("NodeDir")%>
				</td>
				<td align="center">
					<%# GetNodeType(Eval("NodeType", "{0}"))%>
				</td>
                <td align="center">
                    <input type="text" class="l_input" style="width:40px; text-align:center" name="OrderField<%#Eval("NodeID")%>" id="OrderField<%#Eval("NodeID")%>" value="<%#Eval("OrderID") %>" />
                    <input type="hidden" name="NodeIDValue" id="NodeIDValue" value="<%#Eval("NodeID")%>" />
				</td>
				<td align="center">
					<asp:LinkButton ID="LinkButton2" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("NodeID") %>'>上移</asp:LinkButton>
					|
					<asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("NodeID") %>'>下移</asp:LinkButton>
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
</table>
    <asp:Button ID="Button1" runat="server" Text="批量更新排序" CssClass="btn btn-primary" onclick="Button1_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>