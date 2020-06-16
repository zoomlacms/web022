<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.Stock, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加入库出库记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="添加入库出库单"></asp:Label>
            </td>
        </tr>
        <tr >
            <td width="34%" height="22" class="tdbgleft">
                <strong>选择单据类型：</strong>
            </td>
            <td width="66%" valign="middle">
                <asp:RadioButtonList ID="stocktyle" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="RK" Selected="true" onclick="ttname(this.value);">入库</asp:ListItem>
                    <asp:ListItem Value="CK" onclick="ttname(this.value);">出库</asp:ListItem>
                </asp:RadioButtonList>
                <asp:HiddenField ID="stockid" runat="server" />
            </td>
        </tr>
        <tr >
            <td width="34%" height="22" class="tdbgleft">
                <strong>单据编号：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:Label ID="danjuhao" runat="server" Text=""></asp:Label>
                <asp:HiddenField ID="danjuhaos" runat="server" />
                <asp:HiddenField ID="danjuhaobak" runat="server" />
            </td>
        </tr>
        <tr >
            <td width="34%" height="22" class="tdbgleft">
                <strong>商品选择：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:DropDownList CssClass="form-control" Width="200" ID="productid" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr >
            <td width="34%" height="22" class="tdbgleft">
                <strong>商品数量：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:TextBox ID="Pronum" runat="server" class="form-control text_md">0</asp:TextBox>
                *<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Pronum" ErrorMessage="商品数量必须是整数!" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr >
            <td width="34%" class="tdbgleft" style="height: 22px">
                <strong>录入时间：</strong>
            </td>
            <td valign="middle" style="height: 22px">
                <asp:TextBox ID="calendars" runat="server" class="form-control text_md" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td width="34%" class="tdbgleft" style="height: 22px">
                <strong>录 入 者：</strong>
            </td>
            <td valign="middle" style="height: 22px">
                <asp:TextBox ID="adduser" runat="server"  class="form-control text_md"></asp:TextBox>
                *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adduser" ErrorMessage="录入者不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td width="34%" height="22" class="tdbgleft">
                <strong>备&nbsp; &nbsp; 注：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:TextBox ID="stockcontent" class="form-control" runat="server" Height="91px" Width="482px"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg">
            <td height="22" colspan="5" align="center" class="tdbgleft">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="添 加" OnClick="Button1_Click" />&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function ttname(value) {
            document.getElementById("danjuhaos").value = value + document.getElementById("danjuhaobak").value;
            document.getElementById("danjuhao").innerHTML = document.getElementById("danjuhaos").value
        }
    </script>
</asp:Content>
    