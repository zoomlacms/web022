<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_PrintServer_HotelOrder, App_Web_ivqqslkk" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>酒店订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">酒店订单管理</li> 
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
            <a href="HotelOrder.aspx?menu=Cartinfo" class="btn btn-primary">酒店订单</a>
            <a href="FeightOrder.aspx?menu=Cartinfo" class="btn btn-primary">机票订单</a>
            <a href="TripOrder.aspx?menu=Cartinfo" class="btn btn-primary">旅游订单</a>
            <a class="btn btn-primary" href="/User/Info/UserRecei.aspx">收货地址</a>
        </div>
</div>
    <div class="container margin_t10">
    <div class="us_seta">
        <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="false">
            <ZL:ExGridView runat="server" ID="EGVH" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover margin_t5" EmptyDataText="没有相关数据!!" 
                OnPageIndexChanging="EGVH_PageIndexChanging" >
                <Columns>
                    <asp:TemplateField HeaderText="订单编号">
                        <ItemTemplate>
                                <a href="OrderProList?OrderNo=<%#Eval("OrderNo") %>"><%#Eval("OrderNo")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="客户名称" DataField="Rename" />
                    <asp:BoundField HeaderText="入住时间" DataField="AddTime" />
                    <asp:TemplateField HeaderText="订单金额">
                        <ItemTemplate>
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="实际金额">
                        <ItemTemplate>
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
            
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
            <ul>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">酒店名称 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">价格 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">入住人 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">入住时间 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">到店时间 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">城市 </li>
            </ul>
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <ul>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden">
                            <%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%# DataBinder.Eval(Container, "DataItem.Shijia", "{0:N2}")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%# Eval("Proinfo")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd}")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%#Eval("PerID")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%# Eval("city")%></li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <ul>
                <li style="width: 100%; float: none; line-height: 24px; text-align: left; background-color: #F7F7F7">合计：<asp:Label ID="preojiage" runat="server" Text=""></asp:Label>元 </li>
            </ul>
        </asp:Panel>
    </div>
</div>
</asp:Content>
