<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_PromoList, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>推广佣金</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="shop" data-ban="UserInfo"></div>
    <div class="container margin_t10">
        <ol class="breadcrumb">
            <li>您现在的位置：<a href="/" title="网站首页"><%= Call.SiteName%></a></li>
            <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
            <li><a href="Deposit.aspx">资金管理</a></li>
            <li class="active">流水记录</li>
        </ol>
    </div>
    <div class="container"><div class="bgfff">
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false"
            OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True"
            CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="尚无分红记录">
            <Columns>
                <asp:BoundField HeaderText="佣金" DataField="Unit" DataFormatString="{0:f0}" />
                <asp:BoundField HeaderText="日期" DataField="cdate" />
                <asp:BoundField HeaderText="备注" DataField="Remind" />
            </Columns>
        </ZL:ExGridView></div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>