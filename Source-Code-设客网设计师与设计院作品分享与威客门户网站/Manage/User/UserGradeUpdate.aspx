<%@ page language="C#" autoeventwireup="true" inherits="manage_User_UserGradeUpdate, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>确认房间</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
     <div style="width: 100%; margin-left: auto; margin-right: auto; text-align: center;">
    <div style="width: 100px; margin-left: auto; margin-right: auto; text-align: left;">
      <asp:HiddenField ID="hfId" runat="server" />
      <asp:Repeater ID="repUserGrade" runat="server">
        <ItemTemplate>
          <input name='rdUserGrade' type="radio" <%#ZoomLa.Common.DataConverter.CLng(Eval("Grade").ToString())==ZoomLa.Common.DataConverter.CLng( Request["grade"])?"checked=true":"" %> value='<%#Eval("Grade") %>' />
          <%#Eval("Name") %><br />
        </ItemTemplate>
      </asp:Repeater>
    </div>
    <div style="width: 100%; margin-left: auto; margin-right: auto; text-align: center;">
      <asp:Button ID="btOK" class="btn btn-primary" runat="server" Text="确定" onclick="btOK_Click" />
      <asp:Button ID="brNO" class="btn btn-primary" runat="server" Text="取消" OnClientClick="Dialog.close()"/>
    </div>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="../../js/Drag.js"></script>
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script>

    function gotourl(url) {
        try {
            parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../" + url; void (0);
        }
    }
</script>
</asp:Content>
