<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_UserDeci_Modify, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>用户地址薄</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">我的地址簿</a></li>
<li class="active">修改地址薄</li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" align="center">
<asp:Label ID="Label1" runat="server" Text="添加地址薄"></asp:Label>
</td>
</tr>
<tr>
<td align="right" class="td_l">收货人姓名：
</td>
<td>
<asp:HiddenField ID="hfid" runat="server" />
<asp:TextBox ID="txtName" runat="server" CssClass="form-control text_md pull-left"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtName" ErrorMessage="收货人姓名不能为空!">
</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">所在省市：
</td>
<td>
<asp:DropDownList ID="ddlProvince" CssClass="form-control text_md pull-left" Width="90px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
</asp:DropDownList>
<span class="tips pull-left" style="margin-right:5px;">省</span>
<asp:DropDownList ID="ddlCity" CssClass="form-control text_md pull-left" Width="150px" runat="server"></asp:DropDownList>
<span class="tips pull-left">市</span>
</td>
</tr>
<tr>
<td align="right">具体地址：
</td>
<td>
<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control text_md pull-left"  Height="108px"></asp:TextBox>
<font color="gray">具体地址可以不加省市</font>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtAddress" ErrorMessage="具体地址不能为空!">
</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right" class="style3">E-Mail：
</td>
<td class="style3">
<asp:TextBox ID="txtmail" runat="server" CssClass="form-control text_md pull-left"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtmail" CssClass="tips" Display="Dynamic" runat="server" ErrorMessage="E-Mail不能为空！" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" Display="Dynamic" CssClass="tips" ControlToValidate="txtmail" ErrorMessage="邮件地址不规范" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$">
</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td align="right" class="style3">邮政编码：
</td>
<td class="style3">
<asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control text_md pull-left"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="tips" Display="Dynamic" ControlToValidate="txtZipCode" ErrorMessage="邮政编码不能为空!">
</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="^\d{6}$" ControlToValidate="txtZipCode" Display="Dynamic" CssClass="tips" ErrorMessage="只能输入正确的邮政编码">
</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td align="right">电话号码：
</td>
<td>
<asp:TextBox runat="server" CssClass="form-control text_md pull-left" ID="phoneSection" Width="80px"></asp:TextBox>
<span style=" float:left; line-height:32px; margin-left:5px;margin-right:5px;">-</span>
<asp:TextBox runat="server" ID="phone" CssClass="form-control text_md pull-left"></asp:TextBox><span class="tips"><font color="gray">区号-电话号码</font></span>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="^\d{3,4}$"  CssClass="tips" Display="Dynamic" ControlToValidate="phoneSection" ErrorMessage="请输入正确的区号"></asp:RegularExpressionValidator>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" CssClass="tips" Display="Dynamic" ValidationExpression="^\d{5,12}$" ControlToValidate="phone" ErrorMessage="请输入正确的电话号码">
</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td align="right">手机号码：
</td>
<td>
<asp:TextBox ID="txtMobile" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="^1[(0-9)]{10}$" CssClass="tips" ControlToValidate="txtMobile" ErrorMessage="按照手机号规则输入">
</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td align="right">是否默认：
</td>
<td>
<asp:CheckBox ID="isDefault" runat="server" Text="" />
</td>
</tr>
<tr>
<td colspan="2" align="center">
<asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="添加" OnClick="Button1_Click" />&nbsp;
<asp:Button ID="Button2" CssClass=" btn btn-primary" runat="server" Text="取消" OnClientClick="javascript:location.href='UserRecei.aspx';return false;" CausesValidation="False" />
</td>
</tr>
</table>
</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        function Secc() {
            alert('添加成功！');
            location.href = 'UserRecei.aspx';
        }
        function Seccerr() {
            alert('添加失败！');
        }
    </script>
</asp:Content>
