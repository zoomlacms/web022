<%@ page language="C#" autoeventwireup="true" inherits="manage_File_tjlink, App_Web_3njldbsp" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加站内链接</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <asp:Label ID="LblTitle" runat="server" Text="添加站内链接" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>关键字：&nbsp;</strong></td>
            <td class="style4" align="left">
                <asp:TextBox ID="Txtlinkname" runat="server" CssClass="form-control text_md"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <strong>目标框架：&nbsp;</strong>
            </td>
            <td lign="left">
                <asp:DropDownList ID="TxtLwindows" CssClass="form-control text_md" Width="150" runat="server">
                    <asp:ListItem Value="_self">_self</asp:ListItem>
                    <asp:ListItem Value="_blank" Selected="True">_blank</asp:ListItem>
                    <asp:ListItem Value="_top">_top</asp:ListItem>
                    <asp:ListItem Value="_parent">_parent</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <strong>链接网址：&nbsp;</strong></td>
            <td class="style1" align="left">
                <asp:TextBox ID="TxtKeywordText" class="form-control text_md" runat="server">http://</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>正则表达：&nbsp;</strong>
            </td>
            <td>
                <asp:TextBox ID="Regex_Txt" class="form-control text_md" runat="server"></asp:TextBox>
                <span style="color:#f00;">如果正则表达式存在，则替换正则而不替换关键字</span>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>正则替换值：&nbsp;</strong>
            </td>
            <td>
                <asp:TextBox ID="RegexValue_T" class="form-control text_md" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>权值：&nbsp;</strong>
            </td>
            <td>
                <asp:TextBox ID="Priority" class="form-control text_md" runat="server"></asp:TextBox>
                <span style="color: #F00">* 权值越大，优先替换</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Priority" runat="server" ErrorMessage="权值不能为空"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Priority" ValidationExpression="^\d+$" ForeColor="Red" runat="server" ErrorMessage="只能为正整数或0"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                <strong>链接状态：&nbsp;</strong></td>
            <td valign="middle">
                <asp:RadioButtonList ID="Txtstate" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">开启</asp:ListItem>
                    <asp:ListItem Value="1">关闭</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>--%>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加" runat="server" OnClick="EBtnSubmit_Click1" />
                <asp:Button ID="EBtnModify" class="btn btn-primary" OnClick="EBtnModify_Click" Text="修改" runat="server" Visible="false" />
                <button type="button" class="btn btn-primary" onclick="location.href='Addlinkhttp.aspx'" >返回列表</button>
                <asp:HiddenField ID="id1" runat="server" />
                <asp:HiddenField ID="id2" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
