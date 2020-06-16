<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Ask/Ask.master" inherits="Guest_SearchDetails, App_Web_5ap02aa3" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>已解决-<%Call.Label("{$SiteName/}"); %>问答</title>
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
<li class="active"><a href="/Guest/Ask/Add.aspx" target="_blank">在线提问</a></li>
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
<li><a href="/Ask">问答中心</a></li>
<li class="active">已解决</li>
</ol>
<div class="question_count">
<span class="count">最佳回答采纳率:</span><span class="adopt" ><%=getAdoption() %></span><br />
<span class="count">已解决问题数:</span><span class="countques" ><% =getSolvedCount() %></span><br />
<span class="count">待解决问题数:</span><span class="countques" ><% =getSolvingCount() %></span>
</div>
<div id="move">
<span class="count">当前在线:</span><%=getLogined() %><br />
<span class="count">注册用户:</span><%=getUserCount() %><br />
</div>
<div  class="myanswer">
<div class="question">
<span class="questions">问题：</span>
<strong><asp:Label ID="question" class="questions" runat="server"></asp:Label></strong><br />
<span  class="questions">提问者： <asp:Label ID="username" runat="server"></asp:Label>|</span> 
<span  class="questions">提问日期：<asp:Label
ID="addtime" runat="server"></asp:Label></span><br />
<span class="questions" id="supdiv" runat="server">问题补充：</span><asp:Label ID="supment" runat="server"></asp:Label>
</div>
<div class="tuijian">
<div class="tit"><div class="bg_tj"><span>推荐答案：</span></div>
</div>
<div class="tj_content">
<div id="g_show">
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound1" >
<ItemTemplate>
<div class="g_show_txt"><%# Eval("Content")%> <div style=" float:right;color:red" id="Div<%#Eval("ID") %>"><%#getstatus(Eval("Status","{0}"))%></div></div> 
<div class="btm">
<span class="btmlabe ad">回答者：<asp:Label id="Isname" runat="server"><a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a></asp:Label></span><span class="btmlabe date">回答日期：<%# Eval("AddTime")%></span><span  class="btmlabel"><a href="#" onClick="showComment(<%#Eval("ID") %>)">评论</a></span>
<span class="btmlabel">
<asp:LinkButton ID="lbtApproval" runat="server" CommandName="Approval" CommandArgument='<%#Eval("ID") %>' class="zandip" onMouseover="Changtxt(this)"  onMouseOut="rectxt(this)"></asp:LinkButton></span>
<div id="divComment<%#Eval("ID") %>" style="display:none; width:75%">
<div class="clear"></div>
<ul>
<asp:Repeater ID="RepeaterC" runat="server" OnItemDataBound="RepeaterC_ItemDataBound">
<ItemTemplate>
<li style="width:100%">
<span><label runat="server" id="lbUser"></label></span><span ><%#Eval("Content") %></span>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
<asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine"
Width="500" Height="120">
</asp:TextBox><br/>
<div style="float:right;"><a href="#" onClick="hideComment(<%#Eval("ID") %>)">取消  </a><asp:LinkButton ID="lbtSub" runat="server" CommandName="subComment" CommandArgument='<%#Eval("ID") %>' >提交</asp:LinkButton></div>
</div>
        
