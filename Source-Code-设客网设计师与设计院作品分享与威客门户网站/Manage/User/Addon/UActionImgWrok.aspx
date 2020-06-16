<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/Common.master" inherits="Manage_User_Addon_UActionImgWrok, App_Web_q2kjotox" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="myDiagram" style="height:400px;">
    </div>
    <asp:HiddenField ID="code" runat="server" />
    <script src="/Plugins/Third/go/go.js" type="text/javascript"></script>
    <script src="/js/plugs/ZL_Diagram.js" type="text/javascript"></script>
    <script>
        $().ready(function () {
            console.log($("#code").val());
            var data = JSON.parse($("#code").val());
            if (data.length > 0) {
                ZL_Diagram.InitDiagram("myDiagram", data[0].Table[0].uname+"的行为跟踪",data[0].Table );
            }
        });
    </script>
</asp:Content>
