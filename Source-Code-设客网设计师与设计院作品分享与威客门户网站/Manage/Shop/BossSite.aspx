<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BossSite, App_Web_qqf21ky3" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>提成设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
            <table class="table table-striped table-bordered table-hover">
            <tr>
                <td class="tdbgleft" style="width: 200px; height: 23px;">
                    vip卡提成比例：</td>
                <td>&nbsp;
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="tdbgleft" style="width: 200px; height: 23px;">
                                        全市提成比列：</td>
                <td>&nbsp;
                     <asp:TextBox ID="TextBox4" class="form-control" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 200px; height: 23px;">
                                        间接招商提成比例：</td>
                <td>&nbsp;
                     <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 200px; height: 23px;">
                    招商提成比例：</td>
                <td>&nbsp;
                   <asp:TextBox ID="TextBox3" class="form-control" runat="server"></asp:TextBox></td>
            </tr>
               <tr>
                <td class="tdbgleft" style="width: 200px; height: 23px;">
                    间接VIP卡提成：</td>
                <td>&nbsp;
                   <asp:TextBox ID="TextBox5" class="form-control" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存设置" OnClick="Button1_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script src="/JS/Common.js" type="text/javascript"></script>
</asp:Content>