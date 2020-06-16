<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.PeriodHis, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>有效期明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">有效期明细</li>
</ol>
</div>
<div class="container">
<div class="us_seta" id="manageinfo" runat ="server">
<ZL:ExGridView ID="Egv" runat="server" AllowPaging="True" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="PID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" Width="100%" CellPadding="4"  GridLines="None" EmptyDataText="暂无有效期明细记录">
<Columns> 
<asp:BoundField DataField="OperDate" HeaderText="日期时间">
<HeaderStyle Width="15%" />
<ItemStyle HorizontalAlign="Center" />                    
</asp:BoundField>
<asp:BoundField DataField="OperatorIP" HeaderText="操作IP">
<HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" />                    
</asp:BoundField> 
<asp:BoundField DataField="DeadLineDay" HeaderText="有效期天数">
<HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" />                    
</asp:BoundField>
<asp:BoundField DataField="PDetail" HeaderText="备注">
<HeaderStyle Width="40%" />
<ItemStyle HorizontalAlign="Left" />                    
</asp:BoundField>
<asp:TemplateField HeaderText="操作人" >
<ItemTemplate>
<%# GetOperator(Eval("Operator","{0}")) %>
</ItemTemplate>
<HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="查看" >
<ItemTemplate>
<a href="ViewPeriodHis.aspx?PID=<%# Eval("PID","{0}") %>">查看</a>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
<PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
</ZL:ExGridView>
</div>
</div>
</asp:Content>