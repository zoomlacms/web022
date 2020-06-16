<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_SelectCourse, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>选择课程</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table  class="table table-striped table-bordered table-hover">
    <tr class="tdbg">
        <td align="center" colspan="7" class="title" width="100%">课 程 列 表</td>
    </tr>
    <tr class="tdbg">
        <td align="center" class="tdbgleft" style="height: 24px;  font-weight: bold">ID</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">课程名称</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">课程缩写</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">课程代码</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">热门课程</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">负责人</td>
        <td align="center" class="tdbgleft" style="height: 24px;  font-weight: bold">操作</td>
    </tr>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <tr>
                <td align="center" style="height: 24px;"><%#Eval("ID")%></td>
                <td align="center" style="height: 24px;"><%#Eval("CourseName")%></td>
                <td align="center" style="height: 24px;"><%#Eval("CoureseThrun")%></td>
                <td align="center" style="height: 24px;"><%#Eval("CoureseCode")%></td>
                <td align="center" style="height: 24px;"><%#GetHot(Eval("Hot","{0}"))%></td>
                <td align="center" style="height: 24px;"><%#GetAdminName(Eval("AddUser", "{0}"))%></td>                 
                <td align="center" style="height: 24px;">
                    <a href="SelectCourse.aspx?menu=select&id=<%#Eval("ID") %>&name=<%#Eval("CourseName") %>">选择</a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg">
        <td align="center" class="tdbg" style="height: 24px;" colspan="7">
            共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条信息
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
            页
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Dialog.js"></script>
    <script>
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