<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BidManage_BidConfige, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>竞拍信息配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td colspan="2" align="center" class="title">
                <asp:Label ID="Label1" runat="server" Text="竞拍参数设置"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr class="tdbg">
            <td align="center" class="tdbg">竞拍信誉值:
            </td>
            <td>
                <span style="float: left; padding: 5px">用户竞拍1元可增加</span><asp:TextBox ID="txtVal" runat="server" class="form-control pull-left" Style="width: auto;"></asp:TextBox><span style="float: left; padding: 5px">信誉值</span>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtVal" ErrorMessage="信誉值格式不正确!"
                    ValidationExpression="^-?\d+$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="tdbg">
            <td align="center" class="tdbg">竞拍积分值:
            </td>
            <td>
                <span style="float: left; padding: 5px">用户竞拍1元可增加</span><asp:TextBox ID="txtPoint" runat="server" class="form-control pull-left" Style="width: auto;"></asp:TextBox><span style="float: left; padding: 5px">积分</span>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPoint" ErrorMessage="积分值格式不正确!"
                    ValidationExpression="^-?\d+$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="tdbg">
            <td align="center" class="tdbg">竞拍商品封顶:
            </td>
            <td>
                <span style="float: left; padding: 5px">用户每个月可获取:</span><asp:TextBox ID="txtShopNum" runat="server" class="form-control pull-left" Style="width: auto;"></asp:TextBox><span style="float: left; padding: 5px">件商品<font>0为不封顶</font></span>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtShopNum" ErrorMessage="商品数量格式不正确!"
                    ValidationExpression="^-?\d+$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="tdbg">
            <td class="tdbg" colspan="2">
                <asp:Button ID="btn" runat="server" Text="保存"
                    class="btn btn-primary" OnClick="btn_Click" /></td>
        </tr>
    </table>
</asp:Content>
