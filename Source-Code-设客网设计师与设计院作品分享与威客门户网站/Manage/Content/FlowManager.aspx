<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.FlowManager, App_Web_tln5ra1b" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>流程管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:ObjectDataSource ID="odsFlow" runat="server" SelectMethod="GetFlowAll" TypeName="ZoomLa.BLL.B_Flow"
	DeleteMethod="DelFlowById">
	<DeleteParameters>
		<asp:Parameter Name="id" Type="Int32" />
	</DeleteParameters>
</asp:ObjectDataSource>
<ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
	DataSourceID="odsFlow" OnPageIndexChanging="EGV_PageIndexChanging"  DataKeyNames="id" RowStyle-HorizontalAlign="Center" 
	OnRowDataBound="gwFlow_RowDataBound" PageSize="20"  class="table table-striped table-bordered table-hover">
	<Columns>
		<asp:BoundField DataField="id" HeaderText="ID" />
		<asp:BoundField DataField="flowName" HeaderText="流程名称"></asp:BoundField>
		<asp:BoundField DataField="flowDepict" HeaderText="流程描述"></asp:BoundField>
		<asp:TemplateField HeaderText="流程操作" ShowHeader="False">
			<ItemTemplate>
				<a href='FlowProcess.aspx?id=<%# Eval("id") %>&name=<%# Eval("flowName") %>'>|添加步骤|</a><a href='FlowProcessManager.aspx?id=<%# Eval("id") %>&name=<%#Eval("flowName") %>'>步骤列表|</a><a href='ModifyFlow.aspx?id=<%#Eval("id") %>'>修改流程|</a><a href='FlowManager.aspx?Action=copy&id=<%#Eval("id") %>'>复制流程|</a><asp:LinkButton ID="lbDel" runat="server" CausesValidation="False" CommandName="Delete"
					Text="删除流程"></asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
	<PagerStyle HorizontalAlign="Center" Font-Bold="true" />
	<HeaderStyle Height="26px" />
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>

