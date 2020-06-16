<%@ page language="C#" autoeventwireup="true" inherits="Common_Chat_chathistory, App_Web_trr1yflt" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>历史聊天记录</title>
    <link type="text/css" href="chat.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="chat_container" style="width:80%;max-width:1024px;min-width:600px; margin:auto;">
            <div class="chat_header">
                <span id="uinfo_name"><asp:Label runat="server" ID="CUName_L"></asp:Label></span>
                <span style="float: right; margin-right: 10px;">
                    <span class="glyphicon glyphicon-remove opbtn" onclick="parent.ChatClose();" title="关闭"></span>
                </span></div>
                <asp:Repeater runat="server" ID="RPT">
                    <HeaderTemplate><div class="chat_body" style="max-height:700px;padding-bottom:10px;"></HeaderTemplate>
                    <ItemTemplate>
                        <%#GetChatContent() %>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            <div style="text-align:center;"><asp:Literal ID="Page_Lit" runat="server" EnableViewState="false"></asp:Literal></div>
       </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>