<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ContentMove, App_Web_ckin0fxz" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>内容管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle">批量移动内容到其他节点
            </td>
        </tr>
        <tr>
            <td style="width: 20%" align="right">内容ID：
            </td>
            <td class="bqright">
                <asp:TextBox ID="TxtContentID" class="form-control text_300"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtContentID" ErrorMessage="内容ID不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" align="right">目标节点：
            </td>
            <td class="bqright">
                <asp:DropDownList ID="DDLNode" CssClass="form-control text_300" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="2">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="批量处理" OnClick="Button1_Click" />
                <input name="Cancel" type="button" class="btn btn-primary" id="BtnCancel" value="取消" onclick="javascript: history.back()" />
            </td>
        </tr>
    </table>
</asp:Content>
