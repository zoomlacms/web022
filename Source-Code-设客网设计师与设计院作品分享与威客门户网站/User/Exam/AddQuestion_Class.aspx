<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_AddQuestion_Class, App_Web_cwcutwox" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>编辑分类</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a href="/user">用户中心</a></li>
<li><a href="Question_Class_Manage.aspx">分类管理</a></li>
<li class="active">编辑分类</li>
</ol>
</div>
<div class="container">
<asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
<table class="table table-striped table-bordered table-hover">
<tr>
<td class="td_md text-right">
所属类别:
</td>
<td>
<asp:Label ID="Parent_T" runat="server" Text="无父类"></asp:Label>
</td>
</tr>
<tr>
<td class="text-right">
类别名称:
</td>
<td class="bqright">
<asp:TextBox ID="txtClassName" runat="server" class="form-control text_md" OnTextChanged="txtClassName_TextChanged"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="类别不能为空!"
ControlToValidate="txtClassName"></asp:RequiredFieldValidator>
<asp:HiddenField ID="hfC_Id" runat="server" Value="" />
</td>
</tr>

<tr>
<td class="text-right">
<asp:Label ID="Label3" runat="server" Text="类别类型:"></asp:Label>
&nbsp;
</td>
<td>
<asp:RadioButtonList ID="C_ClassType" runat="server"
RepeatDirection="Horizontal" CssClass="text_md">
<asp:ListItem Selected="True" Value="1">答题类型</asp:ListItem>
<asp:ListItem Value="2">视频操作类型</asp:ListItem>
</asp:RadioButtonList>
</td>
</tr>
<tr>
<td class="text-right">
<asp:Label ID="hits_txt" runat="server" Text="排序:"></asp:Label>
&nbsp;
</td>
<td>
<asp:TextBox ID="txtC_OrderBy"  class="form-control text_md" runat="server">0</asp:TextBox>
</td>
</tr>
<tr>
<td colspan="2">
<asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存分类" OnClick="EBtnSubmit_Click" runat="server" />
<asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返回" OnClick="BtnBack_Click"
UseSubmitBehavior="False" CausesValidation="False" />
</td>
</tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>