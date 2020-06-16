<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_BkAlter, App_Web_dbnpt1ot" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>词条修改</title>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr >
                <td class="text-center" style="line-height:45px;"><strong>百科</strong></td>
                <td>
                    <asp:TextBox runat="server"  TextMode="MultiLine" ID="code" name="message" Width="500" Height="400"></asp:TextBox>
                    <%=Call.GetUEditor("code", 4) %>
                </td>
            </tr>
            <tr>
                <td class="text-center" style="line-height:80px;"><strong>参考资料</strong></td>
                <td><asp:TextBox runat="server" CssClass="form-control" ID="txtReference"  TextMode="MultiLine" Width="500" Height="80"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="text-center" style="line-height:80px;"><strong>开放分类</strong></td>
                <td><asp:TextBox runat="server" CssClass="form-control" ID="txtBtype"  TextMode="MultiLine" Width="500" Height="80"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="text-center" style="line-height:80px;"><strong>扩展阅读</strong></td>
                <td><asp:TextBox runat="server" CssClass="form-control" ID="txtExtend"  TextMode="MultiLine" Width="500" Height="80"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="btn btn-primary" OnClick="btnSubmit_Click"  OnClientClick="getCode()"/>&nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="back" Text="返回" CssClass="btn btn-primary" OnClick="back_Click" />
                </td>
                
            </tr>
        </table>
    </div>
    <!-- 版权信息 -->
</asp:Content>
