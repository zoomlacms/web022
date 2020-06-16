<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Common.MultiDropList, App_Web_czxwn4p5" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<title>多级选项</title>
</head>
<body class="tdbg">
<form id="form1" runat="server">
    <asp:DropDownList ID="DDLGrade1" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDL_Grade1ChangeIndex">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade2" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDL_Grade2ChangeIndex">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade3" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade3_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade4" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade4_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:dropdownlist id="DDLGrade5" runat="server" visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade5_SelectedIndexChanged">
    </asp:dropdownlist>
    <asp:dropdownlist id="DDLGrade6" runat="server" visible="false" AutoPostBack="true" onselectedindexchanged="DDLGrade6_SelectedIndexChanged">
    </asp:dropdownlist>
</form>
</body>
</html>