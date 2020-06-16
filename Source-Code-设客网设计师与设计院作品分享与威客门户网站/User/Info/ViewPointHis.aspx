<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Info.ViewPointHis, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>点券明细记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">点券明细记录</li>
</ol>
</div>
<div class="container">
<div id="manageinfo" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">点券明细详情</td>
</tr>
<tr>
<td style="width: 20%; float: left; text-align: right">日期时间：
</td>
<td style="width: 80%;">
<asp:Label ID="LblOperDate" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; float: left; text-align: right">操作IP：
</td>
<td style="width: 80%;">
<asp:Label ID="LblOperatorIP" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; float: left; text-align: right">数量：
</td>
<td style="width: 80%;">
<asp:Label ID="LblCount" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; float: left; text-align: right">操作人：
</td>
<td style="width: 80%;">
<asp:Label ID="LblOperator" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; float: left; text-align: right">备注：
</td>
<td style="width: 80%;">
<asp:Label ID="LblDetail" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr class="btn_green">
<td colspan="2" align="center">
<input id="Button1" class="btn btn-primary" type="button" value="返回" onclick="javascript: location.href = 'PointHis.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
