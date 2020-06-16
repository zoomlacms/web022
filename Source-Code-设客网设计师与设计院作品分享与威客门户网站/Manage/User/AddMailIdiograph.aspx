<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_AddMailIdiograph, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>签名管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <!--
    <div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>-->
  <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="35%" align="right" class="tdbgleft"><strong>签名标签：</strong></td>
        <td><asp:TextBox ID="txtName" runat="server" class="form-control" style="max-width:350px;"></asp:TextBox></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="35%" align="right" class="tdbgleft"><strong>签名内容：</strong></td>
        <td><asp:TextBox ID="txtContext" class="form-control" runat="server" Rows="3" TextMode="MultiLine"  style="max-width:350px;"></asp:TextBox></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="35%" align="right" class="tdbgleft"><strong>签名状态：</strong></td>
        <td><asp:RadioButtonList ID="rblState" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="True" Selected="true">启用</asp:ListItem>
            <asp:ListItem Value="False">禁用</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr class="tdbg">
        <td colspan="2" align="center"><asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="提  交" OnClick="Button1_Click" /></td>
      </tr>
    </table>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
