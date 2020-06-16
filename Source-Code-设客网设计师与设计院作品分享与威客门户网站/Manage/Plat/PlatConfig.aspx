<%@ page language="C#" autoeventwireup="true" inherits="Plat_Config_Default, App_Web_3jlet1o3" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title><%:Call.SiteName %>_配置信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#Tabs0" data-toggle="tab">平台配置</a></li>
        </ul>
        <div class="tab-content">
                <table class="table table-bordered table-striped table-hover">
                    <tbody class="tab-pane active" id="Tabs0">
                        <tr>
                        <td class="text-right" style="width:8%;">新浪key:</td>
                        <td><asp:TextBox ID="SinaKey_T" style="max-width:500px;" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="text-right">新浪Secret:</td>
                        <td><asp:TextBox ID="SinaSecret_T" style="max-width:500px;" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="text-right">新浪回调地址:</td>
                        <td><asp:TextBox style="max-width:500px;" ID="SinaCallBack_T" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="text-right">腾讯appid:</td>
                        <td><asp:TextBox ID="QQKey_T" runat="server" style="max-width:500px;" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="text-right">腾讯回调地址:</td>
                        <td><asp:TextBox ID="QQCallBack_T" style="max-width:500px;" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="2" class="text-left">
                            <asp:Button ID="SaveConfig" runat="server" OnClick="SaveConfig_Click" CssClass="btn btn-primary" Text="保存设置" />
                            <%--<asp:Button ID="ReConfig" runat="server" CssClass="btn btn-primary" Text="初始设置" />--%>
                        </td>
                    </tr>
                </table>
            </div>       
</asp:Content>

