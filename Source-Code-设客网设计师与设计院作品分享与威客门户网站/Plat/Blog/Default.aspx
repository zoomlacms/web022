<%@ page language="C#" autoeventwireup="true" enablesessionstate="True" inherits="Plat_Task_Default, App_Web_od3mslno" masterpagefile="~/Plat/Main.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head"> 
<link type="text/css" rel="stylesheet" href="/JS/atwho/jquery.atwho.css" /> 
<link type="text/css" rel="stylesheet" href="/dist/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="/Plugins/FancyBox/jquery.fancybox.css" />
<link type="text/css" rel="stylesheet" href="/Plugins/FancyBox/jquery.fancybox-thumbs.css" />
<script type="text/javascript" src="/JS/CalendarTable.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/Plugins/FancyBox/jquery.fancybox.js"></script>
<script type="text/javascript" src="/Plugins/FancyBox/jquery.fancybox-thumbs.js"></script>
<title><%:Call.SiteName %>_信息分享</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="breadcrumb visible-xs">
信息分享
</div>
<div class="container-fluid hidden-xs">
<ol class="breadcrumb">
<li><a href="/">首页</a></li>
<li><a href="/Plat/Blog/">能力中心</a></li>
<li class="active">信息分享</li>
<div class="clearfix"></div>
</ol>
</div>
<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 padding0">
<div runat="server" id="pcmsgdiv">
  <div>
      <ul id="child_nav_ul">
          <li onclick="MsgTypeFunc('.tab1');"><a href="javascript:;" data-type=".tab1" class="active">写分享</a></li>
          <li onclick="MsgTypeFunc('.tab2');"><a href="javascript:;" data-type=".tab2">发投票</a></li>
          <li><a href="javascript:ContentShow();">长文章</a></li>
      </ul>
      <div class="clearfix"></div>
  </div>
  <table id="votetable" class="votetable tab2">
	<tr>
	  <td class="tdleft">创建标题：</td>
	  <td><asp:TextBox runat="server" ID="VoteTitle_T" class="form-control required" /></td>
	</tr>
	<tr>
	  <td>投票选项：</td>
	  <td><label class='vote_op_label'>1.</label>
		<input type="text" name="VoteOption_T1"  class='vote_op_input form-control required' /></td>
	</tr>
	<tr class='votetr'>
	  <td></td>
	  <td><label class='vote_op_label'>2.</label>
		<input type='text' name='VoteOption_T' class='vote_op_input form-control required' /></td>
	</tr>
	<tr>
	  <td></td>
	  <td><input type="button" value="添加选项" class="btn btn-primary btn-sm" onclick="AddVoteOP();"/></td>
	</tr>
	<tr>
	  <td>截止时间：</td>
	  <td><asp:TextBox runat="server" ID="EndDate_T" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm'});" class="form-control required date"></asp:TextBox></td>
	</tr>
	<tr>
	  <td>匿名投票：</td>
	  <td><input type="checkbox" runat="server" id="IsAnony"/></td>
	</tr>
	<tr>
	  <td>投票结果：</td>
	  <td><input type="radio" name="IsView" value="1" checked="checked" id="IsView1" />
		<label for="IsView1">投票人可见</label></td>
	</tr>
	<tr>
	  <td></td>
	  <td><input type="radio" name="IsView" value="2" id="IsView2" />
		<label for="IsView2">发起人可见</label></td>
	</tr>
  </table>
  <asp:TextBox runat="server" ID="MsgContent_T" class="atwho msgcontent" placeholder="今天说点什么?" TextMode="MultiLine"></asp:TextBox>
  <div id="uploader"><ul class="filelist"></ul></div>
  <div class="msg_opdiv"><a href="javascript:;" onclick="ShowDiv('topicDiv');"><span class="spanico">#</span><span>话题</span></a>
	<div id="topicDiv" class="msgex">
	  <div class="text-right"><span title="关闭" class="glyphicon glyphicon-remove op" onclick="$('#topicDiv').hide();"></span></div>
        <ul id="topicul">
            <li>#插入话题#</li>
            <li>#工作交流#</li>
            <li>#更新记录#</li>
            <li>#请假申请#</li>
            <li>#每日小记#</li>
            <li>#心情分享#</li>
            <li style="border-bottom: 1px solid #ddd;">#Bug反馈#</li>
        </ul>
	</div>
	<a href="javascript:;" onclick="ShowDiv('GroupAT_ifr');"><span class="spanico">@</span><span>AT</span>
        <iframe id="GroupAT_ifr" class="msgex"></iframe>
    </a>
      <a href="javascript:;" onclick="ShowDiv('ImgFace_Div');"><span class="glyphicon glyphicon-heart spanico"></span><span>表情</span>
          <div id="ImgFace_Div" class="msgex">
              <asp:HiddenField runat="server" ID="ImgFace_Hid" Value="[]" />
              <iframe src="" class="emotion_ifr" id="ImgFace_if"></iframe>
          </div>
      </a>
      <a href="javascript:;" onclick="ShowFileUP();"><span class="glyphicon glyphicon-paperclip spanico"></span><span>附件</span></a>
      <a href="javascript:;" onclick="ShowSign();"><span class="glyphicon glyphicon-map-marker spanico"></span>签到</a>
      <span class="msg_opdiv_span">
          <asp:LinkButton runat="server" ID="Share_Btn" OnClientClick="return DataChk();" OnClick="Share_Btn_Click" class="tab1" Style="color: #0066cc;">分享</asp:LinkButton>
          <asp:Button runat="server" ID="Share_Btn2" OnClientClick="return DataChk();" OnClick="Share_Btn_Click" CssClass="hidden" />
          <asp:LinkButton runat="server" ID="Vote_Btn" OnClientClick="return VoteCheck();" OnClick="Vote_Btn_Click" class="tab2" Style="color: #0066cc; display: none;">发布</asp:LinkButton>
      </span><a href="javascript:;" class="pull-right border_l" onclick="ShowDiv('viewgroup');"><span class="glyphicon glyphicon-eye-open margin_l5 spanico"></span> <span id="canSee_Span">公开</span></a><!--根据其中所选-->
	<ul id="bloglist" runat="server" class="ViBoList" visible="false">
	  <li runat="server" id="sina_li" visible="false" title="同步到新浪微博"  onclick="Blog_Chk()"> <span id="weibo_icon" class="fa fa-weibo blogicon" style="font-size:23px;line-height:25px;color:#999;"></span>
		<input type="checkbox" class="hidden_div"  name="sync_chk" value="sina" />
	  </li>
	  <li runat="server" id="qqblog_li" visible="false" title="同步到腾迅微博" onclick="Blog_Chk()"> <span id="qq_icon" class="fa fa-qq blogicon" style="font-size:20px;line-height:25px;color:#999;" ></span>
		<input type="checkbox" id="qqchk" class="hidden_div" name="sync_chk" value="qqblog" />
	  </li>
	</ul>
	<div id="noplat_div" runat="server" class="noneTitle_Title hidden-xs" visible="false"> <span>你尚未绑定微博平台,<a style="color:#0066cc;float:none;" href="/Plat/UPCenter.aspx?Set=1">前往设置</a></span></div>
	<table class="table msgex" id="viewgroup">
	  <tr>
		<td onclick="ShowDiv('viewgroup');CanSeeFun('all');" class="cursour">公开</td>
	  </tr>
	  <asp:Repeater runat="server" ID="GroupRpt" EnableViewState="false">
		<ItemTemplate>
		  <tr>
			<td><label class="oplabel">
				<input type="checkbox" name="GroupIDS_Chk" value="<%#Eval("ID") %>" data-gname="<%#Eval("GroupName") %>" onclick="CanSeeFun('single');" />
				<%#Eval("GroupName") %></label></td>
		  </tr>
		</ItemTemplate>
	  </asp:Repeater>
        <tr><td><label class="oplabel"><input type="checkbox" name="GOnlyMe_Chk" value="0" data-gname="仅自己" onclick="CanSeeFun('onlyme');" />仅自己</label></td></tr>
	</table>
    <div class="clearfix"></div>
  </div>
