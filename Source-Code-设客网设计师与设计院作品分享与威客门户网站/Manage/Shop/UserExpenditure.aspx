<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.UserExpenditure, App_Web_qq1xfqnx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
      <title>会员购物排名</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr align="center">
        <td width="5%" class="title">
            用户ID</td>
        <td width="10%" class="title">
            用户名</td>
        <td width="10%" class="title">
            注册时间</td>
        <td width="10%" class="title">
            电子信箱</td>
        <td width="10%" class="title">
            最后登录IP</td>
        <td width="10%" class="title">
            订单数量</td>
        <td width="10%" class="title">
            购买订单数量</td>
      </tr>
      
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
      <tr class="">
        <td height="22" class="tdbg" align=center><%#Eval("UserID")%></td>
        <td height="22" class="tdbg" align=center><%#Eval("Username") %></td>
        <td height="22" class="tdbg" align=center><%#Eval("RegTime")%></td>
        <td height="22" class="tdbg" align=center><%#Eval("Email")%></td>
        <td height="22" class="tdbg" align=center><%#Eval("LastLoginIP")%></td>
        <td height="22" class="tdbg" align=center><%#Getordernum(Eval("Username","{0}"))%></td>
        <td height="22" class="tdbg" align=center><%#Getordernums(Eval("Username","{0}"))%></td>
      </tr>
      </ItemTemplate>
        </asp:Repeater>
      <tr class="tdbg">
<td height="22" colspan="10" align="center" class="tdbgleft">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条记录  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页</td>
        </tr>
    </table>
</asp:Content>