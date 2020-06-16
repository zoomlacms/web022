<%@ page language="C#" autoeventwireup="true" clientidmode="Static" inherits="Guest_AddClassification, App_Web_qyeuarzo" masterpagefile="~/Guest/Ask/Ask.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>问答中心-<%Call.Label("{$SiteName/}"); %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="navbar navbar-default" role="navigation" id="guest_nav">
<div class="container">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/Guest">留言反馈</a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/Ask">问答首页</a></li>
<li><a href="/Guest/Ask/List.aspx" target="_blank">问题库</a></li>
<li class="active"><a href="/Guest/Ask/Classification.aspx" target="_blank">分类大全</a></li>
<li><a href="/Guest/Ask/Add.aspx" target="_blank">在线提问</a></li>
<li><a href="/Guest/Ask/Star.aspx" target="_blank">问答专家</a></li>
<li><a href="/Guest/Ask/MyAskList.aspx" target="_blank">我的提问</a></li>
<li><a href="/Guest/Ask/MyAnswerlist.aspx" target="_blank">我的问答</a></li>
</ul>
</div>
</div>
</div>
<div class="container">
<ol class="breadcrumb">  
<li>您的位置：<a href="/">网站首页</a></li>
<li><a href="Default.aspx">问答中心</a></li>
<li class="active">分类大全</li>
</ol>
<div class="ask_class">
<div class="ask_class_t">问题分类</div>
<div class="ask_class_c">
<div class="row">
<ul class="list-unstyled">
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
    <ItemTemplate><li class="col-lg-2 col-md-2 col-sm-4 col-xs-12"><span runat="server" id="spGrade"></span></li></ItemTemplate>
</asp:Repeater>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
<div class="ask_class_con">
<ul class="nav nav-tabs">
<li class="active"><a href="Classification.aspx?type=1&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type1">待完善问题</a></li>
<li><a href="Classification.aspx?type=2&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type2">已完善</a></li>
<li><a href="Classification.aspx?type=3&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type3">高分</a></li>
<li><a href="Classification.aspx?type=4&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type4">零回答</a></li>
<li><a href="Classification.aspx?type=5&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type5">全部</a></li>
</ul>
<div class="ask_class_conc">
<table class="table table-bordered">
<tr>
<th>积分</th>
<th>问题</th>
<th>回答</th>
<th>用户</th>
<th>时间</th>
</tr> 
<asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
<ItemTemplate>
<tr>
<td><img src="/App_Themes/Guest/images/TB2.gif" alt="" /><%#Eval("Score") %></td>
<td><a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),20) %></a></td>
<td><label id="aCount" runat="server"></label></td>
<td><a href="/ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a></td>
<td><%#Eval("AddTime", "{0:yyyy-MM-dd}")%></td>
</tr>
</ItemTemplate>
</asp:Repeater>
</table>
<ul class="list-unstyled">
<li style="width: 98.5%; float: left; line-height: 28px; text-align: center;">
共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条信息
<asp:LinkButton runat="server" ID="First" onclick="First_Click">首页</asp:LinkButton>
<asp:LinkButton runat="server" ID="Prev" onclick="Prev_Click">上一页</asp:LinkButton>
<asp:LinkButton runat="server" ID="Next" onclick="Next_Click">下一页</asp:LinkButton>
<asp:LinkButton runat="server" ID="Last" onclick="Last_Click">尾页</asp:LinkButton>
页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="form-control" style="display:inline-table;"  OnTextChanged="txtPage_TextChanged" Width="50px">10</asp:TextBox>
条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server" AutoPostBack="True" CssClass="form-control" style="display:inline-table;" Width="50" OnSelectedIndexChanged="DropDownListPage_SelectedIndexChanged"></asp:DropDownList>页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
</li>
</ul>
</div>
</div>
</div>
<div class="hidden">
<div class="h_b">
<div class="h_b_m">
<div class="question_count">
<span class="count">最佳回答采纳率:</span><span class="adopt" ><%=getAdoption() %></span><br />
<span class="count">已解决问题数:</span><span class="countques" ><% =getSolvedCount() %></span><br />
<span class="count">待解决问题数:</span><span class="countques" ><% =getSolvingCount() %></span>
</div>
<div id="move">
<span class="count">当前在线:</span><%=getLogined() %><br />
<span class="count">注册用户:</span><%=getUserCount() %><br />
</div>
</div>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
<script>
    $().ready(function () {
        
        var type = '<%Call.Label("{$GetRequest(type)$}");%>';
        if (type != "")
        {
            $(".ask_class_con ul li").removeClass("active");
            $("#type" + type).parent().addClass("active");
        }
    })
</script>
</asp:Content>