<%@ page language="C#" title="角色管理" autoeventwireup="true" inherits="User.RoleManage, App_Web_1jbandww" enableeventvalidation="false" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>角色管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" DataKeyNames="RoleID"
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="RoleID" HeaderText="ID" ItemStyle-CssClass="td_s"></asp:BoundField>
            <asp:TemplateField HeaderText="角色名">
                <ItemTemplate>
                    <a href="AddRole.aspx?RoleID=<%#Eval("RoleID") %>"><%#Eval("RoleName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="描述"></asp:BoundField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <asp:LinkButton ID="Userlist" CommandName="ListRolelist" CommandArgument='<%# Eval("RoleID")%>' runat="server">成员管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkEdit" CommandName="ModifyRole" CommandArgument='<%# Eval("RoleID")%>' runat="server">修改</asp:LinkButton>
                    <asp:LinkButton ID="LnkDel" CommandName="Del" CommandArgument='<%# Eval("RoleID")%>' OnClientClick="return confirm('您确认删除该角色吗?')" runat="server">删除</asp:LinkButton>
                    <asp:LinkButton ID="AuthEdit" CommandName="ModifyPower" CommandArgument='<%# Eval("RoleID")%>' runat="server">权限设置</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
</ZL:ExGridView>
    <div class="clearbox"></div>
    <div class="alert alert-info"><img src="/Images/notice.gif"/>超级管理员拥有最高的权限，不能修改其权限，删除该组!</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () { $(".allchk_l").hide(); });
    </script>
</asp:Content>