</div>
<!--信息分区 End-->
<div runat="server" id="mobilemsgdiv" visible="true">
<a href="javascript:;" id="xs_share" class="bounceInUp_css" >+</a>
<div class="xs_share_box">
<ul class="list-unstyled">
    <li><a href="javascript:;" onclick="$('#mobilemsgdiv').hide();$('#pcmsgdiv').show();" data-type=".tab1"><span>写分享</span><i class="fa fa-share-alt"></i></a></li>
    <li><a href="javascript:;" onclick="$('#mobilemsgdiv').hide();$('#pcmsgdiv').show();MsgTypeFunc('.tab2');" data-type=".tab2"><span>发投票</span><i class="fa fa-anchor"></i></a></li>
    <li><a href="javascript:ContentShow();"><span>长文章</span><i class="fa fa-outdent"></i></a></li>
    <li><a href="/Plat/Blog/PosSign.aspx?s=mobile"><span>写签到</span><i class="glyphicon glyphicon-map-marker"></i></a></li>
</ul>
</div>
</div>
<div class="clearfix"></div>
<div>
  <ul class="content_nav_ul">
	<li onclick="location='<%:GetUrl("?") %>';"><a href="javascript:;">全部</a></li>
	<li class="hidden-xs" onclick="location='<%:GetUrl("?msgtype=1&liop=1") %>';"><a href="javascript:;">通知</a></li>
	<li onclick="location='<%:GetUrl("?msgtype=2&liop=2") %>';"><a href="javascript:;">投票</a></li>
	<li class="hidden-xs" onclick="location='<%:GetUrl("?msgtype=1&liop=3") %>';"><a href="javascript:;">文章</a></li>
	<li onclick="location='<%:GetUrl("?filter=colled&liop=4") %>';"><a href="javascript::">收藏</a></li>
  </ul>
    <div class="clearfix"></div>
