<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_RegValidateMail, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件内容</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('105')" title="帮助"></a></div>
  <%} %></div>
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td colspan="2" align="center" class="spacingtitle" > 验证邮件内容</td>
      </tr>
      <tr>
        <td style="white-space: normal; width: 30%;" class="tdbgleft" align="right"><strong>邮件标题：</strong></td>
        <td><asp:TextBox ID="txtTitle" runat="server" Width="400px" class="form-control" style="max-width:150px;"></asp:TextBox></td>
      </tr>
      <tr>
        <td style="white-space: normal; width: 30%; height: 69px;" class="tdbgleft" align="right"><strong>邮件内容：<br />
          (请在内容中使用<br />
          {UserName},{Url}<br />
          两个关键字符)</strong></td>
        <td><asp:TextBox ID="txtContext" runat="server" TextMode="multiLine" Rows="15"  class="form-control" style="max-width:400px"></asp:TextBox></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="提  交" OnClick="Button1_Click" class="btn btn-primary"/></td>
      </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="../../js/Common.js"></script>
</asp:Content>
