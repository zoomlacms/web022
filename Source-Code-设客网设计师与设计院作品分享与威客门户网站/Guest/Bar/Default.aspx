<%@ page language="C#" autoeventwireup="true" inherits="Guest_Bar_BarList, App_Web_jcwbqs35" masterpagefile="~/Guest/Guest.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><%:Call.SiteName+"_社区列表" %></title>
<script src="/js/scrolltopcontrol.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<div class="row">
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 club_l">
<h5 class="well well-sm hidden"><strong>社区热点</strong>
<div class="pull-right">今日:<asp:Label runat="server" ID="TCount_L"></asp:Label>  昨日:<asp:Label runat="server" ID="YCount_L"></asp:Label></div>
</h5>
<div class="club_rec">
<div id="carousel-example-generic" class="carousel slide clubShow" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
<li data-target="#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
<li data-target="#carousel-example-generic" data-slide-to="3"></li>
</ol>
<div class="carousel-inner" role="listbox">
<asp:Repeater runat="server" ID="TopRPT">
<ItemTemplate>
<div class="item <%#Eval("Index").ToString().Equals("0")?"active":"" %>">
<a href="<%#CreateUrl(2,Eval("ID")) %>"><img src="<%#Eval("TopImg") %>" alt="<%#Eval("Title") %>" style=''></a>
<div class="carousel-caption"><%#Eval("Title") %></div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
<span class="sr-only">Previous</span>
</a>
<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
<span class="sr-only">Next</span>
</a>
</div>

<div class="clearfix"></div>
</div> 
<div class="hot_theme">
<div class="hot_theme_t"><span>热点</span>关注</div>
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"首页输出帖子列表\" TitleNum=\"60\" ShowNum=\"20\" /}"); %>
</ul>
</div>
</div>

<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
<%Call.Label("{ZL.Label id=\"贴吧获取当前用户信息\"/}");%> 
<div class="bar_sort bar_item">
<div class="club_rtitle"><span>板块</span>导航</div>
<ul class="list-unstyled">
<asp:Repeater runat="server" ID="ParentRPT"  EnableViewState="false" OnItemDataBound="ParentRPT_ItemDataBound">	
<ItemTemplate>
<li>
<div class="col-xs-5 padding5">
<a href="<%#CreateUrl(1,Eval("CateID")) %>"><img src="<%#Eval("BarImage") %>" onerror="this.src='/Images/nopic.gif';" alt="<%#Eval("CateName") %>" /></a>
</div>
<div class="col-xs-7 padding5">
<a href="<%#CreateUrl(1,Eval("CateID")) %>"><%#Eval("CateName") %></a>
<p><%#Eval("Desc") %></p>
</div> 
<asp:Repeater runat="server" ID="ChildRPT" EnableViewState="false">
<HeaderTemplate>
<table class="table margin_bottom0 club_list">
</HeaderTemplate>
<ItemTemplate>
<tr>
<td class="club_div_img"><a href="<%#CreateUrl(1,Convert.ToInt32(Eval("CateID"))) %>" title="<%#Eval("CateName") %>"><img src="<%#Eval("BarImage") %>" onerror="this.src='/Images/nopic.gif';" alt="<%#Eval("CateName") %>" /></a></td>
<td class="cateName">
<a href="<%#CreateUrl(1,Convert.ToInt32(Eval("CateID"))) %>"><%#Eval("CateName") %></a>
</td>
<td>
<span class="card_menNum" title="主题"><%#Eval("ItemCount") %></span><span title="回贴">/<%#Eval("ReCount") %></span>
</td>
<td class="club_bar_status">
<div>
最新帖子：<a href="<%#CreateUrl(2,Eval("ID")) %>"><%#Eval("Title") %></a>
</div>
<div class="barDate" title="<%#Eval("R_CDate") %>">
回复时间：<%#ZoomLa.Common.function.GetBarDate(Eval("R_CDate")) %>
</div>
</td>
</tr>
</ItemTemplate>
<FooterTemplate></table></FooterTemplate>
</asp:Repeater>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
<div class="bar_rank bar_item">
<div class="club_rtitle"><span>社区</span>排名</div>
<ul class="media-list">
<%Call.Label("{ZL.Label id=\"输出贴吧达人\" ShowNum=\"10\" /}");%>
</ul>
</div> 
</div> 

