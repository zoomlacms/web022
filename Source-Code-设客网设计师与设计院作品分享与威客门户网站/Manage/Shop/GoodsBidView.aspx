
<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_GoodsBidView, App_Web_hjqedvte" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>促销方案管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td align="center" class="title"><span class="tdbgleft">用户姓名</span></td>
                <td align="center" class="title">出价时间</td>
                <td align="center" class="title">竞拍价格</td>
            </tr>
            <asp:Repeater ID="Promotions" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td height="24" align="center"><%#GetName(Eval("UserID"))%></td>
                        <td height="24" align="center"><%#Eval("AddTime")%></td>
                        <td height="24" align="center"><%#Eval("PMoney")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="24" colspan="6" align="center" class="tdbgleft">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条记录 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input"
                        OnTextChanged="txtPage_TextChanged" Width="30px"></asp:TextBox>
                    条记录/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    页</td>
            </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>