</div>
<div id="msglist" class="msglist"> 
    <span class="alert alert-alert" id="Empty_Span" runat="server" visible="false">你当前不属于任何组,无法查看信息</span>
  <asp:Repeater runat="server" ID="MsgRepeater" OnItemDataBound="MsgRepeater_ItemDataBound" EnableViewState="false">
	<ItemTemplate>
	  <div class="msgitem" id="msgitem-<%#Eval("ID") %>">
		<div class="plat_left_div" style="position:absolute;">
            <div class="uinfodiv">
              <div class="loadok hidden_div">
                  <div class="info">
                      <div class="pull-left">
                          <img src="/Images/ajax-loader.gif" onerror="this.src='/Images/userface/noface.gif';" class="imgface_max" />
                      </div>
                      <div class="uinfo_body">
                          <ul class="uinfoul">
                              <li class="paddbottom5">@UserName <input type="button" class="btn btn-xs btn-primary" value="AT他" onclick="AddAT('@UserName','@UserID');" />
                              </li>
                              <li class="grayremind">电话：@Mobile</li>
                              <li class="grayremind">部门：@GroupName</li>
                              <li class="grayremind">状态：在职</li>
                          </ul>
                      </div>
                      <div class="clearfix"></div>
                  </div>
                  <div class="uinfo_bottom">
                      <input type="button" class="btn btn-xs btn-primary" value="私信" onclick="ChatShow('@UserID','@UserName');" />
                      <a href="/Plat/Blog/?uids=@UserID" class="btn btn-xs btn-primary">工作流</a>
                      <input type="button" class="btn btn-xs btn-primary" value="站内邮" onclick="PrivateOpen('@UserID','@UserName');UInfoClose(this);" />
                      <input type="button" class="btn btn-xs btn-primary" value="关闭" onclick="UInfoClose(this);" />
                  </div>
              </div>
              <div class="loading"><i class="fa fa-spinner fa-spin"></i></div>
          </div>

		    <div class="pull-left"><img class="imgface_mid uinfo" src="<%#Eval("UserFace") %>" onerror="this.src='/Images/userface/noface.gif';" title="<%#Eval("CreateUName") %>" data-uid="<%#Eval("CreateUser") %>" /></div>
		</div>
		<div class="msg_content_div plat_content_div">
		    <div class="content_head"><a href="javascript:;" onclick="ShowUser(<%#Eval("CreateUser") %>);" title="用户详情"><%#Eval("CreateUName") %></a> <%#GetColled() %></div>
		    <div id="normal" runat="server" visible="false">
			    <div class="msg_content_article_div"><%#GetContent()%></div>
			    <%#GetAttach() %> <%#GetForward() %> </div>
		    <div id="vote" runat="server" visible="false">
			    <div class="paddbottom5"><strong><%#Eval("Title") %></strong></div>
			    <div class="vote_user_div" id="vote_user_div" runat="server">
			      <ul class="vote_list_ul">
				    <%#GetVoteLI() %>
			      </ul>
			      <div>
				    <input type="button" value="投票" onclick="PostUserVote(<%#Eval("ID") %>);" class="btn btn-primary btn-sm"/>
				    <input type="button" value="查看结果" onclick="ShowMsgDiv('<%#Eval("ID") %>','.vote_user_div','.vote_result_div');" class="btn btn-primary btn-sm"/>
			      </div>
			    </div>
			    <div class="vote_result_div" id="vote_result_div" runat="server"><!--结果页-->
			      <asp:Repeater runat="server" EnableViewState="false" ID="VoteResultRep">
				    <ItemTemplate>
				      <div><%#Eval("opName") %></div>
				      <div class="progress vote_progress">
					    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100" <%#"style='width:"+Eval("Percent")+"%;'" %>></div>
				      </div>
				      <label class="vote_person_num"><%#Eval("count")+"人" %></label>
				    </ItemTemplate>
			      </asp:Repeater>
			      <div class="clearfix"></div>
			      <div id="msg_op_btn_div" runat="server">
				    <input value="返回投票" class="btn btn-primary btn-sm" onclick="ShowMsgDiv(<%#Eval("ID")%>,'.vote_result_div','.vote_user_div');" />
			      </div>
			    </div>
			    <div class="paddin5"><strong><%#GetVoteBottom() %></strong></div>
			    <div class="paddbottom5"><%#Eval("MsgContent") %></div>
		      </div>
            <div id="longarticle" runat="server" visible="false">
                  <div class="subtitle grayremind"><%#Eval("Title") %><div class="clearfix"></div><input type="button" value="浏览全文" class="btn btn-xs btn-primary" onclick="ShowLong(<%#Eval("ID")%>);" /></div>
              </div>
		  <a href="Item.aspx?id=<%#Eval("ID") %>" class="grayremind" title="浏览信息详情"><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyy年MM月dd日 HH:mm") %></a>
          <span class="grayremind" title="哪些人可见"><%#GetWhoCanSee()%></span>
		  <div class="reply_op_div"> <%#GetReplyOP() %> <span class="glyphicon glyphicon-comment" title="回复" onclick="DisReplyOP(<%#Eval("ID") %>,0,'<%#Eval("CreateUName") %>');"></span> </div>
		  <div class="likeids_div" >
			<ul class="likeids_div_ul" style='<%#IsShowLike()%>'>
			  <li style="width:auto;"> <a href="javascript:;" onclick="PostLike(<%#Eval("ID") %>)" class="likeids_div_a"><span class="glyphicon glyphicon-thumbs-up"></span><span class='likenum_span'>(<%#GetLikeNum() %>)</span></a> </li>
			  <%#GetUserFace() %>
			</ul>
		  </div>
		  <div id='reply_<%#Eval("ID") %>'>
			<asp:Literal runat="server" ID="ReplyList_L" EnableViewState="false"></asp:Literal>
		  </div>
		  <div id="reply_div_<%#Eval("ID") %>" class="reply_item">
			<input type="hidden" id="Reply_Rid_Hid_<%#Eval("ID") %>" value="0" />
			<textarea id="MsgContent_<%#Eval("ID") %>" class="form-control atwho reply_text" style="height:40px;" placeholder="说一句吧..."></textarea>
			<input type="button" value="回复" onclick="AddReply(<%#Eval("ID") %>);" class="btn btn-primary btn-sm replybtn" />
			<div class="clearfix"></div>
		  </div>
		</div>
		<div class="clearfix"></div>
	  </div>
	</ItemTemplate>
  </asp:Repeater>
  <asp:Literal runat="server" ID="MsgPage" EnableViewState="false"></asp:Literal>
</div>
<div>
  <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
</div>
<!--模态框区-->
<div class="hidden_div"> 
    <a href="javascript:;" data-toggle="modal" data-target="#myModal" id="Model_Btn"></a> 
    <a href="javascript:;" data-toggle="modal" data-target="#fileup_div" id="FileUP_Btn"></a>
    <a href="javascript:;" data-toggle="modal" data-target="#forward_div" id="Forward_Btn"></a>
  <asp:HiddenField runat="server" ID="UserInfo_Hid"/>
</div>
<div class="modal fade" id="myModal">
  <div class="modal-dialog width1100">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<span class="modal-title">文件预览</span> <a href="#" id="preview_down_a" title="下载该文档">下载</a> <a href="javascript:;" id="largepre_a" target="_blank" title="全屏浏览">全屏</a> </div>
	  <div class="modal-body">
		<iframe id="preview_if" class="ifr_mid" style="width:100%; height:700px;"></iframe>
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
	  </div>
	</div>
  </div>
</div>
<div id="fileup_div" class="hidden_div">
    <input type="file" id="file_upload_1" />
    <input type="hidden" id="Attach_Hid" name="Attach_Hid" />
</div>
<div class="modal" id="forward_div">
  <div class="modal-dialog width1100">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<span class="modal-title">内容转发</span></div>
	  <div class="modal-body">
		<div id="forward_his_div"> </div>
		<div id="forward_my_div margin_t5">
		  <asp:HiddenField runat="server" ID="Forward_ID_Hid"/>
		  <asp:TextBox runat="server" ID="ForMsg_Text" TextMode="MultiLine" CssClass="formsg_text" placeholder="说说转发理由吧!!"></asp:TextBox>
		</div>
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<asp:Button runat="server" ID="Froward_Btn" OnClick="Froward_Btn_Click" Text="转发" class="btn btn-primary"/>
	  </div>
	</div>
  </div>
</div>
<div class="modal" id="article_div" data-backdrop='static'>
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" onclick="$('#article_div').modal('hide');"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<span class="modal-title"><strong>撰写文章(最多不能超过10000个字符)</strong></span> </div>
	  <div class="modal-body height600">
		<asp:TextBox runat="server" ID="Article_T" TextMode="MultiLine" class="height500"></asp:TextBox>
	  </div>
	  <div class="modal-footer text-center">
		<asp:Button runat="server" ID="ArtSave_Btn" Text="保存" OnClick="ArtSave_Btn_Click" CssClass="btn btn-primary"/>
		<button type="button" class="btn btn-default" onclick="$('#article_div').modal('hide');">关闭</button>
	  </div>
	</div>
  </div>
</div>
    <%=Call.GetUEditor("Article_T",4) %>
<!--站内邮-->
<div id="privatediv" class="modal site_mail_div">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-body padding0">
		<div class="site_mail_title">站内邮 <span class="glyphicon glyphicon-remove grayremind" title="关闭" onclick="PrivateClose();"></span> </div>
		<table id="privatetable">
		  <tr>
			<td class="tdleft"></td>
			<td><span class="grayremind">你可以发邮件给一个或多个同事</span></td>
		  </tr>
		  <tr>
			<td class="centertd"><span class="grayremind">收信人：</span></td>
			<td><div class="input-group width100">
				<input type="text" id="ReceUser" class="form-control width100"/>
				<input type="hidden" value="ReceUser_Hid" />
				<span class="input-group-addon cursour" onclick="PrivateSelUser('private');"><span class="glyphicon glyphicon-plus"></span></span></div></td>
		  </tr>
		  <tr>
			<td class="centertd"><span class="grayremind">内容：</span></td>
			<td><asp:TextBox CssClass="site_mail_content" runat="server" ID="MailContent" TextMode="MultiLine"/></td>
		  </tr>
		  <tr>
			<td></td>
			<td class="text-right"><input type="button" id="prvatesend_btn" value="发送" onclick="PrivateSend();" class="btn btn-primary" /></td>
		  </tr>
		</table>
	  </div>
	</div>
  </div>
</div>
<%=Call.GetUEditor("MailContent",1) %>
<div id="seluserdiv" class="fixifrdiv width800 hidden_div">
  <div class="panel panel-primary">
	<div class="panel-heading">
	  <h3 class="panel-title text-center pull-left">请选择用户</h3>
	  <span class="glyphicon glyphicon-remove cursour pull-right" title="关闭" onclick="$('#seluserdiv').hide();"></span>
	  <div class="clearfix"></div>
	</div>
	<div class="panel-body">
	  <iframe runat="server" id="User_IFrame" class="ifr_mid" name="main_right" src="" frameborder="0"></iframe>
	</div>
  </div>
</div>
</div>
<!--右边栏-->
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 paddin5">
<div class="right_nav_divide">日期</div>
<div class="hidden_div"> <span id="times"></span> </div>
<div class="r_clander">
  <table class="table table-striped table-responsive table-bordered" id="caltable">
	<thead>
	  <tr class="r_clander_tr">
		<td colspan="7" class="r_clander_td"><a href="javaScript:subMonth();" title="上一月" class="DayButton">上一月</a>
		  <input name="year" id="year" class="form-control year" type="text" size="4" maxlength="4" />
		  <span>年</span>
		  <input name="month" id="month" type="text" class="form-control month" size="1" maxlength="2"/>
		  <span>月</span><a href="JavaScript:addMonth();" title="下一月" class="DayButton">下一月</a></td>
	  </tr>
 	  <tr class="r_clander_tr">
          <script>
		document.write("<td class=\"DaySunTitle\" id=\"diary\" name=\"diary\" >" + days[0] + "</td>");
		for (var intLoop = 1; intLoop < days.length - 1; intLoop++) {
			document.write("<td class=\"DayTitle\" id=\"diary\" name=\"diary\">" + days[intLoop] + "</td>");
		}
		document.write("<td class=\"DaySatTitle\" id=\"diary\" name=\"diary\" >" + days[intLoop] + "</td>");
          </script>
      </tr>
	</thead>
	<tbody id="calendar" class="text-center">
	  <script>
		for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
			document.write("<TR style=\"cursor: hand\">");
			for (var intDays = 0; intDays < days.length; intDays++) document.write("<td class=\"CalendarTD\" onMouseover=\"buttonOver();\" onMouseOut=\"buttonOut();\"></td>");
			document.write("</TR>");
		}
	</script>
