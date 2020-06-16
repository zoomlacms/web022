<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Default, App_Web_v2egescv" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE html>
<html>
<head>
<title><%:Call.SiteName%>_后台管理</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit">
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/V3.css?version=<%:ConfigurationManager.AppSettings["Version"].ToString() %>" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/JS/jquery-ui.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/FrameTab.js"></script>
</head>
<body style="overflow-y:hidden;">
<form id="form1" runat="server">
<asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
<div class="m_top">
<table class="main_table" cellpadding="0" cellspacing="0">
<tr>
<td class="main_table_l">
<div class="padding0">
<a href="Default.aspx"><img src="<%= Call.Logo %>" alt="逐浪CMS_后台管理系统" title="重新加载后台" class="logoAdmin" /></a>
</div>
</td>
<td>
<div class="margin-15 padding0 m_top_right">
    <div class="col-lg-9 col-md-10 col-sm-9 col-xs-12 hidden-xs"> 
	    <div style="height: 42px;" class="m_top_menu row">
		    <ul class="list-unstyled ">
			    <li class="menu1 active" onclick="openmenu('menu1')"><a onclick="showleft('menu1_1');" data-toggle="tooltip" data-placement="top" title="工作台"><span class="visible-sm">工作</span><span class="hidden-sm"><%:lang.LF("工作台") %></span></a></li>
			    <li class="menu2" onclick="openmenu('menu2')"><a onclick="ShowMain('NodeTree.ascx','');" title="内容"><span class="visible-sm">内容</span><span class="hidden-sm"><%:lang.LF("内容") %></span></a></li>
			    <li class="menu3" onclick="openmenu('menu3')"><a onclick="ShowMain('ShopNodeTree.ascx','');" title="商城"><span class="visible-sm">商城</span><span class="hidden-sm"><%:lang.LF("商城") %></span></a></li>
			    <li class="menu4" onclick="openmenu('menu4')"><a onclick="showleft('menu4_1');" title="黄页"><span class="visible-sm">黄页</span><span class="hidden-sm"><%:lang.LF("黄页") %></span></a></li>
			    <li class="menu5" onclick="openmenu('menu5')"><a onclick="showleft('menu5_1');" title="教育"><span class="visible-sm">教育</span><span class="hidden-sm"><%:lang.LF("教育") %></span></a></li>
			    <li class="menu6" onclick="openmenu('menu6')"><a onclick="ShowMain('UserGuide.ascx','');"  title="用户"><span class="visible-sm">用户</span><span class="hidden-sm"><%:lang.LF("用户") %></span></a></li>
			    <li class="menu7" onclick="openmenu('menu7')"><a onclick="showleft('menu7_1');" title="扩展"><span class="visible-sm">扩展</span><span class="hidden-sm"><%:lang.LF("扩展") %></span></a></li>
			    <li class="menu8" onclick="openmenu('menu8')"><a onclick="showleft('menu8_1');" title="系统"><span class="visible-sm">系统</span><span class="hidden-sm"><%:lang.LF("系统") %></span></a></li>
			    <li class="menu9" onclick="openmenu('menu9')"><a onclick="showleft('menu9_1');" title="办公"><span class="visible-sm">办公</span><span class="hidden-sm"><%:lang.LF("办公") %></span></a></li>
                <li class="menu10" onclick="openmenu('menu10')"><a onclick="showleft('menu10_1');" title="移动"><span class="visible-sm">移动</span><span class="hidden-sm"><%:lang.LF("移动") %></span></a></li>
                <li class="menu11" onclick="openmenu('menu11')"><a onclick="showleft('menu11_1');" title="站群"><span class="visible-sm">站群</span><span class="hidden-sm"><%:lang.LF("站群") %></span></a></li>
		    </ul>
	    </div> 
    </div>
    <div class="col-lg-3 col-md-2 col-sm-3 col-xs-12 padding0 m_top_rl" style="padding-right:20px;">
        <div id="Announce">
            <div class=" pull-right hidden-md hidden-sm hidden-xs">
                <a href="/" target="_blank" title="返回首页"><span class="glyphicon glyphicon-home"></span></a>
                <a href="/user/" target="_target" title="ALT+U进入会员中心"><span class="glyphicon glyphicon-user"></span></a>
                <a href="javascript:void(0)" style="cursor: pointer;" title='Alt+Q锁定屏幕' onclick="showWindow('Lockin.aspx',900,460);"><span class="glyphicon glyphicon-lock"></span>
				<a href="<%= CustomerPageAction.customPath2 %>SignOut.aspx" title="退出"><span class="glyphicon glyphicon-off"></span></a>
            </div>
            <div class="dropdown pull-right">
			<a data-toggle="dropdown" href="javascript:;">
				<label runat="server" id="nameL"></label>
				<span class="glyphicon glyphicon-th-large"></span>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				<li><a href="javascript:ShowAD();" title="场景切换"><%:lang.LF("场景切换") %></a></li>
				<li><a href="javascript:modalDialog('/Common/calc.html', 'calculator', 400, 300);"><%:lang.LF("计算器") %></a></li>
				<li><a href="/help.html" target="_blank"><%:lang.LF("快速帮助") %></a></li>
				<li><a href="http://help.zoomla.cn/" target="_blank"><%:lang.LF("线上支持") %></a></li>
			</ul>
		</div>
	</div> 
    <div class="pull-right hidden-lg search_btn">
        <span class="glyphicon glyphicon-search" onclick="showsearch()"></span>
    </div>
    <div class="pull-right hidden-lg hidden_group" id="search_div">
        <div class="input-group input-group-sm">
            <asp:TextBox runat="server" ID="keyText" class="form-control input-control" placeholder="快速搜索  回车确认" onkeydown="return IsEnter(this);" /><i class="glyphicon glyphicon-search"></i>
        </div>
    </div>
    </div>
</div>
</td>
</tr>
</table>
<div class="mb_nav visible-xs">
<nav class="navbar navbar-default">  
    <div class="navbar-header pull-right visible-xs-inline">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button> 
    </div> 
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="javascript:;" data-label="menu1">工作台</a></li>
            <li><a href="javascript:;" data-label="menu2">内容</a></li>
            <li><a href="javascript:;" data-label="menu3">商城</a></li>
            <li><a href="javascript:;" data-label="menu4">黄页</a></li>
            <li><a href="javascript:;" data-label="menu5">教育</a></li>
            <li><a href="javascript:;" data-label="menu6">用户</a></li>
            <li><a href="javascript:;" data-label="menu7">扩展</a></li>
            <li><a href="javascript:;" data-label="menu8">系统</a></li>
            <li><a href="javascript:;" data-label="menu9">办公</a></li>
            <li><a href="javascript:;" data-label="menu10">移动</a></li>
            <li><a href="javascript:;" data-label="menu11">站群</a></li>
        </ul> 
        <ul class="sub_nav"></ul>
        <ul class="thi_nav"></ul>
    </div> 
</nav>
</div>
<div class="clearfix"></div>
<div class="m_top_bottom hidden-xs">
<ul class="menu1 open">
    <li class="menu1_1 active"><a onclick="showleft('menu1_1','{$path}Profile/Worktable.aspx')"><%:lang.LF("版本信息") %></a></li>
	<li class="menu1_2 "><a onclick="showleft('menu1_1','Main.aspx')"><%:lang.LF("从此开始") %></a></li>
	<li class="menu1_3"><a onclick="showleft('menu1_2','Config/SearchFunc.aspx')"><%:lang.LF("快速导航") %></a></li>
	<li class="menu1_4"><a onclick="showleft('menu1_3','Profile/ModifyPassword.aspx')"><%:lang.LF("修改密码") %></a></li>
</ul>
<ul class="menu2">
	<li class="menu2_1 active"><a onclick="ShowMain('NodeTree.ascx','Content/ContentManage.aspx');"><%:lang.LF("按栏目管理") %></a></li>
	<li class="menu2_2"><a onclick="ShowMain('NodeTree.ascx','Content/SpecialManage.aspx')"><%:lang.LF("按专题管理") %></a></li>
	<li class="menu2_3"><a onclick="showleft('menu2_3','Content/CommentManage.aspx')"><%:lang.LF("评论管理") %></a></li>
    <li class="menu2_4">
        <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu2_4','Pub/PubManage.aspx')" class="btn btn-primary  btn-sm">互动模块</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubManage.aspx')">互动模块</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/FormManage.aspx')">互动表单</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubManage.aspx')">互动信息</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Content/ModelManage.aspx?ModelType=7')">互动模型</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubRecycler.aspx')">互动存档</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubExcel.aspx')">Excel导出</a></li>
            </ul>
        </div>
    </li>
    <li class="menu2_7"><a onclick="showleft('menu2_7','Content/CreateHtmlContent.aspx')"><%:lang.LF("生成发布") %></a></li>
    <li class="menu2_6"><a onclick="showleft('menu2_6','Content/Video/VideoList.aspx')">视频管理</a></li>
    <li class="menu2_5">
        <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu2_5','Content/CollectionManage.aspx')" class="btn btn-primary  btn-sm ">采集检索</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:;" data-url="Content/CollectionStep1.aspx">添加采集</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionManage.aspx">采集项目</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionStart.aspx">开始采集</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionStatus.aspx">采集进度</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionList.aspx">采集记录</a></li>
                <li><a href="javascript:;" data-url="Content/CollSite.aspx">统一检索</a></li>
                <li><a href="javascript:;" data-url="Content/InfoLog.aspx">检索动态</a></li>
            </ul>
        </div>  
    </li>
    <li class="menu2_8"><a onclick="ShowMain('NodeTree.ascx?url=Content/ContentRecycle.aspx','Content/ContentRecycle.aspx');"><%:lang.LF("回收站") %></a></li>
	<li class="menu2_9"><a onclick="showleft('menu2_9','Guest/GuestManage.aspx')"><%:lang.LF("百科问答贴吧") %></a></li>
	<li class="menu2_10"><a onclick="showleft('menu2_10','AddOn/SourceManage.aspx')"><%:lang.LF("内容参数") %></a></li>
</ul>
<ul class="menu3">
	<li class="menu3_1 active"><a onclick="ShowMain('ShopNodeTree.ascx','Shop/ProductManage.aspx');"><%:lang.LF("商品管理") %></a></li>
	<li class="menu3_2"><a onclick="showleft('menu3_2','Shop/StockManage.aspx')"><%:lang.LF("库存管理") %></a></li>
	<li class="menu3_3"><a onclick="showleft('menu3_3','Shop/OrderList.aspx')"><%:lang.LF("订单管理") %></a></li>
	<li class="menu3_4"><a onclick="showleft('menu3_4','Shop/BankRollList.aspx')"><%:lang.LF("明细记录") %></a></li>
	<li class="menu3_5"><a onclick="showleft('menu3_5','Shop/ProductSale.aspx')"><%:lang.LF("销售统计") %></a></li>
	<li class="menu3_6"><a onclick="showleft('menu3_6','Shop/PresentProject.aspx')"><%:lang.LF("促销优惠") %></a></li>
	<li class="menu3_7"><a onclick="showleft('menu3_7','Shop/DeliverType.aspx')"><%:lang.LF("商城配置") %></a></li>
	<li class="menu3_8"><a onclick="showleft('menu3_8','Boss/Bosstree.aspx')"><%:lang.LF("加盟商管理") %></a></li>
	<li class="menu3_9"><a onclick="ShowMain('ShopRecycle.ascx','Shop/ShopRecycler.aspx');"><%:lang.LF("商品回收站") %></a></li>
	<li class="menu3_10"><a onclick="showleft('menu3_10','Flex/FlexTemplate.aspx')"><%:lang.LF("礼品管理") %></a></li>
	<li class="menu3_12"><a onclick="showleft('menu3_12','Shop/profile/StatisticsBriefing.aspx')"><%:lang.LF("推广返利") %></a></li>
	<li class="menu3_13">
        <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu3_13','Content/ModelManage.aspx?ModelType=6')" class="btn btn-primary  btn-sm ">店铺管理</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li class="active"><a href="javascript:;" data-url="UserShopManage/StoreManage.aspx">店铺审核</a></li>
                <li><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=6">申请模型</a></li>
                <li><a href="javascript:;" data-url="UserShopManage/StoreStyleManage.aspx">店铺模板</a></li>
                <li><a href="javascript:ShowMain('UserShopNodeTree.ascx','Shop/ProductManage.aspx?StoreID=-1',this);">商品管理</a></li>
                <li><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=5">店铺模型</a></li>
                <li><a href="javascript:;" data-url="UserShopManage/ShopinfoManage.aspx">店铺配置</a></li>
            </ul>
        </div>
	</li>
	<li class="menu3_14"><a onclick="showleft('menu3_14','/3D/3DManage.aspx')"><%:"3D"+lang.LF("店铺管理") %></a></li>
