<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_ExchangeIntegral, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>兑换金额</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">兑换金额</li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<div class="us_seta" id="manageinfo" runat="server">
<h1 style="text-align: center">兑换金额</h1>
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">兑换金额</td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">用户名：</td>
<td style="width: 80%; line-height: 30px">&nbsp;<asp:Label ID="LblUser" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">资金余额：</td>
<td style="width: 80%; line-height: 30px">&nbsp;<asp:Label ID="LblBalance" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">积分余额：</td>
<td style="width: 80%; line-height: 30px"><asp:Label ID="LblUserExp" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">兑换金额：</td>
<td style="width: 80%; line-height: 30px">
将积分余额：<asp:TextBox ID="TxtExp" CssClass="form-control" style="max-width:80px;" runat="server"></asp:TextBox>分兑换成金额
<br />兑换比率：<asp:Label ID="LblExpRate" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td colspan="2" align="center" class="btn_green">
<asp:Button ID="EBtnSubmit" Text="兑换" CssClass="btn btn-primary" OnClick="EBtnSubmit_Click" runat="server" />
<input id="Button1" class="btn btn-primary" type="button" value="返回" onclick="javascript: location.href = 'UserInfo.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
