<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_UserRole, App_Web_ilbgbtjb" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>用户权限</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">能力中心</a></li>
<li><a href="/Plat/Admin/">管理中心</a></li>
<li>角色管理 [<a href="AddUserRole.aspx" style="color:red;">添加角色</a>]</li>
</ol>
  <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" OnRowCommand="EGV_RowCommand" OnRowDataBoundDataRow="EGV_RowDataBoundDataRow">
    <Columns>
    <asp:TemplateField>
      <ItemTemplate>
        <input type="checkbox" name="idChk" title="选择" value='<%#Eval("ID") %>' />
      </ItemTemplate>
      <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="ID">
      <ItemTemplate> <%# Eval("ID")%> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="角色名称">
      <ItemTemplate> <a href="RoleAuth.aspx?ID=<%#Eval("ID") %>" target="_blank"> <%# Eval("RoleName")%></a> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="创建时间">
      <ItemTemplate> <%# Eval("CreateTime")%> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="备注">
      <ItemTemplate> <%# Eval("RoleDesc")%> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作">
      <ItemTemplate> <a href="AddUserRole.aspx?ID=<%#Eval("ID") %>"><span class="glyphicon glyphicon-pencil"  style="color:#7D98A1;"></span></a>
        <asp:LinkButton ID="DelBtn" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除"><img src="/App_Themes/AdminDefaultTheme/images/del.png" /></asp:LinkButton>
      </ItemTemplate>
    </asp:TemplateField>
    </Columns>
  </ZL:ExGridView>
  <asp:Button runat="server" Text="批量删除" OnClientClick="return confirm('你确定要删除选中项吗!');" ToolTip="批量删除" CssClass="btn btn-primary" ID="BatDel_Btn" OnClick="BatDel_Btn_Click"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
#EGV { margin-top: 10px; }
</style>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");
        $("#chkAll").click(function () {
            selectAllByName(this, "idChk");
        });
    });
</script>
</asp:Content>
