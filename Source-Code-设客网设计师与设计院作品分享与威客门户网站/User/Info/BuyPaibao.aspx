<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_BuyPaibao, App_Web_efhcdohc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>购买拍宝套餐</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5"> 
    <ol class="breadcrumb">
    <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li><li><a href="UserInfo.aspx">账户管理</a></li>
    <li class="active">购买拍宝套餐</li>
    </ol>
</div>
<div class="container">
<div class="us_seta" id="manageinfo" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">购买拍宝套餐</td>
</tr>
<tr>
<td style="width: 30%;text-align: right">我的资金：
</td>
<td style="width: 70%; line-height: 30px">&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 30%;text-align: right">我的拍宝：
</td>
<td style="width: 70%; line-height: 30px">
<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="text-align: center" colspan="2">
<asp:Literal ID="txt_Timg" runat="server"></asp:Literal>
</td>
</tr>
<tr>
<td style="width: 30%;text-align: right">套餐名称：
</td>
<td style="width: 70%; line-height: 30px">&nbsp;<asp:Label ID="txt_Tname" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 30%;text-align: right">兑换比例(金钱/宝点)：
</td>
<td style="width: 70%; line-height: 30px">&nbsp;<asp:Label ID="txt_bili" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 30%;text-align: right">套餐说明：
</td>
<td style="width: 70%; line-height: 30px">&nbsp;<asp:Label ID="txt_Tinfo" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 30%;text-align: right">购买数量：
</td>
<td style="width: 70%; line-height: 30px">
<asp:TextBox ID="Bnum" CssClass="form-control text_300" runat="server">1</asp:TextBox>个
</td>
</tr>
<asp:HiddenField ID="hiden" runat="server" />
<tr>
<td class="btn_green" colspan="2" align="center">
<asp:Button ID="EBtnSubmit" Text="购买" CssClass="btn btn-primary" OnClick="EBtnSubmit_Click" runat="server" />
<input id="Button1" class="btn btn-primary" type="button" value="返回" onclick="javascript: location.href = 'Userinfo.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
