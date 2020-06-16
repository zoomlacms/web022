<%@ page language="C#" autoeventwireup="true" inherits="MIS_AddMis, App_Web_5qibkz2g" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加目标</title>
<link href="../App_Themes/User.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script src="/Plugins/Ckeditor/EditFile/sample.js" type="text/javascript"></script>
<link href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
  <div class="Mis_pad">
    <table width="100%"   class="border"  >
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 150px" class="tdbgleft"><strong> 目标名称<b>*</b>：</strong></td>
        <td><asp:TextBox ID="TextTitle" class="M_input" runat="server" />
          <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td   class="tdbgleft"><strong>当前状态：</strong></td>
        <td><asp:RadioButtonList ID="TextStatus" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:listitem Value="0">未启动</asp:listitem>
            <asp:listitem Value="1" selected>进行中</asp:listitem>
            <asp:listitem Value="2">已完成</asp:listitem>
          </asp:RadioButtonList></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td   class="tdbgleft"><strong>选择分类：</strong></td>
        <td><asp:RadioButtonList ID="TextType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
            <asp:listitem value="0">事业</asp:listitem>
            <asp:listitem value="1" selected>财富</asp:listitem>
            <asp:listitem value="2">家庭</asp:listitem>
            <asp:listitem value="3" selected>休闲</asp:listitem>
            <asp:listitem value="4">学习</asp:listitem>
          </asp:RadioButtonList></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 150px" class="tdbgleft"><strong> 参与人<b>*</b>：</strong></td>
        <td><asp:TextBox ID="TextJoiner" class="M_input" runat="server" /></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>开始时间<b>*</b>：</strong></td>
        <td><asp:TextBox ID="StarDate"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" /></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>完成时间<b>*</b>：</strong></td>
        <td><asp:TextBox ID="EndDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" /></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>详细<b>*</b>：</strong></td>
        <td><asp:TextBox id="TextContent" width="580px" height="200px" TextMode="MultiLine"   runat="server"></asp:TextBox></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td colspan="2"><asp:Button Text="确定"  runat="server" ID="BtnCommit" CssClass="i_bottom"  OnClick="Button_Click"/></td>
      </tr>
      <asp:HiddenField ID="ParentID" runat="server" />
    </table>
  </div>
</form>
<script id="headscript" >
//<![CDATA[
CKEDITOR.replace('TextContent',
{
skin: 'v2',
enterMode: 2,
width: '100%',
shiftEnterMode: 2
//toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
});
    //]]>
</script>
</body>
</html>