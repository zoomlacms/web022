<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_ProjectClass, App_Web_jzh2rzwp" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="node_div" style="min-height:300px;">
            <asp:Literal runat="server" ID="NodeHtml_Lit" EnableViewState="false"></asp:Literal>
        </div>
    <script>
        function ShowChild(obj) {
            if ($(obj).find('.folders').hasClass('glyphicon-folder-close')) {
                $(obj).find('.folders').removeClass('glyphicon-folder-close').addClass('glyphicon-folder-open');
                $(obj).next().show();
            } else {
                $(obj).find('.folders').removeClass('glyphicon-folder-open').addClass('glyphicon-folder-close');
                $(obj).next().hide();
            }
            
        }
    </script>
</asp:Content>
