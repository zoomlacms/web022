<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_MoneyConver, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/ZL_Regex.js"></script>
    <title>虚拟币转换</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%ZoomLa.Common.function.WriteErrMsg("该页面关闭访问");%>
<div id="pageflag" data-nav="shop" data-ban="UserInfo"></div>
<div class="container margin_t10">
    <ol class="breadcrumb">
        <li>您现在的位置：<a href="/" title="网站首页"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li>
        <li class="active">虚拟币互转</li>
    </ol>
</div>
<div class="container btn_green">
    <table class="table table-hover table-bordered">
        <tr>
            <td class ="td_md">奖金:</td>
            <td>
                <span class="desc">现有<asp:Label runat="server" ID="Purse_L2"></asp:Label></span>
                <asp:TextBox runat="server" ID="MoneyNum_T" CssClass="form-control text_x num" Text="0" />
                <asp:Label runat="server" ID="Cost_L" Text="手续费:0"></asp:Label>
                <asp:LinkButton runat="server" CommandArgument="purse" CommandName="money" class="btn btn-primary" OnClientClick="return moneysure();" OnClick="Money_Click">提现</asp:LinkButton>
                <a href="WithdrawLog.aspx" class="btn btn-primary">提现记录</a>
                <span class="r_gray">*只能为100的整数,提现需收取10%的手续费</span>
            </td></tr>
        <tr>
            <td>奖金(余额):</td>
            <td><span class="desc">现有<asp:Label runat="server" ID="Purse_L"></asp:Label></span>
                <asp:TextBox runat="server" ID="PurseNum_T" CssClass="form-control text_xs num" Text="0" />转换为
                <div class="btn btn-group">
                    <asp:LinkButton runat="server" CommandArgument="purse" CommandName="sicon" class="btn btn-primary" OnClientClick="return sure();" OnClick="Purse_Click">购物币</asp:LinkButton>
                    <asp:LinkButton runat="server" CommandArgument="purse" CommandName="point" class="btn btn-primary" OnClientClick="return sure();" OnClick="Purse_Click">文币</asp:LinkButton>
                </div>
            </td>
        </tr>
        <tr><td>文币(积分):</td><td>
            <span class="desc">现有<asp:Label runat="server" ID="Point_L"></asp:Label></span>
            <asp:TextBox runat="server" ID="PointNum_T" CssClass="form-control text_xs num" Text="0" />转换为
                <div class="btn btn-group">
                    <asp:LinkButton runat="server"  class="btn btn-primary" OnClientClick="return sure();" OnClick="Point_Click">购物币</asp:LinkButton>
                </div>
        </td>
        </tr>
        <tr><td>购物币(银币):</td><td><span class="desc">现有<asp:Label runat="server" ID="Sicon_L"></asp:Label></span></td></tr>
        <tr>
            <td>学分(点券):</td>
            <td><span class="desc">现有<asp:Label runat="server" ID="UserPoint_L"></asp:Label></span>
                <asp:TextBox runat="server" ID="UserPointNum_T" CssClass="form-control text_xs num" Text="0" />转换为
                <div class="btn btn-group">
                    <asp:LinkButton runat="server" class="btn btn-primary" OnClientClick="return sure();" OnClick="UserPoint_Click">购物币</asp:LinkButton>
                </div>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {
            ZL_Regex.B_Num(".num");
            $("#MoneyNum_T").blur(function () {
                var val = this.value; this.value = parseInt(val / 100) * 100;
                $("#Cost_L").text("手续费:" + (this.value * 0.1));
            });
        })
        function sure()
        {
            return confirm("确定要转换吗");
        }
        function moneysure()
        {
            return confirm("确定要提现吗");
        }
    </script>
    <style type="text/css">
        .desc {display:inline-block;width:80px;}
    </style>
</asp:Content>