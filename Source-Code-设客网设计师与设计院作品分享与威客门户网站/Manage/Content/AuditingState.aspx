<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.AuditingState, App_Web_ckin0fxz" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>工作流配置</title><style>#AllID_Chk{display:none;}</style></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" DataSourceID="odsAuditingState" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="stateCode" AllowSorting="True" 
        PageSize="20" OnRowCommand="gvAuditingState_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging"   class="table table-striped table-bordered table-hover" >
	<Columns>
		<asp:TemplateField HeaderText="状态编码" ItemStyle-Height="22" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<asp:Label ID="Label1" runat="server" Text='<%# Bind("StateCode") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="状态名称">
			<ItemTemplate>
				<asp:Label ID="Label3" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
			</EditItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="状态类型"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<%# GetStateType(Eval("StateType").ToString())%>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StateType") %>'></asp:TextBox>
			</EditItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="编辑" ShowHeader="False"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate >
				<asp:LinkButton ID="btnEdit" runat="server" CausesValidation="True" CommandName="Edit" Text="编辑" Enabled='<%# IsEnabled(Eval("StateType").ToString())%>' />
			</ItemTemplate>
			<EditItemTemplate>
				<asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" CommandArgument='<%# Container.DisplayIndex+":"+ Eval("StateCode")%>' Text="更新" />
				&nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
			</EditItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="删除" ShowHeader="False"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<asp:LinkButton ID="btnDel" runat="server" Text="删除" CommandName="Delete" OnClientClick="return confirm('你确定将该数据删除吗？');"  CommandArgument='<%# Eval("StateCode")%>' Enabled='<%# IsEnabled(Eval("StateType").ToString())%>' />
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
	<RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
	<HeaderStyle Height="26px" />
</ZL:ExGridView>
<asp:ObjectDataSource ID="odsAuditingState" runat="server" SelectMethod="GetAuditingStateAll"
	TypeName="ZoomLa.BLL.B_AuditingState" DeleteMethod="DelBystateCode"
	UpdateMethod="Update">
	<DeleteParameters>
		<asp:Parameter Name="stateCode" Type="String" />
	</DeleteParameters>
	<UpdateParameters>
		<asp:Parameter Name="stateName" Type="String" />
		<asp:Parameter Name="stateType" Type="String" />
		<asp:Parameter Name="stateCode" Type="String" />
	</UpdateParameters>
</asp:ObjectDataSource>
</asp:Content>