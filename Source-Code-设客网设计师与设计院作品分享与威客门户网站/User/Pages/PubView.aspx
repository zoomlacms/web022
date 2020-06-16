<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Pages_PubView, App_Web_n12dq2lj" clientidmode="Static" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>查看信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>	
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Default.aspx">企业黄页</a></li>
        <li class="active">查看信息</li>
    </ol>
    <asp:HiddenField ID="HiddenID" runat="server" />
    <asp:HiddenField ID="HiddenSmall" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenType" runat="server" />
    <asp:HiddenField ID="HiddenMenu" runat="server" />
    <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CellPadding="4" GridLines="None" Font-Size="12px" Style="margin-bottom: 3px; margin-top: 2px;" CssClass="table table-striped table-bordered table-hover" ></asp:DetailsView>
    <asp:HiddenField ID="HdnModelID" runat="server" />
    <asp:HiddenField ID="HiddenPubid" runat="server" />
    <div style="text-align: center;">
        <asp:Button ID="Button2" runat="server" Text="回复" CssClass="btn btn-primary" OnClick="Button2_Click" />
        <asp:Button ID="Button1" runat="server" Text="返回" CssClass="btn btn-primary" OnClick="Button1_Click" />
    </div>
</asp:Content>
