<%@ page language="C#" autoeventwireup="true" inherits="manage_User_CertificateAudit, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>证书审核列表</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td class="spacingtitle" align="center" colspan="3"> 证书审核 </td>
    </tr>
    <tr>
      <td> 关键字：
        <asp:TextBox ID="TextBox1" runat="server" Width="102px" class="form-control" style="max-width:350px;"></asp:TextBox>
        认证状态：
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="text">
          <asp:ListItem Value="3" Selected="True">选择</asp:ListItem>
          <asp:ListItem Value="1">待认证</asp:ListItem>
          <asp:ListItem Value="2">认证成功</asp:ListItem>
          <asp:ListItem Value="0">认证失败</asp:ListItem>
        </asp:DropDownList>
        指定用户：
        <asp:TextBox ID="TextBox2" runat="server" Width="102px" class="form-control" style="max-width:150px;"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="搜  索" class="btn btn-primary"  OnClick="Button2_Click" /></td>
    </tr>
  </table>
  <div class="clearbox"> </div>
  <ZL:ExGridView ID="Egv" runat="server" AllowPaging="true" OnPageIndexChanging="Egv_PageIndexChanging" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover" Width="100%" OnRowCommand="Lnk_Click">
    <Columns>
    <asp:TemplateField HeaderText="用户名称">
      <ItemTemplate> <%#Eval("UserName")%> </ItemTemplate>
      <HeaderStyle Width="10%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="公司名称">
      <ItemTemplate> <%#Eval("CompanyName")%> </ItemTemplate>
      <HeaderStyle Width="10%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="认证状态">
      <ItemTemplate> <%# getStrstate((int)Eval ("State"))%> </ItemTemplate>
      <HeaderStyle Width="10%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="认证类型">
      <ItemTemplate> <%#Eval("ApproveType")%> </ItemTemplate>
      <HeaderStyle Width="10%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作">
      <ItemTemplate>
        <asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteUser" OnClientClick="if(!this.disabled) return confirm('确实要删除此会员吗？');" CommandArgument='<%# Eval("UserID")%>'>删除</asp:LinkButton>
        | <a href='CertificateAuditInfo.aspx?UserID=<%# Eval("UserID")%>'>进行认证</a> </ItemTemplate>
      <HeaderStyle Width="10%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
  </ZL:ExGridView>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
