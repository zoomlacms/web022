<%@ Page Language="C#" MasterPageFile="~/User/Default.master" AutoEventWireup="true" CodeFile="InstituteBase.aspx.cs" Inherits="User_Info_InstituteBase" ClientIDMode="Static" ValidateRequest="false"%>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="FileUp" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
<title>基本信息</title>
<script src="http://code.zoomla.cn/Area.js"></script>
<script src="/JS/Controls/ZL_PCC.js"></script>
<style> 
.cutImg{width:1100px;}
</style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">基本信息</li>
<div class="clearfix"></div>
</ol>
</div> 
<div class="">
<div runat="server" id="Login" class="us_seta" style="position: absolute; top: 40%; left: 40%" visible="false">
<table>
<tr>
<td colspan="2"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
</tr>
<tr>
<td>
<asp:TextBox ID="Second" runat="server" TextMode="Password"></asp:TextBox></td>
<td>
<asp:Button ID="sure" runat="server" Text="确定" OnClick="sure_Click" /></td>
</tr>
</table>
</div>
</div>
<div class="">
<div runat="server" id="DV_show">  
<div class="us_seta" style="margin-top: 10px; width: 100%; float: left" id="manageinfo" runat="server">
<ul class="nav nav-tabs">
<li><a href="UserInfo.aspx">注册信息</a></li>
<li class="active" onclick="switchTab('Tabs0');"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
<li onclick="switchTab('Tabs1');"><a href="#Tabs1" data-toggle="tab">头像设置</a></li>
</ul>
</div>
</div>
<script type="text/javascript">
$("body").ready(function () {
switchTab("<%=switchID.Value %>");
var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
if ($("#address").val() != "") {
var attr = $("#address").val().split(',');
pcc.SetDef(attr[0], attr[1], attr[2]);
}
pcc.ProvinceInit();
});
function switchTab(id) {
switch (id) {
case "Tabs0":
$("#Tabs0").show();
$("#Tabs1").hide();
$("#switchID").val("Tabs0");
break;
case "Tabs1":
$("#Tabs0").hide();
$("#Tabs1").show();
$("#switchID").val("Tabs1");
break;
}
$("#switchID").val(id);
}
$().ready(function () {
if ($("#switchID").val() == "Tabs1")
{
$(".nav-tabs li").removeClass("active");
$(".nav-tabs li:eq(2)").addClass("active");
}
})
</script>
<asp:HiddenField ID="switchID" runat="server" />
<div class="">
<table class="table table-bordered">
<tbody id="Tabs0">
<tr>
<td colspan="4" class="text-center" style="font-size: 1.5em;">资料维护</td>
</tr>
<tr id="DivCompany" runat="server" hidden>
<td class="tdbgleft" colspan="4">
<table style="border-collapse: collapse;" cellspacing="1" cellpadding="2" width="100%" border="0">
<tr>
<td class="text-right text_150">：</td>
<td><asp:TextBox ID="txtCompanyName" class="form-control text_md" runat="server"></asp:TextBox></td>
</tr>
<tr hidden>
<td class="text-right text_150">企业简介：</td>
<td><asp:TextBox ID="txtCompanyDescribe" class="form-control text_md" runat="server" TextMode="MultiLine" Height="60"></asp:TextBox></td>
</tr>

</table>
</td>
</tr>
<tr>
<td class="text-right">公司名称：</td>
<td><asp:TextBox runat="server" CssClass="form-control text_md pull-left" ID="CompanyName"></asp:TextBox></td>
</tr>

<tr>
<td class="text-right text_150">联系人：</td>
<td><asp:TextBox ID="tbTrueName" CssClass="form-control text_md " runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td class="text-right">手机号码：
</td>
<td>
<asp:TextBox ID="tbMobile" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="^1[(0-9)]{10}$" ControlToValidate="tbMobile" CssClass="tips" ErrorMessage="按照手机号规则输入"></asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td class="text-right">QQ号码：</td>
<td>
<asp:TextBox ID="tbQQ" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="^[0-9]*$" ControlToValidate="tbQQ" CssClass="tips" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td class="text-right">邮箱：</td>
<td><%Call.Label("{ZL.Label id=\"获取当前用户邮箱地址\" /}");%> <a href="/User/ChangeEmail.aspx" class="btn btn-info">修改邮箱</a></td>
</tr>
<tr>
<td class="text-right">所在城市：</td>
<td>
<select id="tbProvince"></select>
<select id="tbCity"></select>
<select id="tbCounty"></select>
<input id="address" runat="server" type="hidden" />
</td>
</tr>
<tr>
<td class="text-right">详细地址：</td>
<td><asp:TextBox ID="tbAddress" CssClass="form-control text_md" runat="server" Columns="30"></asp:TextBox></td>
</tr>

<tr hidden>
<td class="text-right text_150">昵称：</td>
<td><asp:TextBox ID="txtHonName" CssClass="form-control text_md " runat="server"></asp:TextBox></td>
</tr>

