<%@ page language="C#" autoeventwireup="true" inherits="User_UserFunc_UnitList, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>管理奖</title></asp:Content>
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
<%--                <asp:TemplateField HeaderText="下线业绩金额(汇总)"><ItemTemplate><%#Eval("ChildAMount","{0:f0}")+"<span class='remind_g_x'>"+Eval("Remind")+"</span>" %></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="无提成"><ItemTemplate><%#Eval("RealUnit0","{0:f0}") %></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="可提成1%"><ItemTemplate><%#Eval("RealUnit10","{0:f0}")+GetUnit(Eval("RealUnit10","{0:f0}"),0.01) %></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="可提成2%"><ItemTemplate><%#Eval("RealUnit20","{0:f0}")+GetUnit(Eval("RealUnit20"),0.02) %></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="可提成3%"><ItemTemplate><%#Eval("RealUnit30","{0:f0}")+GetUnit(Eval("RealUnit30"),0.03) %></ItemTemplate></asp:TemplateField>--%>
                <asp:TemplateField HeaderText="提成金额"><ItemTemplate><span class="unit"><%#Eval("RealUnit","{0:f0}") %></span></ItemTemplate></asp:TemplateField>
                <asp:BoundField HeaderText="日期" DataField="cdate" />
                <asp:BoundField HeaderText="备注" DataField="Remind" />
            </Columns>
        </ZL:ExGridView></div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
