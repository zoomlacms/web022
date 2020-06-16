<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_WithDraw, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>提现申请</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="shop" data-ban="UserInfo"></div>
    <div class="container margin_t10">
        <ol class="breadcrumb">
            <li>您现在的位置：<a href="/" title="网站首页"><%= Call.SiteName%></a></li>
            <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
            <li><a href="/User/UserFunc/Deposit.aspx">资金管理</a></li>
            <li class="active">提现申请</li>
        </ol>
    </div>
    <div class="container">
        <div class="bgfff">
            <table class="table table-bordered table-hover table-striped">
                <tr><td>提现金额：</td><td><asp:Label runat="server" ID="Money_L" /></td></tr>
                <tr><td>申请日期：</td><td><asp:Label runat="server" ID="CDate_L" /></td></tr>
                <tr><td>开户人姓名：</td><td>
                    <asp:TextBox runat="server" CssClass="form-control  text_300" ID="PName_T" />
                    <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="PName_T" ErrorMessage="开户人姓名不能为空" ForeColor="Red" />
                                   </td></tr>
                <tr><td>银行名称：</td><td><asp:TextBox runat="server" CssClass="form-control text_300" ID="Bank_T" />
                    <asp:RequiredFieldValidator runat="server" ID="R2" ControlToValidate="Bank_T" ErrorMessage="银行名称不能为空" ForeColor="Red" />
                                </td></tr>
                <tr><td>银行卡号：</td><td>
                    <asp:TextBox runat="server" CssClass="form-control text_300" ID="Account_T" />
                    <asp:RequiredFieldValidator runat="server" ID="R3" ControlToValidate="Account_T" ErrorMessage="银行卡号不能为空" ForeColor="Red" />
                                  </td></tr>
                <tr><td></td><td><asp:Button runat="server" CssClass="btn btn-primary" ID="Sure_Btn" Text="申请提现" OnClick="Sure_Btn_Click" OnClientClick="disBtn(this);" /></td></tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
