<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_AgioCommodityShow, App_Web_qq1xfqnx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>选择商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered">
            <tr id="tr1" runat="server">
                <td>
                    <table class="table table-striped table-bordered table-hover">
                        <tr class="title">
                            <td align="left" colspan="4">
                                <b>商品列表：</b></td>
                        </tr>
                        <tr class="tdbgleft">
                            <td width="5%" height="24" align="center">
                                <strong>ID</strong></td>
                            <td width="10%" height="24" align="center">
                                <strong>商品图片</strong></td>
                            <td width="40%" height="24" align="center">
                                <strong>商品名称</strong></td>
                            <td width="35%" height="24" align="center">
                                <strong>商品零售价</strong></td>
                        </tr>
                        <asp:Repeater ID="Pagetable" runat="server">
                            <ItemTemplate>
                                <tr class="tdbg">
                                    <td height="24" align="center">
                                        <%#Eval("ID") %>
                                    </td>
                                    <td height="24" align="center">
                                        <%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%>
                                    </td>
                                    <td height="24" align="center">
                                        <%#Eval("Proname") %>
                                        <input type="hidden" id="Pronames<%#Eval("ID") %>" value="<%#Eval("Proname") %>" />
                                    </td>
                                    <td height="24" align="center">
                                        <%#Eval("LinPrice","{0:c}")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr class="tdbg">
                            <td class="tdbgleft" colspan="6" align="center">
                                共
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                                条信息
                                <asp:Label ID="Toppage" runat="server" Text="" />
                                <asp:Label ID="Nextpage" runat="server" Text="" />
                                <asp:Label ID="Downpage" runat="server" Text="" />
                                <asp:Label ID="Endpage" runat="server" Text="" />
                                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                                    Text="" />页
                                <asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第<asp:DropDownList ID="DropDownList1"
                                    runat="server" AutoPostBack="True">
                                </asp:DropDownList>页
                            </td>
                        </tr>
                    </table>
                    </td>
            </tr>
            <tr>
                <td id="tdnode" class="tdbgleft" runat ="server">
               </td>
            </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>