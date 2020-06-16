<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_TypeInfo, App_Web_li2c4mic" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
      <title>类别信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td align="center" colspan="6" class="spacingtitle"><b>类别信息</b></td>
        </tr>
        <tr>
            <th width="50">用户ID</th>
            <th width="200">用户名</th>
            <th width="400">邮箱帐号</th>
            <th width="200">时间</th>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td align="center"><%#Eval("ID") %></td>
                    <td align="center"><%#Eval("FromName") %></a></td>
                    <td align="center"><%#Eval("ReEmail") %></td>
                    <td width="100" align="center"><%#Eval("CreateTime") %></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>