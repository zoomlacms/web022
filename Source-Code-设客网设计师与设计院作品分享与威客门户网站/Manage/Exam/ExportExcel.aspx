<%@ page language="C#" autoeventwireup="true" inherits="manage_Exam_ExportExcel, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>导入数据</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        导入Excel文件：<asp:FileUpload runat="server" ID="FileUpload1" />
        <asp:Button   runat="server" ID="Export"  class="C_input" Text="导入文件"  onclick="Export_Click" /> 
        [<asp:LinkButton ID="LinkButton1" Text="点击下载Excel模版↓" OnClick="Button1_Click" runat="server"></asp:LinkButton>]
        <asp:HiddenField ID="HdnPath" runat="server" />
</asp:Content>