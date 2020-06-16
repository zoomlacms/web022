<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_AddCard, App_Web_qq1xfqnx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.form-control { max-width: 200px; }
</style>
<title>VIP卡管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td colspan="2" style="text-align:center;">生成VIP</td>
      </tr>
      <tr>
        <td style="width:120px;"> 生成数量： </td>
        <td>&nbsp;
          <asp:TextBox ID="num" class="form-control" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td> 卡片起始数： </td>
        <td>&nbsp;
          <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td> 卡片加盟商： </td>
        <td>&nbsp;
          <asp:TextBox ID="tx_user" class="form-control" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td> 到期时间： </td>
        <td>&nbsp;
          <asp:TextBox ID="endtime" class="form-control" runat="server" Width="133px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox></td>
      </tr>
      <tr>
        <td> 卡片状态 ： </td>
        <td><asp:RadioButtonList ID="IsOpen" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:ListItem Value="1">停用</asp:ListItem>
            <asp:ListItem Value="2">开启</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr>
        <td> 卡类型 ： </td>
        <td><asp:DropDownList ID="DropDownList2" runat="server"> </asp:DropDownList></td>
      </tr>
      <tr>
        <td><strong></strong></td>
        <td><asp:Button ID="Button1" class="btn btn-primary" style="width:110px;"  runat="server" Text="开始生成" OnClick="Button1_Click" /></td>
      </tr>
    </table>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/pacalendar.js" ></script>
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/calendar.js"></script>
</asp:Content>