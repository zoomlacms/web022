<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="Plat_Mail_MailWrite, App_Web_qf403px0" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Plat/Common/EmailNav.ascx" TagName="MailNav" TagPrefix="UC" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>发送邮件</title>
<link type="text/css" rel="stylesheet" href="/Plugins/Uploadify/style.css" />
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/JS/MisView.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">首页</a></li>
<li><a href="/Plat/EMail/">邮件</a></li>
<li class="active">写邮件</li>
</ol>
</div>
<UC:MailNav runat="server" ID="Nav" />
 
<div class="mainDiv">
<div class="clearfix"></div>
<div style="margin-top: 10px;">
<div class="us_seta" style="margin-top: 5px;">
  <table class="table table-border table-hover">
    <tr>
        <td class="text-right">发件邮箱：</td>
        <td><asp:DropDownList ID="Emails_D" CssClass="form-control" DataValueField="ID" DataTextField="Acount" runat="server"></asp:DropDownList></td>
    </tr>
	<tr>
	  <td class="text-right">收件人：</td>
	  <td class="tdRight"><asp:TextBox CssClass="form-control t_mid" ID="Receiver_T" runat="server" style="margin-right:10px;" /></td>
	</tr>
	<tr>
	  <td class="text-right">邮件标题：</td>
	  <td class="tdRight"><asp:TextBox ID="TxtTitle" CssClass="form-control t_mid" runat="server" /></td>
	</tr>
	<tr>
	  <td colspan="2"><asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" Width="98%" Height="300px" ClientIDMode="Static"> </asp:TextBox>
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
		<asp:Button ID="BtnSend" runat="server" Text="发送" OnClientClick="return SendConfirm();" OnClick="BtnSend_Click" class="btn btn-primary"/>
		&nbsp;
<%--		<asp:Button ID="Button1" runat="server" Text="存草稿" class="btn btn-primary" />--%>
		&nbsp;
		<asp:Button ID="BtnReset" runat="server" Text="清除" class="btn btn-primary" /></td>
	</tr>
	<tr>
	  <td colspan="2" align="center"><%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />--%></td>
	</tr>
  </table>
</div>
</div>
</div>
<div style="display:none;" id="FileUp_Div">
    <input type="file" id="boxfile" />
</div>
<%=Call.GetUEditor("EditorContent",2)%> 
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
<script type="text/javascript">
    var uptr = '<tr><td style="width:20%"><input type="file" name="fileUP" class="fileUP" /></td><td><input type="button" class="btn btn-primary pull-left" value="删除" onclick="delAttach(this);" /></td></tr>';
    var diag = new ZL_Dialog();
    function ShowUpFile() {
        diag.title = "添加附件";
        diag.content = "FileUp_Div";
        diag.ShowModal();
    }
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
    function hidediv() {
        $("#div_share").hide("fast");
    }
    function SendConfirm() {
        if ($("#Emails_D").val()=="-1") {
            alert("您未绑定邮箱！");
            return false;
        }
        if (!ZL_Regex.isEmail($("#Receiver_T").val())) {
            alert("收件人格式不对！");
            return false;
        }
        if ($("#TxtTitle").val() == "" || $("#TxtTitle").val()==undefined) {
            alert("邮箱不能为空！");
            return false;
        }
        if (confirm('确定要发送该邮件吗')) {
            return true;
        } else {
            return false;
        }
    }
</script>
<style>
</style>
</asp:Content>