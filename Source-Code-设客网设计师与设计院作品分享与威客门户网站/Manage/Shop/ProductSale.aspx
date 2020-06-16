<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.ProductSale, App_Web_1lmqzdkx" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>总体销售统计</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <table class="table table-striped table-bordered table-hover">
      <tr align="center">
        <td width="33%" class="title">
            产品ID</td>
        <td width="33%" class="title">
            产品名称</td>
        <td width="33%" class="title">
            总销量</td>
      </tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
              <tr class="">
        <td height="22" class="tdbg" align=center>
            <%#Eval("proid","{0}") %></td>
        <td height="22" class="tdbg" align=center><%#Eval("proname") %></td>
        <td height="22" class="tdbg" align=center><%#Eval("cc") %></td>
      </tr>
      </ItemTemplate>
        </asp:Repeater>
              <tr class="tdbg">
<td height="22" colspan="10" align="center" class="tdbgleft">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条记录  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页</td>
        </tr>
    </table>
</asp:Content>