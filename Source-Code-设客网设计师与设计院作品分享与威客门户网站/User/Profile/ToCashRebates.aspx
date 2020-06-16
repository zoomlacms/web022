<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Profile_ToCashRebates, App_Web_rqfijtq4" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>兑现记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Default.aspx">我的返利</a></li>
        <li class="active">兑换记录</li>
		<div class="clearfix"></div>
    </ol>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="6" class="text-center">兑现记录
                </td>
            </tr>
            <tr>
                <td align="center" width="15%">申请时间</td>
                <td align="center" width="15%">兑现金额(元)</td>
                <td align="center" width="15%">扣除手续费(元)</td>
                <td align="center" width="20%">支付信息</td>
                <td align="center" width="20%">状态</td>
                <td align="center" width="15%">支付日期</td>
            </tr>
            <asp:Repeater ID="repf" runat="server">
                <ItemTemplate>
                    <tr>
                        <td align="center" width="15%">
                            <asp:HiddenField ID="hfId" runat="server" Value='<%#Eval("id") %>' />
                            <%#DataBinder.Eval(Container.DataItem, "OrderData", "{0:yyyy-MM-dd}")%></td>
                        <td align="center" width="15%"><%# DataBinder.Eval(Container, "DataItem.HonorMoney", "{0:N2}")%></td>
                        <td align="center" width="15%"><%#DataBinder.Eval(Container, "DataItem.Fee", "{0:N2}")%></td>
                        <td align="center" width="20%"><%#Eval("Payinfo") %></td>
                        <td align="center" width="20%"><%# GetStatus(Eval("State", "{0}")) %></td>
                        <td align="center" width="15%">
                            <asp:Label ID="lblpayData" runat="server" Text='<%#GetDataBypay(Eval("State","{0}"),Eval("payData","{0}")) %>'></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="6" align="center">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条信息 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />
                    页  
                    <span style="text-align: center">
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22" Height="22" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    </span>条信息/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>页
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
