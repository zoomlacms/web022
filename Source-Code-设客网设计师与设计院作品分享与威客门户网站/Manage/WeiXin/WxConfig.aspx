<%@ page language="C#" autoeventwireup="true" inherits="Manage_WeiXin_WxConfig, App_Web_ycbxry5x" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="alert alert-info" role="alert">注意事项: AppID与Secret要与微信公众号下的appID与appsecret一致,公众号名可以自定义设置</div>
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_m">公众号名</td>
            <td><asp:TextBox runat="server" ID="Alias_T" CssClass="form-control text_300"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="Alias_T" ErrorMessage="公众号名不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>微信公众号</td>
            <td>
                <asp:TextBox runat="server" ID="WxNo_T" CssClass="form-control text_300"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="WxNo_T" ErrorMessage="微信公众号不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>AppID</td>
            <td>
                <asp:TextBox runat="server" ID="AppID_T" CssClass="form-control text_300" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="AppID_T" ErrorMessage="AppID不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr><td>Secret</td><td>
            <asp:TextBox runat="server" ID="Secret_T" CssClass="form-control text_300" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="Secret_T" ErrorMessage="Secret不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Token</td><td><asp:Label runat="server" ID="Token_L" /></td></tr>
        <tr><td>操作</td><td>
            <asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click"  CssClass="btn btn-primary"/>
            <a href="WxAppManage.aspx" class="btn btn-primary">返回</a></td></tr>
    </table>
    <script>
    </script>
</asp:Content>