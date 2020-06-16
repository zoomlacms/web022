<%@ page language="C#" autoeventwireup="true" inherits="manage_Exam_InputTechUser, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>选择招生人员</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td class="tdbg">选择招生人员：
                                        <asp:DropDownList ID="EnrollUser" runat="server" CssClass="x_input">
                                        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EnrollUser"
                    Display="Dynamic" ErrorMessage="请选择招生人员！"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="下一步" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-primary" OnClientClick="closethiswin();return false" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script>
            function closethiswin() {
                parent.Dialog.close();
            }
    </script>
</asp:Content>