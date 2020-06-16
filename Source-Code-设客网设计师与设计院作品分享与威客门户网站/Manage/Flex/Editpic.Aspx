<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_Flex_editpic, App_Web_54finohp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加模板</title>
<script>
function savepic() {
var Mu_BackImg1 = document.getElementById("Mu_BackImg1").value;
var Mu_BackImg2 = document.getElementById("Mu_BackImg2").value;
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <table class="table table-striped table-bordered table-hover">
            <tr align="center">
                <td colspan="2" class="style1">
                    <strong>
                        <asp:Label ID="LblTitle" runat="server" Text="上传模板" Font-Bold="True"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft">模板小图：
                </td>
                <td class="tdbg" style="text-align: left; width: 80%;" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <asp:TextBox ID="Mu_BackImg1" class="l_input" runat="server" Width="260px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ErrorMessage="模板小图不能为空!" ControlToValidate="Mu_BackImg1"></asp:RequiredFieldValidator>
                    <iframe id="Iframe1" src="../../Common/PubimgUpload.aspx?menu=Mu_BackImg1" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
                </td>
            </tr>
            <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">模板大图：
                </td>
                <td class="tdbg" style="text-align: left; width: 80%;">
                    <asp:TextBox ID="Mu_BackImg2" class="l_input" runat="server" Width="260px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="模板大图不能为空!" ControlToValidate="Mu_BackImg2"></asp:RequiredFieldValidator>
                    <iframe id="Iframe2" src="../../Common/PubimgUpload.aspx?menu=Mu_BackImg2" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="text-align: center" colspan="2" class="style2">
                    <asp:Button ID="Button2" class="C_input" runat="server" OnClick="Button2_Click" Text="保存" />&nbsp;&nbsp;
                <input name="BtnCancel" class="C_input" type="button" onclick="javascript: window.close();"
                    value=" 取消 " />

                </td>
            </tr>
        </table>
</asp:Content>
