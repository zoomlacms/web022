<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_MyCommentList, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我参与的</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">我参与的 </li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<div class="us_topinfo" style="margin-bottom:10px;">
<div class="us_pynews">
<asp:DropDownList ID="DropDownList1" CssClass="form-control text_md" Width="150" runat="server">
<asp:ListItem Value="0" Selected="True">按标题查找</asp:ListItem>
<asp:ListItem Value="1">按ID查找</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="TxtSearchTitle" CssClass="form-control text_md" runat="server"></asp:TextBox>
<asp:Button ID="Btn_Search" runat="server" class="btn btn-primary" Text="搜索" OnClick="Btn_Search_Click" />
</div>
<div class="cleardiv"></div>
</div>
<div class="us_seta">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
OnPageIndexChanging="EGV_PageIndexChanging" OnRowDataBound="Egv_RowDataBound" >
<Columns>
<asp:BoundField DataField="GeneralID" HeaderText="ID">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="标题">
<ItemTemplate>
<asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title" ) %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="作者">
<ItemTemplate>
<asp:Label ID="lblInput" runat="server" Text='<%# Eval("inputer" ) %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="发表时间">
<ItemTemplate>
<asp:Label ID="Label1" runat="server" Text='<%# getTime(Eval("commentTime")) %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="状态">
<ItemTemplate>
<asp:Label ID="Label1" runat="server" Text='<%# GetStatus(Eval("status", "{0}")) %>'></asp:Label>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="操作">
<ItemTemplate>
<a href='../../Comments/CommentFor.aspx?ID=<%#Eval("GeneralID","{0}") %>' target="_blank">访问</a>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
<PagerStyle HorizontalAlign="Center" />
<RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
</div>
</div>
</asp:Content>
