<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_CashInfo, App_Web_mugy5rhh" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>VIP信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li>
        <li class="active">VIP信息</li>
    </ol>
    <div class="us_seta" style="margin-bottom: 10px;" id="manageinfos" runat="server">
        <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    </div>
    <div class="us_seta" style="margin-top: 10px;" id="Div1" runat="server">
        <asp:Label ID="Label2" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label3" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label5" runat="server"></asp:Label>
    </div>
    <div class="us_seta" id="manageinfo" runat="server">
        <div style="text-align: center; vertical-align: middle;">
            <table class="table table-striped table-bordered table-hover">
                <tr align="center">
                    <td width="10%">
                        <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                    <td width="10%">ID</td>
                    <td width="10%">银行</td>
                    <td width="30%">帐号</td>
                    <td width="10%">申请金额</td>
                    <td width="10%">状态</td>
                </tr>
                <asp:Repeater ID="gvCard" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <input name="Item" type="checkbox" value='<%# Eval("Y_ID")%>' /></td>
                            <td align="center"><%# Eval("Y_ID")%></td>
                            <td align="center"><%# Eval("Bank")%></td>
                            <td align="center"><%# Eval("Account")%></td>
                            <td align="center"><%#showMoney(Eval("money").ToString())%></td>
                            <td align="center"><%#shoyState(Eval("yState").ToString())%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr class="tdbg">
                    <td colspan="6" align="center" class="tdbgleft">共
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        条信息
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                        页
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>