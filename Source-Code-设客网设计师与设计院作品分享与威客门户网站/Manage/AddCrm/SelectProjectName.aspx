<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_SelectProjectName, App_Web_4jghbugi" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查询用户</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table  class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td align="center" colspan="7" >
                客 户 列 表
            </td>
        </tr>
        <tr class="tdbg">
            <td align="center" class="tdbgleft" style="height: 24px; width: 5%; font-weight: bold">
                ID
            </td>
            <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                客户名称
            </td>
            <td align="center" class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
                客户类别
            </td>
            <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                客户编号
            </td>
            <td align="center" class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
                客户组别
            </td>
            <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                客户来源
            </td>
            <td align="center" class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
                操作
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td align="center" style="height: 24px;">
                        <%#Eval("Flow")%>
                    </td>
                    <td align="center" style="height: 24px;">
                        <a href="SelectProjectName.aspx?menu=select&id=<%#Eval("Flow") %>"><%#Eval("P_name")%></a>
                    </td>
                    <td align="center" style="height: 24px;">
                        <%#Eval("Client_Type","{0}")=="1"?"企业":"个人"%>
                    </td>
                    <td align="center" style="height: 24px;">
                        <%#Eval("Code")%>
                    </td>
                    <td align="center" style="height: 24px;">
                        <%#Eval("Client_Group")%>
                    </td>
                    <td align="center" style="height: 24px;">
                        <%#Eval("Client_Source")%>
                    </td>
                    <td align="center" style="height: 24px;">
                        <a href="SelectProjectName.aspx?menu=select&id=<%#Eval("Flow") %>">选择</a>
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
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                <asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                页
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function onstr() {
            parent.Dialog.close();
        }

        function setvalue(objname, valuetxt) {
            if (window.top != window.self) {
                $(parent.document).find("#" + objname).val(valuetxt);
                parent.CloseCurDiag();
                return;
            }
            var mainright = window.top.main_right;
            mainright.frames["main_right_" + parent.nowWindow].document.getElementById(objname).value = valuetxt;
        }
</script>
</asp:Content>