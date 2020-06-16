<%@ page language="C#" autoeventwireup="true" inherits="User_Message_Mobile, App_Web_st4ieofp" enableviewstatemac="false" masterpagefile="~/User/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>手机短信</title>
<style type="text/css">
.nav li{float:left;width:80px;text-align:center;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mainDiv">
    <ul class="Messge_nav">
        <li><a href="MessageSend.aspx">写邮件</a></li>
        <li><a href="Message.aspx">收件箱</a></li>
        <li><a href="MessageOutbox.aspx">发件箱</a></li>
        <li><a href="MessageDraftbox.aspx">草稿箱</a></li>
        <li><a href="MessageGarbagebox.aspx">垃圾箱</a></li>
        <li class="active"><a href="Mobile.aspx">手机短信</a></li><div class="clearfix"></div>
    </ul><div class="clearfix"></div>
    <table class="table_li table-border" style="margin-top:10px;">
      <tr>
        <td align="right" style="height: 28px; width: 15%;">接收方手机号码：</td>
        <td><asp:TextBox ID="TxtInceptUser" runat="server" Width="326px" />
              <%--(多条信息发送以半角逗号区隔，最多支持100个/次超100个请自行做循环)--%>一次只能发给一个号码一条短信
                <asp:RegularExpressionValidator ControlToValidate="TxtInceptUser" runat="server" ForeColor="Red"  ValidationExpression="^(1(([35][0-9])|(47)|[8][012356789]))\d{8}$" >手机号码有误，请重新输入！</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtInceptUser" runat="server" ForeColor="Red">手机号码不能为空 </asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align="right" style="height: 23px; width: 15%;">短信内容：<br />
          (字数70个字以内)</td>
        <td><asp:TextBox ID="EditorContent" runat="server" Rows="10" TextMode="MultiLine" Width="99%" class="x_input"></asp:TextBox>
          <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator></td>
      </tr>
     
      <tr align="center">
        <td colspan="2" style="height: 50px;" align="center">
            <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" class="btn btn-primary"/>
          &nbsp;&nbsp;
<%--          <asp:Button ID="BtnReset" runat="server" Text="清除" OnClientClick="return CheckIsMobile(document.getElementById('TxtInceptUser').value)" OnClick="BtnReset_Click" class="btn btn-primary"/>--%>
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" /></td>
      </tr>
    </table>
      <div style=" border:1px solid #CCC; padding:10px;margin-top:10px;">
   <asp:Label ID="LblMobile" runat="server" Text="Label" style="color:Red;"></asp:Label>
  提示：系统支持以Mobile.aspx?MB=[手机号码]&txt=[发送内容]方式GET将手机号码传值发送，如：Mobile.aspx?MB=13177777714&txt=默认短信内容。</div>
  </div>
</asp:Content>
