<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_SelecShopUserid, App_Web_qq1xfqnx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>店铺用户ID</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td width="5%" align="center" class="title">
                <span class="tdbgleft">ID</span>
            </td>
            <td width="12%" align="center" class="title">
                <span class="tdbgleft">申请人用户名</span>
            </td>
            <td width="20%" align="center" class="title">
                <span class="tdbgleft">店铺名称</span>
            </td>
            <td width="20%" align="center" class="title">
                <span class="tdbgleft">申请时间</span>
            </td>
            <td width="7%" align="center" class="title">
                <span class="tdbgleft">店铺状态</span>
            </td>
            <td width="8%" align="center" class="title">
                <span class="tdbgleft">操作</span>
            </td>
        </tr>
        <asp:Repeater ID="Productlist" runat="server" 
            onitemcommand="Productlist_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td height="24" align="center">
                        <%#DataBinder.Eval(Container.DataItem, "GeneralID")%>
                    </td>
                    <td height="24" align="center">
                        <%#GetUsername(DataBinder.Eval(Container.DataItem, "GeneralID").ToString())%>
                    </td>
                    <td height="24" align="center">
                        <a href="../../Store/Storeindex.aspx?id=<%# Eval("GeneralID")%>" target="_blank"
                            title="点击进入店铺"><%#GetStorename(DataBinder.Eval(Container.DataItem, "GeneralID").ToString())%></a>
                    </td>
                    <td height="24" align="center">
                        <%#GetAddtime(DataBinder.Eval(Container.DataItem, "GeneralID").ToString())%>
                    </td>
                    <td height="24" align="center">
                        <%#GetState(DataBinder.Eval(Container.DataItem, "GeneralID").ToString())%>
                    </td>
                    <td height="24" align="center">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName='sel' CommandArgument='<%#Eval("GeneralID")%>' >选择</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td height="24" colspan="7" align="center" class="tdbgleft">
                共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>&nbsp;
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                    Text="" />页
                <asp:Label ID="pagess" runat="server" Text="" />个/页 转到第<asp:DropDownList ID="DropDownList1" runat="server"
                        AutoPostBack="True">
                    </asp:DropDownList>
                页
                <asp:HiddenField ID="hfOrderID" runat="server" />
            </td>
        </tr>
</table>
</asp:Content>