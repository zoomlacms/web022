<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.AddContentpage, App_Web_j2dqvgme" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加内容</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.tdbgleft{text-align:right;}
.fd_td_l { width:50%;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">确认付款</li> 
</ol> 
</div>
<div class=" ">         
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">
<h4>提交付款申请</h4>
<asp:Label ID="Label1" runat="server" CssClass="hidden" Text="Label"></asp:Label></td>
</tr>
<tr hidden>
<td class="text-right">所属节点</td>
<td>
<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr hidden>
<td class="text-right"><asp:Label ID="Title_L" runat="server">内容标题</asp:Label></td>
<td>
<asp:TextBox ID="txtTitle" CssClass="form-control m715-50" runat="server" onblur="getstrKeys()" Text=''></asp:TextBox>
<span><font color="red">*</font></span>
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
<asp:Button ID="EBtnSubmit" Text="" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-success" />
<input type="button" id="BtnBack" class="btn btn-warning" value="返回项目" onclick="history.go(-1);" />
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
	$("#txt_szxm").parent().parent().hide();
	$("#txt_szjb").parent().parent().hide();
	$("#txt_xmjd").parent().parent().hide();
    $("#txt_szxm").val(<%Call.Label("{$GetRequest(GID)$}");%>);
    $("#txt_szjb").val(<%Call.Label("{$GetRequest(SID)$}");%>);
	$("#txtTitle").val("用户<%Call.Label("{ZL:GetuserName()/}");%>对<%Call.Label("{$GetRequest(SID)$}");%>竞标的付款申请");
	$("#EBtnSubmit").val("提交付款申请");
});
</script>
</asp:Content>
