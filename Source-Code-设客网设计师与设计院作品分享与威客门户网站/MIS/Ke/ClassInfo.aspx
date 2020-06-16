<%@ page language="C#" autoeventwireup="true" inherits="Manage_Exam_ClassInfo, App_Web_tbedsbxg" masterpagefile="~/User/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>时段管理</title>
<style>
#BreadNav {display:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td>班级名称</td>
            <td>开始时间</td>
            <td>结束时间</td>
            <td>操作</td>
        </tr>
        <ZL:ExRepeater ID="Class_RPT" runat="server" OnItemCommand="Class_RPT_ItemCommand" PageSize="10" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='8'><div class='text-center'>" PageEnd="</div></td></tr>">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Regulationame") %></td>
                    <td><%#Eval("SDate") %></td>
                    <td><%#Eval("Edate") %></td>
                    <td><asp:LinkButton CommandName="Del" CommandArgument='<%#Eval("ID") %>' runat="server">删除</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
    <div class="text-center">
        <button type="button" class="btn btn-primary" onclick="parent.CloseInfo()">返回</button>
    </div>
</asp:Content>
