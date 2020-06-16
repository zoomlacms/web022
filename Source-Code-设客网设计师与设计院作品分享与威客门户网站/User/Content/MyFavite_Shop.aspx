<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_MyFavite_Shop, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>商品收藏</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">网店收藏</li>
<div class="clearfix"></div>
</ol>
</div>
<div class="container">
<div id="noconten" runat="server" align="center" style="width: 800px; line-height: 100px; border: solid 1px #CCC">暂无收藏内容</div>
<div id="cont" runat="server">
<ZL:ExGridView ID="Egv" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="Egv_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="FavoriteID" OnRowCommand="Lnk_Click" Width="100%" CellPadding="4" GridLines="None" EnableModelValidation="True">
<Columns>
<asp:TemplateField HeaderText="选择">
<ItemTemplate>
<asp:CheckBox ID="chkSel" runat="server" />
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:BoundField DataField="InfoID" HeaderText="ID">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="商品名称">
<HeaderStyle Width="26%" />
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<a href="<%#Eval("FavUrl")%>" target="_blank"><%# Eval("Title")%></a>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="图片">
<HeaderStyle Width="14%" />
<ItemStyle HorizontalAlign="Center" />
<ItemTemplate>
<%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></a>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField HeaderText="市场价" DataField="ShiPrice" DataFormatString="{0:N2}">
<HeaderStyle Width="14%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField HeaderText="零售价" DataField="LinPrice" DataFormatString="{0:N2}">
<HeaderStyle Width="14%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="操作">
<ItemTemplate>
<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("FavoriteID") %>' OnClientClick="return confirm('你确定将该数据从收藏夹删除吗？')">移出收藏夹</asp:LinkButton>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
</ZL:ExGridView>

<div style="padding-top: 5px;" class="btn_green">
<div class="us_seta" style="height: auto;">
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="选中本页显示的所有项目" />
<asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项从收藏夹删除吗？')}" CssClass=" btn btn-primary" UseSubmitBehavior="true" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索标题：
<asp:TextBox ID="TxtSearchTitle" CssClass="form-control" runat="server"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Button1_Click" />
</div>
</div>
</div>
</div>
</asp:Content>
