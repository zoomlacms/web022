﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Questions_TreeNode, App_Web_uqfrsqus" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>课程分类</title>   
</head>
<body>
<form id="form1" runat="server">
<asp:TreeView ID="tvNav" runat="server"  ExpandDepth="0" ShowLines="True" EnableViewState="False">
    <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
    <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
    <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
    <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
</asp:TreeView>
</form>
</body>
</html>