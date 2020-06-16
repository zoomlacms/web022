<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.MyComment, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的评论</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">我的评论 </li>
</ol>
</div>
<div class="container">
<ZL:ExGridView runat="server" ID="EGV" DataKeyNames="CommentID"  AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
CssClass="table table-striped table-bordered table-hover" EmptyDataText="无相关信息!!" 
OnPageIndexChanging="EGV_PageIndexChanging" >
<Columns>
<asp:BoundField DataField="CommentID" HeaderText="ID">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="所属内容标题">
<HeaderStyle Width="25%" />
<ItemTemplate>
<a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank"><%# GetTitle(Eval("GeneralID", "{0}"))%></a>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="Title" HeaderText="评论标题">
<HeaderStyle Width="24%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="Contents" HeaderText="评论内容">
<HeaderStyle Width="25%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="发表日期">
<ItemTemplate>
<%# Eval("CommentTime", "{0:yyyy-mm-dd}")%>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
<PagerStyle HorizontalAlign="Center" />
<RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
</div>
</asp:Content>
