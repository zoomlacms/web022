<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_ShowPubList, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>内容预览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Mycontent.aspx?NodeID=<%= NodeID%>">投稿管理</a></li>
<li class="active">信息预览</li>
</ol>
</div>
<div class="container">
<table class="table table-striped table-bordered table-hover">
<tr>
<td class="text-center">
<asp:Label ID="Label1" runat="server" Text="信息预览"></asp:Label>
</td>
</tr>
<tr>
<td>
<asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-striped table-bordered table-hover">
<Fields></Fields>
<FooterStyle Font-Bold="True" BackColor="#FFFFFF" />
<CommandRowStyle Font-Bold="True" CssClass="tdbgleft" />
<RowStyle />
<FieldHeaderStyle Font-Bold="True" />
<PagerStyle HorizontalAlign="Center" />
<HeaderStyle Font-Bold="True" />
<EditRowStyle />
<AlternatingRowStyle />
</asp:DetailsView>
</td>
</tr>
</table>
</div>
<script>
$("#DetailsView1 td").each(function(index, element) {
    if($(this).html()=="营业执照")
	{
		$(this).next("td").html("<img src='<%Call.Label("{$UploadDir/}");%>"+$(this).next("td").html()+"' alt='资料认证' onerror=\"javascript:this.src='/UploadFiles/nopic.gif';\" />")
	}
    if($(this).html()=="组织机构代码证")
	{
		$(this).next("td").html("<img src='<%Call.Label("{$UploadDir/}");%>"+$(this).next("td").html()+"' alt='资料认证' onerror=\"javascript:this.src='/UploadFiles/nopic.gif';\" />")
	}
});
</script>
</asp:Content>