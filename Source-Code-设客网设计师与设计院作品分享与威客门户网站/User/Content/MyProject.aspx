<%@ Page Language="C#" MasterPageFile="~/User/Default.master" AutoEventWireup="true" CodeFile="MyProject.aspx.cs" Inherits="ZoomLa.WebSite.User.Content.MyProject" %>
<%@ Register Src="~/Manage/I/ASCX/TreeView.ascx" TagPrefix="ZL" TagName="TreeView" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>项目管理_<%=Call.SiteName %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">项目管理</li> 
</ol>
<div class="clearfix"></div>
</div>
<div class="u_cnt">
<div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0;height:500px;overflow-y:auto;" hidden>
<div>
<ZL:TreeView ID="MyTree" IsShrink="true" NodeID="NodeID" runat="server" />
<span style="color:green;" runat="server" id="remind" visible="false" />
</div>
</div>
<div>
<div class="node13">
<a href="/User/Content/MyProject.aspx?NodeID=14" class="btn btn-success">概念方案</a>
<a href="/User/Content/MyProject.aspx?NodeID=15" class="btn btn-success">实施方案</a>
<a href="/User/Content/MyProject.aspx?NodeID=16" class="btn btn-success">初步设计</a>
<a href="/User/Content/MyProject.aspx?NodeID=36" class="btn btn-success">施工图设计</a>
<a href="/User/Content/MyProject.aspx?NodeID=38" class="btn btn-success">施工服务</a>
</div>
<div class="btn_green" hidden>
    <asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label>
    <a href="/User/Content/MyContent.aspx?NodeID=<%=NodeID%>&status=-2" class="btn btn-primary">回收站</a>
</div>
<div class="us_pynews btn_green margin_t10">
    <div class="us_seta">
         <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" 
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="td_m" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("GeneralID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="GeneralID" HeaderText="ID">
                </asp:BoundField>
                <asp:TemplateField HeaderText="项目名称"> 
                    <ItemTemplate>
                        <a href='/Class_<%#Eval("NodeID") %>/NodeNews.aspx?GID=<%# Eval("GeneralID") %>'>
                            <%# ZoomLa.Common.BaseClass.Htmlcode(Eval("Title","{0}"))%></a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus("1") %>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CssClass="option_style" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%#GetIsNRe(Eval("Status", "{0}"),"edit") %>' ToolTip="修改"><i class="glyphicon glyphicon-pencil"></i> 修改</asp:LinkButton>
                        <%# GetStatus("2") %>
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="option_style" Visible='<%#GetIsDe(Eval("Status", "{0}")) %>' CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><i class="fa fa-trash"></i> 删除</asp:LinkButton>
                        <asp:LinkButton ID="ResetBtn" runat="server" Visible='<%#GetIsRe(Eval("Status", "{0}")) %>' CommandName="Reset" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据还原吗？')">还原</asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
            </Columns>
             <PagerStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
        <div style="width:100%; float: left; line-height: 30px;"">
            <asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click" class="btn btn-primary pull-left"
                OnClientClick="return confirm('你确定要将所有选择项删除吗?')" UseSubmitBehavior="true" />
            <asp:DropDownList ID="DropDownList1" CssClass="form-control text_md pull-left" Width="120" style="margin-left:10px;" runat="server">
                <asp:ListItem Value="0">按标题查找</asp:ListItem>
                <asp:ListItem Value="1">按ID查找</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="TxtSearchTitle" CssClass="form-control text_md pull-left" runat="server"></asp:TextBox>
            <asp:Button ID="Btn_Search" runat="server" class="btn btn-primary" Text="搜索" OnClick="Btn_Search_Click" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
        </div>
    </div>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
$().ready(function () {
$(".tvNav a.list1").click(function () { showlist(this); });
if (window.localStorage.Content_tvNav) {
    expand($("#" + window.localStorage.Content_tvNav));
}
})
function showlist(obj) {
$(obj).parent().parent().find("a").removeClass("activeLi");//a-->li-->ul
$(obj).parent().children("a").addClass("activeLi");//li
$(obj).parent().siblings("li").find("ul").slideUp();
$(obj).parent().children("ul").slideToggle();
window.localStorage.Content_tvNav = obj.id;
}
function expand(obj)//超链接,不以动画效果显示
{
$a = $(obj).parent().parent(".tvNav ul").parent("li").find("a:first");
if ($a.length > 0) expand($a);
$(obj).addClass("activeLi");
$(obj).parent("li").children("ul").show();
}
</script>
</asp:Content>