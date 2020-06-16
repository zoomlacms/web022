<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_StroeUpdate, App_Web_e1atrdhs" validaterequest="false" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商家店铺修改</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td class="text-right">店铺名称</td>
                <td>
                    <asp:TextBox ID="UserShopName_T" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        </table>
    </div>
    <div style="margin-left: 400px">
        <asp:Button ID="Esubmit" CssClass="btn btn-primary" runat="server" Text="保存信息" OnClick="Esubmit_Click" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/Common/Common.js" type="text/javascript"></script>
    <script>
        $("input[type=text]").addClass("form-control");
    </script>
</asp:Content>
