<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ShowMinute, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>详细信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td valign="top" style="margin-top: 0px; margin-left: 0px;"> 发送者:
          <asp:Label ID="label1" Text="" runat="server"/></td>
      </tr>
      <tr class="tdbg">
        <td valign="top" style="margin-top: 0px; margin-left: 0px;"> 接收者:
          <asp:Label ID="label2" Text="" runat="server"/></td>
      </tr>
      <tr class="tdbg">
        <td valign="top" style="margin-top: 0px; margin-left: 0px;"> 内&nbsp;&nbsp;容:
          <asp:Label ID="label3" Text="" runat="server"/></td>
      </tr>
      <tr class="tdbg">
        <td valign="top" style="margin-top: 0px; margin-left: 0px;"> 时&nbsp;&nbsp;间:
          <asp:Label ID="label4" Text="" runat="server"/></td>
      </tr>
      <tr>
        <td align="center"><input ID="Button" type="button" runat="server" value="返回" class="btn btn-primary" onclick="javascript: window.location.href = 'MsgEx.aspx'" /></td>
      </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>