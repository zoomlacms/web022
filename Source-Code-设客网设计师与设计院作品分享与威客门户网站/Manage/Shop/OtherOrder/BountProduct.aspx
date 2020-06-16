<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_OtherOrder_BountProduct, App_Web_zdyyh32r" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>关联产品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="h_27"></div>
    <div class="sitelist">
      <ZL:ExGridView ID="EGV"  runat="server" AutoGenerateColumns="False" PageSize="20" OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" class="table table-striped table-bordered table-hover" EmptyDataText="没有任何数据！" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True">
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
        <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true" />
        <asp:TemplateField HeaderText="站点ID">
          <ItemTemplate> <%# Eval("SiteID") %> </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="网站名称">
          <ItemTemplate> <%#Eval("SiteName")%> </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="生效时间">
          <ItemTemplate> <%#Eval("CreateDate") %> </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="到期时间">
          <ItemTemplate> <%#Eval("EndDate") %> </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="绑定的订单">
          <ItemTemplate> <%#GetBound(DataBinder.Eval(Container,"DataItem.SiteID","{0}"))%> </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作">
          <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" CommandName="select" CommandArgument='<%#Eval("SiteID") %>' runat="server">绑定</asp:LinkButton>
          </ItemTemplate>
        </asp:TemplateField>
        </Columns>
      </ZL:ExGridView>
    </div>
    </form>
    <script type="text/javascript">
    $().ready(function () {
        $("#<%=EGV.ClientID%> tr").mousemove(function () { this.className = 'tdbgmouseover'; }).mouseout(function () { this.className = 'tdbg'; });
    });
</script> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>.sitelist tr { height: 24px; line-height: 24px; }
</style>
</asp:Content>