<tr hidden>
<td class="text-right">性别：</td>
<td style="">
<asp:RadioButtonList ID="tbUserSex" runat="server" RepeatDirection="Horizontal">
<asp:ListItem Selected="True" Value="1">男</asp:ListItem>
<asp:ListItem Value="0">女</asp:ListItem>
</asp:RadioButtonList>
</td>
</tr>

<tr hidden>
<td class="text-right">小灵通：</td>
<td style="">
<asp:TextBox ID="tbPHS" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<%--  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ValidationExpression="^\d+(\d+)?$"
ControlToValidate="tbPHS" CssClass="tips" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
</td>
</tr>
<tr hidden>
<td class="text-right">出生日期：
</td>
<td style="">
<asp:TextBox ID="tbBirthday" CssClass="form-control text_md " runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"></asp:TextBox>
</td>
<td class="text-right">办公电话：
</td>
<td style="">
<asp:TextBox ID="tbOfficePhone" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="tips" runat="server" ControlToValidate="tbOfficePhone" ErrorMessage="请输入数字！" Display="Dynamic" ValidationExpression="^\d+(\d+)?$"></asp:RegularExpressionValidator>
</td>
</tr>
<tr hidden>
<td class="text-right">家庭电话：
</td>
<td style="">
<asp:TextBox ID="tbHomePhone" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="tbHomePhone"
ErrorMessage="请输入区位号-数字！" CssClass="tips" Display="Dynamic" ValidationExpression="^\d+-(\d+)?$"></asp:RegularExpressionValidator>
</td>
<td class="text-right">传真：
</td>
<td style="">
<asp:TextBox ID="tbFax" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="^\d+(\d+)?$"
ControlToValidate="tbFax" CssClass="tips" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
</td>
</tr>
<tr hidden>
<td class="text-right">邮政编码：
</td>
<td style="">
<asp:TextBox ID="tbZipCode" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="\d{6}"
ControlToValidate="tbZipCode" ErrorMessage="只能输入正确的邮政编码"></asp:RegularExpressionValidator>
</td>
<td class="text-right">身份证号码：
</td>
<td style="">
<asp:TextBox ID="tbIDCard" CssClass="form-control text_md pull-left" runat="server" Columns="30"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="(^\d{15}$)|(^\d{17}([0-9]|X)$)"
ControlToValidate="tbIDCard" CssClass="tips"  ErrorMessage="请输入正确身份证号"></asp:RegularExpressionValidator>
</td>
</tr>
<tr hidden>
<td class="text-right">个人主页：
</td>
<td style="">
<asp:TextBox ID="tbHomepage" CssClass="form-control text_md" runat="server" Columns="30">http://</asp:TextBox>
</td>
<td class="text-right">QQ号码：
</td>
</tr>
<tr hidden>

<td class="text-right">MSN帐号：
</td>
<td style="">
<asp:TextBox ID="tbMSN" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator10"
ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbMSN" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
</td>
<td class="text-right">雅虎通帐号：
</td>
<td style="">
<asp:TextBox ID="tbYahoo" runat="server" CssClass="form-control text_md pull-left"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator11"
ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbYahoo" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
</td>
</tr>
<tr hidden>

<td class="text-right">UC帐号：
</td>
<td style="">
<asp:TextBox ID="tbUC" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator12"
ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbUC" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
</td>


</tr>
<tr hidden>
<td class="text-right">职务：</td>
<td style="">
<asp:TextBox runat="server" CssClass="form-control text_md pull-left" ID="Position"></asp:TextBox></td>

<td class="text-right">ICQ号码：
</td>
<td style="">
<asp:TextBox ID="tbICQ" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ValidationExpression="^[0-9]*$"
ControlToValidate="tbICQ" CssClass="tips" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
</td>
</tr>
<tr hidden><td style="display:none;"></td></tr>

<tr hidden>
<td class="text-right">签名档：
</td>
<td style="">
<asp:TextBox ID="tbSign" runat="server" class="form-control text_md" TextMode="MultiLine" Width="300" Height="60"></asp:TextBox>
</td>
<td rowspan="2" class="text-right">隐私设定：
</td>
<td rowspan="2" style="">
<asp:RadioButtonList ID="tbPrivacy" runat="server">
<asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
<asp:ListItem Value="1">只对好友公开</asp:ListItem>
<asp:ListItem Value="2">完全保密</asp:ListItem>
</asp:RadioButtonList>
<!--<div style="float:right;margin-right:50px;"><asp:Image ID="ImgCode" runat="server" Width="145" Height="120"/></div>-->
</td>
</tr>
<tr>
<asp:Literal ID="lblHtml" runat="server"></asp:Literal>
</tr>

