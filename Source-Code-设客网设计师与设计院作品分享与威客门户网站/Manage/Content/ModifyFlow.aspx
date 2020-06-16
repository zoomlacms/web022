<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ModifyFlow, App_Web_ckin0fxz" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改审核状态</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <thead class="spacingtitle">
            <tr>
                <td colspan="2" align="center">修改流程</td>
            </tr>
        </thead>
        <tr>
            <td style="width: 20%">流程名称</td>
            <td align="left">
                <input id="txtName" class="form-control" runat="server" size="50" /><label style="color: Red">*</label>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">流程描述
            </td>
            <td align="left">
                <textarea id="txtFlowDepict" runat="server" rows="10" class="form-control" cols="8" style="width: 360px"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="保存" OnClick="btnSave_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
