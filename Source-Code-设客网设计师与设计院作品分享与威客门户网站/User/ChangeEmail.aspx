<%@ page language="C#" autoeventwireup="true" inherits="User_ChangeEmail, App_Web_kh00etpl" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>修改邮箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="ChangeEmail"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">修改邮箱</li> 
</ol>
</div>
<div runat="server" id="Login" class="us_seta" style="position: absolute; top: 40%; left: 40%" visible="false">
<table>
    <tr>
   	 	<td colspan="2"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
    </tr>
    <tr>
        <td>
        <asp:TextBox ID="Second" runat="server" TextMode="Password"></asp:TextBox></td>
        <td>
    	<asp:Button ID="sure" runat="server" Text="确定" OnClick="sure_Click" /></td>
    </tr>
</table>
</div>
<div runat="server" id="DV_show">
<div class="container">
<div class="us_seta btn_green">
<asp:Panel ID="Panel" runat="server" Visible="true" Width="100%">
<table align="center" border="0" class="table table-striped table-bordered table-hover">
    <tr>
   	 	<td align="center" width="40%" class="auto-style1"><strong>原 邮 箱：</strong></td>
    	<td class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="发送验证码" OnClick="Button1_Click" />
        </td>       
    </tr>
    <tr>
        <td align="center" width="40%"><strong>请输入验证码：</strong></td>
        <td>
    	<asp:TextBox ID="TextBox1" runat="server" CssClass="form-control text_md" />
    	<font style="color: Red">*</font>
    	
    	</td>
    </tr>
    <tr>
        <td align="center" width="40% " colspan="2">
        <asp:Button ID="XiaYiBu" runat="server" CssClass="btn btn-primary" Text="下一步" OnClick="XiaYiBu_Click" />
        </td>
    </tr>
	<asp:Literal ID="Literal1" runat="server"></asp:Literal>
</table>
</asp:Panel>
<asp:Panel ID="PnlStep3" runat="server" Visible="false" Width="100%">
<table align="center" border="0">
    <tr>
        <td align="center" width="40%"><strong>新 邮 箱：</strong></td>
        <td>
    	<asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control text_md" />
    	<font style="color: Red">*</font>
    	<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail"
        ErrorMessage="邮件地址不规范" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
        </td>
    </tr>

    <tr align="center">
    	<td align="center" colspan="2">
        <asp:Button ID="BtnSubmit" runat="server" Text="提交" class="btn btn-primary" OnClick="BtnSubmit_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="BtnCancle" runat="server" Text="取消" OnClick="BtnCancle_Click" ValidationGroup="BtnCancel" class="btn btn-primary" /></td>    
    </tr>
    <tr align="center">
        <td>
        <asp:Literal ID="LitRegResult" runat="server"></asp:Literal>
        </td>
    </tr>
</table>
</asp:Panel>
<div style="width: 100%; text-align: center; margin-top: 10px">
<div style="width: 100%; text-align: center"></div>
</div>
</div>
</div>
</div>
</asp:Content>
