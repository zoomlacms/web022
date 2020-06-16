<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.ModelField, App_Web_qq1xfqnx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>字段列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr class="gridtitle" align="center" style="height:25px;">
        <td width="10%" height="20">
            <strong>字段名</strong></td>
        <td width="10%">
            <strong>字段别名</strong></td>
        <td width="10%">
            <strong>字段类型</strong></td>
        <td width="10%">
            <strong>字段级别</strong></td>
        <td width="10%">
            <strong>是否必填</strong></td>
        <td width="20%">
            <strong>排序</strong></td>                        
        <td width="30%">
            <strong>操作</strong></td>
    </tr>
<asp:Repeater ID="RepSystemModel" runat="server">
<ItemTemplate>
    <tr>
        <td><%#Eval("FieldName")%></td>
        <td align=center><%#Eval("FieldAlias")%></td>
        <td align=center><%# Eval("FieldType", "{0}")%></td>
        <td align=center><font color="#339900">系统</font></td>
        <td align=center><%# GetStyleTrue(Eval("IsNotNull", "{0}"))%></td>
        <td>
        </td>
        <td align="center">
        </td>
    </tr>
</ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="RepModelField" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <ItemTemplate>
        <tr>
            <td>
                <%#Eval("IsShow", "{0}") == "False" ? "<font color=#999999>" : ""%><%#Eval("FieldName")%><%#Eval("IsShow","{0}")=="False"?"</font>":"" %>
            </td>
            <td align=center><%#Eval("FieldAlias")%></td>
            <td align=center><%# GetFieldType(Eval("FieldType", "{0}"))%></td>
            <td align=center>自定义</td>
            <td align=center> <%# GetStyleTrue(Eval("IsNotNull", "{0}"))%></td>
            <td align=center>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("FieldID") %>'>上移</asp:LinkButton> | <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("FieldID") %>'>下移</asp:LinkButton>
            </td>
            <td align="center"><a href="UpdateModelField.aspx?ModelID=<%# Eval("ModelID") %>&FieldID=<%# Eval("FieldID") %>">修改</a> | <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?\r\n\r\n删除字段后需要重新生成静态Html代码')">删除</asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</table>
<div class="clearbox"></div>
<table class="table table-striped table-bordered table-hover">
    <tr>
    <td width="30%">
    <asp:TextBox ID="TxtTemplate" class="l_input" MaxLength="255" runat="server" Columns="50"></asp:TextBox>
    <input type="button" class="btn btn-primary" style="width:100px;" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtTemplate') + '&FilesDir=', 650, 480)" class="btn"/>
    <asp:Button ID="Button1" class="btn btn-primary" style="width:100px;" runat="server" Text="设定模板" OnClick="SetTemplate" /></td>			
    </tr>
</table>
    <asp:HiddenField runat="server" ID="navBar_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
</asp:Content>