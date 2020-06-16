<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_OrderForm_ContestList, App_Web_xtlk0k3d" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>团购列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">竞拍信息</li>
    </ol>
    <div class="s_bright">
        <!-- str -->
        <div class="btn-group">
            <a href="ShopCarList.aspx?menu=Cartinfo" class="btn btn-primary">购物车管理</a>
            <a href="../ViewOrder.aspx?menu=Orderinfo" class="btn btn-primary">订单管理</a>
            <a href="../ViewOrder.aspx?menu=Orderinfo&type=1" class="btn btn-primary">已确定的订单</a>
            <a href="../ViewOrder.aspx?menu=Orderinfo&type=2" class="btn btn-primary">已发货订单</a>
            <a href="../ViewOrder.aspx?menu=Orderinfo&type=3" class="btn btn-primary">正常订单</a>
            <a href="../ViewOrder.aspx?menu=Orderinfo&type=4" class="btn btn-primary">已成交订单</a>
            <a href="../ViewOrder.aspx?menu=Orderinfo&type=5" class="btn btn-primary">已作废订单</a>
        </div>
        <div class="us_topinfo" style="margin-top:10px;">
            <a href="ShopCarList.aspx?menu=Cartinfo">购物车管理</a> | <a href="ColonelList.aspx">团购信息</a> | <a href="ContestList.aspx">竞拍信息</a>
        </div>
        <div class="us_seta" style="margin-top: 10px;">
            <table class="table table-bordered table-hover table-striped">
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label1" runat="server" BorderWidth="0px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>图片</td>
                    <td>商品名称</td>
                    <td>价格</td>
                    <td>交易状态</td>
                </tr>
                <asp:Repeater ID="cartinfo" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="width: 9.5%; text-align: center;">
                                <%#getproimg(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                            </td>
                            <td style="width: 20%; text-align: center;">
                                <%#Eval("proname")%>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <%#getjiage("1",DataBinder.Eval(Container, "DataItem.ColonelMoney", "{0}"))%>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <%#getprojia(DataBinder.Eval(Container, "DataItem.Settle", "{0}"))%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="4" class="text-center">共
						<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        个商品
						<asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                            Text="" />页
						<asp:Label ID="pagess" runat="server" Text="" />个商品/页 转到第<asp:DropDownList ID="DropDownList1"
                            runat="server" AutoPostBack="True">
                        </asp:DropDownList>页
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <style>
        .table td{ text-align:center;}
    </style>
</asp:Content>
