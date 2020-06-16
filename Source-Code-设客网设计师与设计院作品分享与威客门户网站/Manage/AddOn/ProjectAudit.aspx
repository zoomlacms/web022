﻿<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_AddOn_ProjectAudit, App_Web_jzh2rzwp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>项目审核</title>    
<script language="javascript" type="text/javascript">
function CheckAll(spanChk)//CheckBox全选
{
var oItem = spanChk.children;
var theBox=(spanChk.type=="checkbox")?spanChk:spanChk.children.item[0];
xState=theBox.checked;
elm=theBox.form.elements;
for(i=0;i<elm.length;i++)
if(elm[i].type=="checkbox" && elm[i].id!=theBox.id)
{
	if(elm[i].checked!=xState)
	elm[i].click();
}
}
function getinfo(id) {
location.href = "ProjectsDetail.aspx?ProjectID=" + id + "";
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-responsive table-bordered table-hover">
	<tbody>
		<tr class="gridtitle">
			<td>选择</td>
			<td>ID</td>
			<td>项目名称</td>
			<td>项目类型</td>
			<td>项目价格</td>
			<td>审核状态</td>
			<td>申请时间</td>
			<td>操作</td>
		</tr>
		<asp:Repeater ID="Repeater1" runat="server" 
			onitemcommand="Repeater1_ItemCommand" >
			<ItemTemplate>
				<tr id='<%#Eval("ID") %>' class="tdbg" align="center" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="getinfo(this.id);" title="双击查看此项目详情">
					<td><asp:CheckBox ID="ChBx" runat="server"/><asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>     
					<td><%# Eval("ID","{0}")%></td>
					<td><a href="ProjectsDetail.aspx?ProjectID=<%# Eval("ID","{0}")%>"><%# Eval("Name")%></a></td>
					<td><a href="Projects.aspx?type=<%#Eval("TypeID") %>"><%#Eval("TypeID") %></a></td>
					<td>￥<%# Eval("Price")%>.00</td>
					<td><%#Eval("AuditStatus")%></td>
					<td><%# Eval("ApplicationTime")%></td>
					<td><asp:LinkButton ID="LBtnAudit" runat="server" CommandArgument='<%# Eval("ID")%>' CommandName="Audit" OnClientClick="if(!this.disabled) return confirm('确定要执行此操作吗？');">审核</asp:LinkButton>&nbsp;|
						<asp:LinkButton ID="LBtnDel" runat="server" CommandArgument='<%# Eval("ID")%>' CommandName="Del" OnClientClick="if(!this.disabled) return confirm('确实要删除吗？');">删除</asp:LinkButton>
					</td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
		<tr class="tdbg">
		<td align="center" class="tdbg" style="height: 24px;" colspan="8">
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
	</tbody>
</table>
<table>
	<tr>
		<td>
			<asp:CheckBox ID="Checkall" runat="server" onclick="javascript:CheckAll(this);" Text="全选" />
			<asp:Button ID="btnDeleteAll" runat="server" style="width:110px;"  
				OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="批量删除" class="C_input" 
				onclick="btnDeleteAll_Click" />
			<asp:Button ID="BtnAudit" runat="server" style="width:110px;" 
				OnClientClick="return confirm('确定要执行此操作吗？')" Text="批量审核" class="C_input" 
				onclick="BtnAudit_Click"/>
		</td>
	</tr>
</table>
</asp:Content>

