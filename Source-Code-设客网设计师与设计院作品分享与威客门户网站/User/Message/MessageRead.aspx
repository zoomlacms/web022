<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageRead, App_Web_rarj43kt" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>阅读短消息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>		
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Message.aspx">消息中心</a></li>
<li class="active">阅读信息</li>
<div class="clearfix"></div>
</ol>
<div class="btn-group">
<a href="MessageSend.aspx" class="btn btn-primary">新消息</a>
<a href="Message.aspx" class="btn btn-primary">收件箱</a>
<a href="MessageOutbox.aspx" class="btn btn-primary">发件箱</a>
<a href="MessageDraftbox.aspx" class="btn btn-primary">草稿箱</a>
<a href="MessageGarbagebox.aspx" class="btn btn-primary">垃圾箱</a>
<a href="Mobile.aspx" class="btn btn-primary">手机短信</a>
</div>
<table class="table table-bordered table-hover table-striped" style="margin-top:10px;">
<tr>
<td colspan="2" class="text-center">
会员短消息
</td>
</tr>
<tr>
<td>发件人：</td>
<td>
<asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td>收件人：</td>
<td>
<asp:Label ID="LblIncept" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td>主题：</td>
<td>
<asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td>发送时间：</td>
<td>
<asp:Label ID="LblSendTime" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td>内容：</td>
<td>
<asp:TextBox runat="server" ID="LblContent" TextMode="MultiLine" style="width:800px;height:500px;"></asp:TextBox>
</td>
</tr>
<tr>
<td colspan="2" class="text-center">
<asp:Button ID="BtnDelete" runat="server" Text="删除" class="btn btn-primary" OnClick="BtnDelete_Click" OnClientClick="return confirm('是否要删除此短消息？')" />
<asp:Button ID="BtnReply" runat="server" Text="回复" class="btn btn-primary" OnClick="BtnReply_Click" Visible="false" />
</td>
</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<%=Call.GetUEditor("EditorContent",2) %>
</asp:Content>
