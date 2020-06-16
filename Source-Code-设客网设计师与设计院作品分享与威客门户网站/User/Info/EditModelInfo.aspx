<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.EditModelInfo, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>用户模型信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">用户模型信息</li>
    </ol>
</div>
<div class="container">
    <div class="us_topinfo" style="width: 98%">
        <div class="us_pynews">
            <span><a title="网站首页" href="/" target="_parent">
                <asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label>
            </a></span><span>&gt;&gt;
      <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            </span><span>&gt;&gt; </span><span>
                <asp:Label ID="LblModel" runat="server" Text="模型名称"></asp:Label>
            </span>
        </div>
        <div class="cleardiv"></div>
    </div>
    <div class="us_setaa2" style="margin-top: 10px;" id="manageinfos" runat="server">
        <ul>
            <li><a href="UserInfo.aspx">注册信息</a></li>
            <li><a href="UserBase.aspx">基本信息</a></li>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            <div class=" clearfix"></div>
        </ul>
    </div>
    <div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center"><asp:Label ID="LblModelName" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 35%; line-height: 30px; text-align: right" nowrap>用户名：</td>
                <td style="width: 65%; line-height: 30px">
                    <asp:Label ID="LblUser" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
            <tr class="tdbgbottom">
                <td colspan="2" align="center">
                    <asp:HiddenField ID="HdnModel" runat="server" />
                    <asp:HiddenField ID="HdnID" runat="server" />
                    <asp:HiddenField ID="HdnType" runat="server" />
                    <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" CssClass="btn btn-primary" Style="display: none"></asp:TextBox>
                    <asp:Button ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" CssClass="btn btn-primary" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Common/Common.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>