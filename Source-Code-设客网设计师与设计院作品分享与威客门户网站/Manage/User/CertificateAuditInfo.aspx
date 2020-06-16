<%@ page language="C#" autoeventwireup="true" inherits="manage_User_CertificateAuditInfo, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>审核证书</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr align="center">
      <td colspan="4" class="spacingtitle"><strong>
        <asp:Label ID="LblUserName" runat="server" Text=""></asp:Label>的证书认证</strong></td>
    </tr>
  </table>
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td class="tdbgleft" style="width: 15%; height: 25px;" align="right"> 公司名称：
        <asp:Label ID="lblUserID" runat="server" Text="" Visible="false"></asp:Label></td>
      <td style="width: 85%; height: 25px;" colspan="3" align="left"><asp:TextBox ID="txtCompany" runat="server" Text="" class="form-control" style="max-width:150px;"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="width: 15%; height: 25px;" align="right"> 当前状态：
        <asp:Label ID="lblState" runat="server" Text="" Visible="false"></asp:Label></td>
      <td style="width: 85%; height: 25px;" colspan="3" align="left"><asp:Label ID="lblstrState" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="width: 15%; height: 25px;" align="right"> 认证类型： </td>
      <td style="width: 85%; height: 25px;" colspan="3" align="left"><asp:Label ID="lblApproveType" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="width: 15%; height: 25px;" align="right"> 公司介绍： </td>
      <td style="width: 85%; height: 25px;" colspan="3" align="left"><asp:TextBox ID="txtCompanyDescribe"  runat="server" TextMode="MultiLine" Height="60px" class="form-control"  Width="473px"  ></asp:TextBox></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="width: 15%; height: 25px;" align="right">证书图片：</td>
      <td style="width: 85%; height: 25px;" colspan="3" align="left">
          <asp:Image ID="imgCommpanyLogo" style="width:66px; height:66px;" onerror="this.onerror=null;this.ImageUrl='/UploadFiles/nopic.gif'" alt="" runat="server" ImageUrl="/UploadFiles/nopic.gif" />
      </td>
    </tr>
    <tr>
        <td colspan="2" style="width: 85%; height: 25px;" colspan="3" align="left">
      <asp:Button ID="btnPass" runat="server" Text="认证通过" class="btn btn-primary"  onclick="btnPass_Click" />
      <asp:Button ID="btnFailure" runat="server" Text="认证未通过" class="btn btn-primary"   onclick="btnFailure_Click" />
      <asp:Button ID="Button1" runat="server" Text="返回列表"  class="btn btn-primary"  onclick="Button1_Click"/>
        </td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
