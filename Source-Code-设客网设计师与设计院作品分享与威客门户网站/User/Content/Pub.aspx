<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Pub, App_Web_q5rpj2um" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>互动页面</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">互动页面</li>
</ol>
</div>
<div class="container">
<div style="margin-bottom: 10px;">
<asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" OnClick="LinkButton1_Click">我发布的互动</asp:LinkButton>
<asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary" runat="server" OnClick="LinkButton4_Click">我参与的互动</asp:LinkButton>
</div>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<ZL:ExGridView runat="server" ID="EGV" DataKeyNames="GeneralID" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
<Columns>
<asp:BoundField DataField="GeneralID" HeaderText="ID">
<HeaderStyle Width="6%" />
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:TemplateField HeaderText="标题">
<HeaderStyle Width="50%" />
<ItemTemplate>
<a href='ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'>
<%# Eval("Title")%></a>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="状态">
<ItemTemplate>
<%# GetStatus(Eval("Status", "{0}")) %>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:TemplateField HeaderText="操作">
<ItemTemplate>
<%#GetLink(Eval("GeneralID")+"") %>&nbsp;&nbsp;<a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>"
target="_blank">访问</a>
<asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%#GetVisible(Eval("GeneralID")+"") %>'>修改</asp:LinkButton>
<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%# GetVisible(Eval("GeneralID")+"")  %>'
OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><%# GetIsDe(Eval("Status", "{0}")) %></asp:LinkButton>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
</Columns>
<PagerStyle HorizontalAlign="Center" />
<RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
<asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150" runat="server">
<asp:ListItem Value="0">按标题查找</asp:ListItem>
<asp:ListItem Value="1">按ID查找</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="TxtSearchTitle" CssClass="form-control text_300" runat="server"></asp:TextBox>
<asp:Button ID="Btn_Search" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Btn_Search_Click" />
</div>
</asp:Content>
