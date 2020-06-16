<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_ReplyList, App_Web_od3mslno" enableviewstate="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<form id="form1" runat="server">
<start>
<asp:Repeater runat="server" ID="ReplyList">
<ItemTemplate>
<div class="replyrow" id="msgitem-<%#Eval("ID") %>">
  <div class="pull-left"> <img class="replyface" src="<%#Eval("UserFace") %>" /> </div>
  <div class="reply_body">
    <div class="reply_btnlist"><%#GetReplyStr(Eval("ReplyID")) %> </div>
    <div class="replybottom grayremind">
        <%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日 HH:mm") %>
        <%#Convert.ToInt32(Eval("CreateUser"))==UserID?"<span class='glyphicon glyphicon-trash' title='删除' onclick=\"PostDelMsg("+Eval("ID")+");\"></span>":"" %>
        <span class="glyphicon glyphicon-comment" title="回复" onclick="DisReplyOP(<%#Eval("Pid") %>,<%#Eval("ID") %>,'<%#Eval("CreateUName") %>');"></span>
  </div>
  <div class="replyspear"></div>
</div></div>
</ItemTemplate>
<FooterTemplate></FooterTemplate>
</asp:Repeater>
</start>
</form>