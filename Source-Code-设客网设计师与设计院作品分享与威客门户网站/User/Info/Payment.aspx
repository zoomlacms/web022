<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Payment, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>手机短信充值记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">手机短信充值记录</li>
</ol>
</div>
<div class="container">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >     
<Columns>
<asp:TemplateField HeaderText="选择">
<HeaderStyle Width="6%" />
<ItemTemplate>
<asp:CheckBox ID="chkSel" runat="server" />
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:BoundField DataField="PaymentID" HeaderText="ID">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="PaymentNum" HeaderText="支付序号">
<HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="PayPlatName" HeaderText="支付平台">
<HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="MoneyPay" HeaderText="金额">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="MoneyTrue" HeaderText="实际金额">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="交易状态">
<HeaderStyle Width="6%" />
<ItemTemplate>
<%# GetStatus(Eval("Status","{0}"))%>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="处理结果">
<HeaderStyle Width="6%" />
<ItemTemplate>
<%# GetCStatus(Eval("CStatus","{0}"))%>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:BoundField DataField="PlatformInfo" HeaderText="平台反馈">
<HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="操作">
<ItemTemplate>
<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("PaymentID") %>' OnClientClick="return confirm('你确定将该数据删除吗？')">删除</asp:LinkButton>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
<PagerStyle HorizontalAlign="Center" />
<RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
<div style="padding-top: 5px;">
<table width="100%" cellpadding="5" cellspacing="0" class="table table-bordered">
<tr>
<td class="text-center btn_green">
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="选中本页显示的所有项目" />
<asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" CssClass="btn btn-primary" UseSubmitBehavior="true" />
</td>
</tr>
</table>
</div>
</div>
</asp:Content>
