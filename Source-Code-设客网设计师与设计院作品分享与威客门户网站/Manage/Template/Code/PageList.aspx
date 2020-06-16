<%@ page language="C#" autoeventwireup="true" inherits="Manage_Template_Code_PageList, App_Web_vezrqohi" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>页面列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="尚未定义页面">
        <Columns>
            <asp:BoundField HeaderText="别名" DataField="PageAlias" />
            <asp:TemplateField HeaderText="路径">
                <ItemTemplate>
                    <a href="<%#Eval("PageUrl") %>" target="_blank"><%#Eval("PageUrl") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
            <asp:BoundField DataField="Remind" HeaderText="备注" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddPage.aspx?id=<%#Eval("ID") %>">修改</a>
                    <a href="PageCode.aspx?id=<%#Eval("ID") %>">源码</a>
                    <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗,只删除数据,页面请手动移除!');">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
<%--    <asp:Button runat="server" ID="Down_Btn" CssClass="btn btn-primary" Text="打包下载" OnClick="Down_Btn_Click"></asp:Button>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
