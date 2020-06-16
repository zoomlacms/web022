<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Commons.FileUpload, App_Web_mqckmlam" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>文件上传</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
    <table style="height: 100%; border: 0; width: 100%;">
        <tr class="tdbg">
            <td>
                <asp:FileUpload ID="FupFile" runat="server" style="display:inline; line-height:10px;" />
                <asp:Button ID="BtnUpload" runat="server" Text="上传" CssClass="btn btn-info btn-xs" OnClick="BtnUpload_Click" />
                <asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择上传路径" ForeColor="Red" ControlToValidate="FupFile"></asp:RequiredFieldValidator>
                <asp:Label ID="LblMessage" runat="server" ForeColor="red"></asp:Label>
                <asp:HiddenField ID="HiddenNodeDir" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content> 
