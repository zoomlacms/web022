<%@ page language="C#" autoeventwireup="true" inherits="manage_Polymeric_Addclass, App_Web_eptrlqwq" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加分类</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table  class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <strong>
                    <asp:Label ID="LblTitle" runat="server" Text="添加聚合分类" Font-Bold="True"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td align="right">
                分类名称：
            </td>
            <td style="text-align: left; width: 60%;">
                <asp:TextBox ID="Classname" class="l_input" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                会员级别：
            </td>
            <td  style="text-align: left; width: 60%;">
                <asp:DropDownList ID="Classid" runat="server">
                <asp:ListItem Value="" Text="所有级别"></asp:ListItem>
                <asp:ListItem Value="0" Text="普通会员"></asp:ListItem>
                <asp:ListItem Value="1" Text="企业会员"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                分类排序：(数字越大排列越前)
            </td>
            <td  style="text-align: left; width: 60%;">
                <asp:TextBox ID="Orderid" class="l_input" runat="server" Width="91px">0</asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg">
            <td style="text-align: center" colspan="2" class="style2">
                <asp:Button ID="EBtnSubmit" class="C_input" Text="保存" runat="server" 
                    onclick="EBtnSubmit_Click" />&nbsp;&nbsp;
                <input name="BtnCancel" class="C_input" type="button" onclick="javascript: window.location.href = 'ClassManage.aspx'"
                    value=" 取消 " />
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>