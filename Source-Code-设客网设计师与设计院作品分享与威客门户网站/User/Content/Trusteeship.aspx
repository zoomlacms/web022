<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_ShowPubList, App_Web_j2dqvgme" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>资金托管_<%=Call.SiteName%></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">资金托管</li>
</ol>
</div>
<div class="tuoguan">
<h1><span></span>资金托管后能大大增加设计师的应标意愿。</h1>
<button type="button" class="btn btn-success" onClick="GetPay();">立即托管资金</button>
<a href="/User/Default2.aspx" class="btn btn-warning">返回个人主页</a>
</div>
<div class="hidden">
<table class="table table-striped table-bordered table-hover">
<tr>
<td class="text-center">
<asp:Label ID="Label1" runat="server" Text="信息预览"></asp:Label>
</td>
</tr>
<tr>
<td>
<asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CellPadding="4" GridLines="None" Font-Size="12px" Style="margin-bottom: 3px; margin-top: 2px;" CssClass="table table-striped table-bordered table-hover">
<Fields></Fields>
<FooterStyle Font-Bold="True" BackColor="#FFFFFF" />
<CommandRowStyle Font-Bold="True" CssClass="tdbgleft" />
<RowStyle />
<FieldHeaderStyle Font-Bold="True" />
<PagerStyle HorizontalAlign="Center" />
<HeaderStyle Font-Bold="True" />
<EditRowStyle />
<AlternatingRowStyle />
</asp:DetailsView>
</td>
</tr>
</table>

</div>
<form id="form1" name="form1" method="post" action="/Cart/FastOrder.aspx">
<input type="hidden" value="<%Call.Label("{$GetRequest(ID)$}");%>" id="Proinfo" name="Proinfo">
<input type="hidden" value="100" id="Price" name="Price" >
<button type="submit">asdasdasd</button>
</form>
<script>
var moneyt=
function GetPay()
{
	$.post("/Cart/FastOrder.aspx", { Proinfo: <%Call.Label("{$GetRequest(ID)$}");%>,Price:100 }, function () { })
}
</script>
</asp:Content>