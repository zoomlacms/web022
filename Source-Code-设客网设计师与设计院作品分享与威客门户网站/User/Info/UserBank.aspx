<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_UserBank, App_Web_mugy5rhh" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>银行信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">银行信息</li>
</ol>
</div>
<div class="container">
<div class="us_seta" style="margin-top: 10px;" id="manageinfos" runat="server">
<uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
</div>
<div class="us_seta" id="manageinfo" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr>
<td align="right" width="40%">开户银行
</td>
<td>
<asp:TextBox CssClass="form-control" ID="txtBankName" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right" width="40%">开 户 人</td>
<td>
<asp:TextBox class="form-control text_300" ID="txtUserName" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right" width="40%">银行卡号
</td>
<td>
<asp:TextBox ID="txtBankNumber" CssClass="form-control text_300" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td colspan="2" align="center" class="btn_green">
<asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="提交" OnClick="Button1_Click" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
