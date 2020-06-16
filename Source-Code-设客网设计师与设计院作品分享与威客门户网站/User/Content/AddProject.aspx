<%@ Page Title="" Language="C#" MasterPageFile="~/User/Default.master" AutoEventWireup="true" CodeFile="AddProject.aspx.cs" Inherits="ZoomLa.WebSite.User.Content.AddProject" ClientIDMode="Static" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>发布项目_<%= Call.SiteName %></title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.tdbgleft{text-align:right;}
.fd_td_l { width:auto; width:200px;}
#step_btn{ padding:10px 30px; border-radius:30px; border:1px solid #449d44; background:#449d44; color:#fff; font-size:1.2em;}
.wd100 { width:100px;}
.wd120 { width:160px;}
.table_center th,.table_center td { text-align:center;}
.cmdgroup { display:none;}
</style>
<script>
if("<%Call.Label("{ZL.Label id=\"输出当前用户认证资料状态\" /}");%>"!="99")
{
	alert("您尚未通过资料认证，无法发布项目！");
	window.location.href="/User/Default2.aspx"
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="/Class_13/NodePage.aspx">发布项目</a></li>
<li class="active">填写项目信息</li> 
</ol> 
</div>
<div class=" "> 
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center"><span id="label_title">填写项目信息</span><asp:Label ID="Label1" CssClass="hidden" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td class="text-right">项目分类</td>
<td>
<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td class="text-right">项目名称<asp:Label ID="Title_L" CssClass="hidden" runat="server"></asp:Label></td>
<td>
<asp:TextBox ID="txtTitle" CssClass="form-control m715-50" runat="server" Text=''></asp:TextBox>
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
<td colspan="2"><p class="text-center" style="color:#f00;">带*号为必填项</p></td>
</tr>
<tr class="text-center step_btn">
<td colspan="2">
<button type="button" class="step1" id="step_btn" onClick="CheckFun();">完成，保存下一步填写设计师要求</button></td>
</tr>
<tr class="step_btn1">
<td colspan="2" class="text-center">
<asp:Button ID="EBtnSubmit" Text="" OnClick="EBtnSubmit_Click" OnClientClick="return GetPayTimesStr();" runat="server" class="btn btn-success" />
<button type="button" class="btn btn-warning" onClick="ReturnEdit()">返回修改</button>
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
<script type="text/javascript" src="/JS/ZL_Regex.js"></script>
<script>
function UpdateMultiDrop(values, id) {
	if(id=="txt_xmlx"&&values=="其他")
	{
		$("#txt_xmlx").parent().find("iframe").after("<input class='form-control m715-50 fd_text' id='txt_xmlx1' size='300' />")
	}
	else if(id=="txt_xmlx"&&values!="其他")
	{
		$("#txt_xmlx1").remove();
	}
    document.getElementsByName(id)[0].value = values;
}
$("select[name=txt_fkcs]").change(function(){
	GetPayTimes();
})
//$("select[name=txt_xmgm]").change(function(){
//	$("#txt_jtmj").val("");
//	if($(this).val()=="其他")
//	{
//		$("#txt_jtmj").parent().parent().show();
//	}
//	else
//	{
//		$("#txt_jtmj").parent().parent().hide();
//	}
//});
$().ready(function(e) {
	$("#txt_xybzj_0").parent().parent().parent().hide();
	$("#txt_bzjje").parent().parent().hide();
    $("#txt_fkxq").parent().parent().hide();
	$("#txt_sjry_0").parent().parent().parent().hide();
	$("select[name=txt_jyyq]").parent().parent().hide();
	$("select[name=txt_zcyq]").parent().parent().hide();
	$("select[name=txt_sjryszd]").parent().parent().hide();
	$("#txt_sjsxb_0").parent().parent().parent().hide();
	$("#txt_sjsqtyq").parent().parent().hide();
	$("#txt_xmxzqx_0").parent().parent().hide();
    $("#txt_zbrs").parent().parent().hide();
	$("#table_pay").parent().parent().parent().hide();
	$(".step_btn1").hide();
	$("select[name=txt_xgcs]").parent().parent().hide();
	$("select[name=txt_fkcs]").parent().parent().hide();
	$("select[name=txt_xgmj]").parent().parent().hide();
	$("#txt_zdxgff").parent().parent().hide();
	$("#txt_faxmnryqxx").parent().parent().hide();
	$("select[name=txt_dqzyxmnryq]").parent().parent().hide();
	$("#txt_ntxmtsyq_0").parent().parent().hide();
	$("#txt_qtfwyq_0").parent().parent().hide();
	//$("#txt_jtmj").parent().parent().hide();

	$("input[name=txt_wcsj]").attr("onclick","WdatePicker({ dateFmt: 'yyyy年MM月dd日',minDate:'%y-%M-{%d+1}'});").addClass("form-control m715-50");
	$("#txt_sjfy").addClass("form-control m715-50");
	ZL_Regex.B_Float("#txt_sjfy");
	ZL_Regex.B_Value("#txt_sjfy", { min: 0, max: 99999999, overmin: function () { }, overmax: function () {} });
	ZL_Regex.B_Float("#txt_xmzje");
	ZL_Regex.B_Value("#txt_xmzje", { min: 0, max: 99999999, overmin: function () { }, overmax: function () {} });
	ZL_Regex.B_Num("#txt_jtmj");
	ZL_Regex.B_Value("#txt_jtmj", { min: 1, max: 99999999, overmin: function () { }, overmax: function () {} });
	ZL_Regex.B_Num("#txt_zbrs");
	ZL_Regex.B_Value("#txt_zbrs", { min: 1, max: 10000, overmin: function () { }, overmax: function () {} });
	
	$("#txt_xmdd").parent().append("<span style='color:#f00;'>*</span>");
	$("#txt_xmlx").parent().append("<span style='color:#f00;'>*</span>");
	$("#txt_jffs_0").parent().parent().append("<span style='color:#f00;'>*</span>");
	$("#txt_sjfy").parent().parent().find(".tdbgleft").html("设计单价");
	$("#txt_sjfy").parent().append("<span style='color:#f00;'>*</span>");
	$("#txt_zbrs").parent().append("<span style='color:#f00;'>*</span>");
	$("select[name=txt_fkcs]").parent().append("<span style='color:#f00;'>*</span>");
	$("select[name=txt_sjfg]").parent().append("<span style='color:#f00;'>*</span>");
	$("input[name=txt_wcsj]").parent().append("<span style='color:#f00;'>*</span>");
	$("input[name=txt_jtmj]").parent().append("<span style='color:#f00;'>*</span>");
	$("select[name=txt_xmgm]").parent().append("<span style='color:#f00;'>*</span>");

	$("select[name=txt_fkcs]").parent().parent().after("<tr class=\"table_pay\" style=\"display:none;\"><td colspan=\"2\"><table class=\"table table-bordered table_center\"><tr><th>分次付款</th><th>付款比例</th><th>需设计师提供内容</th><th>完成时间</th></tr><tr><td><strong>第1次付款</strong></td><td><select class=\"form-control wd100\" id=\"pay_n1\"><option value=\"10\">10%</option><option value=\"20\">20%</option><option value=\"30\">30%</option><option value=\"40\">40%</option><option value=\"50\">50%</option><option value=\"60\">60%</option><option value=\"70\">70%</option><option value=\"80\">80%</option><option value=\"90\">90%</option><option value=\"100\" selected>100%</option></select></td><td><textarea id=\"pay_p1\" class=\"form-control\" rows=\"6\" ></textarea></td><td><input type=\"text\" id=\"pay_t1\" class=\"form-control text_150\" onClick=\"WdatePicker({ dateFmt: 'yyyy年MM月dd',minDate:'%y-%M-{%d+1}',maxDate:'"+$("input[name=txt_wcsj]").val()+"'});\"></td></tr><tbody id=\"table_pay\"></tbody></table></td></tr>");
	$("#EBtnSubmit").val("提交项目");
});
$("select[name=txt_zyyq]").change(function(){
	if($(this).val()=="电气")
	{
		$("select[name=txt_dqzyxmnryq]").parent().parent().show();
		$("#txt_ntxmtsyq_0").parent().parent().hide();
	}
	else if($(this).val()=="暖通")
	{
		$("select[name=txt_dqzyxmnryq]").parent().parent().hide();
		$("#txt_ntxmtsyq_0").parent().parent().show();
	}
	else
	{
		$("select[name=txt_dqzyxmnryq]").parent().parent().hide();
		$("#txt_ntxmtsyq_0").parent().parent().hide();
	}
})
$("#txt_sjfg").parent().find(".btn-group .btn").each(function(index, element) {
    if($(this).html()=="")
		$(this).remove();
});
$("input[name=txt_spxykfrybztx]").change(function(){
	if($(this).val()=="是")
 	{
		$(".step_btn").hide();
		$(".step_btn1").show();
		$(".step_btn1 .btn-warning").hide();
	}
	else
	{
		$(".step_btn").show();
		$(".step_btn1").hide();
		$(".step_btn1 .btn-warning").show();
	}
})
$("input[name=txt_jffs]").change(function(){
	if($(this).val()=="元/M²")
	{
		$("#txt_xmzje").parent().parent().show();
		$("#txt_sjfy").parent().parent().find(".tdbgleft").html("设计单价");
	}
	else
	{
		$("#txt_xmzje").parent().parent().hide();
		$("#txt_sjfy").parent().parent().find(".tdbgleft").html("设计费用");		
	}
});
$("input[name=txt_xybzj]").change(function(){
	if($(this).val()=="是")
	{
		$("#txt_bzjje").parent().parent().show();
	}
	else
	{
		$("#txt_bzjje").parent().parent().hide();
	}
});
$("input[type=checkbox][id=txt_faxmnryq_6]").change(function(){
	if($(this).is(':checked'))
		$("#txt_faxmnryqxx").parent().parent().show();
	else
		$("#txt_faxmnryqxx").parent().parent().hide();
})
function GetPayTimes()
{
	var fkcs=$("select[name=txt_fkcs]").val();
	if(ZL_Regex.isNum(fkcs)&&fkcs>0)
	{
		var str="";
		for(var i=1; i<fkcs; i++)
		{
			str+="<tr><td><strong>第"+(i+1)+"次付款</strong></td><td><select class=\"form-control wd100\" id=\"pay_n"+(i+1)+"\"><option value=\"10\">10%</option><option value=\"20\">20%</option><option value=\"30\">30%</option><option value=\"40\">40%</option><option value=\"50\">50%</option><option value=\"60\">60%</option><option value=\"70\">70%</option><option value=\"80\">80%</option><option value=\"90\">90%</option><option value=\"100\">100%</option></select></td><td><textarea id=\"pay_p"+(i+1)+"\" class=\"form-control\" rows=\"6\" ></textarea></td><td><input type=\"text\" id=\"pay_t"+(i+1)+"\" class=\"form-control text_150\" onClick=\"WdatePicker({ dateFmt: 'yyyy年MM月dd日',minDate:'%y-%M-{%d+1}',maxDate:'"+$("input[name=txt_wcsj]").val()+"'});\" ></td></tr>";
		}
		$("#table_pay").html(str);
	}
	else
	{
		alert("付款次数必须为正整数！");
	}
}
function GetPayTimesStr()
{	
	if($("#txt_xmlx").val()=="其他")
		$("#txt_xmlx").val($("#txt_xmlx1").val());
	var str="";
	var money=0;
	var nums=parseInt($("select[name=txt_fkcs]").val())+1;
	for(var i=1; i<nums; i++)
	{
		money+=parseInt($("#pay_n"+i).val());
		str+='{"num":"'+i+'","paymoney":"'+$("#pay_n"+i).val()+'","paydetial":"'+$("#pay_p"+i).val()+'","paytime":"'+$("#pay_t"+i).val()+'"},';
	}
	if(money!==100)
	{
		alert("付款比例总和必须为100%！");
		return false
	}
	else
	{
		$("#txt_fkxq").html("["+str.Trim(',')+"]");
		return true
	}
}
function CheckFun()
{
	if(ZL_Regex.isEmpty($("#txtTitle").val()))
		alert("项目名称不能为空");
	else if(ZL_Regex.isEmpty($("#txt_xmlx").val()))
		alert("项目类型不能为空");
	else if(ZL_Regex.isEmpty($("input[name=txt_jtmj]").val()))
		alert("具体面积不能为空")
	else if(ZL_Regex.isEmpty($("input[name=txt_wcsj]").val()))
		alert("完成时间不能为空")
	else if(ZL_Regex.isEmpty($("#txt_sjfy").val()))
		alert("设计费用不能为空");
	else if(parseFloat($("#txt_sjfy").val())<0||parseFloat($("#txt_sjfy").val())>99999999)
		alert("设计费用只能在1至99999999之间");
	else
	{
		$("#Label2").parent().parent().hide();
		$("#txtTitle").parent().parent().hide();
		$("#txt_sjjd_0").parent().parent().hide();
		$("#txt_xmdd").parent().parent().hide();
		$("#txt_xmlx").parent().parent().hide();
		$("#txt_sjfg").parent().parent().hide();
		$("select[name=txt_sjfg]").parent().parent().hide();
		$("input[name=txt_wcsj]").parent().parent().hide();
		$("#txt_jffs_0").parent().parent().parent().hide();
		$("#txt_sjfy").parent().parent().hide();
		$("#txt_faxmnryq_0").parent().parent().hide();
		$("#txt_qtyq").parent().parent().hide();
		$("select[name=txt_xmgm]").parent().parent().hide();
		$("#txt_jtmj").parent().parent().hiden();
		$(".step_btn").hide();
		$("select[name=txt_zyyq]").parent().parent().hide();
		$("#txt_spxyts_0").parent().parent().parent().hide();
		$("#txt_spbhzt_0").parent().parent().parent().hide();
		$("#txt_ywtssjyq_0").parent().parent().hide();
		$("select[name=txt_dqzyxmnryq]").parent().parent().hide();
		$("#txt_ntxmtsyq_0").parent().parent().hide();
		$("select[name=txt_sgfwxmnryq]").parent().parent().hide();
		$("#txt_faxmnryqxx").parent().parent().hide();
		$("#txt_xmzje").parent().parent().hide();
		$("#txt_spxykfrybztx_0").parent().parent().parent().hide();
		$("#txt_zlsz").parent().parent().hide();
		
		$("#txt_sjry_0").parent().parent().parent().show();
		$("select[name=txt_jyyq]").parent().parent().show();
		$("select[name=txt_zcyq]").parent().parent().show();
		$("select[name=txt_sjryszd]").parent().parent().show();
		$("#txt_sjsxb_0").parent().parent().parent().show();
		$("#txt_sjsqtyq").parent().parent().show();
		$("#txt_xmxzqx_0").parent().parent().show();
		$("#txt_zbrs").parent().parent().show();
		$("select[name=txt_fkcs]").parent().parent().show();
		$("#table_pay").parent().parent().parent().show();
		$(".step_btn1").show();
		$("select[name=txt_xgcs]").parent().parent().show();
		$("select[name=txt_xgmj]").parent().parent().show();
		$("#txt_zdxgff").parent().parent().show();
		$(".breadcrumb li:last-child").html("对设计师的要求");
		$("#label_title").html("对设计师的要求");
		$(".table_pay").show();
		$("#txt_xybzj_0").parent().parent().parent().show();
		$("#txt_bzjje").parent().parent().show();
		$("#txt_qtfwyq_0").parent().parent().show();
		$("#pay_t1").attr("onClick","WdatePicker({ dateFmt: 'yyyy年MM月dd日',minDate:'%y-%M-{%d+1}',maxDate:'"+$("input[name=txt_wcsj]").val()+"' });");
	}
}
function ReturnEdit()
{
	$("#Label2").parent().parent().show();
	$("#txtTitle").parent().parent().show();
	$("#txt_sjjd_0").parent().parent().show();
	$("#txt_xmdd").parent().parent().show();
	$("#txt_xmlx").parent().parent().show();
	$("#txt_sjfg").parent().parent().show();
	$("select[name=txt_sjfg]").parent().parent().show();
	$("input[name=txt_wcsj]").parent().parent().show();
	$("#txt_jffs_0").parent().parent().parent().show();
	$("#txt_sjfy").parent().parent().show();
	$("#txt_faxmnryq_0").parent().parent().show();
	$("#txt_qtyq").parent().parent().show();
	$("select[name=txt_xmgm]").parent().parent().show();
	$("#txt_jtmj").parent().parent().show();
	$(".step_btn").show();
	$("select[name=txt_zyyq]").parent().parent().show();
	$("#txt_spxyts_0").parent().parent().parent().show();
	$("#txt_spbhzt_0").parent().parent().parent().show();
	$("#txt_ywtssjyq_0").parent().parent().show();
	$("select[name=txt_dqzyxmnryq]").parent().parent().show();
	$("#txt_ntxmtsyq_0").parent().parent().show();
	$("select[name=txt_sgfwxmnryq]").parent().parent().show();
	$("#txt_spxykfrybztx_0").parent().parent().parent().show();
	$("#txt_zlsz").parent().parent().show();

	$("#txt_qtfwyq_0").parent().parent().hide();	
	$("#txt_sjry_0").parent().parent().parent().hide();
	$("select[name=txt_jyyq]").parent().parent().hide();
	$("select[name=txt_zcyq]").parent().parent().hide();
	$("select[name=txt_sjryszd]").parent().parent().hide();
	$("#txt_sjsxb_0").parent().parent().parent().hide();
	$("#txt_sjsqtyq").parent().parent().hide();
	$("#txt_xmxzqx_0").parent().parent().hide();
    $("#txt_zbrs").parent().parent().hide();
	$("select[name=txt_fkcs]").parent().parent().hide();
	$("#table_pay").parent().parent().parent().hide();
	$(".step_btn1").hide();
	$("select[name=txt_xgcs]").parent().parent().hide();
	$("select[name=txt_xgmj]").parent().parent().hide();
	$("#txt_zdxgff").parent().parent().hide();
	$(".breadcrumb li:last-child").html("填写项目信息");
	$("#label_title").html("填写项目信息");
	$(".table_pay").hide();
	$("#txt_xybzj_0").parent().parent().parent().hide();
	$("#txt_bzjje").parent().parent().hide();

}
</script>
</asp:Content>