<div class="clear"></div>
</div> 
</ItemTemplate>
</asp:Repeater>
</div>
</div>
</div>
<div class="tuijian">
<div class="tit"><div class="bg_hd"><span>其他回答:</span></div>
</div>
<div class="tj_content">
<div id="bDiv2">
<asp:Repeater ID="Repeater2" runat="server"  OnItemCommand="Repeater2_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound1">
<ItemTemplate>
<div class="g_show_txt" style="border:none"><%# Eval("Content")%> <div style=" float:right;color:red" id="Div<%#Eval("ID") %>"><%#getstatus(Eval("Status","{0}"))%></div></div> 
<div class="btm">
<span class="btmlabe ad">回答者：<asp:Label id="Isname" runat="server"><a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a></asp:Label></span><span class="btmlabe date">回答日期：<%# Eval("AddTime")%></span><span  class="btmlabel"><a href="#" onClick="showComment(<%#Eval("ID") %>)">评论</a></span>
<span class="btmlabel zan">
<asp:LinkButton ID="lbtApproval" runat="server" CommandName="Approval" CommandArgument='<%#Eval("ID") %>' class="zandip"  onMouseover="Changtxt(this)"  onMouseOut="rectxt(this)"></asp:LinkButton></span>
<div id='divComment<%#Eval("ID") %>' style="display:none; width:75%">
<div class="clear"></div>
<ul>
<asp:Repeater ID="RepeaterC" runat="server" OnItemDataBound="RepeaterC_ItemDataBound">
<ItemTemplate>
<li style="width:100%">
<span><label runat="server" id="lbUser"></label></span><span ><%#Eval("Content") %></span>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
<asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine" Height="120">
</asp:TextBox><br/>
<div style="float:right;"><a href="#" onClick="hideComment(<%#Eval("ID") %>)">取消  </a><asp:LinkButton ID="lbtSub" runat="server" CommandName="subComment" CommandArgument='<%#Eval("ID") %>' >提交</asp:LinkButton></div>
</div>
<div class="clear"></div>
</div> 
</ItemTemplate>
</asp:Repeater>
</div>
</div>
</div>
<div class="ask_Resolved margin_top10">
<div class="ask_Resolved_t"><span><i class="fa fa-heart"></i>我们向您承诺：10分钟内给您满意的答复</span>等待您来回答</div>
<div class="ask_Resolved_c">
<div class="ask_Resolved_cr">
<ul class="list-unstyled">
<asp:Repeater runat="server" ID="Repeater3">
<ItemTemplate>                                            
<li>
<strong><%#getanswer(Eval("ID", "{0}"))%>回答</strong>
<a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),45) %></a>
</li>
</ItemTemplate>
</asp:Repeater>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
<asp:HiddenField runat="server" ID="hfsid" />
<asp:HiddenField runat="server" ID="zanval" /> 
<script type="text/javascript">
    function Changtxt(obj) {
        $("#zanval").val(obj.innerHTML);
        obj.innerHTML = "赞同";
    }
    function rectxt(obj) {
        obj.innerHTML = $("#zanval").val();
    }
    function supplyment() {

        var div = document.getElementById("divSupplyment");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        else {
            div.style.display = "none";
        }
    }
    function reply() {

        var div = document.getElementById("styreply");


        if (div.style.display == "none") {
            div.style.display = "block";
        }
        else {
            div.style.display = "none";
        }
        //alert(div.style.display);
    }
    function show() {
        var div = document.getElementById("show");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        // else {div.style.display = "none";}

    }
    function CheckDirty() {
        var oEditor = CKEDITOR.instances.TxtTContent;
        var value = oEditor.getData();
        var TxtTTitle = document.getElementById("TxtTTitle").value;
        var TxtValidateCode = document.getElementById("TxtValidateCode").value;

        if (value == "" || TxtTTitle == "" || TxtValidateCode == "") {
            if (value == "") {
                var obj = document.getElementById("RequiredFieldValidator1");
                obj.innerHTML = "<font color='red'>内容不能为空！</font>";
            }
            else {
                var obj = document.getElementById("RequiredFieldValidator1");
                obj.innerHTML = "";
            }
            if (TxtTTitle == "") {
                var obj2 = document.getElementById("RequiredFieldValidator2");
                obj2.innerHTML = "<font color='red'>留言标题不能为空！</font>";
            }
            else {
                var obj2 = document.getElementById("RequiredFieldValidator2");
                obj2.innerHTML = "";
            }
            if (TxtValidateCode == "") {
                var obj3 = document.getElementById("sp1");
                obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
            } else {
                var obj3 = document.getElementById("sp1");
                obj3.innerHTML = "";
            }
            return false;
        }
        else {
            var obj = document.getElementById("RequiredFieldValidator1");
            obj.innerHTML = "";
            var obj2 = document.getElementById("RequiredFieldValidator2");
            obj2.innerHTML = "";
            var obj3 = document.getElementById("sp1");
            obj3.innerHTML = "";
            document.getElementById("EBtnSubmit2").click();
        }
    }
    function showComment(id) {
        document.getElementById("divComment" + id).style.display = "";
    }
    function hideComment(id) {
        document.getElementById("divComment" + id).style.display = "none";
    }
</script>
</asp:Content>

