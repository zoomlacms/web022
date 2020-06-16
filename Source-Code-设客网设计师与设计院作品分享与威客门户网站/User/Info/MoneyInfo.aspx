<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_MoneyInfo, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>金额明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">金额明细</li>
<div class="clearfix"></div>
</ol>
<div class="us_seta" id="manageinfo" runat="server">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="暂无积分明细记录!!" OnPageIndexChanging="EGV_PageIndexChanging" >
<Columns>
<asp:BoundField DataField="HisTime" HeaderText="日期时间">
<HeaderStyle Width="17%" CssClass="text-center" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="OperatorIP" ItemStyle-CssClass="text-center" HeaderText="操作IP">
<HeaderStyle Width="10%" CssClass="text-center" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="Score" HeaderText="数量">
<HeaderStyle Width="10%" CssClass="text-center" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="Detail" HeaderText="备注">
<HeaderStyle Width="40%" CssClass="text-center" />
<ItemStyle HorizontalAlign="Left" />
</asp:BoundField>
<asp:TemplateField HeaderText="操作人">
<ItemTemplate>
<%# GetOperator(Eval("Operator","{0}")) %>
</ItemTemplate>
<HeaderStyle Width="10%" CssClass="text-center" />
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="查看">
<ItemTemplate>
<a href="ViewMoney.aspx?PID=<%# Eval("ExpHisID","{0}") %>">查看</a>
</ItemTemplate>
<HeaderStyle Width="10%" CssClass="text-center" />
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
<PagerStyle HorizontalAlign="Center" />
<RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
</div>
</asp:Content>
