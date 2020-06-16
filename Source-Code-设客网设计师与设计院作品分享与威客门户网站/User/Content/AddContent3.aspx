<%@ page title="" language="C#" masterpagefile="~/User/Empty.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.AddContentpage, App_Web_j2dqvgme" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加内容</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.tdbgleft{text-align:right;}
.form-control { max-width:300px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">

<table class="table table-striped table-bordered table-hover">
<tr hidden>
<td colspan="2" class="text-center">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr hidden>
<td class="text-right">所属节点</td>
<td><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
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
<asp:Button ID="EBtnSubmit" Text="" OnClick="EBtnSubmit_Click" runat="server" OnClientClick="return CheckFun();"  class="btn btn-primary" />
<input type="button" id="BtnBack" class="btn btn-primary" value="返回列表" onclick="javascript: getContentUrl()" />
<asp:HiddenField ID="HdnNode" runat="server" />
<asp:HiddenField ID="HdnModel" runat="server" />
<asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
</td>
</tr>
</table> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ZL_Content.js"></script>
<script type="text/javascript" src="/JS/ZL_Regex.js"></script>
<script>
$().ready(function(e) {
    $("input[name=txt_wdcnwcsj]").addClass("form-control");
	$("input[name=txt_wdcnwcsj]").css("max-width","300px;");
    $("input[name=txt_fbrdsjyq]").addClass("form-control");
	$("input[name=txt_fbrdsjyq]").css("max-width","300px;");
	$("#txtTitle").val('用户：<%Call.Label("{ZL:GetuserName()/}");%>对<%Call.Label("{$GetRequest(GID)$}");%>号项目的竞标');
	$("#txt_szxm").parent().parent().hide();
	$("#EBtnSubmit").val("提交竞标方案");
	
	$("#txt_fbrzgxj").val("<%Call.Label("{ZL.Label id=\"获取指定项目发包人报价\" /}");%>");
	$("input[name=txt_fbrdsjyq]").val("<%Call.Label("{ZL.Label id=\"获取指定项目完成时间\" /}");%>");
	$("input[name=txt_fbrdsjyq]").attr("disabled","disabled");
	$("input[name=txt_wdcnwcsj]").attr("onclick","WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d}',maxDate:'<%Call.Label("{ZL.Label id=\"获取指定项目完成时间\" /}");%>'});");

	$("#txt_fbrzgxj").after("<%Call.Label("{ZL.Label id=\"获取指定项目发包人计费方式\" /}");%>");
	$("#txt_wdyhbj").after("<%Call.Label("{ZL.Label id=\"获取指定项目发包人计费方式\" /}");%>");
	$("#txt_szxm").val("<%Call.Label("{$GetRequest(GID)$}");%>")
	$("#txt_fbrzgxj").attr("disabled","disabled");
});
function CheckFun()
{
	if(ZL_Regex.isNum($("#txt_wdyhbj").val())&&parseFloat($("#txt_fbrzgxj").val())>=parseFloat($("#txt_wdyhbj").val()))
	{
		return true;
	}
	else if($("input[name=txt_wdcnwcsj]").val()=="")
	{
		alert("完成时间不能为空！");
		return false;
	}
	else
	{
		alert("优惠报价必须为数字且不得高于发包人报价！");
		return false;
	}
}
</script>
</asp:Content>
