<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ModuleList, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>企业信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td style="height: 20px"><asp:DropDownList ID="DropDownList1" runat="server" DataTextField="ModelName" DataValueField="ModelID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"> </asp:DropDownList></td>
    </tr>
    <tr>
      <td>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
            CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"  DataKeyNames="ID">      
          <Columns>
          <asp:TemplateField HeaderText="选择">
            <ItemTemplate>
              <asp:CheckBox ID="chkSel" runat="server" />
            </ItemTemplate>
            <HeaderStyle Width="5%" />
            <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
          </asp:TemplateField>
          <asp:BoundField DataField="ID" HeaderText="系统ID" />
          <asp:BoundField DataField="UserID" HeaderText="用户ID" />
          <asp:BoundField DataField="UserName" HeaderText="用户名" />
          <asp:CommandField ShowSelectButton="True" SelectText="查看" />
          <asp:CommandField ShowDeleteButton="True" />
          </Columns>
         <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
    </tr>
    <tr>
      <td><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
        <asp:Button ID="Button1" runat="server" Font-Size="9pt" Text="取消" OnClick="Button1_Click" class="btn btn-primary" />
        <asp:Button ID="Button2" runat="server" Font-Size="9pt" Text="批量删除" OnClick="Button2_Click" class="btn btn-primary" /></td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
