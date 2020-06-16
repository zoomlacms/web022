<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Message_Mobile, App_Web_rarj43kt" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>手机短信</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="pub"></div>
<div class="margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Message.aspx">消息中心</a></li>
<li class="active">手机短信</li> 
</ol>
<div class="btn-group">
<a href="MessageSend.aspx" class="btn btn-primary">新消息</a>
<a href="Message.aspx" class="btn btn-primary">收件箱</a>
<a href="MessageOutbox.aspx" class="btn btn-primary">发件箱</a>
<a href="MessageDraftbox.aspx" class="btn btn-primary">草稿箱</a>
<a href="MessageGarbagebox.aspx" class="btn btn-primary">垃圾箱</a>
<a href="Mobile.aspx" class="btn btn-primary">手机短信</a>
</div>
<div class=" margin_t10">
<div class="us_seta">
<table class="table table-bordered table-hover table-striped">
<tr>
<td class="text-center" colspan="2"> 发送手机短信 </td>
</tr>
<tr>
<td align="right" style="height: 28px; width: 15%;">接收方手机号码：</td>
<td>
<table id="TblAddMessage" width="100%" visible="true" runat="server">
<tr>
<td>
<asp:TextBox ID="TxtInceptUser" runat="server" Width="326px" class="form-control"></asp:TextBox>
<%--(多条信息发送以半角逗号区隔，最多支持100个/次超100个请自行做循环)--%>一次只能发给一个号码一条短信
<asp:RegularExpressionValidator ControlToValidate="TxtInceptUser" ID="rev1" runat="server" ValidationExpression="^(1(([35][0-9])|(47)|[8][012356789]))\d{8}$">手机号码有误，请重新输入！</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtInceptUser" runat="server">手机号码不能为空 </asp:RequiredFieldValidator>
</td>
<td></td>
</tr>
</table>
</td>
</tr>
<tr>
<td align="right" style="height: 23px; width: 15%;">短信内容：<br />
(字数70个字以内)</td>
<td>
<asp:TextBox ID="EditorContent" runat="server" Rows="10" TextMode="MultiLine" style="max-width:500px;" class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator></td>
</tr>

<tr align="center">
<td colspan="2" style="height: 50px;" align="center">
<asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" CssClass="btn btn-primary" />
<asp:Button ID="BtnReset" runat="server" Text="清除" OnClientClick="return CheckIsMobile(document.getElementById('TxtInceptUser').value)" OnClick="BtnReset_Click" class="btn btn-primary" />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</td>
</tr>
</table>
</div>
<div class="alert alert-success">
<asp:Label ID="LblMobile" runat="server" Text="Label" Style="color: Red;"></asp:Label>
提示：系统支持以Mobile.aspx?MB=[手机号码]&txt=[发送内容]方式GET将手机号码传值发送，如：Mobile.aspx?MB=13177777714&txt=默认短信内容。
</div>
</div>
</div>
</asp:Content>
