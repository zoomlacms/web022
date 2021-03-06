﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/Empty.master" AutoEventWireup="true" CodeFile="AddMarked.aspx.cs" Inherits="ZoomLa.WebSite.User.Content.AddMarked" ClientIDMode="Static" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加内容</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.speDiag{width:500px;}
.specDiv{width:110px;padding-left:5px;}
.specDiv .spec{border:solid 1px #ccc;margin:5px;}
.specDiv .specname{text-align:left;padding-left:5px;display:inline-block}
.specDiv span{display:inline-block;float:right;line-height:20px;}
.tabinput{ border:none; padding-left:5px; height:30px; line-height:30px;}
.radius{margin:2px;height:24px; line-height:24px; background:#eee; border:1px solid #ddd;border-radius:3px;padding:3px;}
#OAkeyword{ max-width:460px; height:36px; border:1px solid #ccc; display:inline-block;min-width:300px;padding-top:3px;}
#Keywords {display: none;}
.fd_td_l { width:150px;}
.cmdgroup { display:none;}
.tdbgleft{text-align:right;}
.form-control { max-width:300px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="margin_t5">
<ol class="breadcrumb" hidden>
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Mycontent.aspx?NodeID=<%=  this.NodeID%>">投稿管理</a></li>
<li class="active"><asp:Label runat="server" ID="Title_L"></asp:Label></li> 
</ol> 
</div>
<div class="tab-pane active" id="ConInfo">
<div class="alert alert-danger" id="alert_info" role="alert">您已经应标，无法重复应标</div>
<div class="alert alert-danger" id="alert_info1" role="alert">当前项目需要缴纳保证金<span id="alert_infos1"></span>元,<span id="alert_infos2"></span>！</div>
<div class="alert alert-danger" id="alert_info2" role="alert">您尚未通过审核，无法应标</div>
<div id="table_con">
<table id="mainTable" class="table table-bordered table_padding0 addcontent_modeltale" >
<tr>
<th colspan="2" class="text-center" style="color:#c00;">填写完整应标信息后才能应标</th>
</tr>
<tr hidden>
<td style="overflow-x:hidden;" class="col-sm-1 col-xs-1 text-right"><asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label>&nbsp;&nbsp;</td>
<td class="col-sm-11 col-xs-11">
<asp:TextBox ID="txtTitle" style="background:url(/Images/bg1.gif) repeat-x;" CssClass="form-control m715-50" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')"  runat="server"></asp:TextBox>
<span class="vaild_tip">*</span>
<a href="javascript:;" id="Button11" class="btn btn-info btn-sm" onclick="ShowTitle()" ><i class="fa fa-info"></i> 标题属性</a>
<button type="button" class="btn btn-info btn-sm" onclick="ShowSys();"><i class="fa fa-list"></i></button>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="标题不能为空" ForeColor="Red" Display="Dynamic" />
<span id="span_txtTitle" name="span_txtTitle"></span>
<asp:HiddenField ID="ThreadStyle" runat="server" />
<div id="duptitle_div" class="alert alert-warning" style="position: absolute;margin-left:315px;display:none;">
<ul id='duptitle_ul'></ul>
</div>
</td>
</tr>
<tbody id="Sys_Fied" runat="server" style="display:none;">
<tr hidden>
<td class="text-right"><asp:Label ID="py" runat="server" Text="拼音缩写"></asp:Label>&nbsp;&nbsp;</td>
<td>
<asp:TextBox ID="PYtitle" CssClass="form-control m715-50" runat="server" />
</td>
</tr>
<tr id="spec_tr" hidden>
<td class="text-right">所属专题&nbsp;&nbsp;</td>
<td>
<div class="specDiv"></div>
<span id="specbtn_span"><asp:Literal ID="SpecInfo_Li" runat="server"></asp:Literal></span>
<asp:HiddenField ID="Spec_Hid" runat="server" />
</td>
</tr>
<tr runat="server" hidden>
<td class="tdbgleft" align="right"> 
<asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
&nbsp;
</td>
<td>                             
<div id="OAkeyword"></div>
<asp:TextBox ID="Keywords" runat="server" CssClass="form-control" /><span>(空格或回车键分隔，长度不超过10字符或5汉字)</span>  
</td>                        
</tr>
<tr runat="server" hidden>
<td class="text-right"><asp:Label ID="Label4" runat="server" Text="副标题"></asp:Label>&nbsp;&nbsp;</td>
<td>
<asp:TextBox ID="Subtitle" CssClass="form-control m715-50" runat="server"></asp:TextBox>
</td>
</tr>
</tbody>
<asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
<tr id="attPic" runat="server" hidden>
<td class="text-right">主编辑器扩展图</td>
<td style="height:80px;">
<ul id="ThumImg_ul" class="preview_img_ul">
</ul>
<div class="clearfix"></div>
<select name="selectpic" id="selectpic" onchange="ShowPic(this.value)" class="form-control text_300">
<option value="" selected="selected">不指定附属图片</option>
</select>
</td>
</tr>
<tr id="CreateHTML" runat="server">
<td class="text-right">
<asp:Label ID="Label1" runat="server" Text="生成"></asp:Label>&nbsp;
</td>
<td>
<asp:CheckBox ID="quickmake" runat="server" Checked="false" Text="是否立即生成" />&nbsp;
</td>
</tr>
<tr><td></td><td>
<asp:HiddenField runat="server" ID="RelatedIDS_Hid" />
<asp:HiddenField runat="server" ID="nodename" />
<asp:Button runat="server" CssClass="btn btn-primary" ID="EBtnSubmit" Text="添加项目" OnClick="EBtnSubmit_Click" />
<asp:Button runat="server" CssClass="btn btn-primary hidden" ID="DraftBtn" Text="存为草稿" OnClick="DraftBtn_Click" />
<a href="/Class_11/NodeElite.aspx" class="btn btn-primary" target="_parent">返回列表</a>
<%--  <a href="javascript:;" id="toTop" onclick="pageScroll();"><i class="glyphicon glyphicon-upload"></i>Top</a>--%>
</td></tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
var zlconfig = {
updir: "<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>",
duptitlenum: "<%=ZoomLa.Components.SiteConfig.SiteOption.DupTitleNum%>",
modelid: "<%=ModelID%>"
};
</script>
<script type="text/javascript" src="/JS/OAKeyWord.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/ICMS/tags.json"></script>
<script type="text/javascript" src="/JS/ZL_Content.js"></script>
<script type="text/javascript" src="/JS/ZL_Regex.js"></script>
<script>
$().ready(function () {
Tlp_initTemp();
});
//智能模板选择事件
function OnTemplateViewCheck(value) {
$("#TxtTemplate_hid").val(value);
}
//function CheckTlp(obj, name) {
//    $('.Template_box').removeClass('tlp_active');
//    var $box = $(obj).closest(".Template_box");
//    $box.addClass("tlp_active");
//    $("#TxtTemplate_hid").val(name);
//}

$().ready(function () {
	Tlp_initTemp();
});
//智能模板选择事件
function OnTemplateViewCheck(value) {
	$("#TxtTemplate_hid").val(value);
}
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
	$("input[name=txt_wdcnwcsj]").attr("onclick","WdatePicker({ dateFmt: 'yyyy年MM月dd日',minDate:'%y-%M-{%d}',maxDate:'<%Call.Label("{ZL.Label id=\"获取指定项目完成时间\" /}");%>'});");

	$("#txt_fbrzgxj").after("<%Call.Label("{ZL.Label id=\"获取指定项目发包人计费方式\" /}");%>");
	$("#txt_wdyhbj").after("<%Call.Label("{ZL.Label id=\"获取指定项目发包人计费方式\" /}");%>");
	$("#txt_szxm").val("<%Call.Label("{$GetRequest(GID)$}");%>")
	$("#txt_fbrzgxj").attr("disabled","disabled");
	
	var status='<%Call.Label("{ZL.Label id=\"获取当前用户是否注册设计师\" /}");%>';
	if(status==99)
	{
		$("#alert_info2").remove();
		var jbnum='<%Call.Label("{ZL.Label id=\"输出当前用户指定项目应标数\" /}");%>';
		if(parseInt(jbnum)>0)
		{
			$("#table_con").remove();
			$("#alert_info1").remove();
		}
		else
		{
			$("#alert_info").remove();
			var bzj="<%Call.Label("{ZL.Label id=\"输出指定项目保证金\" /}");%>";
			var usermoney="<%Call.Label("{ZL.Label id=\"获取当前用户金额\" /}");%>";
			var cj=parseFloat(parseFloat(bzj)-parseFloat(usermoney)).toFixed(2);
			if(parseFloat(bzj)>0)
			{
				if(cj>0)
				{
					$("#table_con").remove();
					$("#alert_infos1").html(bzj);
					$("#alert_infos2").html("您的保证金余额不足,需<a href='/PayOnline/OrderPay.aspx?Money="+cj+"' target='_blank'>充值"+cj+"元</a>");
				}
				else
				{
					$("#alert_infos1").html(bzj);
					$("#alert_infos2").html("您的保证金金额为："+usermoney+"元");
				}
			}
			else
			{
				$("#alert_info1").remove();
			}
		}
	}
	else
	{
		$("#table_con").remove();
		$("#alert_info1").remove();
		$("#alert_info").remove();
	}
});
function CheckFun()
{
	if(ZL_Regex.isNum($("#txt_wdyhbj").val())&&parseFloat($("#txt_fbrzgxj").val())>=parseFloat($("#txt_wdyhbj").val()))
	{
		$("input[name=txt_fbrdsjyq]").removeAttr("disabled");
		$("#txt_fbrzgxj").removeAttr("disabled");
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
