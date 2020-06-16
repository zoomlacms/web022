<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Baike/Baike.master" clientidmode="Static" inherits="Guestbook_BkDetails, App_Web_mas3ijli" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>逐浪百科</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">  
<div class="container">
<ol class="breadcrumb margin_top10" style="margin-bottom:0px;">
    <li>您的位置：<a href="/">网站首页</a></li>
    <li><a href="/Baike" target="_self">百科中心</a></li>
    <li class="active">词条详情</li>
</ol>
<div>
 <asp:LinkButton runat="server" ID="Edit" Text="编辑本词条：" OnClick="Edit_Click" Font-Size="Medium"></asp:LinkButton>
 <asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF"></asp:Label>
    <div id="inputShowSummaryDiv" style="padding: 0 0 10px; display: none;">
        <div id="canEditSummary" style="display: none"></div>
        <div id="cardSummary"></div>
    </div>
    <div id="inputShowMainInfoDiv" style="display: none;">
        <div id="canEditMainInfo"></div>
        <div id="inputMainInfoDivContent"></div>
    </div>
    <div style="position: relative;">
        <div id="loading"></div>
        <div class="index_div">
            <div class="block-title col-lg-2 col-md-2 col-xs-2">目录</div>
            <div class="catalog-list col-lg-10 col-md-10 col-xs-10" id="baike_list"></div>
            <div class="clearfix"></div>
        </div>
        <div data-spy="scroll" data-target="#baike_div" data-offset="0" style="height: 500px; overflow-y: auto;overflow-x:hidden;">
            <div runat="server" id="code"></div>
        </div>
    </div>
    <div class="yl_items its" runat="server" visible="false">
        <div class="item first">
            <div class="itme_tit"><strong>参考资料</strong></div>
            <div runat="server" id="txtReference" class="x_input"></div>
        </div>
        <div class="item">
            <div class="itme_tit"><strong>开放分类</strong></div>
            <div runat="server" id="txtBtype" class="x_input"></div>
        </div>
        <div class="item">
            <div class="itme_tit"><strong>扩展阅读</strong></div>
            <div runat="server" id="txtExtend" class="x_input"></div>
        </div>
        <div id="editSpan" class="item" runat="server">
            <div class="itme_tit"><strong>合作编辑</strong></div>
            <div runat="server" id="editman" class="x_input"></div>
        </div>
        <span style="float: right; padding-right: 50px"><asp:LinkButton ID="lbtFavorite" runat="server" OnClick="lbtFavorite_Click">收藏</asp:LinkButton></span>
        <div style="display: none;" id="divSupplyment">
            <asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine" Width="500" Height="120"></asp:TextBox>
        </div>
    </div>
</div>
<div class="right baike_border">
    <div id="userinfo" runat="server" style="display: none"><asp:Label runat="server" ID="username"></asp:Label>----实习小编</div>
    <div>
        <div><span class="foot_sub">词条统计</span></div>
        <ul class="floatul">
            <li>浏览次数：</li>
            <li>编辑次数：<asp:Label runat="server" ID="edittime"></asp:Label></li>
            <li>最近更新：<asp:Label runat="server" ID="updatetimes"></asp:Label></li>
            <li>创建者：<asp:Label runat="server" ID="creatbaike"></asp:Label></li>
        </ul>
        <div class="clearfix"></div>
    </div>
    <div class="aa">
        <div><span class="foot_sub">贡献光荣榜</span></div>
        <ul>
            <asp:Repeater runat="server" ID="Contribution" EnableViewState="false">
                <ItemTemplate>
                    <li><span style="float: right"><a href="Details.aspx?tittle=<%#Eval("Tittle")%>&username=<%#Eval("UserName")%>&soure=baikeedit">版本</a></span><%#Eval("UserName")%></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="aa">
        <div><span class="foot_sub">最新动态</span></div>
        <asp:Repeater runat="server" ID="Latestnews">
            <ItemTemplate></ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div class="claerfix"></div>
</div>
<nav id="baike_div" class="bs-docs-sidebar affix-top">
     <ul class="nav" id="baike_nav"></ul>
</nav>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
    <style type="text/css">
        .floatul li {float:left;margin-left:10px;}
        .foot_sub {font-size:16px;font-weight:bold;}
        /*目录索引*/
        .block-title {border:1px solid #ddd;background:#fbfbfb;height: 210px; line-height: 210px; font-size: 1.5em; text-align: center;}
        .catalog-list {display:block;position:relative;overflow:hidden;height:210px;
                       padding-top:15px;padding-bottom:10px;background:#fff;
                       border:1px solid #ddd;}
        .dirul {float:left;width:150px;border-right:1px solid #ddd;padding-left:20px;list-style-type:none;list-style:none;}
        .dirul>li{padding-bottom:3px;list-style-type:none;list-style:none;}
        .drul li ul {padding:0px;margin:0px;list-style-type:none;}
        .dirul .level1 {color:#136ec2;font-size:16px;font-weight:500;text-decoration:none;}
        .dirul .level2 {color:#333;line-height:16px;font-size:12px;text-decoration:none;color:#136ec2;padding-left:12px;}
        .dirul .level3 {color:#333;line-height:16px;font-size:12px;text-decoration:none;padding-left:24px;}
        /*边栏滚动监听*/
        #baike_div {background-color:#fff;position:fixed;right:60px;top:200px;width:150px;padding:10px;border:1px solid #ddd;}
        #baike_nav li {border-left:3px solid #fff;}
        #baike_nav li.active {border-left:3px solid #563d7c;}
        #baike_nav li>a{padding:0px;padding-left:10px;padding-bottom:3px;}
        #baike_nav .level1 {color:#333;font-weight:bold;}
        #baike_nav .level2 {color:#666;padding-left:12px;}
        #baike_nav .level3 {color:#666;padding-left:24px;}
</style>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/Plugs/Baike.js"></script>
    <script>
        BaiKe.config.id = "code";
        BaiKe.config.dirid = "baike_list";
        BaiKe.config.navid = "baike_nav";
        BaiKe.Init();
    </script>
    <script>
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
    </script>
</asp:Content>