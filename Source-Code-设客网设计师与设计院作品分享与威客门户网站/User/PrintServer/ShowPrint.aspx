<%@ page language="C#" autoeventwireup="true" inherits="User_PrintServer_ShowPrint, App_Web_tkhpbss1" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>浏览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField ID="hfImg" runat="server" />
    <div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <div style="height:50px; top:20px">
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="保  存" onclick="Button1_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    function shoImg(obj) {
        alert('保存成功!');
        window.close();
    }
    if (document.getElementById("hfImg").value == "") {
        document.getElementById("hfImg").value = opener.document.getElementById("HiddenField1").value;
        window.form1.submit();
    }
</script>

</asp:Content>