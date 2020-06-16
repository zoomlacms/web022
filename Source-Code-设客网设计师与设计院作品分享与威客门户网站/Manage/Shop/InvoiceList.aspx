﻿<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.InvoiceList, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>支付明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table id="EGV" class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
          <td width="15%" align="center" class="title"><span>订单号码</span></td>
          <td width="10%" align="center" class="title"><span>用户名</span></td>
          <td width="15%" align="center" class="title"><span>交易时间</span></td>
          <td width="30%" align="right" class="title"><span>订单金额 + 运费 = 总额</span></td>
          <td width="12%" align="center" class="title"><span>已开发票</span></td>
        </tr>
         <asp:Repeater ID="Repeater1" runat="server">
          <ItemTemplate>
           <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
          <td height="24" align="left"><a href="Orderlistinfo.aspx?id=<%#Eval("ID") %>"><%#Eval("OrderNo")%></a></td>
          <td height="24" align="center"><%#Eval("Rename", "{0}")%></td>
          <td height="24" align="center"><%#Eval("AddTime")%></td>
          <td height="24" align="right"><%#Eval("Ordersamount","{0:c}")%> + <%#Getdeli(Eval("ID","{0}"))%> = <%#GetMoney(Eval("ID","{0}"))%></td>
          <td height="24" align="center"><%# GetDevelopedvotes(Eval("Developedvotes", "{0}"))%></td>
        </tr>      
          </ItemTemplate>
          </asp:Repeater> 
        <tr class="tdbg">
<td height="22" colspan="5" align="center" class="tdbgleft">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条记录  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页</td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>