<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.ModelInfoList, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>用户模型列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active"><%= modelname%></li>
</ol>
</div>
<div class="container">
<div class="us_setaa2" runat="server">
<ul>
<li><a href="UserInfo.aspx">注册信息</a></li>
<li><a href="UserBase.aspx">基本信息</a></li>
<asp:Label ID="Label4" runat="server" Text=""></asp:Label>
</ul>
</div>
<div class="us_seta" style="margin-top: 10px;" runat="server">
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
<asp:HiddenField ID="HdnModelID" runat="server" />
</div>
<div class="us_seta" id="manageinfo" runat="server">
<h1 style="text-align: center">信息列表</h1>
<ZL:ExGridView ID="Egv" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowDataBound="Egv_RowDataBound"  CellPadding="4" GridLines="None" EmptyDataText="暂无数据">
<Columns>
</Columns>
<PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
</ZL:ExGridView>
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
