<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Suspendedinfo, App_Web_hjqedvte" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>暂停/延迟状态</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr>
        <td width="35%"> 请选择状态：<asp:HiddenField ID="HiddenField1" runat='server' /></td>
        <td> <asp:DropDownList ID="ddstate" runat='server' AutoPostBack="True" 
                onselectedindexchanged="ddstate_SelectedIndexChanged">
                <asp:ListItem Value="0">恢复正常</asp:ListItem>
                <asp:ListItem Value="1">暂停处理</asp:ListItem>
                <asp:ListItem Value="2">延迟处理</asp:ListItem>
            </asp:DropDownList><span id="tips" style="color:Red" runat="server"></span>
        </td></tr>
    <tbody id="yanchi" runat="server">
    <tr>
        <td>延迟时间：</td><td><asp:TextBox ID="txtTime" runat="server" class="l_input" Height="19px"></asp:TextBox><asp:HiddenField ID="hforderid" runat='server' /></td></tr>
    </tbody>
    <tr>
        <td>备注：</td>
        <td><asp:TextBox ID="txtremark" runat="server" class="l_input" TextMode="MultiLine" 
                Height="87px" Width="403px"></asp:TextBox></td>
    </tr>
    <tr>
       <td align="center" colspan="2">
        <asp:Button ID="btn" runat="server" Text="保存" onclick="btn_Click" class="btn btn-primary" /><span id="sptip" runat="server" style="color:Red"></span></td></tr>
</table>
</asp:Content>