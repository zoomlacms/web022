<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_Component_AddComChild, App_Web_bguszhxl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加子类组件</title>
<style type="text/css">
.leftwidth
{
    background: #CBE6FC;
    padding: 2px;
    width: 30%;
}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>
    <div class="clearbox">
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="spacingtitle" colspan="2" style="height: 22px">
                <asp:Literal ID="LblTitle" Text="添加子类组件" runat="Server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                组件名称：
            </td>
            <td style="width: 100px">
                <asp:TextBox ID="txt_Name" runat="server" class="form-control" Width="196px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                排序：
            </td>
            <td style="width: 100px">
                <asp:TextBox ID="txt_OrderNum" runat="server" class="form-control" Text="0" Width="76px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                父类组件：
            </td>
            <td style="width: 100px">
                <asp:DropDownList ID="ParentTitle" runat="server" Width=100px 
                    AutoPostBack="true" onselectedindexchanged="ParentTitle_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                组件说明：
            </td>
            <td style="width: 100px; height: 20px">
                <asp:TextBox ID="txt_Remark" class="form-control" runat="server" Height="100px" TextMode="MultiLine"
                    Width="416px"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg">
            <td class="text-center" colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="添加子类组件" Width="95px" OnClick="Button2_Click"
                    class="btn btn-primary" />
                <asp:Button ID="btnBack" class="btn btn-primary" runat="server" Text="返回组件列表" Width="100px"
                    OnClientClick="location.href='ComChildManage.aspx';return false;" 
                    onclick="btnBack_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

