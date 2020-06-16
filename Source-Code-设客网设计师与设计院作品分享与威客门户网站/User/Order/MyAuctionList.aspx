<%@ page language="C#" autoeventwireup="true" inherits="User_Shopfee_MyAuctionList, App_Web_tdtfdfrp" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>竞拍记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">购物订单管理</li>
    </ol>
</div>
<div class="container">
    <div class="btn-group btn_green btn_green_xs">
        <a href="PreViewOrder.aspx?menu=Cartinfo" class="btn btn-primary">购物车管理</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo" class="btn btn-primary">订单管理</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=1" class="btn btn-primary">已确定的订单</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=2" class="btn btn-primary">已发货订单</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=3" class="btn btn-primary">正常订单</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=4" class="btn btn-primary">成交订单</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=5" class="btn btn-primary">回收站</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=0" class="btn btn-primary">代购订单</a>
        <a href="PreViewOrder.aspx?menu=Orderinfo&type=1&panel=1" class="btn btn-primary">代购历史订单</a>
        <a href="MyAuctionList.aspx" class="btn btn-primary">竞拍记录</a>
        <a href="HotelOrder.aspx?menu=Cartinfo" class="btn btn-primary">酒店订单</a>
        <a href="FeightOrder.aspx?menu=Cartinfo" class="btn btn-primary">机票订单</a>
        <a href="TripOrder.aspx?menu=Cartinfo" class="btn btn-primary">旅游订单</a>
    </div>
</div>
<div class="container">
<div class="us_seta">
    <table class="table table-striped table-bordered" style="margin-bottom: 0;">
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label1" runat="server" Text="竞拍记录"></asp:Label>
                    </td>
                </tr>
            </table>
    <div class="u_cnt">
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr>
                <td width="10%" >
                    <span class="tdbgleft">ID</span>
                </td>
                <td width="20%">商品名称</td>
                <td width="10%">竞拍类型</td>
                <td width="10%">竞拍状态</td>
                <td width="10%">竞拍结果</td>
                <td width="30%">竞拍时间</td>
                <td width="5%">
                    <span class="tdbgleft">操作</span>
                </td>
            </tr>
            <asp:Repeater ID="Promotions" runat="server">
                <ItemTemplate>
                    <tr>
                        <td >
                            <%#Eval("ProID")%>
                        </td>
                        <td >
                            <%#GetName(Eval("ProID"))%>
                        </td>
                        <td >
                            <%#GetType(Eval("ProID"))%>
                        </td>
                        <td >
                            <%#GetState(Eval("ProID"))%>
                        </td>
                        <td>
                            <%#GetCart(Eval("ProID"))%>
                        </td>
                        <td >
                            <%#GetTime(Eval("ProID"))%>
                        </td>
                        <td>
                            &nbsp;<a href="ShowAuction.aspx?id=<%#Eval("ProID") %>">查看</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr >
                <td colspan="7" align="center" class="tdbgleft">
                    共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条记录
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged" Width="30px"></asp:TextBox>
                    条记录/页 转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    页
                </td>
            </tr>
        </tbody>
    </table>
        </div>
</div>
</div>
</asp:Content>