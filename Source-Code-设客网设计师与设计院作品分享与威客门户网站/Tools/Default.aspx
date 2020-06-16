<%@ page language="C#" autoeventwireup="true" inherits="Tools_Default, App_Web_jluk543c" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>维护工具</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="td_l">配置文件检测:</td>
            <td><asp:Button ID="Check_Btn" runat="server" OnClick="Check_Btn_Click" CssClass="btn btn-primary" Text="开始检测" /></td>
        </tr>
        <tr>
            <td>恢复发布配置:</td>
            <td><asp:Button ID="Update_Btn" runat="server" OnClick="Update_Btn_Click" CssClass="btn btn-primary" Text="开始修复" /></td>
        </tr>
    </table>
    <div class="alert alert-info" role="alert" runat="server" id="FileInfo_Div" visible="false">
        <table class="table">
            <thead>
                <tr><td class="td_lg">文件名</td><td>是否存在</td></tr>
            </thead>
            <asp:Literal ID="Files_Li" runat="server" EnableViewState="false"></asp:Literal>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>