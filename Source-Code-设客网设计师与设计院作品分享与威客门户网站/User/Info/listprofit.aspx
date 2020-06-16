<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_listprofit, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>注册信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">我的收益信息[<a href="javascript:;" onclick="showpay()">在线支付</a>]</li>
</ol>
</div>
<div class="container">
<div class="us_seta" style="margin-top: 10px; width: 100%; float: left" id="Div1" runat="server">
<ul class="nav nav-tabs">
<li><a href="UserInfo.aspx">注册信息</a></li>
<li><a href="UserBase.aspx">基本信息</a></li>
<li><a href="UserBase.aspx?sel=Tabs1">头像设置</a></li>
<li><a href="DredgeVip.aspx">VIP信息</a></li>
<li class="active"><a href="ListProfit.aspx">我的收益</a></li>
</ul>
<asp:Label ID="Label2" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label3" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label5" runat="server"></asp:Label>
</div>
<div class="us_seta" style="margin-top: 10px; float: left; width: 100%" id="manageinfo" runat="server">
<h1 style="text-align: center;font-family:'Microsoft YaHei';font-size:16px;">收益信息</h1>
<div style="text-align: center; vertical-align: middle;">
<asp:MultiView ID="MultiView1" runat="server">
<asp:View ID="View1" runat="server">
<br />
<asp:Label ID="Label1" runat="server" Text="您还没有收益信息"></asp:Label><br />
<br />
</asp:View>
<asp:View ID="View2" runat="server">
<table class="table table-striped table-bordered table-hover">
<tr align="center">
<td width="10%">VIP卡号</td>
<td width="20%">下单时间</td>
<td width="15%">订单编号</td>
<td width="10%">成交额</td>
<td width="10%">应提成</td>
<td width="10%">付款状态</td>
<td width="10%">物流状态</td>
</tr>
<asp:Repeater ID="gvCard" runat="server">
<ItemTemplate>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td align="center"><%# Eval("cardnum")%></td>
<td align="center"><%# Eval("AddTime")%></td>
<td align="center"><a href="carinfo.aspx?id=<%# Eval("id")%>" target="_blank"><%# Eval("OrderNo")%></a></td>
<td align="center"><%# Eval("Ordersamount")%>
<td align="center"><%#gomoney(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0}"), DataBinder.Eval(Container.DataItem, "userid").ToString())%></td>
<td align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"), "1")%></td>
<td align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.StateLogistics", "{0}"), "2")%></td>
</tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
<td colspan="7" align="center" class="tdbgleft">
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
&nbsp;&nbsp;页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">  </asp:DropDownList>
页 &nbsp;&nbsp;共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条记录  &nbsp;&nbsp;<asp:Label ID="pagess" runat="server" Text="" />条记录/页 
</td>
</tr>
</table>
</asp:View>
</asp:MultiView>
</div>
</div>
</div>
<div class="pay_iframe">
<iframe id="iframepage" name="iframepage" src="" frameborder="0" scrolling="no" width="100%" onload="this.height = $(this).contents().height() + 'px';"></iframe>
</div>
<script>
function showpay() {
$("#iframepage").attr("src", '/PayOnline/SelectPayPlat.aspx');
}

</script>
</asp:Content>
