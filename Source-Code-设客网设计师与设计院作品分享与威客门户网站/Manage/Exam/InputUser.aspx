<%@ page language="C#" autoeventwireup="true" inherits="manage_Exam_InputUser, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>导入用户</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="border">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="4" class="spacingtitle" align="center">会员导入
                </td>
            </tr>
            <tr class="tdbg">
                <td width="220" align="right" class="tdbgleft" style="width: 15%; height: 22px;">选择文件：
                </td>
                <td align="left" class="style3" colspan="3">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" />
                </td>
            </tr>
            <tr class="tdbg">
                <td width="220" align="right" class="tdbgleft" style="width: 15%; height: 22px;">说明：
                </td>
                <td align="left" class="style3" colspan="3">
                    <asp:TextBox ID="txt_infos" runat="server" TextMode="MultiLine" Height="113px"
                        Width="402px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td style="height: 21px" colspan="4" align="center">
                    <asp:Button ID="Button1" runat="server" Text="导入" CssClass="btn btn-primary" OnClick="Button1_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" class="btn btn-primary" runat="server" Text="取　消" Width="70px"
                        OnClientClick="parent.Dialog.close();return false;" TabIndex="13" />
                </td>
            </tr>
        </table>
    </div>
    状态：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js" ></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>