</tbody> 
  </table>
  <script>
	Calendar();
</script> 
</div>
<div class="right_nav_divide"><span>最新投票</span><span class="seemore"><a href="javascript:location='?msgtype=2&liop=2';">查看更多></a></span></div>
<div>
  <ul id="newvote_ul">
	<asp:Repeater runat="server" ID="newvote_Rep" EnableViewState="false">
	  <ItemTemplate>
		<li>
		  <div><img src="<%#Eval("UserFace") %>" class="imgface_mini" title="admin" /> <span class="margin_l20"><a href="#"><%#Eval("Title") %></a></span></div>
		  <div><span class="pull-right"><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日") %></span></div>
          <div class="clearfix"></div>
		</li>
	  </ItemTemplate>
	</asp:Repeater>
  </ul>
</div>
<div class="right_nav_divide"><span>最近日程</span><span class="seemore"><a href="/Mis/Ke/DailyPlan.aspx" target="_blank">查看更多></a></span></div>
<div>
  <ul id="newdaily_ul">
	<asp:Repeater runat="server" ID="newdaily_Rep" EnableViewState="false">
	  <ItemTemplate>
		<li>
		  <span><a target="_blank" href="/Mis/Ke/DailyPlan.aspx?type=<%#Eval("TaskType") %>"><%#Eval("Name") %></a></span>
		  <span class="pull-right"><%#Convert.ToDateTime(Eval("StartDate")).ToString("MM月dd日")+"---" %><%#Convert.ToDateTime(Eval("EndDate")).ToString("MM月dd日") %></span>
		</li>
	  </ItemTemplate>
	</asp:Repeater>
  </ul>
