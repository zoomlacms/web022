<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_BidManage_Default, App_Web_m3pk103q" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>正在竞拍的商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="bid"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">竞拍管理</li>
</ol>
</div>
<div class="container">
    <div class=" text-center" style="margin-top: 5px; padding:10px 15px;">
        <asp:Label ID="tipss" runat="server" ></asp:Label>
</div>
<div class="alert alert-success" id="nocont" runat="server">暂时无参与的竞拍，快去选择你喜欢的商品吧! </div>
</div>
    <div id="conten" runat="server" align="center">
        <asp:Repeater ID="repf" runat="server">
            <ItemTemplate>
                <dl class="Auction_HOR">
                    <dt>
                        <div class="proImg">
                            <input type="hidden" id="hid<%#Eval("ID") %>" value='<%#Eval("ID") %>' />
                            <a href="DetailCom.aspx?cid=<%#Eval("ID") %>" title="<%#GetName(Eval("shopID","{0}"),"0") %>">
                                <img width="100" height="75" alt="<%#GetName(Eval("shopID","{0}"),"0") %>" src="<%#GetName(Eval("shopID","{0}"),"4") %>" /></a>
                        </div>
                    </dt>
                    <dd class="detail">
                        <h3><a href="/action/DetailCom.aspx?cid=<%#Eval("ID") %>" target="_blank" title="<%#GetName(Eval("shopID","{0}"),"0") %>"><%#GetName(Eval("shopID","{0}"),"0") %></a></h3>
                        <span class="description"><%#GetName(Eval("shopID","{0}"),"1") %></span>
                        <span>市价：<span class="worth">&yen;<%#GetName(Eval("shopID","{0}"),"2") %></span></span>&nbsp;&nbsp;奖品：<span style="color: #FF6600"><%#GetName(Eval("shopID","{0}"),"3") %></span>
                        <div id="CompetNum" runat="server"><%#GetComTips(Eval("ID","{0}")) %></div>
                    </dd>
                    <dd class="bidder">
                        <a class="userName" href="javascript:void(0)" id="bidder_<%#Eval("id") %>">-</a>
                        <span id='bid_btn_<%#Eval("id") %>' class="button button-hilite">
                            <span class="first-child">
                                <a href="/action/DetailCom.aspx?cid=<%#Eval("ID") %>" id="<%#Eval("ID") %>" name="buttons" target="_blank">继续竞拍</a>
                                <input type="hidden" id="Hidden_<%#Eval("id") %>" name="Hiddenfilename" value="<%#Eval("CompeteXmlName") %>" />
                            </span>
                        </span>
                    </dd>
                    <dd class="countdown">
                        <strong class="price f18" id="price_<%#Eval("id") %>" style="font-size: 12px"></strong>
                        <strong class="f18" id="TimeCounter_<%#Eval("id") %>">--:--:--</strong>
                    </dd>
                </dl>
            </ItemTemplate>
        </asp:Repeater>
        <div align="center">
            共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条信息 
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
            <span style="text-align: center" runat="server">
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input"
                    Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            </span>条信息/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>页
        </div>
    </div>
</asp:Content>