</tbody>
<tbody id="Tabs1" style="display:none;">
<tr>
<td class="text-right" >头像地址：
</td>
<td style="" colspan="3">
<div class="pull-left">
<div>
<ZL:FileUp ID="SFile_Up" runat="server" FType="Img" />
<asp:Button ID="BtUpImage" runat="server" OnClick="BtUpImage_Click" CssClass="btn btn-primary" Text="上传" />
<asp:HiddenField ID="UserFace_Hid" runat="server" />
</div>
<div class="Top">
<asp:TextBox ID="tbUserFace" CssClass="form-control text_md" runat="server" Text="/Images/userface/noface.gif"></asp:TextBox>&nbsp;
<select size="1" name="myface" class="form-control text_md" style="max-width:100px;" onchange="document.images['face'].src=options[selectedIndex].value;document.getElementById('tbUserFace').value=options[selectedIndex].value;options[selectedIndex].selected=true;">
<option value="/Images/userface/1.gif">01.gif</option>
<option value="/Images/userface/2.gif">02.gif</option>
<option value="/Images/userface/3.gif">03.gif</option>
<option value="/Images/userface/4.gif">04.gif</option>
<option value="/Images/userface/5.gif">05.gif</option>
<option value="/Images/userface/6.gif">06.gif</option>
<option value="/Images/userface/7.gif">07.gif</option>
<option value="/Images/userface/8.gif">08.gif</option>
<option value="/Images/userface/9.gif">09.gif</option>
<option value="/Images/userface/10.gif">10.gif</option>
<option value="/Images/userface/11.gif">11.gif</option>
<option value="/Images/userface/12.gif">12.gif</option>
<option value="/Images/userface/13.gif">13.gif</option>
<option value="/Images/userface/14.gif">14.gif</option>
<option value="/Images/userface/15.gif">15.gif</option>
<option value="/Images/userface/16.gif">16.gif</option>
<option value="/Images/userface/17.gif">17.gif</option>
<option value="/Images/userface/18.gif">18.gif</option>
<option value="/Images/userface/19.gif">19.gif</option>
<option value="/Images/userface/20.gif">20.gif</option>
</select>
</div>
</div>
<div class="UserFaseStyle">
<div class="pull-left">
头像预览:
<asp:Image ID="face" runat="server" Height="111" Width="111" ImageUrl="~/Images/userface/noface.gif" />
<button class="btn btn-primary btn-xs" onclick="SetCutPic()" type="button">裁剪</button>
</div>
</div>
</td>

</tr>
<tr>
<td class="text-right">头像宽度：
</td>
<td style="">
<asp:TextBox CssClass="form-control text_md" ID="tbFaceWidth" runat="server">111</asp:TextBox>
</td>
<td style="text-align: right;">头像高度：
</td>
<td style="">
<asp:TextBox CssClass="form-control text_md" ID="tbFaceHeight" runat="server">111</asp:TextBox>
</td>
</tr>
</tbody>
<tr>

<td class=" text-center" colspan="4">
<asp:Button ID="btnSave" CssClass="btn btn-primary" OnClientClick="return SaveAdress()" runat="server" Text="更新信息" OnClick="btnSave_Click" TabIndex="12" />
</td>
</tr>
</table>
</div>
</div> 
<div class="u_sign" id="u_UserInfo"></div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ZL_Regex.js"></script>
<script>
	function SaveAdress() 
	{
		if(ZL_Regex.isEmpty($("#CompanyName").val()))
		{
			alert("公司名称不能为空！");
			return false;
		}
		else if(ZL_Regex.isEmpty($("#tbTrueName").val()))
		{
			alert("联系人不能为空！");
			return false;
		}
		else if(ZL_Regex.isEmpty($("#tbMobile").val()))
		{
			alert("手机号码不能为空！");
			return false;
		}
		else
		{
			//var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
			$("#address").val($("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val());
			return true;
		}
	}
	var diag = new ZL_Dialog();
	function SetCutPic() {
		diag.title = "图片编辑";
		diag.width = "cutImg";
		diag.url = "/Plugins/PicEdit/CutPic_User.aspx?ipath=" + $("#UserFace_Hid").val();
		diag.ShowModal();
		//?p=" + $("#face").attr("src") + "&d=" + parseInt(10 * Math.random()) + parseInt(10 * Math.random()))
	}
	function closdlg() {
		$("#closeCut").click();
	}
	function setCutUrl(url) {
		$("#face").attr("src", url);
		$("#tbUserFace").val(url);
	}
	function PageCallBack(action, url, pval) {
		$("#tbUserFace").val(url);
		$("#face").attr("src", url);
		diag.CloseModal();
	}
	$("#mimenu_btn").click(function(e) { 
		if($(".user_mimenu_left").width()>0){ 
			$(".user_mimenu_left ul").fadeOut(100);
			$(".user_mimenu_left").animate({width:0},200); 	
		}
		else{ 
			$(".user_mimenu_left").animate({width:150},300); 
			$(".user_mimenu_left ul").fadeIn();
		}
	}); 
	//会员搜索
	$("#sub_btn").click(function(e) { 
		if($("#key").val()=="")
			alert("搜索关键字为空!");
		else
			window.location="/User/SearchResult.aspx?key="+escape($("#key").val());	
	});
	//搜索回车事件
	function IsEnter(obj) {
		if (event.keyCode == 13) {
			$("#sub_btn").click(); return false;
		}
	}
</script>
</asp:Content>