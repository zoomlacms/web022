<%@ page title="兑换银币" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_ExchangeSilverCoin, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">兑换银币</li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<div runat="server" id="Login" class="us_seta" visible="false">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
</tr>
<tr>
<td style="width:50%;" class="text-right">
<asp:TextBox ID="Second" CssClass=" form-control" runat="server" TextMode="Password"></asp:TextBox>
</td>
<td>
<asp:Button ID="sure" CssClass="btn btn-primary" runat="server" Text="确定" OnClick="sure_Click" />
</td>
</tr>
</table>
</div>
<div runat="server" id="DV_show">
<div class="us_seta" id="manageinfo" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">兑换银币</td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">用户名：</td>
<td style="width: 80%; line-height: 30px">&nbsp;<asp:Label ID="LblUser" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">银币余额：</td>
<td style="width: 80%; line-height: 30px">&nbsp;<asp:Label ID="LblSilverCoin" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">积分余额：</td>
<td style="width: 80%; line-height: 30px">&nbsp;<asp:Label ID="LblUserExp" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td style="width: 20%; line-height: 30px; text-align: right">兑换金额：</td>
<td style="width: 80%; line-height: 30px">&nbsp; &nbsp;&nbsp;将积分余额：
<asp:TextBox ID="TxtExp" CssClass="form-control" style="max-width:80px;" runat="server" onKeyUp="value=value.replace(/[^\d\.]/g,'')"></asp:TextBox>分兑换成银币&nbsp;&nbsp;兑换比率：<asp:Label ID="LblExpRate" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr class="btn_green">
<td colspan="2" align="center">
<asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="兑换" OnClick="EBtnSubmit_Click" runat="server" />
<input id="Button1" class="btn btn-primary" type="button" value="返回" onclick="javascript: location.href = 'UserInfo.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</div>
</asp:Content>
