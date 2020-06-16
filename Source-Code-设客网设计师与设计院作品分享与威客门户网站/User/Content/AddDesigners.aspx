<%@ Page Title="" Language="C#" MasterPageFile="~/User/Default.master" AutoEventWireup="true" CodeFile="AddDesigners.aspx.cs" Inherits="ZoomLa.WebSite.User.Content.AddDesigners" ClientIDMode="Static" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>完善资料_<%= Call.SiteName%></title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.tdbgleft{text-align:right;}
.fd_td_l { width:auto;}
.cmdgroup { display:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">完善资料</li> 
</ol> 
</div>
<div class="">         
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">完善资料（个人信息填写的越详细有助于项目方更好的找到，同时可增加中标率）<span class="hidden"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span></td>
</tr>
<tr>
<td class="text-right">设计师类型</td>
<td><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td class="text-right">姓名<asp:Label ID="Title_L" CssClass="hidden" runat="server">内容标题</asp:Label></td>
<td>
<asp:TextBox ID="txtTitle" CssClass="form-control m715-50" runat="server" onblur="getstrKeys()" Text=''></asp:TextBox>
<span><font color="red">*请填写您的真实姓名，否则将无法通过审核</font></span>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator>
</td>
</tr>
<tr hidden>
<td class="text-right">关键字</td>
<td>
<asp:TextBox ID="TxtTagKey" CssClass="form-control m715-50" runat="server" Text=''></asp:TextBox>
</td>
</tr>
<asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
<tr>
<td colspan="2" class="text-center">
<asp:Button ID="EBtnSubmit" Text="" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
<input type="button" id="BtnBack" class="btn btn-primary" value="返回列表" onclick="javascript: getContentUrl()" />
<asp:HiddenField ID="HdnNode" runat="server" />
<asp:HiddenField ID="HdnModel" runat="server" />
<asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
</td>
</tr>
</table>
    </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ZL_Content.js"></script>
<script>
$().ready(function(e) {
    $("#EBtnSubmit").val("完成提交");
	$("input[name=txt_szdq]").parent().append("<span style='color:#f00;'>*</span>");
});
</script>
</asp:Content>
