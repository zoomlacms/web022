<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Page.NodeTree, App_Web_n12dq2lj" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>黄页节点</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div id="nodeNav" style="padding: 0 0 0 0;width:95%;">
        <div>
            <div class="tvNavDiv">
                <div class="left_ul">
                    <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
                </div>
            </div>
            <span style="color: green;" runat="server" id="remind" visible="false" />
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>