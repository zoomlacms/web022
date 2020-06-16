<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddAgent, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加代理商房间</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>
  <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="25%" align="right" class="tdbgleft"><strong>代理商名称：</strong></td>
        <td><asp:TextBox ID="txtName" runat="server" class="form-control" style="width:auto"></asp:TextBox></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="25%" align="right" class="tdbgleft"><strong>代理房间：</strong></td>
        <td><asp:TextBox ID="TextBox1" runat="server" class="form-control" style="width:auto"></asp:TextBox></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="25%" align="right" class="tdbgleft"><strong>代理时间：</strong></td>
        <td><asp:TextBox ID="TextBox2" runat="server"  class="form-control" style="width:auto"></asp:TextBox></td>
      </tr>
      <tr class="tdbg">
        <td colspan="2" align="center"><asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="添加"  OnClick="Button1_Click" />
          <asp:Button ID="Button2"  CssClass="btn btn-primary"  runat="server" Text="返回" CausesValidation="false" onclick="Button2_Click" /></td>
      </tr>
    </table>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>

