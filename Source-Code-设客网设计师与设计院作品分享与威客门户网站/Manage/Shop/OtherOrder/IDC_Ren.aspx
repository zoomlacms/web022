<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_OtherOrder_IDC_Ren, App_Web_y4s3y1ms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>IDC续费</title><style>.opion{font-size:0.5em; cursor:pointer;}</style></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr class="tdbg">
            <td class="text-right" style="width: 20%;">订单编号:</td>
            <td>
                <asp:Label ID="OrderNo" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">用户操作:</td>
            <td>
                <label><input type="radio" name="usertype" value="1" checked="checked" />用户身份</label>
                <label><input type="radio" name="usertype" value="0" />管理员身份</label>
                <span class="rd_green">(以管理员身份,将直接完成订单,不需要支付操作)</span>
        </tr>
        <tr>
            <td class="text-right">下单时间:</td>
            <td>
                <asp:Label ID="OrderAddTime" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">商品信息:</td>
            <td>
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>商品名称</td><td>实际价格</td><td>服务年限</td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="ProName_L" runat="server"></asp:Label></td>
                        <td><asp:Label ID="ProPrice_L" runat="server"></asp:Label></td>
                        <td><asp:Label ID="ProServer_L" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="text-right">购买数量:</td>
            <td><asp:TextBox ID="Num_T" CssClass="form-control td_s number required" runat="server" Text="1"></asp:TextBox></td>
        </tr>
        <tr class="text-center">
            <td colspan="2" style="height: 40px; text-align: center">
                <asp:Button ID="EBtnSubmit" Text="续费" class="btn btn-primary" OnClientClick="SubNum()" OnClick="EBtnSubmit_Click" runat="server" />
                <button type="button" onclick="CloseCur()" class="btn btn-primary">取消</button></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/jquery.validate.min.js"></script>
    <script>
        $().ready(function () {
            $('form').validate();
        });
        function AddNum(num) {
            var curnum = parseInt($("#ProNum_L").text());
            curnum += num;
            $("#ProNum_L").text(curnum<1?'1':curnum+'');
        }
        function SubNum() {
            $("#ProNum_Hid").val($("#ProNum_L").text());
        }
        function GetPayPage(url) {
            window.open(url, '_blank');
        }
        function CloseCur() {
            parent.CloseDiag();
        }
    </script>
</asp:Content>