<%@ Page Title="" Language="C#" MasterPageFile="~/User/Default.master" AutoEventWireup="true" CodeFile="AddMoney.aspx.cs" Inherits="ZoomLa.WebSite.User.Content.AddMoney" ClientIDMode="Static" ValidateRequest="false" %>
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
<table class="table table-striped table-bordered">
<tr>
<td colspan="2" class="text-center">
<h4>提交付款申请</h4>
<asp:Label ID="Label1" runat="server" CssClass="hidden" Text="Label"></asp:Label></td>
</tr>
<tr>
<td colspan="2">
<div class="checked_speed">
<h3 style="margin-top:0;"><span>项目进度</span> <b style="font-weight:normal; font-size:14px; color:#c00;">总项目款：<%Call.Label("{ZL.Label id=\"输出指定项目总款\" /}");%>元</b></h3>
<div class="checked_speed_d">
<table class="table table-bordered">
<tr>
<th>进度名称</th>
<th>付款比例</th>
<th>付款状态</th>
</tr>
<tbody id="table_pay"></tbody>
</table>
<div class="clearfix"></div>
</div>
</div>
</td>
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
	$("#EBtnSubmit").val("确认付款");
	$("#txt_szsjs").parent().parent().hide();
});
var allmoney="<%Call.Label("{ZL.Label id=\"输出指定项目总款\" /}");%>";
var paynum="<%Call.Label("{ZL.Label id=\"输出指定项目实际付款次数\" /}");%>";
var xmjd=(parseInt(paynum)+1);
var sid="<%Call.Label("{ZL.Label id=\"输出指定竞标设计师ID\" /}");%>";
$("#txt_xmjd").val(xmjd);
$("#txt_szsjs").val(sid);
var paystr='<%Call.Label("{ZL.Label id=\"获取指定项目付款详情\" /}");%>';
if(paystr&&paystr!="")
{
	var paylist = JSON.parse(paystr);
	var str="";
	for(var i=1;i<paylist.length+1;i++)
	{
		if(i<=paynum)
			str+="<tr><td>第"+i+"次付款</td><td>"+paylist[i-1].paymoney+"%</td><td><i class=\"glyphicon glyphicon-ok-circle\"></i>已付款</td></tr>";
		else if(i==xmjd)
			str+="<tr><td>第"+i+"次付款</td><td>"+paylist[i-1].paymoney+"%</td><td><i class=\"glyphicon glyphicon-adjust\"></i>进行中</td></tr>"
		else
			str+="<tr><td>第"+i+"次付款</td><td>"+paylist[i-1].paymoney+"%</td><td><i class=\"fa fa-clock-o\"></i>未付款</td></tr>"
	}
	$("#table_pay").html(str);
	if(paystr>=(paynum+1))
	{
		$("#txt_fkje").val(paylist[paynum].paymoney);
		var money = parseFloat(parseFloat(allmoney)*paylist[paynum].paymoney/100).toFixed(2);
		$("#txt_Money").val(money);
	}
}
</script>
</asp:Content>