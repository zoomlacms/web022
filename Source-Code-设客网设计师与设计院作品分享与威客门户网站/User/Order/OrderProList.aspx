<%@ page language="C#" autoeventwireup="true" inherits="User_OrderProList, App_Web_ivqqslkk" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>订单商品列表</title>
    <style>.SumDiv li {list-style: none;display:inline-table;margin-right: 50px;line-height: 10px;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="PreViewOrder.aspx">我的订单</a></li>
        <li class="active">商品列表</li>
        <div class="clearfix"></div>
    </ol>
    <div id="pageflag" data-nav="shop" data-ban="shop"></div>
    <div class="container">
    <div class="panel panel-default">
        <div class="panel-body">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="该订单或购物车下没有商品!!"
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:TemplateField HeaderText="商品名">
                        <ItemTemplate><a href="<%#GetShopUrl()%>" target="_blank" title="浏览商品"><%#Eval("ProName") %></a><%#GetSnapUrl() %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="商品数" DataField="Pronum" />
                    <asp:TemplateField HeaderText="总计金额">
                        <ItemTemplate><%#GetMyPrice() %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="日期">
                        <ItemTemplate><%#Eval("AddTime","{0:yyyy年MM月dd日 HH:mm}") %></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
        <div class="panel-footer">
            <ul class="SumDiv">
                <li><asp:Label runat="server" ID="Total_L"></asp:Label></li>
                <li>已付款：<asp:Label ID="labelmoney01" runat="server"></asp:Label>元</li>
                <li>快递公司：<asp:Label ID="ExpressNum_T" runat="server"></asp:Label></li>
                <li>物流单号：<asp:Label ID="ExpressDelivery_T" runat="server"></asp:Label></li>
                <li>
                    <a visible="false" runat="server" id="PayUrl_A" target="_blank" class="btn btn-primary">前往付款</a>
                    <a  href="javascript:history.back();"  class="btn btn-primary margin_l5">返回</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="panel panel-primary" runat="server" id="User_Div" visible="false">
            <div class="panel-heading"><span class="glyphicon glyphicon-user"></span><span class="margin_l5">客户详情</span></div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr>
                        <td class="td_m">姓名</td>
                        <td>证件号</td>
                        <td>手机</td>
                        <td>备注</td>
                    </tr>
                    <asp:Repeater runat="server" ID="UserRPT" EnableViewState="false">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Name") %></td>
                                <td><%#Eval("CertCode") %></td>
                                <td><%#Eval("Mobile") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
     </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
