<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_SetSecondPWDWeb, App_Web_kh00etpl" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>支付密码设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">支付密码<a href="SetSecondPwd.aspx">[设置支付密码]</a></li>
    </ol>
    <div style="margin-top: 10px;">
        <div class="us_seta" runat="server">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td style="width: 180px;">页面名称</td>
                    <td style="width: 380px;">操作</td>
                </tr>
                <tr>
                    <td style="width: 180px;">会员信息</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="open" OnCommand="open_Command" CommandName="open" CommandArgument="/User/Info/UserInfo.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">虚拟钱包兑换</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton1" OnCommand="open_Command" CommandName="open" CommandArgument="/User/Info/ExchangeDP.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">兑换银币</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton3" OnCommand="open_Command" CommandName="open" CommandArgument="/User/Info/ExchangeSilverCoin.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">基本信息设置</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton5" OnCommand="open_Command" CommandName="open" CommandArgument="/User/Info/UserBase.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">登入密码设置</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton7" OnCommand="open_Command" CommandName="open" CommandArgument="/User/ChangPSW.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">商城订单</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton9" OnCommand="open_Command" CommandName="open" CommandArgument="/User/PreViewOrder.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">卖家订单</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton11" OnCommand="open_Command" CommandName="open" CommandArgument="/User/Profile/OrderManage.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">积分补录</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton13" OnCommand="open_Command" CommandName="open" CommandArgument="/User/AddUserOrder.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">有问必答</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton15" OnCommand="open_Command" CommandName="open" CommandArgument="/user/iServer/FiServer.aspx">开启</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px;">投稿管理</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton17" OnCommand="open_Command" CommandName="open" CommandArgument="/User/Content/Default.aspx">开启</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 180px;">店铺在线支付</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton18" OnCommand="open_Command" CommandName="open" CommandArgument="/PayOnline/StorePayOnline.aspx">开启</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 180px;">商城在线支付</td>
                    <td style="width: 80px;">
                        <asp:LinkButton runat="server"
                            ID="LinkButton19" OnCommand="open_Command" CommandName="open" CommandArgument="/PayOnline/PayOnline.aspx">开启</asp:LinkButton></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
