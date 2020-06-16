<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_OrderForm_ShopCarList, App_Web_25ddmwkv" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>购车列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">购物车管理</li>
    </ol>
    <div class="s_bright">
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
                    <td colspan="8" class="text-center">
                        <asp:Label ID="Label1" runat="server" BorderWidth="0px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>图片</td>
                    <td>商品名称</td>
                    <td>单位</td>
                    <td>数量</td>
                    <td>市场价</td>
                    <td>实价</td>
                    <td>金额</td>
                    <td>操作</td>
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
                            <td style="width: 8%; text-align: center;">
                                <%#getProUnit(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <%#Eval("pronum") %>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <%#getjiage("1",DataBinder.Eval(Container, "DataItem.proid", "{0}"))%>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <%#shijia(DataBinder.Eval(Container, "DataItem.Shijia", "{0}"))%>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <%#getprojia(DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                            </td>
                            <td style="width: 12.5%; text-align: center;">
                                <a href="UserCart.aspx?menu=del&cid=<%#Eval("id")%>"
                                    onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="8" class="text-center">
                        <span>共
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
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" class="text-center">合计：<asp:Label ID="alljiage" runat="server" Text=""></asp:Label>
                        <asp:Button ID="Button1" runat="server" Text="去收银台结帐" OnClientClick="location.href='UserOrderlist.aspx';return false;" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>