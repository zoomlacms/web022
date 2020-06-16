<%@ page language="C#" title="读取短消息" autoeventwireup="true" inherits="User.MessageRead, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>读取短消息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td colspan="2" class="spacingtitle"><b>会员短消息</b></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>发件人：</strong>
          <asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>收件人：</strong>
          <asp:Label ID="LblIncept" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>发送时间：</strong>
          <asp:Label ID="LblSendTime" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>消息主题：</strong>
          <asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>消息内容：</strong></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><asp:Label ID="LblContent" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%; text-align: center"><asp:Button ID="BtnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" OnClientClick="return confirm('是否要删除此短消息？')" class="btn btn-primary"/>
          <asp:Button ID="BtnReply" runat="server" Text="回复" OnClick="BtnReply_Click" class="btn btn-primary"/>
          <asp:Button ID="BtnReturn" runat="server" OnClick="BtnReturn_Click" Text="返回" class="btn btn-primary"/></td>
      </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>