<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_Jobview, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>用户模型列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/">" + SiteConfig.SiteInfo.SiteName + "</a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active"><%= modelname%></li>
    </ol>
</div>
<div class="container">
    <div id="Div1" class="us_setaa2" style="margin-top: 10px;" runat="server">
        <ul>
            <li><a href="UserInfo.aspx">注册信息</a></li>
            <li><a href="UserBase.aspx">基本信息</a></li>
            <li>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </li>
            <div class="clearfix"></div>
        </ul>
    </div>
    <div id="Div2" class="us_seta" style="margin-top: 10px; text-align: center" runat="server">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="HdnModelID" runat="server" />
    </div>
    <div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
        <h1 style="text-align: center">信息列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        </h1>
        <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-striped table-bordered table-hover">
            <Fields></Fields>
        </asp:DetailsView>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function gotoUrl(url) {
            window.location.href = url;
        }
    </script>
</asp:Content>