<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.CartManage, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>购物车记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered">
        <tr>
            <td>
                <span>快速查找：
                    <asp:DropDownList ID="quicksouch" runat="server" CssClass="form-control" Width="150" AutoPostBack="True">
                        <asp:ListItem Value="1">所有购物车记录</asp:ListItem>
                        <asp:ListItem Value="2">会员的购物车记录</asp:ListItem>
                        <asp:ListItem Value="3">今天的购物车记录</asp:ListItem>
                        <asp:ListItem Value="4">本周的购物车记录</asp:ListItem>
                        <asp:ListItem Value="5">本月的购物车记录</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <span>
                    删除记录：
                    <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
                        <asp:ListItem Value="1">一天前</asp:ListItem>
                        <asp:ListItem Value="7">一个星期前</asp:ListItem>
                        <asp:ListItem Value="31">一个月前</asp:ListItem>
                        <asp:ListItem Selected="True" Value="90">三个月前</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="souchok" runat="server" class="btn btn-primary" Text="删除记录" Style="width: 100px" OnClick="souchok_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                </span>
            </td>
        </tr>
    </table>
    <table id="EGV" class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td>购物车ID</td>
            <td>商品名称</td>
            <td>客户名称</td>
            <td>时间</td>
            <td>数量</td>
            <td>预计金额</td>
            <td colspan="1">操作</td>
        </tr>
        <asp:Repeater ID="Carttable" runat="server"
            OnItemDataBound="Carttable_ItemDataBound">
            <ItemTemplate>
                <tr class="tdbg" id="<%#Eval("ID")%>" ondblclick="getinfo(this.id)">
                    <td><a href="cartinfo.aspx?id=<%#Eval("ID")%>"><%#Eval("Cartid")%></a></td>
                    <td>
                        <asp:HiddenField runat="server" ID="hfCartId" Value='<%#Eval("ID")%>' />
                        <asp:Label ID="lblProduct" runat="server" Text=""></asp:Label></td>
                    <td><%#Eval("Username")%></td>
                    <td><%#Eval("Addtime")%></td>
                    <td><%#Eval("Pronum")%></td>
                    <td><%#formatcc(DataBinder.Eval(Container,"DataItem.AllMoney","{0}"))%></td>
                    <td>
                        <a href="?menu=del&id=<%#Eval("ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td colspan="8">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                    ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
    </table>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="textj">
    function getinfo(id) {
        location.href = 'cartinfo.aspx?id=' + id;
    }
    </script>
</asp:Content>
