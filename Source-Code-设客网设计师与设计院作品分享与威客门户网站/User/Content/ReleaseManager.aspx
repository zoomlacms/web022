<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_ReleaseManager, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>竞标管理</title>
<style>
#AllID_Chk { display:none; }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="sub"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">竞标管理</li> 
</ol>
</div>
<div class="container">
<div class="us_seta">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >

<Columns>
<asp:BoundField DataField="GeneralID" HeaderText="ID">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="标题">
<HeaderStyle Width="50%" />
<ItemTemplate>
<%# ZoomLa.Common.BaseClass.Htmlcode(Eval("Title","{0}"))%>
</ItemTemplate>
<ItemStyle HorizontalAlign="left" />
</asp:TemplateField>
<asp:TemplateField HeaderText="操作">
<ItemTemplate>
<a href="../../Comments/CommentFor.aspx?ID=<%#Eval("GeneralID","{0}") %>" target="_blank" class="option_style" title="访问"><i class="fa fa-eye"></i></a>  
<asp:LinkButton runat="server" CommandArgument='<%#Eval("GeneralID") %>' CommandName="Edit" CssClass="option_style"><i class="glyphicon glyphicon-pencil" title="修改"></i></asp:LinkButton>
<asp:LinkButton runat="server" CommandArgument='<%#Eval("GeneralID") %>' CommandName="Del" OnClientClick="return confirm('你确定删除吗');" CssClass="option_style"><i class="fa fa-trash"></i>删除</asp:LinkButton>                      
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="竞标管理">
<ItemTemplate>
<%# GetRelease(Eval("GeneralID","{0}"),Eval("Title","{0}")) %>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns> 
<RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
<div class="tdbg">
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="HiddenField2" runat="server" />
<asp:HiddenField ID="HiddenField3" runat="server" />
</div>
</div>
</div>
</asp:Content>