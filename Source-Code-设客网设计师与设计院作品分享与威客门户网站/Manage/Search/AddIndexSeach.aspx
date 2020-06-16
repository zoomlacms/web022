<%@ page language="C#" autoeventwireup="true" inherits="manage_Search_AddIndexSeach, App_Web_gd4pihcl" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>全文检索管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered">
	<tr align="left">
		<td width="10%">欢迎您使用全文检索系统；本系统将帮助您为数据库创建全文索引目录。
			<br />
			在此可以定义数据库全文检索；方便从全文检索器快速的查询到加入检索的内容!
			<br />
			<font color="green"><b>全文检索与普通搜索的区别：</b>普通搜索只是通过对网页数据过滤获得的具有相同属性的结构化数据，速度会比较慢；而全文检索的目标是识别出与用户查询相关的文档或段落，速度会非常快！数据量越大越容易体现其优势!</font>
		</td>
	</tr>
</table>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<table class="table table-striped table-bordered table-hover">
			<tr align="center">
				<td colspan="2">定义全文检索</td>
			</tr>
			<tr>
				<td align="left" width="20%">定义检索名称(说明)
				</td>
				<td align="left" width="80%">
					<asp:TextBox ID="IndexName" CssClass="form-control" runat="server" Style="width: 200px" AutoPostBack="True" OnTextChanged="IndexName_TextChanged"></asp:TextBox>
					<asp:Label ID="Label1" runat="server" Text="" Style="color: Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td align="left" width="20%">选择表
				</td>
				<td align="left" width="80%">
					<asp:DropDownList ID="Tablelist" CssClass="form-control" runat="server" Style="width: 200px" OnSelectedIndexChanged="Tablelist_SelectedIndexChanged">
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td align="left" width="20%">选择表中的列(可多选)
				</td>
				<td align="left" width="80%">
					<asp:ListBox ID="Filedlist" CssClass="form-control" runat="server" Style="width: 200px" Height="174px" SelectionMode="Multiple"></asp:ListBox>
				</td>
			</tr>
			<tr>
				<td align="left" width="20%">选择全文目录
				</td>
				<td align="left" width="80%">
					<asp:DropDownList ID="Dirlist" CssClass="form-control" runat="server" Style="width: 200px" Visible="False">
					</asp:DropDownList>
					<asp:TextBox ID="Dirname" CssClass="form-control" runat="server" Style="width: 200px" AutoPostBack="True" Visible="False" OnTextChanged="Dirname_TextChanged"></asp:TextBox>
					<asp:CheckBox ID="createdir" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="创建新目录" />
					<asp:Label ID="dirmessage" runat="server" Text="" Style="color: Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="添加" OnClick="Button1_Click" />
					<button type="button" onclick="javascript:location.href='DirectoryManage.aspx';" class="btn btn-primary">返回</button>
				</td>
			</tr>
		</table>
	</ContentTemplate>
</asp:UpdatePanel>
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