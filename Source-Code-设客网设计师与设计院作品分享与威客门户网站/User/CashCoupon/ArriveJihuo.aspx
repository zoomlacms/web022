<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_CashCoupon_ArriveJihuo, App_Web_v0pwsqry" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>优惠券激活</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">优惠券激活</li>
    </ol>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center">优惠劵激活</td>
        </tr>
        <tr>
            <td class="text-right" style="width:50%">
                优惠券编号：
            </td>
            <td>
                <asp:TextBox class="border" CssClass="form-control pull-left" ID="ANo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">优惠券密码：</td>
            <td>
                <asp:TextBox class="form-control pull-left" ID="APwd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center"><asp:Button ID="Btn" runat="server" Text="激活优惠券" CssClass="btn btn-primary" OnClick="Btn_Click" /></td>
        </tr>
    </table>
</asp:Content>