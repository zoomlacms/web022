<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_TypeSet, App_Web_li2c4mic" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮箱类别</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <th>ID</th>
            <th>类别名称</th>
            <th>操作</th>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Lnk_Click">
            <ItemTemplate>
                <tr ondblclick="location.href('MailType.aspx?Type=<%#Eval("ID") %>')">
                    <td align="center" title="双击修改" style="cursor: pointer"><%#Eval("ID") %></td>
                    <td align="center" title="双击修改" style="cursor: pointer" width="450"><%#Eval("TypeName") %></a></td>
                    <td width="450" align="center" title="双击修改" style="cursor: pointer">
                        <a href="MailType.aspx?Type=<%#Eval("ID") %>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteAdmin" OnClientClick=" return confirm('将删除类别下的全部邮箱信息！确实要删除此类别吗？');" CommandArgument='<%# Eval("ID")%>'>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td style="text-align: center;" colspan="6">
                <span style="text-align: center">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条数据
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/
                    <asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:Label ID="pagess" runat="server" Text="" />
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="26px" Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    条数据/页 转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                </span>
            </td>
        </tr>
    </table>
</asp:Content>