<%@ page language="C#" autoeventwireup="true" inherits="Manage_WeiXin_WelPage, App_Web_ycbxry5x" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>欢迎语</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr><td>标题</td><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control text_300" />
            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="Title_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="标题不能为空!" />
                       </td></tr>
        <tr><td>内容</td><td>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="Content_T" CssClass="form-control text_300" />
            <asp:RequiredFieldValidator ID="p2" runat="server" ControlToValidate="Content_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="内容不能为空!" />
                       </td></tr>
        <tr><td>图片</td><td><asp:TextBox runat="server" ID="PicUrl_T" CssClass="form-control text_300" placeholder="http://demo.zoomla.cn/pic.jpg" /><span class="rd_green">图片链接,支持JPG、PNG格式，较好的效果为大图360*200，小图</span></td></tr>
        <tr><td>链接</td><td><asp:TextBox runat="server" ID="Url_T" CssClass="form-control text_300" /><span class="rd_green">点击图文消息跳转链接</span></td></tr>
        <tr><td></td><td><asp:Button runat="server" ID="Save_Btn"  CssClass="btn btn-primary" Text="确定" OnClick="Save_Btn_Click"/></td></tr>
    </table>
</asp:Content>