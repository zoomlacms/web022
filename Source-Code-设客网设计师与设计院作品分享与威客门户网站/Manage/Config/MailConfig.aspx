<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Config_MailConfig, App_Web_zol0bvcz" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件参数配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table width="99%" cellspacing="1" cellpadding="0" class="table table-striped table-bordered table-hover">
        <tr>
          <td  ><strong><%:lang.LF("发送人邮箱") %>：</strong></td>
          <td><asp:TextBox ID="TextBox1" runat="server" class="form-control" Width="200" ></asp:TextBox></td>
        </tr>
        <tr >
          <td  ><strong><%:lang.LF("发送邮件服务器(SMTP)") %>：</strong></td>
          <td ><asp:TextBox ID="TextBox2" runat="server" class="form-control" Width="200" ></asp:TextBox></td>
        </tr>
        <tr>
          <td ><strong><%:lang.LF("端口号") %>：</strong></td>
          <td ><asp:TextBox ID="TextBox3" runat="server" class="form-control" Width="200" ></asp:TextBox></td>
        </tr>
        <tr >
          <td  ><strong><%:lang.LF("此服务器要求安全连接(SSL)") %>：</strong></td>
          <td ><asp:CheckBox ID="CheckBox1" runat="server" Checked="True" /></td>
        </tr>
        <tr >
          <td  ><strong><%:lang.LF("身份验证方式") %>：</strong></td>
          <td style="height: 23px;"><asp:RadioButton ID="RadioButton1" runat="server" GroupName="AuthenticationType"/>
            无<br />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="AuthenticationType"/>
            基本<br />
            如果您的电子邮件服务器要求在发送电子邮件时显式传入用户名和密码，请选择此选项。 <br />
            <span class="pull-left" style="line-height:32px;">发件人的用户名：</span>
            <asp:TextBox ID="TextBox5" runat="server" Columns="30" class="form-control pull-left" Width="200" ></asp:TextBox>
            <div class="clearfix"></div>
            <span class="pull-left" style="line-height:32px;">发件人的密&nbsp;&nbsp;&nbsp;码：</span>
            <asp:TextBox ID="TextBox6" TextMode="Password" Width="200" runat="server" Columns="30" CssClass="form-control"></asp:TextBox>
            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="AuthenticationType" />
            NTLM (Windows 身份验证) <br/>
            如果您的电子邮件服务器位于局域网上，并且您使用 Windows 凭据连接到该服务器，请选择此选项。 </td>
        </tr>
        <tr >
          <td  ><strong><%:lang.LF("系统邮件接收地址") %>：</strong></td>
          <td >
              <asp:TextBox ID="TextBox4" Width="290" runat="server" class="form-control pull-left" ></asp:TextBox>
              <span class="pull-left" style="line-height:32px;margin-left:5px;">用于接收系统运行、商务等邮件，多个地址用逗号分隔。</span> 
          </td>
        </tr>
    </table>
    <div class=" text-center">
        <asp:Button ID="Button1" runat="server" Text="保存设置" OnClick="Button1_Click" class="btn btn-primary" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>