<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_PromotionBalance, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品推广结算</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td width="10%" height="28" align="center">推广人</td>
            <td width="10%" height="28" align="center">时间</td>
            <td width="5%" height="28" align="center">商品ID</td>
            <td width="10%" height="28" align="center">商品名称</td>
            <td width="8%" height="28" align="center">商品价格</td>
            <td width="10%" height="28" align="center">购买数量</td>            
            <%--<td width="5%" height="28" align="center">订单数量</td>--%>
          <%--  <td width="12%" height="28" align="center">未结算订单（有/无)</td>--%>
            <td width="10%" height="28" align="center">商品总价</td>
            <td width="10%" height="28" align="center">查看</td>
        </tr>
        <asp:Repeater ID="repArticlePromotion" runat="server">
            <ItemTemplate>
                <tr>
                    <td align="center">                    
                        <a style="color:blue;" href='OrderBlanace.aspx?id=<%#Eval("PromotionUserId") %>&balance=0 ' title="查看此用户推广信息"><%#getUserNameById(ZoomLa.Common.DataConverter.CLng(Eval("PromotionUserId").ToString()))%></a>
                     </td>
                    <td align="center"><%#Eval("AddTime")%></td>
                    <td align="center"><%#Eval("CartProId")%></td>
                    <td align="center"><%#GetShopName(Eval("CartProId", "{0}"))%></td>
                    <td align="center"><%#GetPrice(Eval("CartProId", "{0}"))%></td>
                    <td align="center"><%#Getprope(Eval("CartProId", "{0}"))%></td>                    
                <%--    <td align="center"><%#Eval("id").ToString()%></td>--%>
                    <%--<td align="center"><%#getOrderBalance(ZoomLa.Common.DataConverter.CLng( Eval("PromotionUserId").ToString()))%></td>--%>
                    <td align="center"><%#GetCount(Eval("CartProId", "{0}"))%></td>    
                    <td align="center"><a href='MtrlsMrktng.aspx?id=<%#Eval("PromotionUserId") %>' style="color:Blue;" title="查看返利信息">返利信息</a></td>                
                </tr>
            </ItemTemplate>
        </asp:Repeater>
     <td height="22" colspan="8" align="center" class="tdbg">
          共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </td>
    </table>
</asp:Content>