<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.Print_Type, App_Web_ckin0fxz" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.LF("打印输出")%></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="PID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:TemplateField  ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("PID") %>' />
                </ItemTemplate>
                <HeaderStyle Width="30px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="PID" HeaderText="编号" HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle Width="50px"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="P_Name" HeaderText="模板名称" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="P_AddTime" HeaderText="添加时间" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="调用代码">
                <ItemTemplate>
                    /User/PrintServer/PrintServer.aspx?PID=<%# Eval("PID")%><%#Eval("P_ShopID").ToString()=="0" ? "" : "&Item=" + Eval("P_ShopID")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="AddPrintType.aspx?PID=<%#DataBinder.Eval(Container.DataItem,"PID") %>">修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="Del" CommandArgument='<%#Eval("PID") %>' runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" Text="批量删除" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $().ready(function () {
        })
    </script>
</asp:Content>