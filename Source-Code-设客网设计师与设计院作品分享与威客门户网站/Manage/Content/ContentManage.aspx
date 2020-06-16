<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_ContentManage, App_Web_ckin0fxz" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>内容管理</title>
    <link rel="stylesheet" href="/dist/css/font-awesome.min.css" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
<asp:TextBox runat="server" ID="TextBox1" Visible="false"></asp:TextBox>
<asp:DropDownList runat="server" ID="DropDownList1" Visible="false" EnableViewState="false"></asp:DropDownList>
<div id="m_nodes" class="visible-xs visible-sm"></div>
<div class="opion_header">
	内容操作：<asp:Literal runat="server" ID="lblAddContent"></asp:Literal>
    <span class="pull-right visible-xs visible-sm" id="m_span"><input type="button" class="btn btn-success m_modal" onclick="opentitle('EditNode.aspx?NodeID=<%=Request.QueryString["NodeID"] %>','配置本节点');" value="节点选择" /></span>
	<span class="pull-right hidden-xs count">文章数：<asp:Label runat="server" ID="WZS"></asp:Label>
	点击数：<asp:Label runat="server" ID="DJS"></asp:Label>
	</span>
</div>
<div id="divImp" class="Imp_div">
	选择CSV导入源：<asp:FileUpload ID="fileImp" class="fileImp" runat="server" />
	<asp:Button ID="btnCurrentImport" CssClass="btn btn-default" runat="server" OnClick="btnCurrentImport_Click" OnClientClick="if(document.getElementById('fileImp').value.length==0){alert('请选择Excel(CSV)文件,可下载模板!');return false};" Text="导入" CausesValidation="true" />
	<asp:LinkButton ID="lbtnSaveTempter" runat="server" OnClick="lbtnSaveTempter_Click" CausesValidation="False">
		<span class="red">*</span>
		<span class="Down">下载[<%=getNodeName()%>]的<%=this.bmodel.GetModelById(ZoomLa.Common.DataConverter.CLng(this.Request.QueryString["ModelID"])).ItemName %>模型CSV导入模板</span>
	</asp:LinkButton>(下载后用EXCEL打开从第二行开始按规范填写并保存即可)
</div>
<ul class="nav nav-tabs hidden-xs hidden-sm">
	<li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)"><%:lang.LF("所有内容") %></a></li>
	<li><a href="#tab5" data-toggle="tab" onclick="ShowTabs(5)"><%:lang.LF("工作流审批") %></a></li>
	<li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)"><%:lang.LF("草稿") %></a></li>
	<li><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)"><%:lang.LF("待审核") %></a></li>
	<li><a href="#tab3" data-toggle="tab" onclick="ShowTabs(3)"><%:lang.LF("已审核") %></a></li>
	<li><a href="#tab4" data-toggle="tab" onclick="ShowTabs(4)"><%:lang.LF("退稿") %></a></li>
</ul>
<table id="EGV" class="table table-striped table-bordered table-hover content_list">
	<tr>
		<td></td><td>ID</td><td>标题</td>
		<td class="egv_td_min60">录入者</td>
        <td>点击数</td>
        <td>推荐</td>
        <td class="egv_td_min60">状态</td>
        <td>排序</td>
        <td>操作</td>
	</tr>
