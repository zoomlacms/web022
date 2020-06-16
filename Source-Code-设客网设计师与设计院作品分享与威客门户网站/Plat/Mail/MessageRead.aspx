<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageRead, App_Web_jaatvzyj" validaterequest="false" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>阅读短消息</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<style>
.Messge_nav { margin-bottom: 10px; margin-top: 10px; }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mainDiv">
<div class="container-fluid">
  <ol class="breadcrumb">
	<li><a href="/Plat/Blog/">首页</a></li>
	<li><a href="/Plat/Task/">邮件</a></li>
	<li class="active">阅读信息</li>
  </ol>
</div>
<div class="btn-group Messge_nav"> <a class="btn btn-primary" href="MessageSend.aspx">写邮件</a> <a class="btn btn-primary" href="Default.aspx">收件箱</a> <a class="btn btn-primary" href="MessageOutbox.aspx">发件箱</a> <a class="btn btn-primary" href="MessageDraftbox.aspx">草稿箱</a> <a class="btn btn-primary" href="MessageGarbagebox.aspx">垃圾箱</a> <a class="btn btn-primary" href="Mobile.aspx">手机短信</a> </div>
<div style="margin-top: 10px;">
  <table class="table table-bordered table-striped">
	<tr>
	  <td style="width:20%" class="text-right">发件人：</td>
	  <td><asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">收件人：</td>
	  <td><asp:Label ID="LblIncept" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">短消息主题：</td>
	  <td><asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">发送时间：</td>
	  <td><asp:Label ID="LblSendTime" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">短消息内容：</td>
	  <td><asp:Literal runat="server" ID="txt_Content"></asp:Literal></td>
	</tr>
	<tr>
	  <td class="text-right">附件：</td>
	  <td runat="server" id="publicAttachTD"></td>
	</tr>
	<tr>
	  <td class="text-right">操作：</td>
	  <td><asp:Button ID="BtnReply" runat="server" Text="回复" CssClass="btn btn-primary" OnClick="BtnReply_Click" />
		<asp:Label ID="LBCopy" runat="server" Text="抄送文件无法操作" Visible="false"></asp:Label></td>
	</tr>
  </table>
</div>
</div>
</asp:Content>