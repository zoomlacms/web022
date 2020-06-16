<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_BidManage_BidEnd, App_Web_m3pk103q" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>竞拍成功</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="bid"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">竞拍成功</li>
    </ol>
</div>
<div class="container u_cnt">
    <div class="us_seta" style="margin-top: 5px;">
        <h1 id="tipss" runat="server" align="center"></h1>
    </div>
    <div class="alert alert-success" id="nocont" runat="server">
        您还没有拍到商品
    </div>
    <div id="conten" runat="server" align="center">
        <table class="table table-striped table-bordered table-hover">
            <asp:Repeater ID="repf" runat="server" OnItemDataBound="repf_ItemDataBound" OnItemCommand="repf_ItemCommand">
            <ItemTemplate>
                <tr class="Auction_HOR">
                    <td>
                        <div class="proImg">
                            <a href="DetailCom.aspx?cid=<%#Eval("ID") %>" title="<%#GetName(Eval("shopID","{0}"),"0") %>">
                                <img width="100" height="75" alt="<%#GetName(Eval("shopID","{0}"),"0") %>" src='<%#GetName(Eval("shopID","{0}"),"1") %>' /></a>
                        </div>
                    </td>
                    <td class="detail" style="text-align: left">
                        <h3>
                            <a href="/action/DetailCom.aspx?cid=<%#Eval("ID") %>" target="_blank" title="<%#GetName(Eval("shopID","{0}"),"0") %>">
                                <%#GetName(Eval("shopID","{0}"),"0") %></a></h3>
                        <span class="description">
                            <%#GetName(Eval("shopID","{0}"),"1") %></span> <span>市价：<span class="worth">&yen;<%#GetName(Eval("shopID","{0}"),"2") %></span></span>&nbsp;&nbsp;<div
                                id="CompetNum" runat="server">
                                <%#GetComTips(Eval("ID","{0}")) %>
                            </div>
                    </td>
                    <td class="bidder">
                        <span id='bid_btn_<%#Eval("id") %>' class="button button-hilite"><span class="first-child">
                            <asp:LinkButton ID="subm" runat="server" CommandName="sub" CommandArgument='<%#Eval("ID") %>'>提交订单</asp:LinkButton>
                            <asp:LinkButton ID="hf" runat="server" Visible="false">晒图反馈</asp:LinkButton>
                            <asp:HiddenField ID="hforderid" runat="server" Value='<%#Eval("OrderID") %>' />
                        </span></span>
                    </td>
                    <td class="countdown">
                        <strong class="price f18" id="price_<%#Eval("id") %>">拍价：&yen;<%#DataBinder.Eval(Container.DataItem, "InitPrice", "{0:F2}")%></strong>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table>
        <div align="center">
            共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条信息
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                Text="" />页 <span style="text-align: center">
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                        Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                </span>条信息/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            页
        </div>
    </div>
</div>
</asp:Content>
