<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="Space_SpaceManage, App_Web_folwwh0k" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>我的聚合页</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
 <div id="pageflag" data-nav="group" data-ban="group"></div>
    <div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的聚合</li> 
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 

    <div class="clearfix"> </div>
  </div> 
  <div class="container" id="selallno">
  <ZL:ExGridView ID="EGV" runat="server" AllowPaging="true" class="table table-bordered table-hover table-striped" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="10" OnRowCommand="Lnk_Click" GridLines="None" OnRowDataBound="Egv_RowDataBound"  >
    <Columns>
    <asp:BoundField DataField="GeneralID" HeaderText="ID">
      <HeaderStyle Width="6%" /> 
    </asp:BoundField>
    <asp:TemplateField HeaderText="标题">
      <HeaderStyle Width="40%" />
      <ItemTemplate> <a href='/User/Content/ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'> <%# Eval("Title")%></a> </ItemTemplate>
      <ItemStyle HorizontalAlign="left" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="状态">
        <HeaderStyle Width="6%" />
      <ItemTemplate> <%# GetStatus(Eval("Status", "{0}")) %> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="已生成">
      <HeaderStyle Width="6%" />
      <ItemTemplate> <%# GetCteate(Eval("IsCreate", "{0}"))%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作">
      <HeaderStyle Width="15%" />
      <ItemTemplate> <a href='/User/Content/ShowPubList.aspx?ID=<%# Eval("GeneralID") %>' class="option_style" title="预览"><i class="fa fa-eye"></i></a>
          <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' CssClass="option_style"  title="修改"><i class="glyphicon glyphicon-pencil"></i></asp:LinkButton>
          <a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank" class="option_style"><i class="fa fa-globe"></i>访问</a>
        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' CssClass="option_style" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><%# GetIsDe(Eval("Status", "{0}")) %></i></asp:LinkButton>
      </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
    <PagerStyle HorizontalAlign="Center" />
  </ZL:ExGridView>
       </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">

</asp:Content>