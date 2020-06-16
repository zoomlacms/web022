<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Default.master" inherits="User_Order_MyOrderRepair, App_Web_ivqqslkk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>返修/退货记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="shop" data-ban="shop"></div> 
    <div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">返修/退货记录</li>
    </ol>
    <div class="btn-group">
            <a href="PreViewOrder.aspx?menu=Cartinfo" class="btn btn-primary">购物车管理</a>
            <a href="OrderList.aspx?menu=Orderinfo" class="btn btn-primary">我的订单</a>
            <a href="MyOrderRepair.aspx" class="btn btn-primary">返修/退货记录</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo" class="btn btn-primary">订单管理</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=2" class="btn btn-primary">已发货订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=3" class="btn btn-primary">正常订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=4" class="btn btn-primary">成交订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=5" class="btn btn-primary">回收站</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1&panel=1" class="btn btn-primary">代购历史订单</a>
            <a href="HotelOrder.aspx?menu=Cartinfo" class="btn btn-primary">酒店订单</a>
            <a href="FeightOrder.aspx?menu=Cartinfo" class="btn btn-primary">机票订单</a>
            <a href="TripOrder.aspx?menu=Cartinfo" class="btn btn-primary">旅游订单</a>
            <a class="btn btn-primary" href="/User/Info/UserRecei.aspx">收货地址</a>
        </div>
    </div>
    <div class="container myorderrepair">
        <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" OnPageIndexChanging="EGV_PageIndexChanging" 
            class="table table-striped table-bordered table-hover " PageSize="10" EmptyDataText="没有相关数据" >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="编号" ItemStyle-CssClass="td_s" />
                <asp:BoundField DataField="OrderNo" HeaderText="订单编号" />
                <asp:TemplateField HeaderText="商品名称">
                    <ItemTemplate>
                        <div class="proinfo_div">
                            <div class="pro_img"><img src="/<%#Eval("Thumbnails") %>" /></div>
                            <div class="pro_title"><%#Eval("Proname") %></div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="ReqRepair.aspx?id=<%#Eval("ID") %>" target="_blank">查看</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
        
    <style>
        .myorderrepair .proinfo_div div{float:left;margin-left:5px;}
        .myorderrepair .proinfo_div .pro_img img{width:70px;height:80px;}
        .myorderrepair .proinfo_div .pro_title{padding-top:10px;}
    </style>
</asp:Content>


