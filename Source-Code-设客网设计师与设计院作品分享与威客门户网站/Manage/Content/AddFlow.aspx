<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.AddFlow, App_Web_ckin0fxz" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加审核状态</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table  class="table table-striped table-bordered table-hover">
	<tr>
		<td colspan="2" align="center" >
			添加流程
		</td>
	</tr>
	<tr>
		<td style="width:20%">
			流程名称
		</td>
		<td align="left">
			<input id="txtName" runat="server"  class="form-control text_md" size="50" /><label style="color:Red">*</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="流程名称不能为空" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td style="width:20%">流程描述</td>
		<td  align="left">
			<textarea id="txtFlowDepict" class="form-control"   runat="server" cols="8" style="width:360px; height: 79px;"></textarea>
		</td>
	</tr>
	<tr><td colspan="2" align="center">
	<asp:Button ID="btnSave" runat="server"  Text="保存状态码" class="btn btn-primary"  style="width:100px;"  onclick="btnSave_Click"  /></td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>