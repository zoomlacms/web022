<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_PostPointP, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>佣金赠送积分</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li><a href="PostPoint.aspx">积分赠送</a></li>
<li class="active">佣金赠送积分</li>
</ol>
</div>
<div class="container">
<div id="manageinfo" class="us_seta" style="margin-top: 10px;">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">佣金赠送积分</td>
</tr>
<tr>
<td style="width: 20%" align="right">会员余额：</td>
<asp:HiddenField ID="rblExp" runat="server" Value="3" />
<td>
<asp:Label ID="lblCoin" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td align="right">赠送会员：</td>
<td>
<asp:TextBox ID="UserName2" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged" CssClass="form-control text_300" runat="server" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName2" ErrorMessage="请输入用户名" SetFocusOnError="True"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">赠送姓名：</td>
<td>
<asp:TextBox ID="TrueName" CssClass="form-control text_300" runat="server"  Style="float: left;" Width="140"></asp:TextBox>
</td>
</tr>

<tr>
<td align="right">赠送积分数：</td>
<td>
<asp:TextBox ID="TxtScore" CssClass="form-control text_300" runat="server" AutoPostBack="True" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="TxtScore" ErrorMessage="积分赠送只能是数字" ValidationExpression="^\+?[1-9][0-9]*$"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtScore" ErrorMessage="请输入赠送积分数" SetFocusOnError="True"></asp:RequiredFieldValidator>

</td>
</tr>
<tr>
<td align="right">应付佣金：</td>
<td>
<asp:TextBox ID="Txtpurse" CssClass="form-control text_300" runat="server" ReadOnly="True"></asp:TextBox></td>
</tr>
<tr>
<td style="width: 20%" align="right">支付密码 ：</td>
<td>
<asp:TextBox ID="Second" CssClass="form-control text_300" runat="server" Value="" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td style="width: 20%" align="right">备注：</td>
<td>
<asp:TextBox ID="TxtDetail" runat="server" Rows="10" TextMode="MultiLine" class="form-control text_300" Height="60px"></asp:TextBox></td>
</tr>
<tr class="btn_green">
<td colspan="2" align="center">
<asp:HiddenField ID="Hdn_t" runat="server" />
<asp:HiddenField ID="HdnUserID" runat="server" />
<asp:Button ID="EBtnSubmit" Text="执行" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
<asp:Button ID="Button1" Text="取消" runat="server" CausesValidation="false" OnClick="Button1_Click" class="btn btn-primary" /></td>
</tr>
</table>
</div>
</div>
</asp:Content>