<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Shop.SelectPayPlat, App_Web_i3mjmiwl" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户充值</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="panel panel-primary" style="width: 500px; margin: auto; margin-top: 40px;">
            <div class="panel-heading text-center"><b>在线充值</b></div>
            <div class="panel-body">
                <span class="pull-left" style="line-height:32px; margin-left:70px;">充值金额：</span>
                <asp:TextBox ID="Money_T" CssClass="form-control text_md" Text="100" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="R2" CssClass="tips" runat="server" ControlToValidate="Money_T" Display="Dynamic" ForeColor="Red" ErrorMessage="金额不能为空" />
                <asp:RegularExpressionValidator CssClass="tips" ID="R1" runat="server" ControlToValidate="Money_T" Display="Dynamic" ForeColor="Red" ErrorMessage="金额数值不正确" ValidationExpression="^\d+(\.\d{1,2})?$" />
                <div class="clearfix"></div>
                <div class="text-center" style="margin-top:20px;">
                    <asp:Button ID="BtnSubmit" CssClass="btn btn-primary" runat="server" Text=" 下一步 " OnClick="BtnSubmit_Click" />
                </div>
            </div>
        </div>
        <style>
            .tips{ line-height:32px;margin-left:5px;}
        </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>