</div>
<div class="right_nav_divide"><span>热门话题</span></div>
<div>
  <ul id="topic_ul">
	<asp:Repeater runat="server" ID="Topic_Rep" EnableViewState="false">
	  <ItemTemplate>
		<li>
           <a class="btn btn-default" title="热度:<%#Eval("Count") %>" href="/Plat/Blog/?Skey=<%#HttpUtility.UrlEncode(Eval("TName").ToString())%>"><%#Eval("TName").ToString().Replace("#","") %></a>
		</li>
	  </ItemTemplate>
	</asp:Repeater>
  </ul>
</div>
</div>
    <div class="r_uinfo_div" id="ShowUser_Div">
        <iframe class="r_uinfo_ifr" id="ShowUser_if"></iframe>
    </div>
<%--    <div>
        <iframe src="PosSign.aspx" class="mobilediag"></iframe>
    </div>--%>
<div onclick="ChatShow(0,'');" title="打开私信" class="b_chat_div hidden-xs"> <span class="glyphicon glyphicon-envelope remind_mid"></span> <span class="margin_l5">私信聊天</span> </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/Controls/Textarea.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/atwho/jquery.atwho.js"></script>
<script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
<script type="text/javascript">
var pageSize ="<%=replyPageSize%>";
$().ready(function(){//初始化位置的CSS，在此定义指定
 var liop="<%:Request.QueryString["liop"]%>";
 if(!liop||liop==""){
	 $(".content_nav_ul li")[0].className="active";
 }
 else{
	 $(".content_nav_ul li")[liop].className="active";
 }
 $("#MsgContent_T").keydown(function(){
	 if(event.ctrlKey && event.keyCode=='13'){
		 $("#Share_Btn2").trigger("click");
	 }
 });
 $(".reply_text").autoHeight();
 PostToCS2("/Plat/Common/Common.ashx","Plat_CompUser","",function(data){InitAt(data);});
 //话题 
 $("#topicul li").click(AddTopic);
 //博客
 Blog_StatusChk();
 //用户信息
 var uinfointer;
 $(".uinfo").hover(function(){
	 obj=this;
	 uinfointer= setTimeout(function(){UInfoShow(obj)},300);
 },function(){
	 clearTimeout(uinfointer);
 }).click(function(){var uid=$(this).data("uid");ShowUser(uid);});
    //信息保存,分开绑定,避免点分享,无法清除缓存
 $("#MsgContent_T").bind("blur",function(){window.localStorage.PlatMsg = $("#MsgContent_T").val();})
 $("#MsgContent_T").bind("paste cut", function () {//keyup paste clip
     setTimeout(function () { window.localStorage.PlatMsg = $("#MsgContent_T").val(); }, 100);
 });
 if(window.localStorage.PlatMsg)
     $("#MsgContent_T").val(window.localStorage.PlatMsg);
//预览
 $(".athumbnail_img").fancybox({
     'titlePosition': 'over',
     helpers: {
         thumbs: {
             width: 50,
             height: 50
         }
     }
 });// 预览end;
 if($("#mobilemsgdiv .xs_share_box").is(":visible")){
     $("#topcontrol").hide();
 }
});
var diag=new ZL_Dialog();diag.title="文章浏览";diag.width=" ";
var diag1=new ZL_Dialog();diag1.title="文件上传(最多支持5个)";diag1.content="fileup_div";diag1.width=" ";
var mbDiag=new ZL_Dialog();mbDiag.maxbtn=false;mbDiag.backdrop=true;mbDiag.width="mobilediag";
function ShowMBDiag(url,title)
{
    mbDiag.url=url;
    mbDiag.title=title;
    mbDiag.ShowModal();
}
function CloseDiag()
{
    mbDiag.CloseModal();
    diag1.CloseModal();
    diag.CloseModal();
}
function ShowSign(){ShowMBDiag("PosSign.aspx","移动签到");}
function ShowByPoint(point)
{
    ShowMBDiag("MapByPoint.aspx?Point="+JSON.stringify(point),"查看签到位置");
}
function ShowLong(id)
{
    diag.ajaxurl="Article.aspx?id="+id;
    diag.ShowModal();
}
function OpenWin(type){
    var url="";
    switch(type)
    {
        case 1:
            url="/Common/PreView/PicView.aspx?s=plat&id="+arguments[1];
            break;
        case 2:
            url="/Plat/UPCenter.aspx?Set=1&Remote=true";
            break;
    }
    var myWin = window.open(url, '_blank', 'height=630, width=1030,top=200,left=300,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}
</script>
<script type="text/javascript" src="/JS/ICMS/MainBlog.js"></script>
    <script>
        /*Attach Begin*/
        //WUFile {name: "test.html", size: 76272, type: "text/html", lastModifiedDate: Thu Apr 16 2015 17:41:02 GMT+0800 (China Standard Time), id: "WU_FILE_0"…}
        var attachDiag = new ZL_Dialog();
        function ShowFileUP()
        {
            attachDiag.title = "文件上传";
            attachDiag.reload=true;
            attachDiag.backdrop = true;
            attachDiag.maxbtn = false;
            attachDiag.width = "width1100";//Blog
            attachDiag.url = "/Plugins/WebUploader/WebUP.aspx?json={\"ashx\":\"action=Blog\",\"pval\":\"\"}";
            attachDiag.ShowModal();
        }
        function AddAttach(file,ret,pval) {
            var src=ret._raw;
            if(src==""||src.indexOf('<')>-1){alert('请勿上传可疑文件!!');attachDiag.CloseModal();return;}
            var imgli = "<li data-name='@name'><p><img src='@src' /></p>"
                + "<div class='file-panel' style='height: 0px;'><span class='cancel'>删除</span></div></li>";
            var divli="<li data-name='@name'><div class='imgview'><div class='ext @ex'></div><div class='fname'>@fname</div></div><div class='file-panel' style='height: 0px;'><span class='cancel'>删除</span></div></li>";
            //var img = "<div class='imgview'><img src='{0}' class='img'/></div>";
            //var tlp = "<div class='imgview'><div class='ext @ex'></div><div class='fname'>@fname</div></div>";
            $("#uploader").show(); 
            var li="",name=GetFname(src);
            if (IsImage(src)) {
                var li = imgli.replace(/@src/, src).replace(/@name/,name);
            }
            else {
                var li = divli.replace("@ex", GetExName(src)).replace("@fname", GetFname(src, 6)).replace(/@name/,name);
            }
            $("#uploader .filelist").append(li);
            $("#Attach_Hid").val( $("#Attach_Hid").val() + GetFname(src,0) + "|");//仅存文件名,用于防止用户随意指定图片
            BindAttachEvent();
            console.log($("#Attach_Hid").val());
            attachDiag.CloseModal();
        }
        function RemoveAttach(name) {
            var attctArr = $("#Attach_Hid").val().split('|');
            var result = "";
            for (var i = 0; i < attctArr.length; i++) {
                if (attctArr[i] != name) {
                    result += attctArr[i] + "|";
                }
            }
            result = result.replace("||", "|").trim("|");
            $("#Attach_Hid").val(result);
            if($("#uploader .filelist li").length<1){$("#uploader").hide();}
        }
        function BindAttachEvent()
        {
            $("#uploader .filelist li").mouseenter(function () {
                $btns = $(this).find(".file-panel");
                $btns.stop().animate({ height: 30 });
            }).mouseleave(function () {
                $btns = $(this).find(".file-panel");
                $btns.stop().animate({ height: 0 });
            });
            $(".filelist li .cancel").click(function () {
                $li = $(this).closest("li");
                RemoveAttach($li.data("name"));
                $li.remove();
            });
        }
        /*Attach End*/
        $("#xs_share").click(function(e){ 
            if($(".xs_share_box").css("display")=="none"){
                $(".xs_share_box").fadeIn();
                $(this).text("×");
            }
            else{
                $(".xs_share_box").fadeOut();
                $(this).text("+");
            }
        })
        //全屏预览
        function LargePre(){
            window.location.href=$("#preview_if").attr('src');
        }
    </script>
</asp:Content>