<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Arrive_SelectUserName, App_Web_rillxipg" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查询用户</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table width="100%" cellspacing="1" cellpadding="0" class="table table-striped table-bordered table-hover">
        <tr>
            <td class="text-center" colspan="7" class="title" style="width: 100%">客 户 列 表</td>
        </tr>
        <tr>
            <td class="text-center" font-weight: bold">ID</td>
            <td class="text-center" font-weight: bold">会员名称</td>
            <td class="text-center" font-weight: bold">会员组别</td>
            <td class="text-center" font-weight: bold">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td class="text-center">
                        <%#Eval("UserID")%>
                    </td>
                    <td class="text-center">
                        <%#Eval("UserName")%>
                    </td>
                    <td class="text-center">
                        <%#Eval("GroupID", "{0}") == "1" ? "普通会员" : "企业会员"%>
                    </td>
                    <td class="text-center">
                        <a href="SelectUserName.aspx?menu=select&id=<%#Eval("UserID") %>">选择</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td class="text-center" colspan="7">共
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
            </asp:DropDownList>
                页
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript">
        function onstr() {
            window.opener = null;
            parent.Dialog.close();
        }
        function setvalue(objname, valuetxt) {
            var mainright = window.top.main_right;
            mainright.document.getElementById(objname).value = valuetxt;
        }
    </script>
</asp:Content>




