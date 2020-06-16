<%@ page language="C#" autoeventwireup="true" inherits="MIS_OA_Menu_LeftMenu, App_Web_hplpn5kv" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>OA左边栏</title>
    <script src="/JS/calendar-brown.js" type="text/javascript"></script>   
<script>
    function writeDate() {
        var week;
        if (new Date().getDay() == 0) week = "星期日"
        if (new Date().getDay() == 1) week = "星期一"
        if (new Date().getDay() == 2) week = "星期二"
        if (new Date().getDay() == 3) week = "星期三"
        if (new Date().getDay() == 4) week = "星期四"
        if (new Date().getDay() == 5) week = "星期五"
        if (new Date().getDay() == 6) week = "星期六"
        document.write(new Date().getFullYear() + "年" + (new Date().getMonth() + 1) + "月" + new Date().getDate() + "日 " + week);
    }
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="oaleftmenu">
    <ul class="list-unstyled" id="userinfo_ul">
        <div class="left_user">
						<div class="userimg pull-left">
							<img src="" onerror="this.src='/Images/userface/noface.gif'" runat="server" id="faceImg" /></div>
						<div class="userinfo " style="margin-right: 15px;">
							<span>名称：<asp:Label runat="server" ID="userNameL" /></span><br />
							<span>部门：<asp:Label runat="server" ID="userGNL" /></span><br />
							<span>工号：<asp:Label runat="server" ID="Work_L" /></span>
						</div>
						<div class="clearfix"></div>
						<div id="calendarDiv" runat="server">
							<script type="text/javascript">
							    function dateChanged(calendar) {
							        if (calendar.dateClicked) {
							            var y = calendar.date.getFullYear();
							            var m = calendar.date.getMonth();
							            var d = calendar.date.getDate();
							            window.open("/Mis/Daily/AddDaily.aspx?name=admin&Date=" + y + "-" + (m + 1) + "-" + d, "main_right");
							        }
							    };
							    Calendar.setup(
								{
								    flat: "calendarDiv",
								    flatCallback: dateChanged
								});
							</script>
						</div>
						<div class="clearfix"></div>
						

					</div>
					<div class="commonuser" runat="server" id="leftChk3">
						<div class="common_t">
							<div class="duty_tp">
								<span class="fork" onclick="closeDiv(this);"></span>
								<span class="oaarrow" onclick="hideC(this);" style="display: none;"></span>
								<span class="oaarrowDown" onclick="showC(this);"></span><strong>常用联系人</strong>
							</div>
						</div>
						<div class="content common_c" style="display: none;">
							<ul style="margin-bottom: 0;">
								<li><a href="#" style="display: block; width: 40px; height: 40px; float: left;">
									<img src="/Mis/OA/images/cuser.jpg" alt="" /></a><a class="name" href="#">暴风杨立东</a></li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
					<div class="commonuser" runat="server" id="leftChk5">
						<div class="history_t">
							<div class="duty_tp">
								<span class="fork" onclick="closeDiv(this);"></span>
								<span class="oaarrow" onclick="hideC(this);"></span>
								<span class="oaarrowDown" style="display: none;" onclick="showC(this);"></span><strong>便捷访问</strong>
							</div>
						</div>
						<div class="content history_c">
                            <a href="javascript:;" class="btn btn-xs btn-info" onclick="showMain('Office/Default.aspx');">发文管理</a> 
                            <a href="javascript:;" class="btn btn-xs btn-info" onclick="showMain('AffairsList.aspx?view=1');">待办事务</a> 
                            <a href="javascript:;" class="btn btn-xs btn-info" onclick="showMain('Mail/MessageSend.aspx');">写邮件</a> 
                            <a href="javascript:;" class="btn btn-xs btn-info" onclick="showMain('Mail/Message.aspx');">收邮件</a> 
                            <a href="javascript:;" class="btn btn-xs btn-info" onclick="showMain('../MisAttendance.aspx');">签到</a> 
							<div class="clearfix"></div>
						</div>
					</div> 
        </ul>
    <ul class="list-unstyled" id="draftdoc_ul">
        <li><span><i class="fa fa-plus-square"></i>公文拟稿</span></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>代收公文</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>公文发送</a></li>
        <li><a href="javascript:;" data-url="Drafting.aspx" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>撰写公文</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>已发公文</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>已收公文</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>已收组配置</a></li>

    </ul>
    <ul class="list-unstyled" id="agencydoc_ul">
        <li><span><i class="fa fa-plus-square"></i>代办公文</span></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>今日公文</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>历史公文</a></li> 
    </ul>
    <ul class="list-unstyled" id="office_ul">
        <li><span><i class="fa fa-plus-square"></i>已办事务</span></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>事务管理</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>待办事务</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>已办事务</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>回收站</a></li>
    </ul>
    <ul class="list-unstyled" id="senddoc_ul">
        <li><span><i class="fa fa-plus-square"></i>发文模板</span></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>发文代字</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>主题词</a></li> 
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>主送</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>抄送</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>抄报</a></li>
    </ul>
    <ul class="list-unstyled" id="newdoc_ul">    
        <li><span><i class="fa fa-plus-square"></i>新建发文</span></li>   
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>发文拟稿</a></li>
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>发文追踪</a></li> 
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>收文等登记</a></li> 
        <li><a href="javascript:;" data-url="" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>收文追踪</a></li>   
    </ul>
    <ul class="list-unstyled" id="doclist_ul">    
        <li><span><i class="fa fa-plus-square"></i>已归档文件</span></li>   
        <li><a href="javascript:;" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>文件借阅</a></li>
        <li><a href="javascript:;" class="oaleftul"><i class="fa fa-chevron-circle-right"></i>已借阅</a></li>  
    </ul>
    </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style>
    .oaleftmenu ul.list-unstyled{ display:none;}
    .oamain_left ul{ display:none;}
    .oamain_left ul.active{ display:block;}
</style>
<script>
    function hideC(obj) {
        $(obj).hide().siblings().show();
        $p = $(obj).parent().parent().parent();
        $p.find("div.content").hide("fast");
    }
    function showC(obj) {
        $(obj).hide().siblings().show();
        $p = $(obj).parent().parent().parent();
        $p.find("div.content").show("fast");
    }
    $(".oaleftul").click(function (e) {
        $(".oaleftul").removeClass("active");
        $(this).addClass("active");
        var right = $(this).attr("data-url");
        if (right != "")
            parent.showRightCnt($(this).attr("data-url"));
    })
    function hiddendiv1() {
        parent.hiddendiv1();
    }
</script>
</asp:Content>