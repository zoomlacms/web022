<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_GoodsBid, App_Web_hjqedvte" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>促销方案管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="CommentID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无竞拍商品！！">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ProID" />
            <asp:TemplateField HeaderText="商品名称">
                <ItemTemplate>
                    <%#GetName(Eval("ProID"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="竞拍人数">
                <ItemTemplate>
                    <%#GetCount(Eval("ProID"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="竞拍状态">
                <ItemTemplate>
                    <%#GetState(Eval("ProID"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="竞拍时间">
                <ItemTemplate>
                    <%#GetTime(Eval("ProID"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="GoodsBidView.aspx?id=<%#Eval("ProID") %>">查看</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>