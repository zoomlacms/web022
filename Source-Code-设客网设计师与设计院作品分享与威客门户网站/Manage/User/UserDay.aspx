<%@ page language="C#" autoeventwireup="true" inherits="manage_User_UserDay, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>节日提醒</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr class="tdbg">
      <td align="center" class="spacingtitle" colspan="2">信息统计 </td>
    </tr>
    <tr>
      <td width="200px">短信余额</td>
      <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td class="style1">发送次数 </td>
      <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
  </table>
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td align="center" class="spacingtitle" colspan="2">节日提醒 </td>
      </tr>
      <tr>
        <td width="200px"> 选择日期 </td>
        <td>

            <asp:TextBox ID="SendDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' })" runat="server" class="form-control" style="max-width:200px;"></asp:TextBox>
        </td>
      </tr>
      <tr class="tdbg">
        <td class="style1">发送条件</td>
        <td><asp:CheckBoxList ID="SendDay" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Text="今天" Selected="True"></asp:ListItem>
            <asp:ListItem Value="1" Text="明天" Selected="True"></asp:ListItem>
          </asp:CheckBoxList></td>
      </tr>
      <tr class="tdbg">
        <td class="style1">发送目标</td>
        <td><asp:CheckBoxList ID="Sendto" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Text="邮箱" Selected="True"></asp:ListItem>
            <asp:ListItem Value="1" Text="手机短信" Selected="True"></asp:ListItem>
          </asp:CheckBoxList></td>
      </tr>
      <tr class="tdbg">
        <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="发送" class="btn btn-primary"  onclick="Button1_Click" />
          <asp:Button ID="Button2" runat="server" Text="取消" class="btn btn-primary" /></td>
      </tr>
    </table>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
