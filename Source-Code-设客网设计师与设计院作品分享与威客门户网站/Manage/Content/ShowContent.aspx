<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_ShowContent, App_Web_ckin0fxz" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>预览内容</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
<asp:HiddenField ID="HdnModelID" runat="server" />
<div>
<ul class="nav nav-tabs">
<li class="active"><a href="#base" data-toggle="tab">基本信息</a></li>
<li><a href="#info" data-toggle="tab">信息属性</a></li>
<li><a href="#process" data-toggle="tab">流程控制</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane fade in active" id="base">
<table class="table table-bordered">
<tr>
<td style="width:10%;">所属节点</td>
<td>
<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td>ID</td>
<td>
<asp:Label ID="GeneralID" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td>标题</td>
<td>
<asp:Label ID="Title_T" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<asp:Label ID="Base_L" runat="server" Text="Label"></asp:Label>
</table>
</div>
<div class="tab-pane fade" id="info">
<table class="table table-bordered">
<tr>
<td style="width:10%;">录入者</td>
<td >
<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td >点击数</td>
<td >
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td >录入时间</td>
<td >
<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td >更新时间</td>
<td >
<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td  class="auto-style1">PDF查看</td>
<td class="auto-style2">
<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
</td>
</tr>
</table>
</div>
<div class="tab-pane fade" id="process">
<table class="table table-bordered">
<tr>
<td style="width:10%;">审核状态<br />
</td>
<td class="tdrighttxt"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td>推荐</td>
<td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
</tr>
</table>
</div>
</div>
<div class="text-center">
<asp:Button ID="Button5" CssClass="btn btn-primary" runat="server" Text="修改/审核" OnClick="Button5_Click" />
&nbsp;<asp:Button ID="delete" CssClass="btn btn-primary" runat="server" Text="删除" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"
OnClick="delete_Click" />
&nbsp;<asp:Button ID="delete1" CssClass="btn btn-primary" runat="server" Text="直接退稿" OnClick="delete1_Click" />
&nbsp;<asp:Button ID="delete2" CssClass="btn btn-primary" runat="server" Text="取消审核" OnClick="delete2_Click" />
&nbsp;<asp:Button ID="delete3" CssClass="btn btn-primary" runat="server" Text="设为推荐" OnClick="delete3_Click" />
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-primary" runat="server" Text="取消推荐" OnClick="Button6_Click" />
<a href="/Item/<%:Request.QueryString["GID"] %>.aspx" target="_blank" class="btn btn-primary">浏览文章</a>
</div>
</div>
<div style="margin-top:10px;display:none;" id="commentDiv">
<asp:HiddenField ID="HiddenType" runat="server" />
<asp:HiddenField ID="HiddenModeid" runat="server" />
<asp:HiddenField ID="HiddenGID" runat="server" />
<ul class="nav nav-tabs">
<li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">所有评论</a></li>
<li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">已审核评论</a></li>
<li><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)">待审核评论</a></li>
</ul>
<ZL:ExGridView ID="Egv"  runat="server" AutoGenerateColumns="False" DataKeyNames="CommentID" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="table table-bordered" EnableTheming="False" GridLines="None" EnableModelValidation="True" EmptyDataText="无评论信息!!" >
<Columns>
<asp:TemplateField>
<ItemTemplate>
<input type="checkbox" name="idchk" title="" value='<%#Eval("CommentID") %>' />
</ItemTemplate>
<HeaderStyle CssClass="hidden-xs hidden-sm" Width="5%" />
<ItemStyle CssClass="hidden-xs hidden-sm" />
</asp:TemplateField>
<asp:BoundField HeaderText="评论ID" DataField="CommentID">
<HeaderStyle CssClass="hidden-xs hidden-sm text-center" Width="10%" />
<ItemStyle CssClass="hidden-xs hidden-sm text-center" />
</asp:BoundField>
<asp:BoundField HeaderText="标题" DataField="Title" />
<asp:TemplateField HeaderText="评论者">
<ItemTemplate>
<a href="<%= CustomerPageAction.customPath2 %>User/UserInfo.aspx?id=<%# Eval("UserID") %>"><%# GetUserName(Eval("UserID", "{0}"))%></a>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField HeaderText="评论时间" DataField="CommentTime" />
<asp:TemplateField HeaderText="状态">
<ItemTemplate>
<%#getcommend(Eval("Audited"))%>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="操作">
<ItemTemplate>
<a href="CommentView.aspx?CommentID=<%#Eval("CommentID") %>&modeid=<%=HdnModelID.Value %>&GID=<%=HiddenGID.Value %>">查看</a>
<asp:LinkButton ID="LinkButton1" CommandName="audit" CommandArgument='<%#Eval("CommentID") %>' runat="server">审核</asp:LinkButton>
<asp:LinkButton ID="LinkButton2" CommandName="del2" CommandArgument='<%#Eval("CommentID") %>' runat="server">删除</asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle HorizontalAlign="Center"  />
<RowStyle  HorizontalAlign="Center" />
</ZL:ExGridView>
<div class="text-center" style="margin-bottom:10px;">
<asp:Button ID="Button1" CssClass="btn btn-primary" Text="批量删除" runat="server" OnClick="Button1_Click" OnClientClick="if(!IsSelectedId()){alert('请选择提交项');return false;}else{return confirm('你确定要提交选中内容吗？')}" />&nbsp; &nbsp;
<asp:Button ID="Button3" CssClass="btn btn-primary" Text="批量审核" runat="server" OnClick="Button3_Click" OnClientClick="if(!IsSelectedId()){alert('请选择提交项');return false;}else{return confirm('你确定要提交选中内容吗？')}" />&nbsp; &nbsp;
<asp:Button ID="Button4" CssClass="btn btn-primary" Text="批量取消审核" runat="server" OnClick="Button4_Click" OnClientClick="if(!IsSelectedId()){alert('请选择提交项');return false;}else{return confirm('你确定要提交选中内容吗？')}" />&nbsp;&nbsp;
<input name="Cancel" type="button" class="btn btn-primary" id="Button2" value="取消" onclick="history.go('-1');" />
</div>
</div>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script>
$().ready(function () {
$("#Egv tr:last").children().first().attr("colspan", "8").before("<td><input type=checkbox id='chkAll'/></td>");
$("#chkAll").click(function () {//EGV 全选
selectAllByName(this, "idchk");
});
if (getParam("type")) {
$("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
}
})
function ShowTabs(n)
{
location.href = 'ShowContent.aspx?GID=<%=Request.QueryString["GID"] %>&type=' + n + '&modeid=<%=Request.QueryString["modeid"] %>';
}
var diag = new ZL_Dialog();
function opentitle(url, title) {
diag.title = title;
diag.url = url;
diag.ShowModal();
}
function editnode(NodeID) {
var answer = confirm("该栏目未绑定模板，是否立即绑定");
if (answer == false) {
return false;
}
else {
open_page(NodeID, "EditNode.aspx?NodeID=");
}
}
function closdlg() {
Dialog.close();
}
function open_page(NodeID, strURL) {
var diag = new Dialog();
diag.Width = 1000;
diag.Height = 750;
diag.Title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
diag.URL = strURL + NodeID;
diag.show();
}
$().ready(function () {
if ($("#Egv tr").length > 1) { $("#commentDiv").show(); }
});
$("#base td").each(function(index, element) {
    if($(this).html()=="营业执照/组织机构代码证")
	{
		$(this).next("td").html("<img src='<%Call.Label("{$UploadDir/}");%>"+$(this).next("td").html()+"' alt='资料认证' onerror=\"javascript:this.src='/UploadFiles/nopic.gif';\" />")
	}
    if($(this).html()=="资质证书")
	{
		$(this).next("td").html("<img src='<%Call.Label("{$UploadDir/}");%>"+$(this).next("td").html()+"' alt='资料认证' onerror=\"javascript:this.src='/UploadFiles/nopic.gif';\" />")
	}
});
</script>
</asp:Content>