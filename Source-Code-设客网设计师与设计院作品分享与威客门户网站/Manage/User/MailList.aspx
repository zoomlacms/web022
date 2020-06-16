<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.MailList, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<title>客服信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
  <tr>
    <td align="center" colspan="2"><b>邮件发送</b></td>
  </tr>
  <tr>
    <td align="right"><strong>邮件模板：</strong></td>
    <td><asp:DropDownList ID="MailTemp" CssClass="form-control text_md" runat="server" AutoPostBack="true" OnSelectedIndexChanged="GetTempCon">
        <asp:ListItem Value="0">请选择</asp:ListItem>
        <asp:ListItem></asp:ListItem>
      </asp:DropDownList></td>
  </tr>
  <tr>
    <td width="15%" align="right"><strong>收件人选择：</strong></td>
    <td style="text-align: left"><table>
        <tr>
          <td><asp:RadioButton ID="RadUserType0" runat="server" GroupName="UserType" Text="所有会员" Checked="True" /></td>
          <td></td>
        </tr>
        <tr>
          <td valign="top"><asp:RadioButton ID="RadUserType2" runat="server" GroupName="UserType" Text="指定用户名" /></td>
          <td><asp:TextBox class="form-control" Style="max-width: 150px; display: inline;" ID="TxtUserName" runat="server" Width="260px"></asp:TextBox>
            <span style="color: blue"><=[</span><a href="javascript:void(0)" onclick="SelectUser();"><span style="color: green">会员列表</span></a> <span style="color: blue">]</span>多个用户名间请用<span style="color: blue">英文的逗号</span>分隔</td>
        </tr>
        <tr>
          <td valign="top"><asp:RadioButton ID="RadUserType3" runat="server" GroupName="UserType" Text="指定E-mail" /></td>
          <td><asp:TextBox class="form-control" Style="max-width: 150px; display: inline;" ID="TxtEmails" runat="server" Width="260px">&nbsp;</asp:TextBox>
            <=[多个Email间请用<span style="color: blue">英文的逗号</span>分隔] </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="right"><strong>邮件主题：</strong></td>
    <td><asp:TextBox class="form-control" ID="TxtSubject" runat="server" Width="390px"></asp:TextBox>*
      <asp:RequiredFieldValidator ID="ValrSubject" runat="server" ControlToValidate="TxtSubject" Display="None" ErrorMessage="邮件主题不能为空！"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td><strong>邮件内容：</strong></td>
    <td><asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Width="700px"  Height="300px"></asp:TextBox></td>
  </tr>
  <tr>
    <td width="15%" align="right">邮件模板标签</td>
    <td> 邮件内容支持HTML，邮件内容中可用标签说明如下:<br />
      <textarea rows="8" cols="50" Width="700px"  style="width:700px; height:480px;" disabled="disabled">
                    邮件标题：{$Title/} 
                     [以下是站点基本信息]
                    ======================================
                    网站名称：{$SiteName/}   
                    网站地址：{$SiteUrl/}  
                    网站标题：{$SiteTitle/}     
                    网站Logo：{$LogoUrl/}   
                    广告图：{$BannerUrl/}
                    网站版权：{$Copyright/}  
                    网站关键字：{$MetaKeywords/}   
                    网站描述：{$MetaDescription/}   
                    站长姓名：{$Webmaster/}
                    站长信箱：{$WebmasterEmail/}  

                     [以下是您在注册会员时填写的基本信息]
                    ======================================
                    <!-- personal -->
                    账号: {$UserName/}
                    密码：{$password/}
                    公司名：{$Company/}
                    办公电话：{$OfficePhone/}  
  
                    昵称: {$HoneyName/}
                    头像: {$UserFace/}
                    性别：{$sex/} 
                    出生日期：{$BirthDay/}  
                    国家：{$Country/}
                    省份：{$Province/}
                    城市：{$City/}
                    县：{$County/}
                    地址：{$Address/} 
                    邮政编码：{$ZipCode/}
                    电话：{$Mobile/}
                    传真：{$Fax/}
                    E-mail地址：{$Email/}
                    个人主页：{$HomePage/}
                    QQ号：{$QQ/}
                    MSN地址：{$MSN/}   
                    签名档：{$Sign/} 
                    <!-- /personal -->
                </textarea></td>
  </tr>
  <tr>
    <td align="right"><strong>发件人：</strong></td>
    <td><asp:TextBox class="form-control" Style="max-width: 200px;" ID="TxtSenderName" runat="server" Width="350px"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="right"><strong>回复Email：</strong></td>
    <td><asp:TextBox class="form-control" Style="max-width: 200px;" ID="TxtSenderEmail" runat="server" Width="350px"></asp:TextBox>
      <asp:RegularExpressionValidator ID="ValeSenderEmail" runat="server" ControlToValidate="TxtSenderEmail" Display="None" ErrorMessage="回复Email不是有效的Email地址！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
  </tr>
  <tr>
    <td align="right"><strong>邮件优先级：</strong></td>
    <td><asp:RadioButtonList ID="RadlPriority" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Value="2">高</asp:ListItem>
        <asp:ListItem Selected="True" Value="0">普通</asp:ListItem>
        <asp:ListItem Value="1">低</asp:ListItem>
      </asp:RadioButtonList></td>
  </tr>
  <tr class="tdbgbottom">
    <td colspan="2" style="text-align: center;"><asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" class="btn btn-primary" />
      <input id="Reset1" type="reset" value="清除" class="btn btn-primary" /></td>
  </tr>
</table>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"> 
<script type="text/javascript" src="/JS/Common.js"></script> 
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script> 
<script>
function SelectUser() {
    window.open('UserList.aspx?TypeSelect=UserList&OpenerText=<%=TxtUserName.ClientID %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
}
</script> 
<%=Call.GetUEditor("TxtContent",2) %> </asp:Content>
