<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageSend, App_Web_jaatvzyj" validaterequest="false" clientidmode="Static" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>发送短消息</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/JS/MisView.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid">
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">首页</a></li>
<li><a href="/Plat/Task/">邮件</a></li>
<li class="active">写邮件</li>
</ol>
</div>
<div style="margin-top: 10px;">
<div class="btn-group Messge_nav"> <a class="btn btn-primary" href="MessageSend.aspx">写邮件</a> <a class="btn btn-primary" href="Default.aspx">收件箱</a> <a class="btn btn-primary" href="MessageOutbox.aspx">发件箱</a> <a class="btn btn-primary" href="MessageDraftbox.aspx">草稿箱</a> <a class="btn btn-primary" href="MessageGarbagebox.aspx">垃圾箱</a> <a class="btn btn-primary" href="Mobile.aspx">手机短信</a> </div>
<div class="mainDiv">
<div class="clearfix"></div>
<div style="margin-top: 10px;">
<div class="us_seta" style="margin-top: 5px;">
  <table class="table table-border table-hover">
	<tr>
	  <td class="text-right">收件人：</td>
	  <td class="tdRight"><asp:TextBox CssClass="form-control text_300" ID="TxtInceptUser" runat="server" style="margin-right:10px;" />
		<asp:HiddenField ID="HiddenUser" runat="server" />
		<button type="button" onclick="showdiv('div_share','1')" class="btn btn-primary">选择</button></td>
	</tr>
	<tr>
	  <td class="text-right">抄送人：</td>
	  <td class="tdRight"><asp:TextBox CssClass="form-control text_300" ID="ccUserT" runat="server" style="margin-right:10px;"/>
		<asp:HiddenField ID="HiddenCCUser" runat="server" />
		<button type="button" onclick="showdiv('div_share','2')" class="btn btn-primary">选择</button></td>
	</tr>
	<tr>
	  <td class="text-right">邮件标题：</td>
	  <td class="tdRight"><asp:TextBox ID="TxtTitle" CssClass="form-control text_300" runat="server" />
		<%-- <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="邮件标题不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%></td>
	</tr>
	<tr>
	  <td colspan="2"><asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" CssClass="m715-50" Height="300px" ClientIDMode="Static"> </asp:TextBox>
		<%--  <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%></td>
	</tr>
	<tr id="hasFileTR" runat="server" visible="true">
	  <td class="text-right">已上传文件：
		<asp:HiddenField runat="server" ID="hasFileData" ClientIDMode="Static" /></td>
	  <td id="hasFileTD" runat="server"></td>
	</tr>
	<tr>
	  <td style="text-align: center;width:10%;" ><input type="button" class="btn btn-primary" value="再加个附件" onclick="addAttach();" /></td>
	  <td colspan="7"><table class="table table-bordered" id="attachTB">
		  <tr>
			<td style="width:20%"><input type="file" runat="server" name="fileUPs"/></td>
			<td><input type="button" class="btn btn-primary pull-left" value="删除" onclick="delAttach(this);" /></td>
		  </tr>
		</table></td>
	</tr>
	<tr>
	  <td colspan="2" align="center"><asp:HiddenField ID="HdnMessageID" runat="server" />
		&nbsp;
		<asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" OnClientClick="return SendConfirm();" class="btn btn-primary"/>
		&nbsp;
		<asp:Button ID="Button1" runat="server" Text="存草稿" OnClick="Button1_Click" class="btn btn-primary" />
		&nbsp;
		<asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-primary" /></td>
	</tr>
	<tr>
	  <td colspan="2" align="center"><%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />--%></td>
	</tr>
  </table>
  <div align="center"></div>
</div>
<div id="div_share" class="panel panel-primary" style="display: none; width: 800px; height: 600px; position: absolute; z-index: 1000;">
  <div class="panel-heading"> <span class="glyphicon glyphicon-remove pull-right" style="margin-top: 10px; cursor: pointer;" onclick="hidediv()" title="关闭"></span>
	<h3 class="panel-title">选择用户</h3>
  </div>
  <div class="panel-body">
	<iframe id="main_right" style="z-index: 1000; visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 450px;" name="main_right" src="" frameborder="0"></iframe>
  </div>
</div>
</div>
</div>
<%=Call.GetUEditor("EditorContent",2)%> 
<script type="text/javascript">
var uptr = '<tr><td style="width:20%"><input type="file" name="fileUP" class="fileUP" /></td><td><input type="button" class="btn btn-primary pull-left" value="删除" onclick="delAttach(this);" /></td></tr>';
function addAttach() {
$("#attachTB").append(uptr);
}
function delAttach(obj) {
$(obj).parent().parent().remove();
}
function delHasFile(v, obj) {
rv = $("#hasFileData").val().replace(v + ",", "");
$("#hasFileData").val(rv)
$(obj).parent().remove();
}
function showdiv(div_id, n) {
if (n == "1")
	$("#main_right").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#ReferUser");
else
	$("#main_right").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#CCUser");
var div_obj = $("#" + div_id);
var h = (document.documentElement.offsetHeight - 800) / 2;
var w = (document.documentElement.offsetWidth - 600) / 2;
div_obj.animate({ opacity: "show", left: 10, top: 100, width: div_obj.width, height: div_obj.height }, 300);
div_obj.focus();
}
function UserFunc(json, select) {
var uname = "";
var uid = "";
for (var i = 0; i < json.length; i++) {
	uname += json[i].UserName + ",";
	uid += json[i].UserID + ",";
}
if (uid) uid = uid.substring(0, uid.length - 1);
if (select == "ReferUser") {
	$("#TxtInceptUser").val(uname);
	$("#HiddenUser").val(uid);
}
if (select == "CCUser") {
	$("#ccUserT").val(uname);
	$("#HiddenCCUser").val(uid);
}
$("#div_share").hide("fast");
}
function hidediv() {
$("#div_share").hide("fast");
}
function SendConfirm()
{
rece = $("#TxtInceptUser").val();
if (rece == "") { alert('未选定收件人!'); return false;}
title = $("#TxtTitle").val();
if (title == "") { alert('邮件标题不能为空!'); return false; }

if (confirm('确定要发送该邮件吗'))
{
	disBtn(this, 3000); return true;
} else {
	return false;
}
}
</script>
<style>
</style>
</asp:Content>