<ZL:Repeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td><label class='allchk_l'><input type='checkbox' id='chkAll'/>全选</label></td><td colspan='8'><div class='text-center'>" PageEnd="</div></td></tr>" OnItemDataBound="RPT_ItemDataBound" OnItemCommand="RPT_ItemCommand">
	<ItemTemplate>
		<tr ondblclick="location='ShowContent.aspx?GID=<%#Eval("GeneralID") %>&modeid=<%#Eval("ModelID") %>';">
			<td class="td_s"> <input type="checkbox" name="idchk" value='<%#Eval("GeneralID") %>' /></td>
			<td class="GID"><%#Eval("GeneralID") %></td>
			<td>
            <div class="Ctitle" onmouseover="ShowPopover(this)" onmouseout="HidePopover(this)">
               <span class="hidden-xs">
                 <%# GetPic(Eval("ModelID", "{0}"))%>
                 <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"),Eval("TitleStyle","{0}"))%></span>
                    <span class="visible-xs"><%#GetTitle(Eval("Title").ToString()) %></span>
                <div class="popover bottom">
                    <div class="arrow"></div>
                    <h3 class="popover-title"><a href="/Item/<%#Eval("GeneralID") %>.aspx" title="<%#Eval("Title") %>" target="_blank"><%#Eval("Title") %></a><span class="badge pull-right"><%# Eval("Hits") %></span></h3>
                    <div class="popover-content">
                        <%# GetContent() %>
                        <div class="clearfix"></div>
                        <i class="gray_9">[<%# Convert.ToDateTime(Eval("CreateTime", "{0}")).ToShortDateString() %>]</i>
                    </div>
                </div>
            </div>
			</td>
			<td><a href="ContentManage.aspx?NodeID=<%#Eval("NodeID") %>&KeyType=1&keyWord=<%#Eval("inputer") %>"><span class="isshe"><%#Eval("Title") %></span><span class="noshe"><%#Eval("Inputer") %></span></a></td>
			<td><%#Eval("Hits") %></td>
			<td><%#GetElite(Eval("EliteLevel", "{0}")) %></td>
			<td>
				<asp:HiddenField ID="hfstatus" runat="server" Value='<%#Eval("Status") %>' />
				<%#GetStatus(Eval("Status", "{0}")) %></td>
			<td>
                <input type="hidden" value="<%#Eval("OrderId") %>" name="Order_hid" />
                <a class="option_style" href="javascript:;" onclick="MoveUp(this)">↑上移 </a>
                <a class="option_style" href="javascript:;" onclick="MoveDown(this)">下移↓</a>
			<td>
                <a class="option_style" href="ShowContent.aspx?GID=<%#Eval("GeneralID") %>" ><i class="fa fa-eye" title="预览"></i></a> 
				<asp:LinkButton runat="server" CssClass="option_style" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' Enabled='<%# getenabled(Eval("Status").ToString()) %>' CausesValidation="false"><i class="glyphicon glyphicon-pencil" title="修改"></i></asp:LinkButton>  
				<asp:LinkButton ID="lbDelete" CssClass="option_style" runat="server" Enabled='<%#getenabled(Eval("GeneralID").ToString()) %>' CommandName="Del" 
                    CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据删除到回收站吗?');"><i class="glyphicon glyphicon-trash" title="删除"></i></asp:LinkButton>   
				<a class="option_style" href="/Item/<%#Eval("GeneralID") %>.aspx" target="_blank"><%#lang.LF("<i class='fa fa-globe'></i>浏览")%></a> 
				<asp:LinkButton ID="lbHtml" CssClass="option_style" runat="server"></asp:LinkButton>
			</td>
		</tr>
	</ItemTemplate>
	<FooterTemplate></FooterTemplate>
</ZL:Repeater>
</table>
<div class="clearbox"></div>
<div>
	<asp:Button ID="btnDeleteAll" CausesValidation="false" runat="server" Text="删除" OnClick="btnDeleteAll_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项放入回收站吗？')}" CssClass="btn btn-info" />
	<input type="button" id="timeReBtn" value="定时发布" class="btn btn-info" onclick="$('#timeReDiv').show();" />
	<asp:Button ID="Button2" CausesValidation="false" runat="server"
		Text="批量推荐" OnClientClick="if(!IsSelectedId()){alert('请选择项');return false;}else{return confirm('你确定要将所有选择项设为推荐吗？')}" CssClass="btn btn-info" OnClick="Button2_Click" />
	<asp:Button ID="Button3" CausesValidation="false" runat="server"
		Text="取消推荐" OnClientClick="if(!IsSelectedId()){alert('请选择项');return false;}else{return confirm('你确定要取消所有选择项推荐吗？')}" CssClass="btn btn-info" OnClick="Button3_Click" />
	<asp:Button ID="btnMove" CausesValidation="false" runat="server"
		Text="批量移动" OnClick="btnMove_Click" OnClientClick="if(!IsSelectedId()){alert('请选择移动项');return false;}else{return true}" CssClass="btn btn-info" />
	<asp:Button ID="btnAddToSpecial" CausesValidation="false" runat="server"
		Text="添加到专题" OnClick="btnAddToSpecial_Click" OnClientClick="if(!IsSelectedId()){alert('请选择添加到专题的内容');return false;}else{return true}" CssClass="btn btn-info" />
	<asp:Button ID="Button1" CausesValidation="false" runat="server"
		Text="批量修改" CssClass="btn btn-info" OnClientClick="if(!IsSelectedId()){alert('请选择修改项');return false;}else{return confirm('你确定要修改选中内容吗？')}"
		OnClick="Button1_Click" />
	<asp:Button ID="btnEsc" CausesValidation="false" runat="server" Text="退稿" OnClick="btnEsc_Click" class="btn btn-info" /><asp:HiddenField ID="HiddenNodeID" runat="server" />
	<asp:Button ID="btnAudit" CausesValidation="false" runat="server" Visible="false"
		Text="审核通过" CssClass="btn btn-success" OnClick="btnAudit_Click" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要审核选中内容吗？')}" />
	<asp:Button ID="btnUnAudit" CausesValidation="false" runat="server"
		Text="取消审核" CssClass="btn btn-info" OnClick="btnUnAudit_Click" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" />
    <input type="button" class="btn btn-info" onclick="if(!IsSelectedId()){alert('请选择内容');return false;}else{ShowSelNode();}" value="内容推送" />
    <asp:Button runat="server" ID="PushCon_Btn" OnClick="PushCon_Btn_Click" style="display:none;" />
    <input type="hidden" value="" id="pushcon_hid" name="pushcon_hid" />
</div>
<div visible="false" runat="server" id="audit_Div" class="margin_t10">
	<asp:Button runat="server" CssClass="btn btn-success" ID="NextStep_Btn" OnClick="NextStep_Btn_Click" Text="工作流批量审批" OnClientClick="return confirm('确定要批量审批吗!');" />
	<asp:Button runat="server" CssClass="btn btn-success" ID="StepReject_Btn" OnClick="StepReject_Btn_Click" Text="工作流批量拒绝" OnClientClick="return confirm('确定要批量拒绝吗!');" />
</div>
<div id="timeReDiv" style="display: none;" class="margin_t10">
	<table class="table table-bordered">
		<tr>
			<td style="width: 100px;"><strong>时间：</strong></td>
			<td><input type="text" id="timeReBTime" class="form-control margin-l5" name="timeReBTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" /></td>
		</tr>
		<tr>
			<td><strong>操作：</strong></td>
			<td>
				<asp:Button runat="server" ID="timeReConfBtn" OnClick="timeReConfBtn_Click" CssClass="btn btn-primary" Text="添加任务" CausesValidation="false" />
				<input type="button" value="取消" onclick="closeDiv()" class="btn btn-primary" />
			</td>
		</tr>
	</table>
</div>  
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
	//chk服务端控件,解析后是放在span中的，以后将其改为html
	$().ready(function () {
		$("#chkAll").click(function () {//EGV 全选
			selectAllByName(this, "idchk");
		});
		if (getParam("type")) {
			$("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
		}
		if (getParam("ModelID")) {
			$("#divImp").show();
		}
		HideColumn("1,4,5,7");
		$(window).resize(function () { SizeCheck(); });
		SizeCheck();
	});
	function MoveUp(data) {
	    var tr = $(data).parent().parent();
	    var oldid = $(tr).find("[name=Order_hid]").val();
	    var noid=$(tr).prev().find("[name=Order_hid]").val();
	    $.post('<%=Request.RawUrl %>', { action: "Move", oid: $(tr).find(".GID").text() + "," + oldid, nid: $(tr).prev().find(".GID").text() + "," +  noid}, function (data) {
	        if (data == "true") {
	            $(tr).find("[name=Order_hid]").val(noid);
	            $(tr).prev().find("[name=Order_hid]").val(oldid);
	            $(tr).insertBefore($(tr).prev());
	        };
	    });
	}
	function MoveDown(data) {
	    var tr = $(data).parent().parent();
	    var oldid = $(tr).find("[name=Order_hid]").val();
	    var noid = $(tr).next().find("[name=Order_hid]").val();
	    $.post('<%=Request.RawUrl %>', { action: "Move", oid: $(tr).find(".GID").text() + "," + $(tr).find("[name=Order_hid]").val(), nid: $(tr).next().find(".GID").text() + "," + $(tr).next().find("[name=Order_hid]").val() }, function (data) {
	        if (data == "true") {
	            $(tr).find("[name=Order_hid]").val(noid);
	            $(tr).next().find("[name=Order_hid]").val(oldid);
	            $(tr).insertAfter($(tr).next())
	        };
	    });
	}
	function ShowDesk() {
	    var ifr = $("#page_ifr")[0];
	    window.location = ifr.contentWindow.location;
	}
	function ShowTabs(ID) {
		location.href = 'ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
	}
	function clickBtn(ID) {
		$("#" + ID).trigger("click");
	}
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
	
		var diag = new ZL_Dialog();
	function ShowPopover(obj) {
		$(obj).find(".popover").show();
	}
	function HidePopover(obj) {
		$(obj).find(".popover").hide();
	}
	document.onkeyup = function GetKeyCode() {
		if (event.keyCode == 46) {
			$("#btnDeleteAll").trigger("click");
		}
	}
	function IsSelectedId() {
		var checkArr = $("input[type=checkbox][name=idchk]:checked");
		if (checkArr.length > 0)
			return true
		else
			return false;
	}
	function SizeCheck()
	{
	    if ((GetCurSize() == "sm" || GetCurSize() == "xs") && $("#m_nodes").html() == "")
	    {
	        $("#m_nodes").load("../ASCX/MobileNode.aspx");
	    }
	}
    //-----内容推送
	function ShowSelNode()
	{
	    comdiag.maxbtn=false;
	    ShowComDiag("/Common/NodeList.aspx?Source=content", "请选择需推送的节点<input type='button' value='确定' onclick='SurePush();' class='btn btn-primary'>");
	}
	function SurePush()
	{ 
	    var content=comdiag.iframe.contentWindow;
	    content.SureFunc();
	}
	function PageCallBack(action, vals, pval) 
	{
	    var ids="";
	    for (var i = 0; i < vals.length; i++) {
	        ids += vals[i].nodeid + ",";
	    }
	    $("#pushcon_hid").val(ids);
	    ids=ids.replace(/ /g,"");
	    if(ids==""){alert("未选择需要推送的节点");return false;}
	    else{
	        $("#PushCon_Btn").click();
	        var mask=new ZL_Dialog();
	        mask.ShowMask("正在推送文章中");
	    }
	}
	var nid="<%Call.Label("{$GetRequest(NodeID)$}");%>";
	if(nid==11||nid==19||nid==20||nid==21||nid==22||nid==23||nid==24||nid==26||nid==47)
	{
		$(".noshe").remove();
	}
	else
	{
		$(".isshe").remove();
	}
</script>
</div>
</asp:Content>