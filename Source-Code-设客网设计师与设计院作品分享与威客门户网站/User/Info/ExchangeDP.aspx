<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_ExchangeDP, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>兑换虚拟钱包金额</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5"> 
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li>
        <li class="active">兑换虚拟钱包金额</li>
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
                <td style="width:50%;">
                    <asp:TextBox ID="Second" runat="server" CssClass="form-control pull-right" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:Button ID="sure" runat="server" CssClass="btn btn-primary btn_green" Text="确定" OnClick="sure_Click" /></td>
            </tr>
        </table>
    </div>
    <div runat="server" id="DV_show">
        <div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
            <h1 style="text-align: center">兑换虚拟钱包金额</h1>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td style="width: 20%; line-height: 30px; text-align: right">用户名：</td>
                    <td style="width: 80%; line-height: 30px">&nbsp;
                    <asp:Label ID="LblUser" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 20%; line-height: 30px; text-align: right">资金余额：</td>
                    <td style="width: 80%; line-height: 30px">&nbsp;
          <asp:Label ID="LblBalance" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 20%; line-height: 30px; text-align: right">虚拟钱包余额：</td>
                    <td style="width: 80%; line-height: 30px">&nbsp;
                        <asp:Label ID="LblUserExp" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%; line-height: 30px; text-align: right">兑换金额：</td>
                    <td style="width: 80%; line-height: 30px">&nbsp;&nbsp;&nbsp;将资金余额：
                        <asp:TextBox ID="TxtExp" CssClass="form-control" style="max-width:100px;" runat="server"></asp:TextBox>
                        元兑换成虚拟钱包资金&nbsp;&nbsp;兑换比率：
                        <asp:Label ID="LblExpRate" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr class="btn_green">
                    <td colspan="2" align="center">
                        <asp:Button ID="EBtnSubmit" Text="兑换" CssClass="btn btn-primary btn_green" OnClick="EBtnSubmit_Click" runat="server" />
                        <input id="Button1" type="button" class="btn btn-primary btn_green" value="返回" onclick="javascript: location.href = 'UserInfo.aspx'" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</asp:Content>
