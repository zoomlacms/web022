<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.ExchangePoint, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>兑换虚拟钱包金额</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= ZoomLa.Components.SiteConfig.SiteInfo.SiteName %></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">兑换<strong><asp:Label runat="server" ID="Nav1"></asp:Label></strong></li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">兑换<asp:Literal ID="LitPointName2" runat="server"></asp:Literal></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">用户名：</td>
<td style="width: 80%; line-height: 30px">
<asp:Label ID="LblUser" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">
<asp:Literal ID="LitPointName3" runat="server"></asp:Literal>信息：
</td>
<td style="width: 80%; line-height: 30px">
<asp:Label ID="LblUserPoint" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">资金余额：</td>
<td style="width: 80%; line-height: 30px">&nbsp;
<asp:Label ID="LblBalance" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">积分余额：</td>
<td style="width: 80%; line-height: 30px">&nbsp;
<asp:Label ID="LblUserExp" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">兑换：</td>
<td style="width: 80%; line-height: 30px">
<asp:RadioButton ID="RblBalance" runat="server" GroupName="ExchgType" Checked="true" Text="使用资金余额：" />
将
<asp:TextBox ID="TxtBalance" CssClass="form-control" style="max-width:80px;" runat="server"></asp:TextBox>
元兑换成
<asp:Literal ID="LitPointName4" runat="server"></asp:Literal>
兑换比率：
<asp:Label ID="LblMoneyRate" runat="server" Text=""></asp:Label><div class="clearfix"></div>
<asp:RadioButton ID="RblExp" runat="server" GroupName="ExchgType" Text="使用积分余额：" />
将
<asp:TextBox ID="TxtExp" runat="server" CssClass="form-control" style="max-width:80px;"></asp:TextBox>
分兑换成
<asp:Literal ID="LitPointName5" runat="server"></asp:Literal>
兑换比率：
<asp:Label ID="LblExpRate" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td colspan="2" class="text-center btn_green">
<asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="兑换" OnClick="EBtnSubmit_Click" runat="server" />
<input id="Button1" class="btn btn-primary" type="button" value="返回" onclick="javascript: location.href = 'UserInfo.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
