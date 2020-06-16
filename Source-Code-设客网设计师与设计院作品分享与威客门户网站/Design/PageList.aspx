<%@ page language="C#" autoeventwireup="true" inherits="Design_PageList, App_Web_l1ynlgj5" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>页面管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false"
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有页面">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("ID") %>" /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="标题" DataField="Title" />
            <asp:BoundField HeaderText="Guid" DataField="Guid" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="/Design/PreView.aspx?ID=<%#Eval("Guid") %>" target="_blank"><i class="fa fa-eye" title="预览"></i></a>
                    <a href="javascript:;" onclick="EdigPage('<%#Eval("Guid") %>');"><i class="glyphicon glyphicon-pencil" title="修改"></i> </a>
                    <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗?');"><i class="glyphicon glyphicon-trash" title="删除"></i> </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function EdigPage(guid) {
            if (top) { top.location = "/Design/?ID=" + guid; }
        }
    </script>
</asp:Content>