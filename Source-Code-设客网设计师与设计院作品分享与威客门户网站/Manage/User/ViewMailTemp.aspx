<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ViewMailTemp, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>预览模板</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td colspan="2" class="spacingtitle"><b>邮件模板</b></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>模板名称：</strong>
          <asp:Label ID="LblTempName" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td  style="height: 28px; width: 100%;"><strong>缩略图：</strong> 
            <a href="javascript:seeBigPicture()" >    
            <asp:Image ID="LblPic" ImageUrl="#" runat="server" Width="150" Height="100" ToolTip="点击浏览大图"
                onerror="this.src='/UploadFiles/nopic.gif';"/> 
            </a> 
            <div style="display:none;position:absolute;" id="seePicture" onclick="seeBigPicture()">
                <asp:Image ID="LblPic2" alt="原图" runat="server"/>
            </div>
            <asp:Label ID="LblIncept" runat="server" Text=""></asp:Label></td>
      </tr>
       <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>创建人：</strong>
          <asp:Label ID="LblAddUser" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>创建时间：</strong>
          <asp:Label ID="LblCreateTime" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td align="left" style="height: 28px; width: 100%;"><strong>模板内容：</strong>
         </td>
      </tr>
      
      <tr>  <td><asp:Label ID="LblContent" runat="server" Text="Label"></asp:Label></td> </tr>
      <tr class="tdbg">
        <td align="left" style="height: 28px; width: 100%; text-align: center">
          <asp:Button ID="BtnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" OnClientClick="return confirm('是否要删除此短消息？')" class="btn btn-primary" />
          <asp:Button ID="BtnReturn" runat="server" OnClick="BtnReturn_Click" Text="返回" class="btn btn-primary" />
          </td>
      </tr>
    </table>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
     <script type="text/javascript">
         function seeBigPicture() {
             top = getAbsoluteTop("LblPic");
             left = getAbsoluteLeft("LblPic");
             $("#seePicture").attr("top", top);
             $("#seePicture").attr("left", left);
             $("#seePicture").toggle("fast");
         }
         function getAbsoluteLeft(objectId) {
             o = document.getElementById(objectId)
             oLeft = o.offsetLeft
             while (o.offsetParent != null) {
                 oParent = o.offsetParent
                 oLeft += oParent.offsetLeft
                 o = oParent
             }
             return oLeft
         }
         //获取控件上绝对位置
         function getAbsoluteTop(objectId) {
             o = document.getElementById(objectId);
             oTop = o.offsetTop;
             while (o.offsetParent != null) {
                 oParent = o.offsetParent
                 oTop += oParent.offsetTop  // Add parent top position
                 o = oParent
             }
             return oTop
         }
         //获取控件宽度
         function getElementWidth(objectId) {
             x = document.getElementById(objectId);
             return x.offsetWidth;
         }
                </script>
</asp:Content>
