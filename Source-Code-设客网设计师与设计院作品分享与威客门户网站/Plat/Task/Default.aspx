<%@ page language="C#" autoeventwireup="true" inherits="Plat_Task_Default, App_Web_0ldkcreu" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>公司名称_任务中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid">
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">首页</a></li>
<li><a href="/Plat/Task/">任务中心</a></li>
<li class="active">我的任务</li>
</ol>
</div>
<a href="javascript:;" data-toggle="modal" data-target="#myModal" id="modal1" style="display:none;"></a>
<div  style="margin-top:10px;margin-bottom:10px;">
<div class="input-group nav_searchDiv" style="float:right;">
  <div class="task_top_opdiv" style="display:inline;">
	<%--            <div class="iconDiv active" title="我的项目">
			<span class="glyphicon glyphicon-briefcase"></span>
		</div>
		<div class="iconDiv" title="我的任务">
			<span class="glyphicon glyphicon-th-list"></span>
		</div>
		<div class="iconDiv" title="定时提醒">
			<span class="glyphicon glyphicon-time"></span>
		</div>--%>
	<div class="iconDiv" title="创建新任务" onclick="$('#modal1').click();"> <span class="glyphicon glyphicon-plus"></span> </div>
  </div>
  <asp:DropDownList runat="server"  CssClass="form-control" Style="width:120px; float:right; margin-top:0px;">
	<asp:ListItem Value="1" Selected="True">全部任务</asp:ListItem>
	<asp:ListItem Value="2">我负责的任务</asp:ListItem>
	<asp:ListItem Value="3">我参与的任务</asp:ListItem>
  </asp:DropDownList>
  <asp:TextBox runat="server" ID="searchText" style="float:right; margin-top:0px;" class="form-control" placeholder="请输入需要搜索的内容" />
  <span class="input-group-btn" style="bottom:3px;">
  <asp:LinkButton runat="server" CssClass="btn btn-default" ID="searchBtn" OnClick="searchBtn_Click"><span class="glyphicon glyphicon-search" style="color:black;"></span></asp:LinkButton>
  </span> </div>
<div style="clear:both;"></div>
</div>
<div class="task_content">
<div >
  <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" IsHoldState="false"
			class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
			OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
	<Columns>
	<asp:TemplateField HeaderText="">
	  <ItemTemplate>
		<input type="checkbox" value="<%#Eval("ID") %>" name="idChk" />
	  </ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="任务名">
	  <ItemTemplate> <a href="javascript:;" title="查看详情" onclick="ViewTaskDetail(<%#Eval("ID") %>);"><%#Eval("TaskName") %></a> </ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="到期日">
	  <ItemTemplate> <%#Convert.ToDateTime(Eval("EndTime")).ToString("yyyy年MM月dd日") %> </ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="负责人">
	  <ItemTemplate> <%#GetUserName(Eval("LeaderIDS").ToString()) %> </ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField  HeaderText="任务色彩">
	  <ItemTemplate> <span class="colorSpan_F <%#Eval("Color") %>" id="colorSpan_<%#Eval("ID") %>"  onclick="ShowColor(this)"> <span  class="colorSpan"></span> </span>
		<div class="ex_Color" onclick="HideColor()" data-id="<%#Eval("ID") %>"> <span class="colorSpan_F White" data-color="White"><span class="colorSpan"></span></span> <span class="colorSpan_F SkyBlue" data-color="SkyBlue"><span class="colorSpan"></span></span> <span class="colorSpan_F Purple" data-color="Purple"><span class="colorSpan"></span></span> <span class="colorSpan_F Pink" data-color="Pink"><span class="colorSpan"></span></span> <span class="colorSpan_F StoneYellow" data-color="StoneYellow"><span class="colorSpan"></span></span> <span class="colorSpan_F BrightYellow" data-color="BrightYellow"><span class="colorSpan"></span></span> </div>
	  </ItemTemplate>
	</asp:TemplateField>
	<asp:TemplateField HeaderText="操作">
	  <ItemTemplate>
		<asp:LinkButton ID="LinkButton" runat="server" CommandName="Del" CommandArgument='<%#Eval("ID") %>' OnClick="lk2_Click" OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">删除</asp:LinkButton>
	  </ItemTemplate>
	</asp:TemplateField>
	</Columns>
	<PagerStyle HorizontalAlign="Center"/>
	<RowStyle Height="24px" HorizontalAlign="Center" VerticalAlign="Top" />
  </ZL:ExGridView>
  <asp:Button runat="server" ID="DelBtn"  OnClientClick="return confirm('你确定要删除吗!');" OnClick="DelBtn_Click"  CssClass="btn btn-primary" Text="批量删除" />