</ul>
<ul class="menu4">
	<li class="menu4_1 active"><a onclick="showleft('menu4_1','Page/UserModelManage.aspx')">黄页申请</a></li>
	<li class="menu4_2"><a onclick="showleft('menu4_2','Page/PageManage.aspx')"><%:lang.LF("黄页审核") %></a></li>
	<li class="menu4_4"><a onclick="ShowMain('PageTree.ascx','Page/PageContent.aspx')"><%:lang.LF("内容管理") %></a></li>
	<li class="menu4_5"><a onclick="showleft('menu4_5','Content/ModelManage.aspx?ModelType=4')"><%:lang.LF("黄页模型") %></a></li>
	<li class="menu4_6"><a onclick="showleft('menu4_2','Page/PageStyle.aspx')"><%:lang.LF("黄页样式") %></a></li>
    <li class="menu4_7"><a onclick="showleft('menu4_2','Page/PageConfig.aspx')">黄页配置</a></li>
</ul>
<ul class="menu5">
    <li class="menu5_1"><a onclick="ShowMain('PaperGuide.ascx','Exam/Papers_System_Manage.aspx')"><%:lang.LF("试卷管理") %></a></li>
    <li class="menu5_9"><a onclick="ShowMain('QuestGuide.ascx','Exam/QuestList.aspx')"><%:lang.LF("试题管理") %></a></li>
    <li class="menu5_10"><a onclick="ShowMain('ExamGuide.ascx','Exam/QuestList.aspx')">按年级管理</a></li>
    <li class="menu5_7"><a onclick="showleft('menu5_7','Exam/Papers_System_Manage.aspx')"><%:lang.LF("组卷配置") %></a></li>
	<li class="menu5_2"><a onclick="showleft('menu5_2','Exam/ToScore.aspx')"><%:lang.LF("阅卷中心") %></a></li>
	<li class="menu5_3"><a onclick="showleft('menu5_3','Exam/ClassManage.aspx')">排课管理</a></li>
	<li class="menu5_4"><a onclick="showleft('menu5_4','AddCRM/CustomerList.aspx?usertype=0')"><%:lang.LF("学员管理") %></a></li>
	<li class="menu5_5"><a onclick="showleft('menu5_5','Exam/ExTeacherManage.aspx')"><%:lang.LF("培训资源库") %></a></li>
	<li class="menu5_6"><a onclick="showleft('menu5_6','Shop/OrderList.aspx')"><%:lang.LF("财务管理") %></a></li>
    <li class="menu5_8"><a onclick="showleft('menu5_8','Exam/News.aspx')">数字出版</a></li>
</ul>
<ul class="menu6">
	<li class="menu6_1 active"><a  onclick="ShowMain('UserGuide.ascx','User/UserManage.aspx');"><%:lang.LF("会员管理") %></a></li>
	<li class="menu6_2"><a onclick="showleft('menu6_2','User/AdminManage.aspx')"><%:lang.LF("管理员管理") %></a></li>
	<li class="menu6_3"><a onclick="showleft('menu6_3','User/PermissionInfo.aspx')"><%:lang.LF("用户角色") %></a></li>
	<li class="menu6_4"><a onclick="showleft('menu6_4','User/SendMailList.aspx')"><%:lang.LF("信息发送") %></a></li>
	<li class="menu6_5">      
          <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu6_5','User/SubscriptListManage.aspx?menu=audit')" class="btn btn-primary  btn-sm ">订阅中心</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li class="active"><a href="javascript:;" data-url="User/EidtMailModel.aspx">邮件模板</a></li>
                <li><a href="javascript:;" data-url="User/RegValidateMail.aspx">邮件内容</a></li>
                <li><a href="javascript:;" data-url="User/SendMailList.aspx">发送邮件</a></li>
                <li><a href="javascript:;" data-url="User/SendMailList.aspx">邮件列表</a></li>
                <li><a href="javascript:;" data-url="User/SubscriptListManage.aspx?menu=all">订阅管理</a></li>
                <li><a href="javascript:;" data-url="User/SendMailList.aspx">邮件发送</a></li>
                <li><a href="javascript:;" data-url="User/MailIdiographList.aspx">签名管理</a></li>
            </ul>
        </div>
	</li>
	<li class="menu6_6"><a onclick="showleft('menu6_6','User/Jobsconfig.aspx')"><%:lang.LF("人才招聘") %></a></li>
	<li class="menu6_7"><a onclick="showleft('menu6_7','Zone/ZoneConfig.aspx')"><%:lang.LF("SNS社区") %></a></li>
    <li class="menu6_8"><a onclick="showleft('menu6_8','User/UserApi.aspx')">整合接口</a></li>
</ul>
<ul class="menu7">
	<li class="menu7_1 active"><a onclick="showleft('menu7_1','Config/DatalistProfile.aspx')"><%:lang.LF("开发中心") %></a></li>
	<li class="menu7_2"><a onclick="showleft('menu7_2','Plus/ADZoneManage.aspx')"><%:lang.LF("广告管理") %></a></li>
	<li class="menu7_3"><a onclick="showleft('menu7_3','Counter/Counter.aspx')"><%:lang.LF("访问统计") %></a></li>
	<li class="menu7_4"><a onclick="showleft('menu7_4','Plus/SurveyManage.aspx')"><%:lang.LF("问卷调查") %></a></li>
	<li class="menu7_5"><a onclick="showleft('menu7_5','File/UploadFile.aspx')"><%:lang.LF("文件管理") %></a></li>
	<li class="menu7_6"><a onclick="showleft('menu7_6','Addon/DictionaryManage.aspx')"><%:lang.LF("数据字典") %></a></li>
	<li class="menu7_7"><a onclick="showleft('menu7_7','File/Addlinkhttp.aspx')"><%:lang.LF("站内链接") %></a></li>
	<li class="menu7_9"><a onclick="showleft('menu7_9','WeiXin/home.aspx')"><%:lang.LF("移动微信") %></a></li>
	<li class="menu7_11"><a onclick="showleft('menu7_11','Iplook/IPManage.aspx')"><%:lang.LF("其他功能") %></a></li>
    <li class="menu7_12"><a onclick="showleft('menu7_12','Template/Code/PageList.aspx')">扩展页面</a></li>
</ul>
<ul class="menu8">
	<li class="menu8_1 active"><a onclick="showleft('menu8_1','Config/SiteInfo.aspx')"><%:lang.LF("网站配置") %></a></li>
	<li class="menu8_2"><a onclick="showleft('menu8_2','Content/ModelManage.aspx?ModelType=1')"><%:lang.LF("模型管理") %></a></li>
	<li class="menu8_3"><a onclick="showleft('menu8_3','Content/NodeManage.aspx')"><%:lang.LF("节点管理") %></a></li>
	<li class="menu8_4"><a onclick="showleft('menu8_4','Content/FlowManager.aspx')"><%:lang.LF("流程管理") %></a></li>
	<li class="menu8_5"><a onclick="showleft('menu8_5','Content/SpecialManage.aspx')"><%:lang.LF("专题管理") %></a></li>
	<li class="menu8_6"><a onclick="ShowMain('LabelGuide.ascx','Template/TemplateSet.aspx')"><%:lang.LF("模板风格") %></a></li>
	<li class="menu8_7"><a onclick="ShowMain('LabelGuide.ascx','Template/LabelManage.aspx')"><%:lang.LF("标签管理") %></a></li>
	<li class="menu8_8"><a onclick="showleft('menu8_8','Pay/PayPlatManage.aspx')">在线支付</a></li>
    <li class="menu9_8"><a onclick="showleft('menu9_8','Plus/LogManage.aspx?LogType=4')"><%:lang.LF("日志管理") %></a></li>
</ul>
<ul class="menu9">
	<li class="menu9_1 active"><a onclick="showleft('menu9_1','WorkFlow/OAConfig.aspx')"><%:lang.LF("OA办公") %></a></li>
	<li class="menu9_2"><a onclick="ShowMain('StructTree.ascx','AddOn/StructList.aspx')"><%:lang.LF("组织结构") %></a></li>
    <li class="menu9_9"><a onclick="showleft('menu9_9','Plat/PlatInfoManage.aspx')"><%:lang.LF("能力中心") %></a></li>
	<li class="menu9_3"><a onclick="showleft('menu9_3','AddOn/Projects.aspx')"><%:lang.LF("项目管理") %></a></li>
	<li class="menu9_4"><a onclick="showleft('menu9_4','AddCRM/CustomerList.aspx?usertype=0')"><%:lang.LF("CRM管理") %></a></li>
	<li class="menu9_5"><a onclick="showleft('menu9_5','iServer/BiServer.aspx?num=-3')"><%:lang.LF("有问必答") %></a></li>
    <li class="menu9_11"><a onclick="showleft('menu9_11','Content/ECharts/AddChart.aspx')">智慧图表</a></li>
    <li class="menu9_10"><a onclick="ShowMain('SenTree.ascx','Sentiment/Default.aspx')">舆情监测</a></li>
	<li class="menu9_6"><a onclick="showleft('menu9_6','User/ServiceSeat.aspx')"><%:lang.LF("客服通") %></a></li>
    <li class="menu9_7"><a onclick="showleft('menu9_7','Workload/WorkCount.aspx')"><%:lang.LF("工作统计") %></a></li>
	
</ul>
<ul class="menu10">
	<li class="menu10_1 active"><a onclick="showleft('menu10_1','WeiXin/home.aspx')"><%:lang.LF("移动应用") %></a></li>
	<li class="menu10_2"><a onclick="showleft('menu10_2','WeiXin/home.aspx')"><%:lang.LF("微信应用") %></a></li> 
    <li class="menu10_5"><a onclick="showleft('menu10_5','WeiXin/EditWxMenu.aspx')"><%:lang.LF("菜单配置") %></a></li>
    <li class="menu10_6"><a onclick="showleft('menu10_1','/Tools/Mobile.aspx')"><%:lang.LF("移动浏览器") %></a></li>
</ul>
<ul class="menu11">
	<li class="menu11_1 active"><a onclick="showleft('menu11_1','Site/SiteConfig.aspx')">全局配置</a></li>
	<li class="menu11_2"><a onclick="showleft('menu11_1','Site/ServerClusterConfig.aspx')">服务器集群</a></li>
    <li class="menu11_3"><a onclick="showleft('menu11_1','Site/DBManage.aspx')">数据库管理</a></li>
    <li class="menu11_4"><a onclick="showleft('menu11_1','Site/Default.aspx')">站点列表</a></li>
    <li class="menu11_5"><a onclick="showleft('menu11_1','Site/SitePool.aspx')">应用程序池</a></li>
    <li class="menu11_6"><a onclick="showleft('menu11_1','Template/CloudLead.aspx')">模板云台</a></li>
    <li class="menu11_7"><a onclick="showleft('menu11_1','Site/SiteCloudSetup.aspx')">快云安装</a></li>
    <li class="menu11_8"><a onclick="showleft('menu11_1','Site/SiteDataCenter.aspx')">智能采集</a></li>
    <li class="menu11_9"><a onclick="showleft('menu11_2','Site/DomName.aspx')">域名注册</a></li>
