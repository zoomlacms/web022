<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Default.master" inherits="User_Order_OrderList, App_Web_ivqqslkk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的订单</title>
    <style>
        .table {margin-bottom:0px;}
        .orderlist .order-item{border:1px solid #ddd;margin-top:10px;}
        .orderlist .gray9{color:#999;}
        .orderlist .orderinfo{padding-left:20px; line-height:20px;}
        .orderlist .shopinfo{line-height:20px;}
        .orderlist .opinfo {line-height:20px;text-align:right;padding-right:15px;font-size:1.2em;color:gray;}
        .orderlist .tips_div{background-color:#f5f5f5;}
        .orderlist .top_div{line-height:30px; background-color:#f5f5f5;margin-top:10px;}
        .orderlist .prolist td{ line-height:70px; border-left:1px solid #ddd;height:70px;text-align:center;}
        .orderlist .prolist td:last-child{border-right:none;}
        .orderlist .proname div{padding:5px;}
        .orderlist .goodservice {text-align:right;padding-right:20px;}
        .orderlist .prolist .rowtd {line-height:20px;padding-top:30px;}
        .orderlist .order_navs{position:relative;}
        .orderlist .search_div{position:absolute;right:0px;top:3px;}
        .orderlist .ordertime{color:#999;font-size:12px;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div> 
<div class="container margin_t5">
<ol class="breadcrumb" style="margin-bottom:5px;">
    <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li class="active">我的订单</li>
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
    <div class="container orderlist margin_t5">
        <div class="order_navs">
            <ul class="nav nav-tabs" id="OrderType_ul" role="tablist">
                <li role="presentation" data-flag="all"><a href="?filter=">全部订单</a></li>
                <li role="presentation" data-flag="needpay"><a href="?filter=needpay">待付款</a></li>
                <li role="presentation" data-flag="receive"><a href="?filter=receive">待收货</a></li>
                <li role="presentation" data-flag="comment"><a href="?filter=comment">待评价</a></li>
                <li role="presentation" data-flag="recycle"><a href="?filter=recycle">回收站</a></li>
              </ul>
            <div class="input-group search_div text_300">
                <asp:TextBox ID="Skey_T" runat="server" placeholder="商品名称/商品编号/订单号" CssClass="form-control"></asp:TextBox>
              <span class="input-group-btn">
                <asp:LinkButton class="btn btn-default" ID="Search_Btn" runat="server" OnClick="Search_Btn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
              </span>
            </div>
        </div>
        <table class="table">
            <thead class="top_div"><tr>
                <th class="text-center">订单详情</th>
                <th class="td_md">数量</th>
                <th class="td_md">收货人</th>
                <th class="td_md">总计</th>
                <th class="td_md">状态</th>
                <th class="td_md">操作</th>
            </tr></thead>
        </table>
        <ZL:ExRepeater ID="Order_RPT" runat="server" OnPreRender="Order_RPT_PreRender" PagePre="<div class='clearfix'></div><div class='text-center'>" PageEnd="</div>"
             OnItemDataBound="Order_RPT_ItemDataBound" OnItemCommand="Order_RPT_ItemCommand" PageSize="10">
            <ItemTemplate>
                <div class="order-item">
                    <table class="table table-striped prolist">
                        <thead><tr class="tips_div">
                            <th class="orderinfo" colspan="1"><span class="gray9"><%#Eval("AddTime") %></span><span class="gray9">订单号：</span><%#Eval("OrderNo") %></th>
                            <th class="shopinfo" colspan="5"><i class="fa fa-home"> <asp:Label ID="Store_L" runat="server" /></i></th>
                            <th class="opinfo">
                                <asp:LinkButton Visible="false" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del2" OnClientClick="return confirm('您确定要删除该订单吗？');"><i class="fa fa-trash"title="删除"></i></asp:LinkButton></th>
                               </tr></thead>
                        <asp:Repeater ID="Pro_RPT" runat="server" EnableViewState="false" OnItemDataBound="Pro_RPT_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align:left;border-right:none;">
                                        <span>
                                            <a href="<%#GetShopUrl() %>" target="_blank"><img src="<%#GetImgUrl() %>" onerror="this.src='/Images/nopic.gif'" class="img50" /></a>
                                            <span><%#Eval("Proname") %><%#GetSnap() %></span>
                                        </span>
                                    </td>
                                    <td class="td_md goodservice" style="border-left:none;"><%#GetRepair() %></td>
                                    <td class="td_md gray9">x<%#Eval("Pronum") %></td>
                                    <asp:Literal runat="server" ID="Order_Lit" EnableViewState="false"></asp:Literal>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/Controls/DateHelper.js"></script>
    <script>
        function ConfirmAction(obj, a) {
            if (!confirm("确定要执行该操作吗?")) { return false; }
            var oid = $(obj).data("oid");
            $.post("", { action: a, "oid": oid }, function (data) {
                location = location;
            })
        }
        function ShowDrawback(oid) {
            comdiag.maxbtn = false;
            comdiag.title = "取消订单";
            comdiag.url = "/User/Order/DrawBack.aspx?id=" + oid;
            comdiag.ShowModal();
        }
        function CheckOrderType(flag) {
            $("#OrderType_ul li").removeClass('active');
            $("#OrderType_ul [data-flag='" + flag + "']").addClass('active');
        }
        $(function () {
            ComputeTime();
            setInterval(function () { ComputeTime(); }, 1000);
        })
        //倒计时
        function ComputeTime() {
            $(".ordertime").each(function () {
                var seconds = parseInt($(this).data("time") - 1);
                var timeMod = DateHelper.SecondToTime((seconds));
                if (timeMod.isHasTime()) {
                    var str = timeMod.hour + '小时' + timeMod.minute + '分'+timeMod.second+'秒';
                    if (timeMod.day > 0) { str = timeMod.day + "天" + str; }
                    $(this).html('<span class="glyphicon glyphicon-time"></span>' + str);
                    $(this).data("time", seconds);
                }
                else { $(this).html('订单关闭'); }
            });
        }
    </script>
</asp:Content>