</div>
</div>
<!--模态框弹出-->
<div class="modal fade" id="myModal">
<div class="modal-dialog">
  <div class="modal-content">
	<div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	  <h4 class="modal-title">添加新任务</h4>
	</div>
	<div class="modal-body">
	  <table class="table table-bordered">
		<tr>
		  <td>任务名称：</td>
		  <td><asp:TextBox  runat="server" ID="TaskName_T" class="form-control required"/>
			<span id="AddSpanColor" class="colorSpan_F White"  style="top:10px;" ><span class="colorSpan"></span></span></td>
		</tr>
		<tr>
		  <td>主负责人：</td>
		  <td><input type="text" id="LeaderIDS_T" class="form-control required"/>
			<input type="button" value="选择" onclick="selRuser();" class="btn btn-primary " style="margin-left:5px;" />
			<asp:HiddenField runat="server" ID="LeaderIDS_Hid" /></td>
		</tr>
		<tr>
		  <td>参与成员：</td>
		  <td><input type="text" id="PartTakeIDS_T"class="form-control required"/>
			<input type="button" value="选择" onclick="selCuser();" class="btn btn-primary " style="margin-left:5px;"/>
			<asp:HiddenField runat="server" ID="PartTakeIDS_Hid" /></td>
		</tr>
		<tr>
		  <td>任务详情：</td>
		  <td><asp:TextBox runat="server" ID="TaskContent_T" CssClass="form-control" /></td>
		</tr>
		<tr>
		  <td>截止日期：</td>
		  <td><asp:TextBox runat="server" ID="EndTime_T" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm'});" CssClass="form-control required date" /></td>
		</tr>
		<tr>
		  <td>任务颜色：</td>
		  <td><span class="colorSpan_F White" onclick="SaveColor('White');"><span class="colorSpan"></span></span> <span class="colorSpan_F SkyBlue" onclick="SaveColor('SkyBlue');"><span class="colorSpan"></span></span> <span class="colorSpan_F Purple" onclick="SaveColor('Purple');"><span class="colorSpan"></span></span> <span class="colorSpan_F Pink" onclick="SaveColor('Pink');"><span class="colorSpan"></span></span> <span class="colorSpan_F StoneYellow" onclick="SaveColor('StoneYellow');"><span class="colorSpan"></span></span> <span class="colorSpan_F BrightYellow" onclick="SaveColor('BrightYellow');"><span class="colorSpan"></span></span>
			<asp:HiddenField runat="server" ID="AddColor_Hid" Value="White" /></td>
		</tr>
	  </table>
	</div>
	<div class="modal-footer">
	  <asp:Button runat="server" ID="TaskAdd_Btn" Text="添加" OnClick="TaskAdd_Btn_Click" OnClientClick="return VoteCheck()" CssClass="btn btn-primary"/>
	  <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
	</div>
  </div>
</div>
</div>
<!--model end-->
<div id="select" style="position: absolute; display: none; width: 800px; background: #FFF; border: 1px solid #ddd; top: 20%; left: 20%; z-index: 99999;">
<div id="Free_Div" runat="server" class="panel panel-primary">
  <div class="panel-heading">
	<h3 class="panel-title" style="text-align: center; width: 600px; float: left;">请选择用户</h3>
	<span style="float: right; cursor: pointer;" class="glyphicon glyphicon-remove" title="关闭" onclick="$('#select').hide();"></span>
	<div class="clearfix"></div>
  </div>
  <div class="panel-body">
	<iframe runat="server" id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 430px;" name="main_right" src="/Plat/Common/SelUser.aspx?Type=AllInfo" frameborder="0"></iframe>
  </div>
