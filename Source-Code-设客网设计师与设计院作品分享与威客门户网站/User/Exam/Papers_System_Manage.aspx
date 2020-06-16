<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Papers_System_Manage, App_Web_nzoqprnw" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>系统试卷管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a href="/user">用户中心</a></li>
<li class="active">组卷管理 [<a href='Add_Papers_System.aspx?menu=Add'>添加试卷</a>]</li>
</ol>
</div>
<div class="container">
<ZL:ExGridView ID="EGV" runat="server" AllowPaging="true" AutoGenerateColumns="False"  AllowSorting="true" 
CssClass="table table-striped table-bordered table-hover" EnableTheming="False"
DataKeyNames="id" OnPageIndexChanging="EGV_PageIndexChanging">
<Columns>
<asp:TemplateField  ItemStyle-Width="50">
<ItemTemplate>
<input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="试卷标题" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<%#Eval("p_name") %>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="试卷分类" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<%#GetClass() %>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:TemplateField>
<%--                  <asp:TemplateField HeaderText="出题方式" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<%#GetModus(Eval("p_type", "{0}"))%>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:TemplateField>--%>
<asp:TemplateField HeaderText="试卷类型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<%#GetStyle(Eval("p_style", "{0}"))%>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
<ItemTemplate>
<a href="/User/Questions/ExamDetail.aspx?ID=<%#Eval("id") %>" target="_blank">参加考试</a>|
<a href="Paper_QuestionManage.aspx?pid=<%#Eval("id") %>">题目管理</a>&nbsp;|&nbsp;
<%--<a href="Paper_Subject_Manage.aspx?pid=<%#Eval("id") %>">浏览试题</a>&nbsp;|&nbsp;--%>
<a href="Add_Papers_System.aspx?menu=Edit&paper_id=<%#Eval("id") %>">修改试卷</a>|
<a href="DownPaper.aspx?ID=<%#Eval("ID") %>" target="_blank">下载试卷</a>
</ItemTemplate>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>
<div class="clearbox">
</div>
<asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClientClick="return confirm('确定删除?')" Text="批量删除" OnClick="BtnDelete_Click" />
</div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>