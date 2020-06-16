<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Page, App_Web_2rwfiian" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>页面设置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr><td class="td_m">页面标题：</td><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control" MaxLength="50" /></td></tr>
        <tr><td>Meta配置：</td><td><asp:TextBox runat="server" TextMode="MultiLine" ID="Meta_T" CssClass="form-control area_md" /></td></tr>
        <tr><td>引入资源：</td><td><asp:TextBox runat="server" TextMode="MultiLine" ID="Resource_T" CssClass="form-control area_md" placeholder="CSS或JS引用" /></td></tr>
        <tr><td>页面备注：</td><td><asp:TextBox runat="server" TextMode="MultiLine" ID="Remind_T" CssClass="form-control area_md" /></td></tr>
        <tr><td></td><td><asp:Button runat="server" CssClass="btn btn-primary" ID="Save_Btn" Text="保存修改" OnClick="Save_Btn_Click" /></td></tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        textarea.area_md {height:80px;}
    </style>
    <script>
        function CloseDiag()
        {
            top.CloseDiag();
        }
    </script>
</asp:Content>

