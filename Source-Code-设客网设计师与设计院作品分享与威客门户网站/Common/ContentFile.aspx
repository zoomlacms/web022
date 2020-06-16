<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Common.FileUpload, App_Web_mqckmlam" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>文件上传</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table style="height: 100%; border: 0; width: 100%">
        <tr class="tdbg">
            <td style="width: 400px;">
                <asp:FileUpload ID="FupFile" runat="server" Style="display: inline;" />
                &nbsp;                           
                <asp:Button ID="BtnUpload" runat="server" Text="上传" CssClass="btn btn-info btn-xs" OnClick="BtnUpload_Click" />
            </td>
            <td class="style2" id="show1" runat="server" visible="false" style="width: 100px;">是否上传水印: </td>
            <td class="style3" id="show2" runat="server" visible="false">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="2">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择上传路径" ControlToValidate="FupFile"></asp:RequiredFieldValidator>
                <asp:Label ID="LblMessage" runat="server" ForeColor="red" Text=""></asp:Label>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
