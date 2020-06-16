 <%@ page language="C#" autoeventwireup="true" inherits="User_Left, App_Web_q5rpj2um" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("功能导航")%></title>
<link href="../../App_Themes/UserThem/user.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../../js/UserDefault.js" type="text/javascript"></script>
</head>
<body class="user_left">  
<div class="left_font" onclick="usershow('#td1','#span1')" >
<span id="span1" class="imgbgover img_icon" onclick=" usershow('#td1','#span1')" ></span>
<%=lang.LF("常规管理")%></div>
<ul id="td1" class="tabtr">
<li><a href="../Content/Default.aspx?t=1"target="main_right"><%=lang.LF("投稿管理")%></a></li>
<li> <a href="<%=CustomerPageAction.customPath.Replace("~","") %>AddOn/ProjectsList.aspx" target="main_right"><%=lang.LF("项目列表")%></a></li>
<li><a href="<%=CustomerPageAction.customPath.Replace("~","") %>AddOn/UserAddProjects.aspx"target="main_right"><%=lang.LF("添加项目")%></a></li>
<li><a href="../../user/iServer/FiServer.aspx"target="main_right" ><%=lang.LF("有问必答")%></a></li>
</ul>

<div class="left_font"  onclick="usershow('#td2','#span2')" >
<span id="span2" class="imgbgout img_icon" onclick=" usershow('#td2','#span2')" ></span> 
<%=lang.LF("人才招聘")%></div>
<ul id="td2" class="tabtr">
<li> <a href="../../Jobs/ExamineeList.aspx" target="main_right"><%=lang.LF("面试通知")%></a></li>
<li><a href="../../CN/nite/Content/PositionManage.aspx"target="main_right"><%=lang.LF("职位管理")%></a></li>
<li><a href="../../CN/nite/Content/ResumeManage.aspx"target="main_right"><%=lang.LF("简历管理")%></a></li>
<li><asp:Literal ID="lt_src" runat="server" Text="视频房间申请"></asp:Literal></li>
<li> <a href="../../CN/nite/Content/CompanyHouseManage.aspx" target="main_right" ><%=lang.LF("视频房间管理")%></a></li>
<li><a href="../../CN/nite/Content/VideoManage.aspx"target="main_right" ><%=lang.LF("企业视频")%></a></li>
<li><a href="MyFavori.aspx"target="main_right" ><%=lang.LF("我的收藏")%></a></li>
</ul>

<div class="left_font" onclick="usershow('#td3','#span3')" >
<span id="span3" class="imgbgout img_icon" onclick="usershow('#td3','#span3')" ></span>
<%=lang.LF("我的互动")%></div>
<ul id="td3" class="tabtr">
<li><a href="../Content/Default.aspx?t=1"target="main_right"><%=lang.LF("我的发表")%></a></li>
<li><a href="../Content/CommentList.aspx" target="main_right"><%=lang.LF("我的评论")%></a></li>
<li><a href="../Message/Message.aspx" target="main_right"><%=lang.LF("收件箱")%></a></li>
</ul>

<div class="left_font" onclick="usershow('#td5','#span5')" >
<span id="span5" class="imgbgout img_icon" onclick="usershow('#td5','#span5')" ></span>
我的问答</div>
<ul id="td5" class="tabtr">
<li><a href="../Guest/MyAsk.aspx"target="main_right">我的提问</a></li>
<li><a href="../Guest/MyAnswer.aspx" target="main_right">我的回答</a></li>
<li><a href="../Guest/AskComment.aspx" target="main_right">我的评论</a></li>
<li><a href="../Guest/MyApproval.aspx" target="main_right">我的赞同</a></li>
</ul>
<div class="left_font" onclick="usershow('#td6','#span6')" >
<span id="span6" class="imgbgout img_icon" onclick="usershow('#td6','#span6')" ></span>
我的百科</div>
<ul id="td6" class="tabtr">
<li><a href="../Guest/BaikeContribution.aspx"target="main_right">词条贡献</a></li>
<li><a href="../Guest/BaikeDraft.aspx" target="main_right">草稿箱</a></li>
<li><a href="../Guest/BaikeFavorite.aspx" target="main_right">百科收藏</a></li>
</ul>
<div class="left_font" onclick="usershow('#td4','#span4')" >
<span id="span4" class="imgbgout img_icon" onclick="usershow('#td4','#span4')" ></span>
<%=lang.LF("威客竞标")%></div>
<ul id="td4" class="tabtr">
<li><a href="../Content/IRelease.aspx"target="main_right"><%=lang.LF("竞标管理")%></a></li>
<li><a href="../Content/MyCommentList.aspx" target="main_right"><%=lang.LF("我参与的")%></a></li>
</ul>
</body>
</html>