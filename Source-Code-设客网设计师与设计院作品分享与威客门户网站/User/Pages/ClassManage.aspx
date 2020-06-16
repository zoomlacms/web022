<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Pages_ClassManage, App_Web_n12dq2lj" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>栏目管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="page" data-ban="page"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href='Default.aspx'>企业黄页</a></li>
        <li class="active">栏目管理<a href="Addnode.aspx">[添加栏目]</a></li>
	</ol>
</div>
    <div class="container btn_green">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td colspan="4" class="text-center">黄页栏目管理
                </td>
            </tr>
            <tr>
                <td class="text-center" width="10%"><b>栏目ID</b></td>
                <td class="text-center" width="30%"><b>栏目名称</b></td>
                <td class="text-center" width="30%"><b>显示状态</b></td>
                <td class="text-center" width="30%"><b>相关操作</b></td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td class="text-center" width="10%"><%#Eval("TemplateID") %></td>
                        <td class="text-center" width="30%"><%#Eval("TemplateName") %></td>
                        <td class="text-center" width="30%"><%#Eval("IsTrue","{0}")=="1"?"显示":"隐藏" %></td>
                        <td class="text-center" width="30%"><%#(Eval("userid","{0}")!="0")?"<a href=\"addnode.aspx?menu=edit&id="+Eval("TemplateID")+"\">修改</a> <a href=\"?menu=delete&id="+Eval("TemplateID")+"\" onclick=\"return confirm('确实要删除吗？');\">删除</a>":"<font color=#999999>修改 删除</font>"%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td class="text-center" colspan="4">
                    <asp:Button ID="BtnSubmit" runat="server" Text="批量隐藏" class="btn btn-primary" />
                    <asp:Button ID="BtnCancle" runat="server" Text="批量删除" class="btn btn-primary" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
