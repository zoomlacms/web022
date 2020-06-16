<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.Manage.User.MobileMsg, App_Web_3vlddosr" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>发送手机短信</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle"><b>发送手机短信</b></td>
        </tr>
        <tr>
            <td align="right" style="height: 28px; width: 25%;">短信余额：</td>
            <td align="left">
                <asp:Label ID="LblMobile" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" style="height: 28px; width: 15%;">&nbsp;接收人号码：<br />
                (多条信息发送以半角逗号区隔，最多支持100个/次超100个请自行做循环))</td>
            <td>
                <table id="TblAddMessage" width="100%" visible="true" runat="server">
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="TxtInceptUser" runat="server" Width="326px" class="form-control" Style="max-width: 350px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtInceptUser" runat="server" Display="Dynamic">号码不能为空 </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtInceptUser" Display="Dynamic" ErrorMessage="手机号码格式不正确" ValidationExpression="^((13[0-9]{9})|(15[0-9]{9})|(18[0-9]{9}))(,((13[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})))*$"></asp:RegularExpressionValidator>
                            &nbsp; <span style="color: #0000ff">&lt;=[</span><a href="#" onclick="SelectUser();"> <span style="text-decoration: underline; color: Green;">会员手机列表</span></a><span style="color: #0000ff">]</span></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" style="height: 23px; width: 15%;">短信内容：<br />
                (字数70个字以内)</td>
            <td>
                <asp:TextBox ID="EditorContent" runat="server" Rows="10" TextMode="MultiLine" class="form-control" Style="max-width: 99%;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="*短消息内容不能为空" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 50px;" align="center">
                <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" class="btn btn-primary" />
                &nbsp;&nbsp;
        <asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-primary" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        function SelectUser() {
            window.open('UserMobile.aspx?OpenerText=<%=TxtInceptUser.ClientID %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
    }
    </script>
</asp:Content>

