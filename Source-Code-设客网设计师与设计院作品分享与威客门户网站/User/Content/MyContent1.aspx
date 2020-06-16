<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.MyContentpage, App_Web_q5rpj2um" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TreeView.ascx" TagPrefix="ZL" TagName="TreeView" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>投稿管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">完善资料</li> 
</ol>
<div class="clearfix"></div>
</div>
<div class="text-center">
<h4>请选择设计师的类型：</h4>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=11" class="btn btn-success">规划师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=19" class="btn btn-success">建筑师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=20" class="btn btn-success">景观师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=21" class="btn btn-success">结构师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=22" class="btn btn-success">暖通师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=23" class="btn btn-success">电气师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=24" class="btn btn-success">给排水师</a>
<a href="/User/Content/AddDesigners.aspx?ModelID=48&NodeID=47" class="btn btn-success">其他</a>
</div>
    <div class="hidden">
<div class="u_cnt">
<div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0;height:500px;overflow-y:auto;">
    <div>
        <ZL:TreeView ID="MyTree" IsShrink="true" NodeID="NodeID" runat="server" />
        <span style="color:green;" runat="server" id="remind" visible="false" />
    </div>
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
<div class="btn_green">
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
                    <HeaderStyle Width="4%" />
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("GeneralID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="GeneralID" HeaderText="ID">
                    <HeaderStyle Width="6%" /> 
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题"> 
                    <ItemTemplate>
                        <a href='ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'>
                            <%# ZoomLa.Common.BaseClass.Htmlcode(Eval("Title","{0}"))%></a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <HeaderStyle Width="8%" />
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status", "{0}")) %>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="已生成">
                    <HeaderStyle Width="8%" />
                    <ItemTemplate>
                        <%# GetCteate(Eval("IsCreate", "{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <HeaderStyle Width="18%" />
                    <ItemTemplate>
                        <a href='ShowPublist.aspx?ID=<%# Eval("GeneralID") %>' class="option_style"><i class="fa fa-eye"></i></a>
                        <asp:LinkButton runat="server" CssClass="option_style" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%#GetIsNRe(Eval("Status", "{0}"),"edit") %>' ToolTip="修改"><i class="glyphicon glyphicon-pencil"></i></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="option_style" CommandName="View" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%#GetIsNRe(Eval("Status", "{0}"),"view") %>' ToolTip="预览"><i class="glyphicon glyphicon-globe"></i>预览</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="option_style" Visible='<%#GetIsDe(Eval("Status", "{0}")) %>' CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>'
                            OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><i class="fa fa-trash"></i>删除</asp:LinkButton>
                        <asp:LinkButton ID="ResetBtn" runat="server" Visible='<%#GetIsRe(Eval("Status", "{0}")) %>' CommandName="Reset" CommandArgument='<%# Eval("GeneralID") %>'
                            OnClientClick="return confirm('你确定将该数据还原吗？')">还原</asp:LinkButton>
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