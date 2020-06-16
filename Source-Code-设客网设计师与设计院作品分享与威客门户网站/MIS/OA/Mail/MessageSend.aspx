<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageSend, App_Web_st4ieofp" validaterequest="false" clientidmode="Static" masterpagefile="~/User/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>发送短消息</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/JS/MisView.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mainDiv"> 
<div class="clearfix"></div>
<div style="margin-top: 10px;">
<div class="us_seta">
<table class="table_li table-border" style="width: 100%;">
    <tr>
        <td class="text-right">收件人：</td>
        <td class="tdRight">
        <asp:TextBox CssClass="form-control text_md" ID="TxtInceptUser" runat="server" style="margin-right:10px;" />
        <asp:HiddenField ID="HiddenUser" runat="server" />
        <button type="button" onclick="ShowSelUser(1)" class="btn btn-primary">选择</button>
        </td>
    </tr>
    <tr>
        <td class="text-right">抄送人：</td>
        <td class="tdRight">
        <asp:TextBox CssClass="form-control text_md" ID="ccUserT" runat="server" style="margin-right:10px;"/>
        <asp:HiddenField ID="HiddenCCUser" runat="server" />
        <button type="button" onclick="ShowSelUser(2)" class="btn btn-primary">选择</button>
        </td>
    </tr>
    <tr>
        <td class="text-right">邮件标题：</td>
        <td class="tdRight">
        <asp:TextBox ID="TxtTitle" CssClass="form-control text_md" runat="server" />
        <%-- <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="邮件标题不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
        </td>
    </tr>
    <tr>
        <td class="text-right">内容：</td>
        <td>
        <asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" Width="100%" Height="300px" ClientIDMode="Static">
        </asp:TextBox>
        <%--  <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
        </td>
    </tr>
    <tr id="hasFileTR" runat="server" visible="true">
        <td class="text-right">已上传文件：<asp:HiddenField runat="server" ID="hasFileData" ClientIDMode="Static" />
        </td>
        <td id="hasFileTD" runat="server"></td>
    </tr>
    <tr>
        <td style="text-align: right;width:10%;" >
        附件：   
        </td>
        <td colspan="7">
            <table id="attachTB">
                <tr>
                    <td>
                    <input type="file" name="fileUPs" class="fileUP" /><input type="button" class="btn btn-xs btn-info" value="删除" onclick="delAttach(this);" /><input type="button" class="btn btn-xs btn-primary" value="再加个附件" onclick="addAttach();" />
                    </td>
                </tr>
            </table>
    	</td>
    </tr>
    <tr>
        <td colspan="2" align="center">
        <asp:HiddenField ID="HdnMessageID" runat="server" />&nbsp;
        <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" OnClientClick="return SendConfirm();" class="btn btn-primary"/>&nbsp;
        <asp:Button ID="Button1" runat="server" Text="存草稿" OnClick="Button1_Click" class="btn btn-primary" />&nbsp; 
        <asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-primary" />
        </td>
    </tr>
</table>
</div>
</div>
</div>
<%=Call.GetUEditor("EditorContent",2)%>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
var uptr = '<tr><td><input type="file" name="fileUP" class="fileUP" /><input type="button" class="btn btn-xs btn-info" value="删除" onclick="delAttach(this);" /></td></tr>';
function addAttach() {
	$("#attachTB").append(uptr);
}
function delAttach(obj) {
	$(obj).parent().remove();
}
function delHasFile(v, obj) {
	rv = $("#hasFileData").val().replace(v + ",", "");
	$("#hasFileData").val(rv)
	$(obj).parent().remove();
}
function ShowSelUser(n) {
    var url = "";
    if (n == 1)
        url = "/Common/Dialog/SelStructure.aspx?Type=AllInfo#ReferUser";
    else
        url = "/Common/Dialog/SelStructure.aspx?Type=AllInfo#CCUser";
    comdiag.maxbtn = false;
    ShowComDiag(url, "选择用户");
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
	CloseComDiag();
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
</asp:Content>