<ul class="list-unstyled navlist hidden">
<asp:Repeater runat="server" ID="Top_Rpt" EnableViewState="false">
<ItemTemplate>
<li>
<a href="<%#CreateUrl(1,Convert.ToInt32(Eval("CateID"))) %>" class="navname">[<%#Eval("CateName") %>]</a>
<a href="<%#CreateUrl(2,Eval("ID")) %>" ><%#getTitle() %></a>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
</div> 

<div class="clearfix"></div>

</div>

<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 padding_l0 hidden">
<div class="mailRight_Puch">
<div class="date"><%=DateTime.Now.ToString("MM月dd日") %><span><%=getNowWeek() %></span>
</div>
<div class="cont">
<a href="#">每日打卡</a>
</div>
</div>    
<div class="mailRight_Hot_Tile">本周热门</div>
<ul class="mailRight_Hot_li">
<asp:Repeater runat="server" ID="Week_Rpt" EnableViewState="false">
<ItemTemplate>
<li>
<div class="badge pull-left"><%#Eval("IndexNum") %></div>
<p><a href="<%#CreateUrl(2,Eval("ID")) %>" class="hoturl"><%#Eval("Title") %></a><span class="hotdate pull-right" title="<%#Eval("CDate") %>"><%#ZoomLa.Common.function.GetBarDate(Eval("CDate"))%></span></p>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
<div class="col-xs-12 col-md-12 padding_l_r0">
<a href="#" class="thumbnail">
<img data-src="holder.js/100%x180" alt="预留广告位" style="height:122px;">
</a>
</div>
</div><!--右边结束 -->    
</div>
</div>

<div class="container hidden">
<div class="row">
<div class="bar_con padding5">
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 padding10">
<div class="bar_tui">
<div class="bar_tui_t">社区推荐</div>
<div class="row">
<div class="padding10">
<%Call.Label("{ZL.Label id=\"输出推荐贴吧列表\" ShowNum=\"2\" /}");%>
</div>
</div>
<div class="bar_tui_t" style="margin-bottom:0;">其他社区</div>
<div class="bar_other">
<div class="row">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出非推荐贴吧列表\" ShowNum=\"8\" /}");%>
</ul>
</div>
</div>
</div>
<div class="bar_dong">
<div class="bar_dong_t"><span><a href="#">更多</a></span>社区动态</div>
<div class="bar_dong_c">
<ul class="list-unstyled" id="bar_dongul">
<%Call.Label("{ZL.Label id=\"输出贴吧动态_仅精华帖\" ShowNum=\"20\" /}");%>
</ul>
<div class="bar_dong_cmore">
<button type="button" onclick="GetMore();" class="btn btn-default"><span>加载更多</span></button>
</div>
</div>
</div>
</div><!--左侧结束-->
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 padding_l0">
<!--bar_right end-->
</div><!--右侧侧结束-->
<div class="clearfix"></div>
</div>
</div>
</div>
<div class="modal fade" id="myModal" data-hasload="0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
<h4 class="modal-title" id="myModalLabel">友情提示</h4>
</div>
<div class="modal-body">
暂无更多内容！！
</div>
<div class="modal-footer">
<button type="button" class="btn btn-primary" data-dismiss="modal">返回</button>
</div>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
var num=10;
var allnum='<%Call.Label("{ZL.Label id=\"输出贴吧贴子总数\"/}");%>'

function GetMore()
{
	if(num>=parseInt(allnum))
	{
//		$('#myModal').modal('show');
//		$('#myModal').data("hasload","1");
	}
	else
	{
		num+=10;
		$("#bar_dongul").load("/Class_1/NodeHot.aspx?Num="+num+"&v="+Math.floor(Math.random()*1000+1)+" start");
	}
}
$(function () {
    $(window).scroll(function () {
        var _top = $(window).scrollTop();
        if (_top >= $(document).height() - $(window).height()) {
            if ($('#myModal').data("hasload") == "0")
                GetMore();
        }
    })
});

$().ready(function(e) {
    $(".hot_theme_c .thumbul").remove();
});
</script>
</asp:Content>