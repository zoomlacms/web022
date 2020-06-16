<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_ShopPinput, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮址列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td align="center" class="spacingtitle">商城导入数据</td>
        </tr>
        <tr class="tdbg" style="height: 24px">
            <td>来源：<asp:DropDownList ID="SubscribeToType" runat="server">
            </asp:DropDownList></td>
        </tr>
        <tr class="tdbg">
            <td>导入商城地址：<asp:FileUpload ID="FileUpload1" runat="server" Height="20px"
                Width="287px" />
                <asp:Button ID="Button2" runat="server" Text="导 入" OnClick="Button2_Click" CssClass="btn btn-primary"/>&nbsp;支持换行的.txt与.csv格式，点击<a href="/UploadFiles/2009-2-12_Output.csv">[这里]</a> 商城地址文件模板
            </td>
        </tr>
        <tr class="tdbg">
            <td align="center">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
</asp:Content>