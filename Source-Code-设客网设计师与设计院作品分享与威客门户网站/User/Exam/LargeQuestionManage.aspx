<%@ page language="C#" autoeventwireup="true" inherits="User_Exam_LargeQuestionManage, App_Web_cwcutwox" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>大型试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a href="/user">用户中心</a></li>
<li class="active">大题管理 [<a href="AddLargeQuestion.aspx">添加大题</a>]</li>
</ol>
</div>
<div class="container">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"   EnableTheming="False" IsHoldState="false"
class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
<Columns>
<asp:TemplateField HeaderText="选择" ItemStyle-CssClass="td_m">
<ItemTemplate>
<input type="checkbox" name="idchk" value="<%#Eval("p_id") %>" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="试题标题">
<ItemTemplate>
<a href="AddLargeQuestion.aspx?p_id=<%#Eval("p_id") %>"><%#Eval("p_title") %></a>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center"
ItemStyle-VerticalAlign="Middle" />
<asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<%#GetDifficult() %>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<%#GetType(Eval("p_Type", "{0}"))%>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="p_CreateTime" HeaderText="创建时间" ItemStyle-VerticalAlign="Middle"
ItemStyle-HorizontalAlign="Center" />
<asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<a href="AddLargeQuestion.aspx?p_id=<%#Eval("p_id") %>">修改</a>
<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("p_id") %>'
    OnClientClick="return confirm('你确定将该数据删除吗？');">删除</asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>
</div>
</asp:Content>
