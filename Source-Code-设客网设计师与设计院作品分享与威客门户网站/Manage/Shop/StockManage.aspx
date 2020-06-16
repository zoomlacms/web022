<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.StockManage, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>库存管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input name="idchk" type="checkbox" value='<%# Eval("id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="单据类型">
                <ItemTemplate>
                    <%#stocktype(DataBinder.Eval(Container,"DataItem.stocktype","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="商品名称" DataField="Proname" />
            <asp:BoundField HeaderText="单据编号" DataField="danju" />
            <asp:BoundField HeaderText="录入时间" DataField="addtime" />
            <asp:BoundField HeaderText="录入者" DataField="adduser" />
            <asp:BoundField HeaderText="数量" DataField="Pronum" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a class="option_style" href="Stock.aspx?menu=edit&id=<%#Eval("id") %>"><i class="glyphicon glyphicon-pencil" title="修改"></i></a>
                    <asp:LinkButton ID="LinkButton1"  CssClass="option_style" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" CommandName="del1" CommandArgument='<%# Eval("ID") %>' runat="server"><i class="glyphicon glyphicon-trash" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="height: 21px">
                <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClick="Button3_Click" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" Text="批量删除" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=Item]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        $().ready(function () {
            $("#Egv tr").dblclick(function () {
                var id = $(this).find("[name=idchk]").val();
                if (id) {
                    location = "Stock.aspx?menu=edit&id=" + id;
                }
            });
        });
    </script>
</asp:Content>
