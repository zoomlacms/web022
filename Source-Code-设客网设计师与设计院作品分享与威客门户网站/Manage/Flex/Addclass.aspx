<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_Addclass, App_Web_nw2myhlo" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加分类</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
	<tr align="center">
		<td colspan="2">
			<strong>
				<asp:Label ID="LblTitle" runat="server" Text="添加像册模板分类" Font-Bold="True"></asp:Label>
			</strong>
		</td>
	</tr>
	<tr>
		<td style="text-align: left; max-width: 120px;">分类名称：</td>
		<td style="text-align: left;">
			<asp:TextBox ID="classname" class="form-control" runat="server" Width="280px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>分类排序：(数字越大排列越前)
		</td>
		<td style="text-align: left;">
			<asp:TextBox ID="classnum" class="form-control" runat="server" Width="91px">0</asp:TextBox>
		</td>
	</tr>

	<tr>
		<td>所属产品：
		</td>
		<td style="text-align: left;">
			<asp:DropDownList ID="cl_PClass" CssClass=" form-control" runat="server"></asp:DropDownList>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cl_PClass" ErrorMessage="所属产品不能为空!"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td>模板规格：
		</td>
		<td style="text-align: left;">
			<asp:TextBox ID="G1" class="form-control" Width="100" runat="server"></asp:TextBox>
			×
			<asp:TextBox ID="G2" class="form-control" Width="100" runat="server"></asp:TextBox>
			(单位:mm)
		</td>
	</tr>
	<tr id="Encrypt" runat="server">
		<td>选择排版：
		</td>
		<td style="text-align: left;">
			<asp:DropDownList ID="paiban" CssClass="form-control" Width="150" runat="server">
				<asp:ListItem Value="">选择分类</asp:ListItem>
				<asp:ListItem Value="1">一张照片</asp:ListItem>
				<asp:ListItem Value="2">二张照片</asp:ListItem>
				<asp:ListItem Value="3">三张照片</asp:ListItem>
				<asp:ListItem Value="4">四张照片</asp:ListItem>
				<asp:ListItem Value="5">四张以上照片</asp:ListItem>
				<asp:ListItem Value="6">纯文本</asp:ListItem>
			</asp:DropDownList>
			<asp:HiddenField ID="cl_Class" runat="server" Value="" />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="paiban" ErrorMessage="排版不能为空!"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td style="text-align: center" colspan="2" class="style2">
			<asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" runat="server" OnClick="EBtnSubmit_Click" />
			<input name="BtnCancel" class="btn btn-primary" type="button" onclick="javascript: window.location.href = 'ClassManage.aspx'" value=" 取消 " />
		</td>
	</tr>
</table>
<asp:HiddenField runat="server" ID="hiddenid" />
</asp:Content>