<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_ManageJsContent, App_Web_ckin0fxz" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>文章JS文件管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="opion_header">
        管理导航:
    <div class="btn-group">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">js文件管理<span class="caret"></span></button>
        <ul class="dropdown-menu" role="menu">
            <li><a href="AddJsContent.aspx">添加JS文件（普通列表）</a></li>
            <li><a href="AddJsPic.aspx">添加JS文件（图片列表）</a></li>
            <li></li>
        </ul>

    </div>
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">图片列表操作<span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="?menu=rsallimg">刷新图片列表</a></li>
                <li><a href="?menu=rsalllist">刷新普通列表</a></li>
                <li></li>
            </ul>
        </div>
    </div>
    <div class="clearbox">
    </div>
    <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td height="24" align="center" width="5%">ID</td>
            <td height="24" align="center" width="15%">JS代码名称</td>
            <td align="center" width="29%">简介</td>
            <td align="center" width="10%">代码类型</td>
            <td align="center" width="10%">JS文件名</td>
            <td align="center" width="20%">JS调用代码</td>
            <td align="center" width="12%">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg" ondblclick="getinfo('<%#Eval("id")%>','<%#Eval("JsType")%>')">
                    <td height="26" align="center">
                        <%#Eval("id")%>
                    </td>
                    <td align="center">
                        <a href="<%#(Eval("JsType","{0}")=="1")?"AddJsPic.aspx":"AddJsContent.aspx" %>?menu=edit&id=<%#Eval("id") %>"><%#Eval("Jsname")%></a>
                    </td>
                    <td align="center">
                        <%#Eval("JsReadme")%>
                    </td>
                    <td align="center">
                        <%#(Eval("JsType","{0}") == "1") ? "图片列表" : "普通列表"%>
                    </td>
                    <td align="center">
                        <asp:HiddenField ID="hfGID" runat="server" Value='<%#Eval("id")%>' />
                        <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("JsFileName")%>'></asp:Label>
                    </td>
                    <td align="center">
                        <textarea name='textarea' cols='36' rows='3' class="l_input" style="height: 40px"><%#Getscript(Eval("id","{0}")) %></textarea>
                    </td>
                    <td align="center">
                        <a href="<%#(Eval("JsType","{0}")=="1")?"AddJsPic.aspx":"AddJsContent.aspx" %>?menu=edit&id=<%#Eval("id") %>">参数设置</a> <a href="?menu=refresh&id=<%#Eval("id") %>">刷新</a>
                         <a href="?menu=delete&id=<%#Eval("id") %>" onclick="return confirm('真的要删除此JS文件吗？如果有文件或模板中使用此JS文件，请注意修改过来！');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <b>说明：</b>
                <br />
                这些JS代码是为了加快访问速度特别生成的。在添加/修改/审核/删除文章时，系统会自动刷新各JS文件。必要时，你也可以手动刷新。如添加了新的JS文件，但还没有添加文章，此时就可以手动刷新有关JS文件。
				<br />
                <font color="red">若文件名为红色，表示此JS文件还没有生成。</font>
                <br />
                <b>使用方法：</b>
                <br />
                将相关JS调用代码复制到页面或模板中的相关位置即可。可参见系统提供的各页面及模板。
            </td>
        </tr>
    </table>
    <script>
        function getinfo(id, types) {
            types == "1" ? location.href = 'AddJsPic.aspx?menu=edit&id=' + id : location.href = 'AddJsContent.aspx?menu=edit&id=' + id;
        }
    </script>
</asp:Content>
