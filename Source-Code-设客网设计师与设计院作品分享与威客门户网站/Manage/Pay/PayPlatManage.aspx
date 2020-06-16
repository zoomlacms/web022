<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.I.Pay.PayPlatManage, App_Web_nbndfeoy" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>支付平台管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
        DataKeyNames="PayPlatID" PageSize="20" OnRowDataBound="Egv_RowCreated" 
        OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" 
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="无支付平台信息">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="PayPlatID">
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="名称" DataField="PayPlatName">
                <HeaderStyle Width="20%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="商户ID" DataField="AccountID">
                <HeaderStyle Width="20%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="接口类型">
                <ItemTemplate>
                    <%#GetPayClass() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="默认">
                <ItemTemplate>
                    <%# GetDefault(Eval("IsDefault", "{0}")) %>
                </ItemTemplate>
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="启用">
                <ItemTemplate>
                    <%# GetDisabled(Eval("IsDisabled", "{0}")) %>
                </ItemTemplate>
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="排序" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("PayPlatID") %>'><span class="glyphicon glyphicon-pencil" title="修改"></span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PayPlatID") %>' OnClientClick="return confirm('确定删除？')"><span class="glyphicon glyphicon-trash" title="删除"></span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="SetDef" CommandArgument='<%# Eval("PayPlatID") %>'><span class="glyphicon glyphicon-flag" title="设为默认"></span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Disabled" CommandArgument='<%# Eval("PayPlatID") %>'><span class="glyphicon glyphicon-ban-circle" title="禁用"></span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="MovePre" CommandArgument='<%# Eval("PayPlatID") %>'><span class="glyphicon glyphicon-arrow-up" title="上移"></span>上移</asp:LinkButton>
                <asp:LinkButton ID="LinkButton5" runat="server" CommandName="MoveNext" CommandArgument='<%# Eval("PayPlatID") %>'><span class="glyphicon glyphicon-arrow-down" title="下移"></span>下移</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
