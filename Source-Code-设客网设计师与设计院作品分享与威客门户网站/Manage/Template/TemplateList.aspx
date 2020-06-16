<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.TemplateList, App_Web_mq0353cm" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>文件管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table">
        <tr>
            <td align="left" valign="top" colspan="3" style="width: 70%;">
                <iframe id="main_right" name="main_right" scrolling="yes" style="width: 100%; height: 400px;" src="SelectTemplate.aspx<%:Request.Url.Query %>" frameborder="0" marginheight="0" marginwidth="1"></iframe>
            </td>
        </tr>
        <tr class="title" style="height: 22px; width: 177px">
            <td colspan="3" class="text-left">
                <span>文件名称:</span><input type="text" id="FileName" class="form-control text_300 margin_l5" />
                <input type="button" id="BtnSubmit" class="btn btn-primary" value="确定" onclick="add()" />
                <input type="button" id="BtnCancel" class="btn btn-primary" value="关闭" onclick="close()" />
                <input type="hidden" id="ParentDirText" />
                <asp:HiddenField ID="HdnParentDir" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script type="text/javascript">
        function add() {
            var name = "<%=Request.QueryString["OpenerText"].Trim() %>";
            var val = document.getElementById('FileName').value;
            parent.Tlp_SetValByName(name, val);
            close();
        }
        function close() {
            if (parent.CloseDialog)
                parent.CloseDialog();
            if (parent.CloseComDiag)
                parent.CloseComDiag();
        }
    </script>
</asp:Content>