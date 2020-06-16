﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.correct, App_Web_0glw4r2n" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>网页纠错</title>
<link href="../App_Themes/UserThem/Default.css" type="text/css" rel="stylesheet" />
<link href="../User/css/default1.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
您现在的位置：<span id="YourPosition"><span><a title="网站首页" href="/">网站首页</a></span><span> &gt;&gt; </span><span>网页纠错</span></span>
</div>
<div class="clearbox"></div>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr align="left">
    <td colspan="2" class="spacingtitle">
        <strong>我来纠错</strong>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" style="width: 20%" align="right">
        <strong>网页标题：</strong>
    </td>
    <td align="left">
        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>                 
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" style="width: 20%" align="right">
        <strong>网页地址：</strong>
    </td>
    <td align="left">
        <asp:Label ID="lblUrl" runat="server" Text=""></asp:Label>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" style="width: 20%" align="right">
        <strong>错误类型：</strong>
    </td>
    <td align="left">
        <asp:RadioButtonList ID="RBLType" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="0">内容错误</asp:ListItem>
            <asp:ListItem Value="1">错别字</asp:ListItem>
            <asp:ListItem Value="2">图片错误</asp:ListItem>
            <asp:ListItem Value="3">链接错误</asp:ListItem>
        </asp:RadioButtonList> 
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" style="width: 20%" align="right">
        <strong>详细说明：</strong>
    </td>
    <td align="left">
        <asp:TextBox ID="TxtDetail" runat="server" Rows="6" TextMode="MultiLine" Width="80%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtDetail"
            ErrorMessage="请填写详细说明"></asp:RequiredFieldValidator></td>
</tr>
<tr class="tdbg">
<td class="tdbgleft" style="width: 20%" align="right">
    <strong>验证码：</strong>
</td>
<td align="left">
<asp:TextBox ID="TxtCode" runat="server"></asp:TextBox>&nbsp; <asp:Image ID="VcodeLogin" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px"   ToolTip="点击刷新验证码" Style="cursor: pointer; border: 0; vertical-align: middle;" onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
</tr>
<tr align="left">
    <td colspan="2" class="spacingtitle">
        <strong>请填写您的联系方式</strong>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" style="width: 20%" align="right">
        <strong>姓名：</strong>
    </td>
    <td align="left">
        <asp:TextBox ID="TxtPer" runat="server" Columns="30"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtPer"
            ErrorMessage="请填写您的姓名"></asp:RequiredFieldValidator></td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" style="width: 20%" align="right">
        <strong>邮件：</strong>
    </td>
    <td align="left">
        <asp:TextBox ID="TxtEmail" runat="server" Columns="30"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail"
            ErrorMessage="请填写您的Email"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail"
            ErrorMessage="Email格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
</tr>
<tr align="center">
    <td colspan="2" class="spacingtitle">
        <asp:Button ID="Button1" runat="server" Text="提 交" OnClick="Button1_Click" />&nbsp;&nbsp;
        <input id="Reset1" type="reset" value=" 重 写 " class="btn" />
    </td>
</tr>
<tr ><td></td><td >  提示：系统支持以/Prompt/correct.aspx?u=[网页地址]&t=[网页标题]方式GET将内容传值，如：/Prompt/correct.aspx?u=/Prompt/correct.aspx&t=标题。 </td></tr>
</table> 
</form>
</body>
</html>