</ul>
</div>
</div>
<div class="m_main">
<div class="padding0 col-lg-2 col-md-2 col-sm-2 col-xs-2 main_left border_right hidden-xs" style="height:100%;" id="left">
<div id="left_ul_div">
	<div id="menu1" class="unstyled m_left_ul open">
        <ul id="menu1_1" class="m_left_ulin open">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>工作台 </li>
            <li id="menu1_1_0"><a href="javascript:;" data-url="Content/ContentManage.aspx"><%:lang.LF("内容管理") %></a></li>
            <li id="menu1_1_1"><a href="javascript:;" data-url="Shop/ProductManage.aspx"><%:lang.LF("商品管理") %></a></li>
            <li id="menu1_1_2"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%:lang.LF("订单管理")%></a></li>
            <li id="menu1_1_3"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=1"><%:lang.LF("模型管理") %></a></li>
            <li id="menu1_1_4"><a href="javascript:;" data-url="Content/NodeManage.aspx"><%:lang.LF("节点管理") %></a></li>
            <li id="menu1_1_5"><a href="javascript:;" data-url="Template/TemplateManage.aspx"><%:lang.LF("模版管理") %></a></li>
            <li id="menu1_1_6"><a href="javascript:;" data-url="Template/LabelManage.aspx"><%:lang.LF("标签管理") %></a></li>
            <li id="menu1_1_7"><a href="javascript:;" data-url="User/UserManage.aspx"><%:lang.LF("会员管理") %></a></li>
            <li id="menu1_1_8"><a href="javascript:;" data-url="Content/CreateHtmlContent.aspx"><%:lang.LF("生成发布") %></a></li>
            <li id="menu1_1_9"><a href="javascript:;" data-url="Config/SiteOption.aspx"><%:lang.LF("网站配置") %></a></li>
        </ul>
		<ul id="menu1_2" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span> 便捷导航 </li>
            <li>
                <div class="input-group">
                    <input type="text" id="searchkeyword" class="form-control" onkeydown="return ASCX.OnEnterSearch('Guest/AllSearch.aspx?keyWord=',this);" placeholder="导航标题" />
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="ASCX.Search('Config/FuncSearch.aspx?keyWord=','searchkeyword');"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </li>
			<li id="menu1_2_1"><a href="javascript:;" data-url="Config/SearchFunc.aspx"><%:lang.LF("管理导航") %></a></li>
			<li id="menu1_2_2"><a href="javascript:;" data-url="Config/UserFunc.aspx?EliteLevel=1"><%:lang.LF("会员导航") %></a></li>
		</ul>
		<ul id="menu1_3" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span> 修改密码 </li>
			<li id="menu1_3_1"><a href="javascript:;" data-url="Profile/ModifyPassword.aspx"><%:lang.LF("修改密码") %></a></li>
		</ul>
		<ul id="menu1_4" class="m_left_ulin">
			<li id="menu1_4_1"><a href="{$path}/SignOut.aspx"><%:lang.LF("安全退出") %></a></li>
		</ul>
        <%--<div class="toCloud">
        <a href="javascript:;" id="cloud_pic" onclick="ShowMain('','{$path}Template/TemplateSetOfficial.aspx')" title="云端模板免费下载"><img src="/App_Themes/admin/cloud.png" class="center-block img-responsive" alt="云端模板免费下载" /></a>         
        <a href="javascript:;" id="cloud_close" onClick="cloud_close();">&times;</a>
        <div class="clearfix"></div>
        </div>        --%>
	</div>
	<div id="menu2" class="m_left_ul">
			<ul class="list-unstyled m_left_ulin open" id="menu2_1"></ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_2">
			<li id="menu2_2_1"><a href="javascript:ShowMain('','Content/SpecContent.aspx');"><%:lang.LF("网站专题") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_3">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span> 评论管理 </li>
			<li id="menu2_3_1"><a href="javascript:;" data-url="Content/CommentManage.aspx" ><%:lang.LF("评论管理") %></a></li>
			<li id="menu2_3_2"><a href="javascript:;" data-url="Content/SohuChatManage.aspx" ><%:lang.LF("畅言评论管理") %></a></li>
			<li id="menu2_3_3"><a href="javascript:;" data-url="Content/SohuChatManage.aspx?show=2" ><%:lang.LF("畅言评论配置") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_4">
			<li class="menu_tit"> <span class="glyphicon glyphicon-globe"></span>互动模块</li>
			<li id="menu2_4_2"><a href="javascript:;" data-url="Pub/PubManage.aspx" >互动模块</a></li>
            <li id="menu2_4_1"><a href="javascript:;" data-url="Pub/FormManage.aspx">互动表单</a></li>
			<li id="menu2_4_3"><a href="javascript:;" data-url="Pub/PubManage.aspx" >互动信息</a></li>
			<li id="menu2_4_4"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=7">互动模型</a></li>
			<li id="menu2_4_5"><a href="javascript:;" data-url="Pub/PubRecycler.aspx">互动存档</a></li>
            <li id="menu2_4_6"><a href="javascript:;" data-url="Pub/PubExcel.aspx">Excel导出</a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>采集检索</li>
			<li id="menu2_5_1"><a href="javascript:;" data-url="Content/CollectionManage.aspx"><%:lang.LF("采集项目") %></a></li>
			<li id="menu2_5_3"><a href="javascript:;" data-url="Content/CollectionStart.aspx"><%:lang.LF("开始采集") %></a></li>
			<li id="menu2_5_4"><a href="javascript:;" data-url="Content/CollectionStatus.aspx"><%:lang.LF("采集进度") %></a></li>
			<li id="menu2_5_5"><a href="javascript:;" data-url="Content/CollectionList.aspx"><%:lang.LF("采集记录") %></a></li>
            <li id="menu2_5_6"><a href="javascript:;" data-url="Content/CollSite.aspx"><%:lang.LF("统一检索") %></a></li>
            <li id="menu2_5_7"><a href="javascript:;" data-url="Content/InfoLog.aspx"><%:lang.LF("检索动态") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>视频管理</li>
			<li id="menu2_6_2"><a href="javascript:;"  data-url="Content/Video/VideoList.aspx"><%:lang.LF("视频列表") %></a></li>
            <li id="menu2_6_3"><a href="javascript:;"  data-url="Content/Video/VideoConfig.aspx">视频配置</a></li>
            <li id="menu2_6_4"><a href="javascript:;"  data-url="Content/Video/VideoPath.aspx">视频路径</a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_7">
			<li class="menu_tit"> <span class="glyphicon glyphicon-globe"></span>生成发布</li>
			<li id="menu2_7_1"><a href="javascript:;" data-url="Content/CreateHtmlContent.aspx"><%:lang.LF("生成发布") %></a></li>
			<li id="menu2_7_3"><a href="javascript:;" data-url="Content/ListHtmlContent.aspx"><%:lang.LF("生成管理") %></a></li>
			<li id="menu2_7_4"><a href="javascript:;" data-url="Content/SiteMap.aspx"><%:lang.LF("站点地图") %></a></li>
			<li id="menu2_7_5"><a href="javascript:;" data-url="Content/ManageJsContent.aspx"><%:lang.LF("JS生成管理") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_8">
			<li id="menu2_8_1"><a href="javascript:;" data-url="Content/ContentRecycle.aspx"><%:lang.LF("节点栏目导航") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_9">
		    <li class="bg-primary"><span class="glyphicon glyphicon-globe"></span>百科问答</li>		
            <li> 
            <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>论坛留言</p>
            <ul class="list-unstyled">
            <li id="menu2_9_6"><a href="javascript:;" data-url="Guest/GuestCateMana.aspx?Type=1"><%:lang.LF("贴吧版面") %></a></li>
			<li id="menu2_9_1"><a href="javascript:;" data-url="Guest/GuestManage.aspx"><%:lang.LF("留言分类") %></a></li>
            </ul>
            </li> 		
            
            <li>
            <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>问答管理</p>
            <ul class="list-unstyled">
            <li id="menu2_9_4"><a href="javascript:;" data-url="Guest/WdCheck.aspx"><%:lang.LF("问答管理") %></a></li>
            <li id="menu2_9_5"><a href="javascript:;" data-url="AddOn/GradeOption.aspx?CateID=2"><%:lang.LF("问答分类") %></a></li>
            <li id="menu2_9_7"><a href="javascript:;" data-url="Guest/WDConfig.aspx"><%:lang.LF("问答配置") %></a></li>
            </ul> 
            </li> 
			<li>
            <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>百科管理</p>
            <ul class="list-unstyled">           
		    <li id="menu2_9_2"><a href="javascript:;" data-url="Guest/BkCheck.aspx"><%:lang.LF("百科词条") %></a></li>
		    <li id="menu2_9_3"><a href="javascript:;" data-url="AddOn/GradeOption.aspx?CateID=3"><%:lang.LF("百科分类") %></a></li> 
			<li id="menu2_9_8"><a href="javascript:;" data-url="Guest/BKConfig.aspx"><%:lang.LF("百科设置") %></a></li>
            </ul>
            </li>
			<li>
                <div class="input-group">
                    <input type="text" id="tiekeyword" class="form-control" onkeydown="return ASCX.OnEnterSearch('Guest/AllSearch.aspx?keyWord=',this);" placeholder="贴吧,百科,留言标题" />
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="ASCX.Search('Guest/AllSearch.aspx?keyWord=','tiekeyword');"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_10">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>内容参数</li>
			<li id="menu2_10_1"><a href="javascript:;" data-url="AddOn/SourceManage.aspx"><%:lang.LF("来源管理") %></a></li>
			<li id="menu2_10_2"><a href="javascript:;" data-url="AddOn/AuthorManage.aspx"><%:lang.LF("作者管理") %></a></li>
			<li id="menu2_10_3"><a href="javascript:;" data-url="AddOn/KeyWordManage.aspx"><%:lang.LF("关键字集") %></a></li>
			<li id="menu2_10_4"><a href="javascript:;" data-url="AddOn/CorrectManage.aspx"><%:lang.LF("纠错管理") %></a></li>
		</ul>
	</div>
	<div id="menu3" class="m_left_ul">
		<ul class="list-unstyled m_left_ulin open" id="menu3_1">
		</ul>
		<ul id="menu3_2" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>库存管理</li>
			<li id="menu3_2_1"><a href="javascript:;" data-url="Shop/StockManage.aspx"><%:lang.LF("库存管理") %></a></li>
			<li id="menu3_2_2"><a href="javascript:;" data-url="Shop/Stock.aspx"><%:lang.LF("入库出库") %></a></li>
		</ul>
		<ul id="menu3_3" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>订单管理</li>
			<li id="menu3_3_1"><a href="javascript:;" data-url="Shop/CartManage.aspx"><%:lang.LF("购物车记录") %></a></li>
			<li id="menu3_3_2"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%:lang.LF("商城订单") %></a></li>
			<li id="menu3_3_3"><a href="javascript:;" data-url="Shop/OrderList.aspx?IsStore=true"><%:lang.LF("店铺订单") %></a></li>
            <li id="menu3_3_17"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=10"><%:lang.LF("代购订单") %></a></li>
			<li id="menu3_3_5"><a href="javascript:;" data-url="Shop/OrderSql.aspx"><%:lang.LF("账单管理") %></a></li>
			<li id="menu3_3_6"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=1"><%:lang.LF("酒店订单") %></a></li>
			<li id="menu3_3_7"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=2"><%:lang.LF("机票订单") %></a></li>
			<li id="menu3_3_8"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=3"><%:lang.LF("旅游订单") %></a></li>
			<li id="menu3_3_9"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=5"><%:lang.LF("域名订单") %></a></li>
			<li id="menu3_3_10"><a href="javascript:;" data-url="Shop/OtherOrder/IDCOrder.aspx?OrderType=7"><%:lang.LF("IDC订单") %></a></li>
            <li id="menu3_3_18"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=9">IDC续费</a></li>
            <li id="menu3_3_4"><a href="javascript:;" data-url="Shop/OrderList.aspx?orderstatus=-1"><%:lang.LF("退款订单") %></a></li>
            <li id="menu3_3_19"><a href="javascript:;" data-url="Shop/OrderRepairAudit.aspx"><%:lang.LF("返修退货申请") %></a></li>

			<li id="menu3_3_11"><a href="javascript:;" data-url="Shop/FillOrder.aspx"><%:lang.LF("补订单") %></a></li>
			<li id="menu3_3_12"><a href="javascript:;" data-url="Shop/LocationReport.aspx"><%:lang.LF("省市报表") %></a></li>
			<li id="menu3_3_13"><a href="javascript:;" data-url="Shop/MonthlyReport.aspx"><%:lang.LF("月报表") %></a></li>
			<li id="menu3_3_15"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=0">订单模型</a></li>
            <li id="menu3_3_16"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=1">购物车模型</a></li>
		</ul>
		<ul id="menu3_4" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>明细记录</li>
			<li id="menu3_4_1"><a href="javascript:;" data-url="Shop/BankRollList.aspx"><%:lang.LF("资金明细") %></a></li>
			<li id="menu3_4_2"><a href="javascript:;" data-url="Shop/SaleList.aspx"><%:lang.LF("销售明细") %></a></li>
			<li id="menu3_4_3"><a href="javascript:;" data-url="Shop/PayList.aspx"><%:lang.LF("支付明细") %></a></li>
			<li id="menu3_4_4"><a href="javascript:;" data-url="Shop/InvoiceList.aspx"><%:lang.LF("发票明细") %></a></li>
			<li id="menu3_4_5"><a href="javascript:;" data-url="Shop/DeliverList.aspx"><%:lang.LF("退货明细") %></a></li>
		</ul>
		<ul id="menu3_5" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>销售统计</li>
			<li id="menu3_5_1"><a href="javascript:;" data-url="Shop/TotalSale.aspx">总体销售</a></li>
			<li id="menu3_5_2"><a href="javascript:;" data-url="Shop/ProductSale.aspx">商品销售</a></li>
			<li id="menu3_5_3"><a href="javascript:;" data-url="Shop/CategotySale.aspx">类别销售</a></li>
			<li id="menu3_5_4"><a href="javascript:;" data-url="Shop/UserOrders.aspx">订单排名</a></li>
			<li id="menu3_5_5"><a href="javascript:;" data-url="Shop/UserExpenditure.aspx">购物排名</a></li>
		</ul>
		<ul id="menu3_6" class="m_left_ulin">
			<li class="menu_tit"> <span class="glyphicon glyphicon-globe"></span>促销优惠</li>
			<li id="menu3_6_1"><a href="javascript:;" data-url="Shop/PresentProject.aspx"><%:lang.LF("促销方案管理") %></a></li>
			<li id="menu3_6_2"><a href="javascript:;" data-url="Shop/AddPresentProject.aspx"><%:lang.LF("添加促销方案") %></a></li>
			<li id="menu3_6_3"><a href="javascript:;" data-url="Shop/AgioProject.aspx"><%:lang.LF("打折方案管理") %></a></li>
			<li id="menu3_6_5"><a href="javascript:;" data-url="Shop/Arrive/ArriveManage.aspx"><%:lang.LF("优惠券管理") %></a></li>
			<li id="menu3_6_6"><a href="javascript:;" data-url="Shop/Arrive/AddArrive.aspx?menu=add"><%:lang.LF("新增优惠券") %></a></li>
		</ul>
		<ul id="menu3_7" class="m_left_ulin">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>商城配置</li>
			<li id="menu3_7_1"><a href="javascript:;" data-url="Shop/DeliverType.aspx">运费模板</a></li>
	<%--		<li id="menu3_7_2"><a href="javascript:;" data-url="Shop/FreePost.aspx"><%:lang.LF("免邮设置") %></a></li>--%>
			<li id="menu3_7_3"><a href="javascript:;" data-url="Shop/ProducerManage.aspx"><%:lang.LF("厂商管理") %></a></li>
			<li id="menu3_7_4"><a href="javascript:;" data-url="Shop/TrademarkManage.aspx"><%:lang.LF("品牌管理") %></a></li>
			<li id="menu3_7_5"><a href="javascript:;" data-url="Shop/CardManage.aspx"><%:lang.LF("VIP卡管理") %></a></li>
			<li id="menu3_7_6"><a href="javascript:;" data-url="Shop/CashManage.aspx"><%:lang.LF("VIP卡提现") %></a></li>
			<li id="menu3_7_7"><a href="javascript:;" data-url="Shop/ProductCashManage.aspx"><%:lang.LF("厂商提现") %></a></li>
			<li id="menu3_7_9"><a href="javascript:;" data-url="Shop/MoneyManage.aspx"><%:lang.LF("货币管理") %></a></li>
			<li id="menu3_7_10"><a href="javascript:;" data-url="Shop/InvtoManage.aspx"><%:lang.LF("发票计算") %></a></li>
		</ul>
		<ul id="menu3_8" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>加盟商管理</li>
			<li id="menu3_8_1"><a href="javascript:;" data-url="boss/Bosstree.aspx"><%:lang.LF("添加加盟商") %></a></li>
		</ul>
		<ul id="menu3_9" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>商品回收站</li>
			<li id="menu3_9_1"><a href="javascript:;" data-url="Shop/ShopRecycler.aspx"><%:lang.LF("商品回收站") %></a></li>
		</ul>
		<ul id="menu3_10" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>礼品管理</li>
			<li id="menu3_10_1"><a href="javascript:;" data-url="Flex/productManage.aspx"><%:lang.LF("产品管理") %></a></li>
			<li id="menu3_10_2"><a href="javascript:;" data-url="Flex/Addproduct.aspx"><%:lang.LF("添加产品") %></a></li>
			<li id="menu3_10_3"><a href="javascript:;" data-url="Flex/ClassManage.aspx"><%:lang.LF("模板分类管理") %></a></li>
			<li id="menu3_10_4"><a href="javascript:;" data-url="Flex/Addclass.aspx"><%:lang.LF("添加模板分类") %></a></li>
			<li id="menu3_10_5"><a href="javascript:;" data-url="Flex/FlexTemplate.aspx"><%:lang.LF("Flex礼品管理") %></a></li>
			<li id="menu3_10_6"><a href="javascript:;" data-url="Flex/AddTemplate.aspx"><%:lang.LF("添加Flex礼品") %></a></li>
			<li id="menu3_10_7"><a href="javascript:;" data-url="Flex/FlexItemManage.aspx"><%:lang.LF("礼品页面管理") %></a></li>
			<li id="menu3_10_8"><a href="javascript:;" data-url="Flex/AddItempage.aspx"><%:lang.LF("添加礼品页面") %></a></li>
		</ul>
		<ul id="menu3_12" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>推广返利</li>
			<li id="menu3_12_1"><a href="javascript:;" data-url="Shop/profile/StatisticsBriefing.aspx"><%:lang.LF("统计简报") %></a></li>
			<li id="menu3_12_2"><a href="javascript:;" data-url="Shop/profile/config.aspx"><%:lang.LF("推广设置") %></a></li>
			<li id="menu3_12_3"><a href="javascript:;" data-url="Shop/profile/LmUserManage.aspx"><%:lang.LF("联盟会员") %></a></li>
            <li id="menu3_12_4"><a href="javascript:;" data-url="User/DepositManage.aspx">用户提现</a></li>
            <li id="menu3_12_5"><a href="javascript:;" data-url="Boss/UserBonus.aspx">会员分红</a></li>
            <li id="menu3_12_6"><a href="javascript:;" data-url="Boss/PromoBonus.aspx">推广佣金</a></li>
            <li id="menu3_12_7"><a href="javascript:;" data-url="User/UnitMain.aspx">管理奖</a></li>
            <li id="menu3_12_8"><a href="javascript:;" data-url="Shop/PVManager.aspx">订单提成</a></li>
