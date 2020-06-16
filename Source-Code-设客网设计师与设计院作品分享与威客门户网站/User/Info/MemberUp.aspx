<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_MemberUp, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>会员升级</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">会员升级</li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<div class="us_seta" id="manageinfo" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">会员升级</td>
</tr>
<tr>
<td style="width: 20%; text-align: right">用户名：
</td>
<td style="width: 80%;">&nbsp;<asp:Label ID="LblUser" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; text-align: right">当前会员等级：
</td>
<td style="width: 80%;">&nbsp;<asp:Label ID="LblUserGrade" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td style="width: 20%; text-align: right">资金余额：
</td>
<td style="width: 80%;">&nbsp;<asp:Label ID="LblBalance" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td style="width: 20%; text-align: right">选择升级规则：
</td>
<td style="width: 80%;">
<%--<asp:DropDownList ID="MemberUpRule" runat="server">
</asp:DropDownList>--%>
<asp:RadioButtonList ID="MemberUpRule" runat="server">
</asp:RadioButtonList>
</td>
</tr>
<tr>
<td colspan="2" align="center" class="btn_green">
<asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="立即升级" runat="server" OnClick="EBtnSubmit_Click" />
&nbsp;&nbsp;
<input id="Button1" class="btn btn-primary" type="button" value="返回" onclick="javascript: location.href = 'UserInfo.aspx'" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
