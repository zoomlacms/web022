<%@ page language="C#" autoeventwireup="true" inherits="Manage_WeiXin_AutoReply, App_Web_ycbxry5x" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>自动回复</title>
<style>.td_md{width:100px;line-height:30px !important;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>关键词:</td>
            <td><asp:TextBox ID="filter_T" runat="server" CssClass="form-control text_300" />
                 <asp:RequiredFieldValidator ID="p0" runat="server" ControlToValidate="filter_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="关键词不能为空!" />
            </td>
        </tr>
        <tr><td>标题</td><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control text_300" />
             <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="Title_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="标题不能为空!" />
                       </td></tr>
        <tr><td>内容</td><td><asp:TextBox runat="server" TextMode="MultiLine" ID="Content_T" CssClass="form-control text_300" />
             <asp:RequiredFieldValidator ID="p2" runat="server" ControlToValidate="Content_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="内容不能为空!" />
                       </td></tr>
        <tr><td>图片</td><td><asp:TextBox runat="server" ID="PicUrl_T" CssClass="form-control text_300" placeholder="http://demo.zoomla.cn/pic.jpg" /></td></tr>
        <tr><td>链接</td><td><asp:TextBox runat="server" ID="Url_T" CssClass="form-control text_300" /><span class="rd_green">点击图文消息跳转链接</span></td></tr>
        <tr>
            <td></td><td >
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-primary" OnClick="Save_B_Click" Text="提交保存" />
                <a href="ReplyList.aspx" class="btn btn-primary">返回列表</a></td>
        </tr>
    </table>
</asp:Content>