</div>
</div>
<div id="taskDetail_Div" style="height:100%;width:610px;position:fixed;bottom:0px;right:0px;border-left:1px solid #ddd;background-color:white;display:none;z-index:1031;" onfocus="console.log('11');" onblur="console.log('22');">
<iframe id="taskDetail_if" style="width:100%;height:100%; border:none;overflow:hidden;"></iframe>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/jquery.validate.min.js"></script>
<script type="text/javascript" src="/JS/JQueryAjax.js"></script>
<style type="text/css">
.iconDiv { width: 40px; height: 40px; border-radius: 50%; background-color: gray; text-align: center; cursor: pointer; float: left; margin-right: 5px; background-color: #1796BF; }
.iconDiv:hover { background-color: #0066cc; }
.iconDiv .active { background-color: #0066cc; }
.iconDiv .glyphicon { font-size: 1.5em; line-height: 40px; color: white; }
.colorSpan_F { padding: 2px; display: inline-block; border: 2px solid white; border-radius: 50%; margin-left: 5px; margin-right: 5px; cursor: pointer; position: relative; }
.colorSpan { width: 30px; height: 30px; border-radius: 50%; float: left; }
.colorSpan_F:hover { border: 2px solid yellow; }
.ex_Color { float: right; display: none; border: 1px solid #CCC; border-radius: 5px; background: #ddd; height: 50px; z-index: 4; padding-top: 5px; position: absolute; }
.White .colorSpan { background-color: white; border: 1px solid #ddd; }
.SkyBlue .colorSpan { background-color: #3bb3ff; border: 1px solid #0084ff; }
.Purple .colorSpan { background-color: #9f74ff; border: 1px solid #5d16ff; }
.Pink .colorSpan { background-color: #ff7c7c; border: 1px solid red; }
.StoneYellow .colorSpan { background-color: #ffc85d; border: 1px solid #ff9600; }
.BrightYellow .colorSpan { background-color: #fff65f; border: 1px solid #eee100; }
</style>
<script type="text/javascript">
	function VoteCheck() {
		var validator = $("#form1").validate({ meta: "validate" });
		return validator.form();
	}
	function ShowColor(obj) {
		$("#EGV .ex_Color").hide();
		$(obj).parent().parent().find(".ex_Color").show();
	}
	function HideColor() {
		$(event.srcElement).parent().parent(".ex_Color").hide();
	}
	function selRuser() {
		$("#select").css("margin-top", $(document).scrollTop());
		$("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#ReferUser");
		$("#User_IFrame")[0].contentWindow.ClearChk();
		$("#select").show();
	}
	function selCuser() {
		$("#select").css("margin-top", $(document).scrollTop());
		$("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#CCUser");
		$("#User_IFrame")[0].contentWindow.ClearChk();
		$("#select").show();
	}
	function UserFunc(json, select) {
		var uname = "";
		var uid = "";
		for (var i = 0; i < json.length; i++) {
			uname += json[i].UserName + ",";
			uid += json[i].UserID + ",";
		}
		if (uid) uid = uid.substring(0, uid.length - 1);
		if (select == "ReferUser") {
			$("#LeaderIDS_T").val(uname);//主负责人
			$("#LeaderIDS_Hid").val(uid);
		}
		if (select == "CCUser") {
			$("#PartTakeIDS_T").val(uname);//参与人员
			$("#PartTakeIDS_Hid").val(uid);
		}
		$("#select").hide();
	}
	$().ready(function () {
		$("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
		$("#chkAll").click(function () { selectAllByName(this, "idChk"); });
		$(".ex_Color .colorSpan_F").click(function () {
			var color = $(this).attr("data-color");
			var id = $(this).parent().attr("data-id").replace(" ","");
			PostChangeColor(id,color);
		});
	});
	function PostChangeColor(id,color)
	{
		$("#colorSpan_" + id).removeClass().addClass("colorSpan_F " + color);
		PostToCS("ChangeColor", id + ":" + color, function () { });
	}
	function SaveColor(color) {
		$("#AddSpanColor").addClass("colorSpan_F " + color);
		$("#AddColor_Hid").val(color);
	}
	function ViewTaskDetail(id) {
		$("#taskDetail_if").attr("src", "TaskDetail.aspx?id=" + id);
		$("#taskDetail_Div").show();
	}
	function HideTaskDiv() {
		$("#taskDetail_Div").fadeOut("fast");
	}
	ZoomLa.AjaxUrl = "<%:Request.RawUrl%>";
</script>
</asp:Content>