<%--			<li id="menu3_12_4"><a href="javascript:;" data-url="Shop/profile/LmUserListTree.aspx"><%:lang.LF("联盟会员树状图") %></a></li>--%>
		</ul>
		<ul id="menu3_13" class="m_left_ulin">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>店铺管理</li>
			<li id="menu3_13_1"><a href="javascript:;" data-url="UserShopManage/StoreManage.aspx">店铺审核</a></li>
			<li id="menu3_13_2"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=6"><%:lang.LF("申请模型管理") %></a></li>
			<li id="menu3_13_3"><a href="javascript:;" data-url="UserShopManage/StoreStyleManage.aspx"><%:lang.LF("店铺模板管理") %></a></li>
			<li id="menu3_13_4"><a href="javascript:ShowMain('UserShopNodeTree.ascx','Shop/ProductManage.aspx?StoreID=-1',this);">店铺商品管理</a></li>
			<li id="menu3_13_6"><a href="javascript:;" data-url="UserShopManage/ShopinfoManage.aspx"><%:lang.LF("店铺信息配置") %></a></li> 
			<li id="menu3_13_8"><a href="javascript:;" data-url="UserShopManage/ShopSearchKey.aspx"><%:lang.LF("搜索管理") %></a></li>
			<li id="menu3_13_9"><a href="javascript:;" data-url="UserShopManage/ShopRemark.aspx"><%:lang.LF("评论管理") %></a></li>
			<li id="menu3_13_10"><a href="javascript:;" data-url="UserShopManage/ShopScutcheon.aspx"><%:lang.LF("品牌管理") %></a></li>
			<li id="menu3_13_11"><a href="javascript:;" data-url="UserShopManage/ShopGrade.aspx"><%:lang.LF("等级管理") %></a></li>
			<li id="menu3_13_12"><a href="javascript:;" data-url="UserShopManage/ProducerManage.aspx"><%:lang.LF("厂商管理") %></a></li>			 
			<li id="menu3_13_15"><a href="javascript:;" data-url="UserShopManage/ShopMailConfig.aspx"><%:lang.LF("店铺邮件设置") %></a></li>
		</ul>
			<ul id="menu3_14" class="m_left_ulin">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>3D店铺管理</li>
			<li id="menu3_14_1"><a href="javascript:;" data-url="/3D/3DManage.aspx"><%:lang.LF("3D店铺管理") %></a></li>
			<li id="menu3_14_2"><a href="javascript:;" data-url="/3D/AddShop.aspx"><%:lang.LF("添加店铺") %></a></li>
		</ul>
	</div>
	<div id="menu4" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu4_1">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页申请</li>
			<li id="menu4_1_1"><a href="javascript:;" data-url="Page/UserModelManage.aspx"><%:lang.LF("申请模型管理") %></a></li>
			<li id="menu4_1_2"><a href="javascript:;" data-url="Page/UserModel.aspx"><%:lang.LF("添加申请模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_2">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页审核</li>
			<li id="menu4_2_1"><a href="javascript:;" data-url="page/PageManage.aspx"><%:lang.LF("黄页审核") %></a></li>
         	<li id="menu4_2_3"><a href="javascript:;" data-url="Page/PageStyle.aspx">黄页样式</a></li>
			<li id="menu4_2_4"><a href="javascript:;" data-url="Page/AddPageStyle.aspx">添加样式</a></li>
            <li id="menu4_2_5"><a href="javascript:;" data-url="Page/PageConfig.aspx">黄页配置</a></li>
		</ul>
		<%--<ul class="m_left_ulin" id="menu4_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页用户栏目管理</li>
			<li id="menu4_3_1"><a href="javascript:;" data-url="page/PageAudit.aspx"><%:lang.LF("黄页用户栏目管理") %></a></li>
		</ul>--%>
		<ul class="m_left_ulin" id="menu4_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页内容管理</li>
			<li id="menu4_4_1"><a href="javascript:;" data-url="page/PageContent.aspx"><%:lang.LF("黄页内容") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页模型管理</li>
			<li id="menu4_5_1"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=4"><%:lang.LF("黄页模型管理") %></a></li>
			<li id="menu4_5_2"><a href="javascript:;" data-url="Page/AddPageModel.aspx"><%:lang.LF("添加黄页模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页样式管理</li>
			<li id="menu4_6_1"><a href="javascript:;" data-url="Page/PageStyle.aspx"><%:lang.LF("黄页样式管理") %></a></li>
			<li id="menu4_6_2"><a href="javascript:;" data-url="Page/AddPageStyle.aspx"><%:lang.LF("添加黄页样式") %></a></li>
		</ul>
	</div>
	<div id="menu5" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu5_1">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>考试管理</li>
			<li id="menu5_1_2"><a href="javascript:;" data-url="Exam/CoureseManage.aspx"><%:lang.LF("课程管理") %></a></li>
			<li id="menu5_1_4"><a href="javascript:;" data-url="Exam/Question_Class_Manage.aspx"><%:lang.LF("分类管理") %></a></li>
			<li id="menu5_1_5"><a href="javascript:;" data-url="Exam/ExamPointManage.aspx"><%:lang.LF("考点管理") %> </a></li>
	<%--		<li id="menu5_1_6"><a href="javascript:;" data-url="Exam/QuestionTypeManage.aspx"><%:lang.LF("题型管理") %></a></li>--%>
		</ul>
		<ul class="m_left_ulin" id="menu5_2">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>阅卷中心</li>
			<li id="menu5_2_1"><a href="javascript:;" data-url="Exam/ToScore.aspx"><%:lang.LF("评阅试卷") %></a></li>
	<%--		<li id="menu5_2_2"><a href="javascript:;" data-url="Exam/ScoreStatics.aspx"><%:lang.LF("成绩统计") %></a> </li>--%>
		</ul>
		<ul class="m_left_ulin" id="menu5_3">
		     <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>排课管理</li>
			<li id="menu5_3_1"><a href="javascript:;" data-url="Exam/ClassManage.aspx"><%:lang.LF("班级管理") %></a></li>
			<li id="menu5_3_3"><a href="javascript:;" data-url="Exam/InsertClass.aspx"><%:lang.LF("班级类别") %></a></li>
            <li id="menu5_3_4"><a href="javascript:;" data-url="Exam/ExTeacherManage.aspx"><%:lang.LF("教师管理") %></a></li>
            <li id="menu5_3_5"><a href="javascript:;" data-url="Exam/SubjectManage.aspx"><%:lang.LF("学科管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>学员管理</li>
			<li id="menu5_4_2"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=0"><%:lang.LF("学员管理") %></a></li>
			<li id="menu5_4_3"><a href="javascript:;" data-url="iServer/BselectiServer.aspx?num=-3&strTitle="><%:lang.LF("有问必答") %></a></li>
			<li id="menu5_4_4"><a href="javascript:;" data-url="User/Message.aspx"><%:lang.LF("短信通知") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_5">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>培训资源库</li>
			<li id="menu5_5_1"><a href="javascript:;" data-url="Exam/ApplicationManage.aspx"><%:lang.LF("提交学员") %></a></li>
			
		</ul>
		<ul class="m_left_ulin" id="menu5_6">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>财务管理</li>
			<li id="menu5_6_1"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%:lang.LF("所有订单") %></a></li>
			<li id="menu5_6_2"><a href="javascript:;" data-url="Shop/BankRollList.aspx"><%:lang.LF("销售明细") %></a></li>
			<li id="menu5_6_3"><a href="javascript:;" data-url="Shop/InvoiceList.aspx"><%:lang.LF("开发票明细") %></a></li>
			<li id="menu5_6_4"><a href="javascript:;" data-url="Shop/CartManage.aspx"><%:lang.LF("购物车记录") %></a></li>
			<li id="menu5_6_5"><a href="javascript:;" data-url="Shop/PayList.aspx"><%:lang.LF("支付明细") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_7">
				<li>
                    <div class="input-group ">
                        <input type="text" placeholder="试题名" class="form-control" id="question_text" />
                        <span class="input-group-btn">
                        <a href="javascript:;" style="line-height:21px; padding:6px 12px;" data-url="" onclick="$(this).attr('data-url','Exam/QuestionManage.aspx?KeyWord='+$('#question_text').val());" class="btn btn-default"><span style="line-height:21px;" class="glyphicon glyphicon-search"></span></a>
                        </span>
                    </div>
				</li>
			<li id="menu5_7_1"><a href="javascript:;" data-url="Exam/Paper_Class_Manage.aspx">试卷节点</a></li>
			<li id="menu5_7_2"><a href="javascript:;" data-url="Exam/Question_Class_Manage.aspx">试题科目</a></li>
            <li id="menu5_7_3"><a href="javascript:;" data-url="Exam/QuestGrade.aspx?cate=5">难度管理</a></li>
			<li id="menu5_7_4"><a href="javascript:;" data-url="Exam/QuestGrade.aspx?cate=6">年级管理</a></li>
			<li id="menu5_7_5"><a href="javascript:;" data-url="Exam/QuestGrade.aspx?cate=7">教材版本</a></li>
			<%--<li id="menu5_7_6"><a href="javascript:;" data-url="Exam/Papers_User_Manage.aspx"><%:lang.LF("用户试卷管理") %></a></li>--%>
		</ul>
	</div>
	<div id="menu6" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu6_1">

		</ul>
		<ul class="m_left_ulin" id="menu6_2">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>管理员管理</li>
			<li id="menu6_2_1"><a href="javascript:;" data-url="User/AdminManage.aspx"><%:lang.LF("管理员管理") %></a></li>
			<li id="menu6_2_2"><a href="javascript:;" data-url="User/RoleManage.aspx"><%:lang.LF("管理员角色") %></a></li>
            <li id="menu6_2_3"><a href="javascript:;" data-url="User/SetAdminKey.aspx">手机口令器</a></li>
            <li>
                <div class="input-group margintop10">
                    <input type="text" id="keyWordss" class="form-control" placeholder="搜索管理员名称" onkeydown="return ASCX.OnEnterSearch('User/AdminManage.aspx?keyWordss=',this);" />
                    <span class="input-group-btn">
                        <button id="Ok" class="btn btn-default" type="button" onclick="ASCX.Search('User/AdminManage.aspx?keyWordss=','keyWordss');"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </li>
		</ul>
		<ul class="m_left_ulin" id="menu6_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>用户角色</li>
			<li id="menu6_3_1"><a href="javascript:;" data-url="User/PermissionInfo.aspx"><%:lang.LF("角色管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>信息发送</li>
			<li id="menu6_4_1"><a href="javascript:;" data-url="User/MessageSend.aspx"><%:lang.LF("发送短消息") %></a></li>
			<li id="menu6_4_2"><a href="javascript:;" data-url="User/Message.aspx"><%:lang.LF("短消息列表") %></a></li>
			<li id="menu6_4_3"><a href="javascript:;" data-url="User/MobileMsg.aspx"><%:lang.LF("手机信息") %></a></li>
			<li id="menu6_4_4"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("订阅列表") %></a></li>
			<li id="menu6_4_5"><a href="javascript:;" data-url="User/AddMail.aspx"><%:lang.LF("订阅群发") %></a></li>
			<li id="menu6_4_6"><a href="javascript:;" data-url="User/MailIdiographList.aspx"><%:lang.LF("签名管理") %></a></li>
			<li id="menu6_4_7"><a href="javascript:;" data-url="User/MailList.aspx"><%:lang.LF("邮件发送") %></a></li>
			<li id="menu6_4_8"><a href="javascript:;" data-url="User/MailTemplist.aspx"><%:lang.LF("邮件模版") %></a></li>
			<li id="menu6_4_9"><a href="javascript:;" data-url="Mail/Mail.aspx"><%:lang.LF("邮件列表") %></a></li>
			<li id="menu6_4_10"><a href="javascript:;" data-url="Mail/MailMorSend.aspx"><%:lang.LF("邮件群发") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_5">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>订阅中心</li>
			<li id="menu6_5_1"><a href="javascript:;" data-url="User/SubscriptListManage.aspx?menu=all"><%:lang.LF("邮件订阅管理") %></a></li>
			<li id="menu6_5_2"><a href="javascript:;" data-url="User/SubscriptListManage.aspx?menu=audit"><%:lang.LF("邮件订阅审核") %></a></li>
			<li id="menu6_5_3"><a href="javascript:;" data-url="User/EidtMailModel.aspx"><%:lang.LF("邮件模板编辑") %></a></li>
			<li id="menu6_5_4"><a href="javascript:;" data-url="User/RegValidateMail.aspx"><%:lang.LF("邮件内容管理") %></a></li>
			<li id="menu6_5_5"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("发送邮件管理") %></a></li>
			<li id="menu6_5_6"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("邮件列表管理") %></a></li>
			<li id="menu6_5_7"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("邮件发送") %></a></li>
			<li id="menu6_5_8"><a href="javascript:;" data-url="User/MailIdiographList.aspx"><%:lang.LF("签名管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>人才招聘</li>
			<li id="menu6_6_1"><a href="javascript:;" data-url="User/Jobsconfig.aspx">人才模板</a></li>
			<li id="menu6_6_2"><a href="javascript:;" data-url="User/Jobsinfos.aspx?modeid=qiye">招聘企业</a></li>
			<li id="menu6_6_3"><a href="javascript:;" data-url="User/Jobsinfos.aspx?modeid=zhappin">职位信息</a></li>
			<li id="menu6_6_4"><a href="javascript:;" data-url="User/Jobsinfos.aspx?modeid=geren">用户简历</a></li>
			<li id="menu6_6_5"><a href="javascript:;" data-url="User/JobsRecycler.aspx?modeid=qiye">招聘回收站</a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_7">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>SNS社区模块</li>
			<li id="menu6_7_1"><a href="javascript:;" data-url="Zone/ZoneConfig.aspx"><%:lang.LF("空间配置") %></a></li>
			<li id="menu6_7_2"><a href="javascript:;" data-url="Zone/ZoneManage.aspx"><%:lang.LF("空间管理") %></a></li>
			<li id="menu6_7_3"><a href="javascript:;" data-url="Zone/ZoneApplyManage.aspx"><%:lang.LF("审核空间") %></a></li>
			<li id="menu6_7_4"><a href="javascript:;" data-url="Zone/ZoneStyleManage.aspx"><%:lang.LF("模板管理") %></a></li>
			<li id="menu6_7_5"><a href="javascript:;" data-url="Zone/FriendSearchManage.aspx"><%:lang.LF("好友管理") %></a></li>
			<li id="menu6_7_6"><a href="javascript:;" data-url="Shop/ProductManage.aspx"><%:lang.LF("虚拟商品") %></a></li>
			<li id="menu6_7_7"><a href="javascript:;" data-url="Zone/CarManage.aspx"><%:lang.LF("抢车管理") %></a></li>
			<li id="menu6_7_10"><a href="javascript:;" data-url="Zone/UnitConfig.aspx"><%:lang.LF("信息设置") %></a></li>
			<li id="menu6_7_11"><a href="javascript:;" data-url="Zone/SnsSchool.aspx"><%:lang.LF("学校管理") %></a></li>
			<li id="menu6_7_12"><a href="javascript:;" data-url="Zone/SnsClassRoom.aspx"><%:lang.LF("班级管理") %></a></li>
			<li id="menu6_7_8"><a href="javascript:;" data-url="Zone/LargessMoney.aspx"><%:lang.LF("游戏币") %></a></li>
			<li id="menu6_7_9"><a href="javascript:;" data-url="Zone/GSManage.aspx"><%:lang.LF("回收站") %></a></li>
		</ul>
        <ul class="m_left_ulin" id="menu6_8">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>整合接口</li>
           	<li class="menu6_8_1"><a href="javascript:;" data-url="User/UserApi.aspx">整合配置</a></li> 
            <li class="menu6_8_2"><a href="javascript:;" data-url="User/UApiConfig.aspx?step=2">站点拓扑</a></li>
            <li class="menu6_8_0"><a href="javascript:;" data-url="User/SiteManage.aspx">子站管理</a></li>
           	<li class="menu6_8_3"><a href="javascript:;" data-url="APP/Suppliers.aspx">社会登录</a></li>
	        <li class="menu6_8_4"><a href="javascript:;" data-url="APP/Ucenter.aspx">跨站接入1.0</a></li>
            <li class="menu6_8_5"><a href="javascript:;" data-url="APP/WSApi.aspx">跨站接入2.0</a></li>
            <li class="menu6_8_6"><a href="javascript:;" data-url="APP/ConPush.aspx">智农推送</a></li>
            <li class="menu6_8_7"><a href="javascript:;" data-url="APP/JsonPManage.aspx">移动接口</a></li>
        </ul>
	</div>
	<div id="menu7" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu7_1">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>开发中心</li>
			<li id="menu7_1_1"><a href="javascript:;" data-url="Config/CreateTable.aspx">快速智能建表</a></li>
			<li id="menu7_1_2"><a href="javascript:;" data-url="Config/ViewList.aspx">主库视图管理</a></li>
			<li id="menu7_1_3"><a href="javascript:;" data-url="Config/DatalistProfile.aspx"><%:lang.LF("系统全库概况") %></a></li>
			<li id="menu7_1_4"><a href="javascript:;" data-url="Config/BackupRestore.aspx"><%:lang.LF("备份还原数据") %></a></li>
			<li id="menu7_1_5"><a href="javascript:;" data-url="Config/Optimization.aspx"><%:lang.LF("数据索引优化") %></a></li>
			<li id="menu7_1_6"><a href="javascript:;" data-url="Config/DataSearch.aspx"><%:lang.LF("全库数据检索") %></a></li>
			<li id="menu7_1_7"><a href="javascript:;" data-url="Config/RunSql.aspx"><%:lang.LF("执行SQL语句") %></a></li>
			<li id="menu7_1_8"><a href="javascript:;" data-url="Config/DataAssert.aspx"><%:lang.LF("表内容批处理") %></a></li>
			<li id="menu7_1_9"><a href="javascript:;" data-url="Config/EmptyData.aspx"><%:lang.LF("清空测试数据") %></a></li>
			<li id="menu7_1_10"><a href="javascript:;" data-url="Common/SystemFinger.aspx">主机信息总览</a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_2">
				<li class="menu_tit"><%:lang.LF("广告管理") %></li>
			<li id="menu7_2_1"><a href="javascript:;" data-url="Plus/ADZoneManage.aspx"><%:lang.LF("广告版位") %></a></li>
			<li id="menu7_2_2"><a href="javascript:;" data-url="Plus/ADManage.aspx"><%:lang.LF("广告内容") %></a></li>
			<li id="menu7_2_3"><a href="javascript:;" data-url="Plus/ADAdbuy.aspx"><%:lang.LF("推广申请") %></a></li>
			<li id="menu7_2_4"><a href="javascript:;" data-url="Plus/ChartManage.aspx"><%:lang.LF("图表管理") %></a></li>
			<li id="menu7_2_5"><a href="javascript:;" data-url="Panoramic/PanoramicManage.aspx"><%:lang.LF("全景列表") %></a></li>
			<li id="menu7_2_6"><a href="javascript:;" data-url="Panoramic/MusicManage.aspx"><%:lang.LF("全景音乐") %></a></li>
			<li id="menu7_2_7"><a href="javascript:;" data-url="AddOn/Maps.aspx"><%:lang.LF("地图管理") %></a></li>
			<li id="menu7_2_8"><a href="javascript:;" data-url="Magazine/AddMagazine.aspx"><%:lang.LF("电子杂志") %></a></li>
			<li id="menu7_2_9"><a href="javascript:;" data-url="/Plugins/Flex/Default.aspx"><%:lang.LF("在线设计") %></a></li>
			<li id="menu7_2_10"><a href="javascript:;" data-url="Flex/MyMaterial.aspx"><%:lang.LF("素材中心") %></a></li>
			<li id="menu7_2_11"><a href="javascript:;" data-url="Flex/MyWork.aspx"><%:lang.LF("我的作品") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>访问统计</li>
			<li id="menu7_3_8"><a href="javascript:;" data-url="Counter/StatisticalCode.aspx"><%:lang.LF("统计代码") %></a></li>
			<li id="menu7_3_1"><a href="javascript:;" data-url="Counter/Counter.aspx"><%:lang.LF("统计导航") %></a></li>
			<li id="menu7_3_2"><a href="javascript:;" data-url="Counter/Ip.aspx"><%:lang.LF("总访问统计") %></a></li>
			<li id="menu7_3_3"><a href="javascript:;" data-url="Counter/Month.aspx"><%:lang.LF("日访问统计") %></a></li>
			<li id="menu7_3_4"><a href="javascript:;" data-url="Counter/Year.aspx"><%:lang.LF("月访问统计") %></a></li>
			<li id="menu7_3_5"><a href="javascript:;" data-url="Counter/Local.aspx"><%:lang.LF("地区访问统计") %></a></li>
			<li id="menu7_3_6"><a href="javascript:;" data-url="Counter/Browser.aspx"><%:lang.LF("浏览器访问统计") %></a></li>
			<li id="menu7_3_7"><a href="javascript:;" data-url="Counter/Os.aspx"><%:lang.LF("操作系统访问统计") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>问卷调查</li>
			<li id="menu7_4_1"><a href="javascript:;" data-url="Plus/SurveyManage.aspx"><%:lang.LF("问卷调查管理") %></a></li>
			<li id="menu7_4_2"><a href="javascript:;" data-url="Plus/Survey.aspx"><%:lang.LF("添加问卷投票") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>文件管理</li>
			<li id="menu7_5_1"><a href="javascript:;" data-url="File/UploadFile.aspx"><%:lang.LF("本地文件") %></a></li>
			<li id="menu7_5_2"><a href="javascript:;" data-url="File/FtpAll.aspx"><%:lang.LF("云端存储") %></a></li>
			<li id="menu7_5_3"><a href="javascript:;" data-url="File/DownServerManage.aspx"><%:lang.LF("下载服务器") %></a></li>
			<li id="menu7_5_4"><a href="javascript:;" data-url="File/BackupManage.aspx"><%:lang.LF("文件备份") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_6">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>数据字典</li>   
			<li id="menu7_6_1"><a href="javascript:;" data-url="Addon/DictionaryManage.aspx"><%:lang.LF("单级数据字典管理") %></a></li>
			<li id="menu7_6_2"><a href="javascript:;" data-url="Addon/GradeCateManage.aspx"><%:lang.LF("多级数据字典管理") %></a></li>
			<li id="menu7_6_3"><a href="javascript:;" data-url="Config/CitizenXmlConfig.aspx"><%:lang.LF("国籍数据字典管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_7">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>站内链接</li> 
			<li id="menu7_7_1"><a href="javascript:;" data-url="File/Addlinkhttp.aspx"><%:lang.LF("管理链接") %></a></li>
			<li id="menu7_7_2"><a href="javascript:;" data-url="File/tjlink.aspx"><%:lang.LF("添加内链") %></a></li>
		</ul>
        <ul class="m_left_ulin" id="menu7_9">
            <li class="bg-primary"><span class="glyphicon glyphicon-globe"></span>移动与微信</li>
            <li>
                <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>微信应用</p>
                <ul class="list-unstyled">
                    <li id="menu7_9_1"><a href="javascript:;" data-url="WeiXin/WxAppManage.aspx"><%:lang.LF("公众号码") %></a></li>
                    <li id="menu7_9_2"><a href="javascript:;" data-url="WeiXin/SendWx.aspx"><%:lang.LF("消息群发") %></a></li>
                    <li id="menu7_9_3"><a href="javascript:;" data-url="WeiXin/MsgsSend.aspx"><%:lang.LF("图文群发") %></a></li>
                    <li id="menu7_9_9"><a href="javascript:;" data-url="WeiXin/WxMaterial.aspx?type=news"><%:lang.LF("素材中心") %></a></li>
                    <li id="menu7_9_8"><a href="javascript:;" data-url="WeiXin/PayWeiXin.aspx"><%:lang.LF("微信支付") %></a></li>
                </ul>
            </li>
            <li> 
            <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>微信支付</p>
            <ul class="list-unstyled">
            <li id="menu7_9_4"><a href="javascript:;" data-url="WeiXin/QrCodeManage.aspx"><%:lang.LF("二维扫码") %></a></li>
			<li id="menu7_9_5"><a href="javascript:;" data-url="WeiXin/QrCodeDecode.aspx"><%:lang.LF("解码管理") %></a></li>
			<li id="menu7_9_6"><a href="javascript:;" data-url="AddOn/UAgent.aspx"><%:lang.LF("设备接入") %></a></li>
            </ul>
            </li> 		
		</ul>
		<ul class="m_left_ulin" id="menu7_11">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>其他功能</li> 
			<li id="menu7_11_1"><a href="javascript:;" data-url="Iplook/IPManage.aspx"><%:lang.LF("IP分类管理") %></a></li>
			<li id="menu7_11_2"><a href="javascript:;" data-url="Iplook/LookIp.aspx"><%:lang.LF("IP地址管理") %></a></li>
			<li id="menu7_11_3"><a href="javascript:;" data-url="Search/DirectoryManage.aspx"><%:lang.LF("定义全文检索") %></a></li>
			<li id="menu7_11_4"><a href="javascript:;" data-url="Search/SeachDirectory.aspx"><%:lang.LF("全文目录管理") %></a></li>
			<li id="menu7_11_5"><a href="javascript:;" data-url="AddOn/FileseeManage.aspx"><%:lang.LF("比较所有文件") %></a></li>
			<li id="menu7_11_6"><a href="javascript:;" data-url="AddOn/FileSynchronize.aspx"><%:lang.LF("文件同步") %></a></li>
		</ul>
        <ul class="m_left_ulin" id="menu7_12">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>扩展页面</li> 
            <li id="menu7_12_1"><a href="javascript:;" data-url="Template/Code/PageList.aspx">页面管理</a></li>
        </ul>
	</div>
	<div id="menu8" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu8_1">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>网站配置</li> 
			<li id="menu8_1_1"><a href="javascript:;" data-url="Config/SiteInfo.aspx"><%:lang.LF("基本信息") %></a></li>
			<li id="menu8_1_2"><a href="javascript:;" data-url="Config/SiteOption.aspx"><%:lang.LF("进阶信息") %></a></li>
            <li id="menu8_1_10"><a href="javascript:;" data-url="Config/SetOrderStatus.aspx"><%:lang.LF("订单配置") %></a></li>
			<li id="menu8_1_3"><a href="javascript:;" data-url="Config/MobileMsgConfig.aspx"><%:lang.LF("短信配置") %></a></li>
			<li id="menu8_1_4"><a href="javascript:;" data-url="Config/MailConfig.aspx"><%:lang.LF("邮件参数") %></a></li>
			<li id="menu8_1_5"><a href="javascript:;" data-url="Config/ThumbConfig.aspx"><%:lang.LF("水印缩图") %></a></li>
			<li id="menu8_1_6"><a href="javascript:;" data-url="Config/IPLockConfig.aspx"><%:lang.LF("访问限定") %></a></li>
			<li id="menu8_1_7"><a href="javascript:;" data-url="Config/AppConfig.aspx"><%:lang.LF("维护中心") %></a></li>
			<li id="menu8_1_8"><a href="javascript:;" data-url="Config/Sensitivity.aspx"><%:lang.LF("敏感过滤") %></a></li>
			<li id="menu8_1_9"><a href="javascript:;" data-url="Config/CreateMap.aspx"><%:lang.LF("快速索引") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_2">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>模型管理</li> 
			<li id="menu8_2_1"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=1"><%:lang.LF("内容模型") %></a></li>
			<li id="menu8_2_2"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=2"><%:lang.LF("商城模型") %></a></li>
			<li id="menu8_2_3"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=5"><%:lang.LF("店铺模型") %></a></li>
			<li id="menu8_2_4"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=3"><%:lang.LF("用户模型") %></a></li>
			<li id="menu8_2_5"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=4"><%:lang.LF("黄页模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_3">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>节点管理</li> 
			<li id="menu8_3_1"><a href="javascript:;" data-url="Content/NodeManage.aspx"><%:lang.LF("节点管理") %></a></li>
			<li id="menu8_3_2"><a href="javascript:;" data-url="Content/BatchNode.aspx"><%:lang.LF("批量设置") %></a></li>
			<li id="menu8_3_3"><a href="javascript:;" data-url="Content/UnionNode.aspx"><%:lang.LF("合并迁移") %></a></li>
            <li id="menu8_3_4"><a href="javascript:;" data-url="Config/RouteConfig.aspx">站点路由</a></li>
			<li id="menu8_3_6"><a href="javascript:;" data-url="Content/Addon/SToS.aspx">站站迁移</a></li>
            <li id="menu8_3_5" class="input-group">
                <div class="input-group margintop10">
                    <input type="text" id="NodeSkey_t" class="form-control" placeholder="节点ID或名称" onkeydown="return ASCX.OnEnterSearch('Content/NodeSearch.aspx?NodeID=',this);" />
                    <span class="input-group-btn">
                        <button id="NodeBtn" class="btn btn-default" type="button" onclick="ASCX.Search('Content/NodeSearch.aspx?NodeID=','NodeSkey_t');"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </li>
		</ul>
		<ul class="m_left_ulin" id="menu8_4">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>流程管理</li> 
			<li id="menu8_4_1"><a href="javascript:;" data-url="Content/FlowManager.aspx"><%:lang.LF("流程管理") %></a></li>
			<li id="menu8_4_2"><a href="javascript:;" data-url="Content/AuditingState.aspx"><%:lang.LF("状态编码") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_5">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>专题管理</li> 
			<li id="menu8_5_1"><a href="javascript:;" data-url="Content/SpecialManage.aspx"><%:lang.LF("专题类别管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_6">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>模板风格</li> 
			<li id="menu8_6_1"><a href="javascript:;" data-url="Template/TemplateSet.aspx"><%:lang.LF("方案列表") %></a></li>
			<li id="menu8_6_2"><a href="javascript:;" data-url="Template/TemplateManage.aspx"><%:lang.LF("模板中心") %></a></li>
			<li id="menu8_6_3"><a href="javascript:;" data-url="Template/CSSManage.aspx"><%:lang.LF("风格管理") %></a></li>
			<li id="menu8_6_4"><a href="javascript:;" data-url="Template/TemplateSetOfficial.aspx"><%:lang.LF("云端下载") %></a></li>
			<li id="menu8_6_5"><a href="javascript:;" data-url="Template/DSManage.aspx"><%:lang.LF("外部数据库源") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_7">
		</ul>
		<ul class="m_left_ulin" id="menu8_8">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>在线支付</li> 
			<li id="menu8_8_1"><a href="javascript:;" data-url="Pay/PayPlatManage.aspx"><%:lang.LF("支付平台管理") %></a></li>
			<li id="menu8_8_2"><a href="javascript:;" data-url="Pay/AlipayBank.aspx">支付宝单网银</a></li>
			<li id="menu8_8_5"><a href="javascript:;" data-url="Pay/Paypalmanage.aspx"><%:lang.LF("paypal国际付") %></a></li>
            <li id="menu8_8_4"><a href="javascript:;" data-url="Pay/PaymentList.aspx"><%:lang.LF("充值信息管理") %></a></li>
            <li id="menu8_8_6"><a href="javascript:;" data-url="WeiXin/PayWeiXin.aspx"><%:lang.LF("微信支付平台") %></a></li>
		</ul>
	</div>
	<div id="menu9" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu9_1">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>OA配置</li> 
			<li id="menu9_1_1"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=12"><%:lang.LF("办公模型") %></a></li>
			<li id="menu9_1_2"><a href="javascript:;" data-url="WorkFlow/Default.aspx"><%:lang.LF("流程管理") %></a></li>
			<li id="menu9_1_3"><a href="javascript:;" data-url="WorkFlow/FlowTypeList.aspx"><%:lang.LF("类型管理") %></a></li>
			<li id="menu9_1_4"><a href="javascript:;" data-url="WorkFlow/MisModelManage.aspx">套红管理</a></li>
			<li id="menu9_1_5"><a href="javascript:;" data-url="WorkFlow/SignManage.aspx">签章管理</a></li>
			<li id="menu9_1_7"><a href="javascript:;" data-url="WorkFlow/OAConfig.aspx"><%:lang.LF("系统配置") %></a></li>
<%--			<li id="menu9_1_8"><a href="javascript:;" data-url="WorkFlow/AffairManage.aspx"><%:lang.LF("公文管理") %></a></li>--%>
            <li id="menu9_1_10"><a href="javascript:;" data-url="WorkFlow/MailManage.aspx">邮箱管理</a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_2">
		<%--	<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>组织结构</li> 
			<li id="menu9_2_1"><a href="javascript:;" data-url="AddOn/StructManage.aspx?type=0"><%:lang.LF("组织结构") %></a></li>
			<li id="menu9_2_2"><a href="javascript:;" data-url="AddOn/StructList.aspx?type=0"><%:lang.LF("配置结构") %></a></li>
			<li id="menu9_2_3"><a href="javascript:;" data-url="AddOn/StructList.aspx?type=1"><%:lang.LF("管理结构") %></a></li>
			<li id="menu9_2_4"><a href="javascript:;" data-url="AddOn/StructAnalysis.aspx"><%:lang.LF("分析结构") %></a></li>--%>
		</ul>
		<ul class="m_left_ulin" id="menu9_3">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>项目管理</li> 
            <li id="menu9_3_4"><a href="javascript:;" data-url="AddOn/ProjectsType.aspx"><%:lang.LF("项目配置") %></a></li>
            <li id="menu9_3_1"><a href="javascript:;" data-url="AddOn/ManageProjects.aspx"><%:lang.LF("项目管理") %></a></li>
            <li id="menu9_3_2"><a href="javascript:;" data-url="AddOn/ProjectRequireList.aspx"><%:lang.LF("需求管理") %></a></li>
            <li id="menu9_3_3"><a href="javascript:;" data-url="AddOn/WorkManage.aspx"><%:lang.LF("流程管理") %></a></li>			
            <li id="menu9_3_5"><a href="javascript:;" data-url="AddOn/ProjectsModelField.aspx"><%:lang.LF("项目模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_4" style="height:700px;overflow:auto;">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>CRM管理</li> 
			<li id="menu9_4_1"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=0"><%:lang.LF("所有客户") %></a></li>
			<li id="menu9_4_2"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=2"><%:lang.LF("企业客户") %></a></li>
			<li id="menu9_4_3"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=1"><%:lang.LF("个人客户") %></a></li>
			<li><a href="javascript:" data-url="AddCRM/AddOption.aspx"><%:lang.LF("添加新选项") %></a></li>     
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Type"><%=lang.LF("投诉记录表")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Type"><%=lang.LF("服务记录表")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Area"><%=lang.LF("客户区域")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Calling" ><%=lang.LF("所属行业")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Value"><%=lang.LF("价值评估")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Credit"><%=lang.LF("信用等级")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Importance"><%=lang.LF("重要程度")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Connection"><%=lang.LF("关系等级")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Group"><%=lang.LF("客户组别")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Source"><%=lang.LF("客户来源")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Phase" ><%=lang.LF("阶段")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Co_Status" ><%=lang.LF("行业地位")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Co_Size"><%=lang.LF("公司规模")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Co_Management" ><%=lang.LF("经营状态")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Type" ><%=lang.LF("服务类型")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Mode" ><%=lang.LF("服务方式")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Urgency" ><%=lang.LF("紧急程度")%></a></li>                    
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Linkman_Income" ><%=lang.LF("月收入")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Linkman_Education"><%=lang.LF("学历")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Type"><%=lang.LF("服务类型")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Mode"><%=lang.LF("服务方式")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_TakeTime"><%=lang.LF("花费时间")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Result"><%=lang.LF("服务结果")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Score"><%=lang.LF("客户评价")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Time"><%=lang.LF("期限")%></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>有问必答</li> 
			<li id="menu9_5_1"><a href="javascript:;" data-url="iServer/BiServer.aspx?num=-3"><%=lang.LF("有问必答")%></a></li>
			<li id="menu9_5_2"><a href="javascript:;" data-url="iServer/BselectiServer.aspx?num=-3"><%=lang.LF("问题列表")%></a></li>
			<li id="menu9_5_3"><a href="javascript:;" data-url="iServer/AddQuestionRecord.aspx"><%=lang.LF("创建问题记录")%></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>客服通</li> 
			<li><a href="javascript:;" data-url="User/ServiceSeat.aspx"><%=lang.LF("客服席位")%></a></li>
            <li><a href="javascript:;" data-url="User/CodeList.aspx">引用管理</a></li>
			<li><a href="javascript:;" data-url="User/ServiceCode.aspx"><%=lang.LF("在线生成")%></a></li>
			<li><a href="javascript:;" data-url="User/MsgEx.aspx"><%=lang.LF("聊天记录")%></a> </li>
			<li><a href="javascript:;" data-url="User/Addon/UAction.aspx"><%=lang.LF("行为跟踪")%></a> </li>

	<%--		<li><a href="javascript:;" data-url="User/UserGroup.aspx"><%=lang.LF("用户组管理")%></a> </li>--%>
		</ul>
		<ul class="m_left_ulin" id="menu9_7">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>工作统计</li> 
            <li id="menu9_7_3"><a href="javascript:;" data-url="Workload/WorkCount.aspx"><%=lang.LF("按时间统计")%></a></li>
			<li id="menu9_7_1"><a href="javascript:;" data-url="Workload/ContentRank.aspx"><%=lang.LF("排行榜")%></a></li>
			<li id="menu9_7_2"><a href="javascript:;" data-url="Workload/Subject.aspx?Type=manager"><%=lang.LF("按管理员统计")%></a></li>
		</ul>
        <ul class="m_left_ulin" id="menu9_8">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>日志管理</li>
            <li id="menu9_8_1"><a href="javascript:;" data-url="Plus/LogManage.aspx?LogType=4">管理登录</a></li>
            <li id="menu9_8_2"><a href="javascript:;" data-url="Plus/LogManage.aspx?LogType=0">内容管理</a></li>
            <li id="menu9_8_3"><a href="javascript:;" data-url="Plus/TxtLog.aspx?LogType=safe">安全日志</a></li>
            <li id="menu9_8_4"><a href="javascript:;" data-url="Plus/TxtLog.aspx?LogType=fileup">上传日志</a></li>
            <li id="menu9_8_5"><a href="javascript:;" data-url="Plus/TxtLog.aspx?LogType=exception">异常日志</a></li>
            <li id="menu9_8_6"><a href="javascript:;" data-url="Plus/TxtLog.aspx?LogType=labelex">标签异常</a></li>
<%--            <li id="menu9_8_6"><a href="javascript:;" data-url="Plus/TxtLog.aspx?LogType=4">支付日志</a></li>--%>
 <%--           <li id="menu9_8_6"><a href="javascript:;" data-url="Plus/AuditNotes.aspx">审核记录</a></li>--%>
        </ul>
        <ul class="m_left_ulin" id="menu9_9">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>能力中心</li>
            <li id="menu9_9_1"><a href="javascript:;" data-url="Plat/PlatInfoManage.aspx">信息管理</a></li>
            <li id="menu9_9_2"><a href="javascript:;" data-url="Plat/PlatConfig.aspx">全局配置</a></li>
        </ul>
        <ul class="m_left_ulin" id="menu9_11">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>智慧图表</li>
            <li id="menu9_11_1"><a href="javascript:;" data-url="Content/ECharts/AddChart.aspx">创建图表</a></li>
            <li id="menu9_11_2"><a href="javascript:;" data-url="Content/ECharts/Default.aspx">图表列表</a></li>
        </ul>
	</div>
    <div id="menu10" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu10_1">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>移动应用</li>
            <li id="menu10_1_2"><a href="javascript:;" data-url="/APP/Client/Default.aspx?u=Default.aspx&t=网站APP">网站APP</a></li>
            <li id="menu10_1_6"><a href="javascript:;" data-url="/APP/Client/Default.aspx?u=Default.aspx?APKMode=1&t=云打包APP">云打包APP</a></li>
            <li id="menu10_1_1"><a href="javascript:;" data-url="WeiXin/home.aspx"><%:lang.LF("应用列表") %></a></li>
            <li id="menu10_1_3"><a href="http://wei.zoomla.cn/" target="_blank"><%:lang.LF("移动模拟器") %></a></li>
            <li id="menu10_1_4"><a href="javascript:;" data-url="/APP/CL.aspx">APP颁发</a></li>
       <%--     <li id="menu10_1_5"><a href="javascript:;" data-url="/APP/AuthList.aspx">授权审核</a></li>--%>
            <li id="menu10_1_7"><a href="javascript:;" data-url="/APP/Client/Default.aspx?u=Other/AuthAPPly.aspx&t=申请授权&s=1">申请授权</a></li>
            <li id="menu10_1_8"><a href="javascript:;" data-url="App/AppTlpOnline.aspx">我的模板</a></li>
            <li id="menu10_1_9"><a href="javascript:;" data-url="/APP/Client/Default.aspx?u=APPList.aspx&t=我的APP">我的APP</a></li>
        </ul>
        <ul class="m_left_ulin" id="menu10_2"> 
		    <li class="bg-primary"><span class="glyphicon glyphicon-globe"></span>微信应用</li>		
            <li> 
            <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>公众号码</p>
            <ul class="list-unstyled">
            <li id="menu10_2_1"><a href="javascript:;" data-url="WeiXin/WxConfig.aspx"><%:lang.LF("微信配置") %></a></li>
			<li id="menu10_2_2"><a href="javascript:;" data-url="WeiXin/WxAppManage.aspx"><%:lang.LF("公众号码") %></a></li>
            <li id="menu10_2_3"><a href="javascript:;" data-url="WeiXin/SendWx.aspx"><%:lang.LF("消息群发") %></a></li>
            <li id="menu10_2_4"><a href="javascript:;" data-url="WeiXin/MsgsSend.aspx"><%:lang.LF("图文群发") %></a></li>
            <li id="menu10_2_5"><a href="javascript:;" data-url="WeiXin/WxMaterial.aspx?type=news"><%:lang.LF("素材中心") %></a></li>
            </ul>
            </li> 		
            
            <li>
            <p class="bg-info laybtn"><i class="fa fa-arrow-circle-down"></i>微信应用</p>
            <ul class="list-unstyled">
            <li id="menu10_2_6"><a href="javascript:;" data-url="WeiXin/PayWeiXin.aspx"><%:lang.LF("微信支付") %></a></li> 
            <li id="menu10_2_7"><a href="javascript:;" data-url="WeiXin/QrCodeManage.aspx"><%:lang.LF("二维扫码") %></a></li> 
            <li id="menu10_2_8"><a href="javascript:;" data-url="WeiXin/QrCodeDecode.aspx"><%:lang.LF("解码管理") %></a></li>
            <li id="menu10_2_9"><a href="javascript:;" data-url="AddOn/UAgent.aspx"><%:lang.LF("设备接入") %></a></li> 
            </ul> 
            </li>  
        </ul> 
        <ul class="m_left_ulin" id="menu10_5">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>菜单配置</li> 
            <li id="menu10_5_1"><a href="javascript:;" data-url="WeiXin/WelPage.aspx?appid=0"><%:lang.LF("欢迎语") %></a></li> 
            <li id="menu10_5_2"><a href="javascript:;" data-url="WeiXin/ReplyList.aspx?appid=0"><%:lang.LF("自动回复") %></a></li>
            <li id="menu10_5_3"><a href="javascript:;" data-url="WeiXin/EditWxMenu.aspx?appid=0"><%:lang.LF("菜单配置") %></a></li> 
            <li id="menu10_5_4"><a href="javascript:;" data-url="WeiXin/WxUserList.aspx?appid=0"><%:lang.LF("粉丝管理") %></a></li> 
        </ul>
    </div>
    <div id="menu11" class="m_left_ul">
        <ul class="m_left_ulin" id="menu11_1">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>站群管理</li>
            <li id="menu11_1_1"><a href="javascript:;" data-url="Site/SiteConfig.aspx">全局配置</a></li>
            <li id="menu11_1_2"><a href="javascript:;" data-url="Site/ServerClusterConfig.aspx">服务器集群</a></li>
            <li id="menu11_1_3"><a href="javascript:;" data-url="Site/DBManage.aspx">数据库管理</a></li>
            <li id="menu11_1_4"><a href="javascript:;" data-url="Site/Default.aspx">站点列表</a></li>
            <li id="menu11_1_5"><a href="javascript:;" data-url="Site/SitePool.aspx">应用程序池</a></li>
            <li id="menu11_1_6"><a href="javascript:;" data-url="Template/CloudLead.aspx">模板云台</a></li>
            <li id="menu11_1_7"><a href="javascript:;" data-url="Site/SiteCloudSetup.aspx">快云安装</a></li>
            <li id="menu11_1_8"><a href="javascript:;" data-url="Site/SiteDataCenter.aspx">智能采集</a></li>
        </ul>
        <ul class="m_left_ulin" id="menu11_2">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>域名注册</li>
            <li id="menu11_2_1"><a href="javascript:;" data-url="Site/DomPrice.aspx">域名定价</a></li>
            <li id="menu11_2_2"><a href="javascript:;" data-url="Site/DomManage.aspx">域名管理</a></li>
            <li id="menu11_2_3"><a href="javascript:;" data-url="Site/DNSManage.aspx">DNS管理</a></li>
            <%--<li id="menu11_2_4"><a href="javascript:;" data-url="Site/SiteDataCenter.aspx">智能采集</a></li>--%>
            <%--<li id="menu11_2_5"><a href="javascript:;" data-url="Site/ProductManage.aspx">域名定价</a></li>--%>
            <li id="menu11_2_6"><a href="javascript:;" data-url="Site/SiteConfig.aspx?remote=true">全局配置</a></li>
        </ul>
        </div>
</div>
<asp:UpdatePanel ID="LeftPanel" runat="server" EnableViewState="false">
	<ContentTemplate>
		<div runat="server" id="left_Div" style="overflow-y:auto;position:relative;"></div>
		<asp:Button runat="server" ID="leftSwitch_Btn" OnClick="leftSwitch_Btn_Click" Style="display: none;" />
		<asp:HiddenField runat="server" ID="left_Hid" />
	</ContentTemplate>
</asp:UpdatePanel>
<div class="clearfix"></div>
</div>
<div id="leftSwitch" style="cursor:pointer;position:absolute;margin-top:12%;z-index:10;display:none;" class="hidden-xs hidden-sm" onclick="hideleft();">
<img src="/App_Themes/Admin/butClose.gif"/>
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 main_right pull-right" id="right" style="overflow:hidden;">
<div class="m_tabs">
	<table style="height: 100%; width: 100%;">
		<tr style="vertical-align: top">
			<td id="frmRtd" style="text-align: left;">
				<div class="FrameTabs_bg">
					<div class="FrameTab_nav">
						<div id="FrameTabs" style="overflow: hidden; width: 100%;">
							<div class="tab-right"></div>
							<div class="tab-left"></div>
							<div class="tab-strip-wrap">
								<ul class="tab-strip pull-left" id="tab_ul" style="position: fixed;background:#FFF;border-bottom:1px solid #ddd;">
									<li class="current first" id="iFrameTab1"><a href="javascript:"><span id="frameTabTitle">新选项卡</span></a><a class="closeTab" title="关闭"><span class="glyphicon glyphicon-remove"></span></a></li>
									<li class="end" id="newFrameTab"><a title="新选项卡" href="javascript:"><span class="glyphicon glyphicon-plus"></span></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 书签结束 -->
				<div class="thumbnail">
					<div id="main_right_frame">
						<iframe id="main_right" onload="SetTabTitle(this)" style="z-index: 2; background: #fff; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%;" name="main_right" src="Profile/Worktable.aspx" frameborder="0" tabid="1"></iframe>
						<div class="clearfix"></div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
<div id="Meno" style="position: inherit; width: 100%;">
	<div id="iframeGuideTemplate" style="display: none;">
		<iframe style="z-index: 2; visibility: inherit; width: 100%;" src="about:blank" frameborder="0" tabid="0"></iframe>
		<div class="clearfix"></div>
	</div>
	<div id="iframeMainTemplate" style="display: none">
		<iframe style="z-index: 2; visibility: inherit; overflow-x: hidden; width: 100%;" src="about:blank" frameborder="0" scrolling="yes" onload="SetTabTitle(this)" tabid="0"></iframe>
		<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<div style="position: absolute; left: 0px; top: 0px; z-index: 10001; text-align: center;" id="infoDiv"></div><!--锁屏-->
<div style="position: absolute; display: none; left: 0px; top: 0px;height:100%; z-index: 10000; background: #1c6297;" id="tranDiv" class="insbox">
<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; filter: alpha(Opacity=20)" id="tranDivBack"></div></div>
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ascx.js?ver=20150602"></script>
<script type="text/javascript" src="/JS/ICMS/alt.js"></script>
<script type="text/javascript" src="/JS/ICMS/Main.js?ver=20150602"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $("li a[data-url]").click(function () {
            ShowMain('', $(this).attr("data-url"), this);
        });
        $("#tab_ul").sortable
            ({
                //placeholder: "ui-state-highlight",
                containment: 'parent'
            });//dragable end;
    });
    var Path = '<%=CustomerPageAction.customPath2%>';
    window.onresize = setLayout;
    document.body.scroll = "no";
    function setLayout() {
        document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth;
        document.getElementById("main_right").height = document.documentElement.clientHeight - 140;
        //----边栏切换按钮
        if ($(window).width() < 768) {
            $("#leftSwitch").hide();
        }
        else {
            LeftSwitchFunc();
        }
        //----边栏滚动条高度
        $("#left_Div").css("height", $(window).height() - 150 + "px");
    }
    setLayout();
    function IsEnter(obj) {
        if (event.keyCode == 13) {
            SearchPage(); return false;
        }
    }
    //搜索
    function SearchPage() {
        var key = $("#keyText").val();
        if (!key || key == "") return;
        ShowMain('', Path + 'Main.aspx?key=' + key);
    }    
    function closdlg() {
        Dialog.close();
    }
    function DivCache(url) {
        myFrame.AddTabJson(currentFrameTabId, url, $("#left_Div").html());
    }
    $('.popover-dismiss').popover({
        trigger: 'toggle'
    })
    var adDiag = new ZL_Dialog();
    function ShowAD() {
        adDiag.title = "选择工作环境";
        adDiag.url = "Scence.aspx";
        adDiag.maxbtn = false;
        adDiag.height = 675;
        adDiag.ShowModal();
    }
	//关闭云模板提示
	function cloud_close(){
		$(".toCloud").fadeOut();	
	}
	$().ready(function () {
	    $(".laybtn").bind("click", BindLayerUL());
	})
    //小屏下菜单显示 
	$(".mb_nav .navbar-nav li a").click(function (e) { 
	    var snav = $(this).attr("data-label");
	    $(".mb_nav .navbar-nav a").removeClass("active");
	    $(this).addClass("active");
	    $(".sub_nav").slideDown();
	    $(".sub_nav").html("");
	    $(".sub_nav").append($("ul." + snav).html());
	    $(".sub_nav li a").removeAttr("onclick");
	    $(".sub_nav li a").click(function (e) {
	        showThiNav(this);
	    })
	}); 
	function showThiNav(obj) {
	    $(".sub_nav a").removeClass("active");
	    $(obj).addClass("active");
	    var tnav = $(obj).parent().attr("class");
	    $(".thi_nav").slideDown();
	    $(".thi_nav").html("");
	    $(".thi_nav").append($("ul#" + tnav).html());
	    $(".thi_nav li a").click(function (e) {
	        showA(this);
	    })
	}
	function showA(obj) {
	    $(".thi_nav a").removeClass("active");
	    $(obj).addClass("active");
	    $(".mb_nav button").click();
	    $("#main_right").attr("src", $(obj).attr("data-url"));
	} 
</script> 
</form>
</body>
</html>