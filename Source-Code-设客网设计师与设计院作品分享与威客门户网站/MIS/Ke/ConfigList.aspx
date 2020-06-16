<%@ page language="C#" autoeventwireup="true" inherits="User_Class_ConfigList, App_Web_tbedsbxg" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>配置列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/">逐浪CMS</a></li>
        <li><a href="/User/">用户中心</a></li>
        <li class="active">配置列表[<a href="SchConfig.aspx">添加配置</a>]</li>
    </ol>
    </div>
    <div class="container u_cnt">
    <table class="table table-bordered table-striped">
        <tr><td></td><td>学校名称</td><td>学校类型</td><td>上午节数</td><td>下午节数</td><td>晚上节数</td><td>每周天数</td><td>操作</td></tr>
        <ZL:ExRepeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='8'><div class='text-center'>" OnItemCommand="RPT_ItemCommand" PageEnd="</div></td></tr>">
            <ItemTemplate>
                <tr>
                    <td><input type="checkbox" name="idchk" /></td>
                    <td><%#Eval("SchoolName") %></td>
                    <td><%#Eval("SchoolType") %></td>
                    <td><%#Eval("moring") %></td>
                    <td><%#Eval("afternoon") %></td>
                    <td><%#Eval("evening") %></td>
                    <td><%#Eval("weekday") %></td>
                    <td>
                        <a href="SchConfig.aspx?id=<%#Eval("ID") %>" class="option_style"><i class="fa fa-edit"></i></a>
                        <asp:LinkButton runat="server" CommandName="Del"  OnClientClick="return confirm('是否删除!')" CommandArgument='<%#Eval("ID") %>' CssClass="option_style"><i class="fa fa-trash"></i>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
        </div>
    <script>
        //$().ready(function () {
        //    openmenu('menu4');
        //});

    </script>
</asp:Content>

