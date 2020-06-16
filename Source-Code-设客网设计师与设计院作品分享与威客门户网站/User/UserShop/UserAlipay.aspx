<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_UserAlipay, App_Web_rfdgijc1" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">支付宝账号管理</li>
    </ol>
    <div class="s_bright">
        <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
        <div class="us_topinfo" style="margin-top: 10px;"><a href="UserAlipay.aspx">支付宝账号管理</a></div>
        <div class="us_topinfo" style="margin-top: 10px;">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td colspan="2" align="center">支付宝账号设置</td>
                </tr>
                <tr>
                    <td width="30%" align="center">账号：</td>
                    <td width="70%">&nbsp;<asp:TextBox ID="usernametxt" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center">合作伙伴ID：</td>
                    <td>&nbsp;<asp:TextBox ID="parID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" style="height: 15px">支付宝安全校验码：</td>
                    <td style="height: 15px">&nbsp;<asp:TextBox ID="safetxt" CssClass="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="height: 32px">&nbsp;</td>
                    <td style="height: 32px">&nbsp;<asp:Button ID="Savebtn" runat="server" CssClass="btn btn-primary" Text=" 保 存 " OnClick="Savebtn_Click" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
