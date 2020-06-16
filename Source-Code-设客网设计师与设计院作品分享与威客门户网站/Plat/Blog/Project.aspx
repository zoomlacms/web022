<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_Project, App_Web_od3mslno" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>项目管理</title>
<style type="text/css">
.prolist_ul { text-decoration: none; list-style-type: none; }
.prolist_ul li { cursor: pointer; float: left; width: 210px; height: 135px; margin-right: 5px; border-radius: 3px; border: 1px solid #c0c0c0; padding: 5px 0 0 5px; }
.pro_info_li:hover { background-color: #0088cc; border: 1px solid #0066cc; box-shadow: inset 0px 1px 1px rgba(0,0,0,0.075), 0px 0px 8px rgba(82,168,236,0.6); }
.pro_info_li { background-color: #1796BF; color: white; }
.pro_info_li a { color: white; }
.pro_info_op_div .glyphicon:hover { color: #0066cc; }
#add_Content { width: 560px; height: 580px; border: 1px solid #CCC; background-color: white; overflow: hidden; margin: auto; }
.img img { width: 40px; height: 40px; border-radius: 20px; }
.box_head { margin-top: 30px; }
.box_title { margin-top: 10px; }
.important { color: red; margin-left: 15px; }
.line { padding-top: 10px; }
#content { margin-top: 300px; }
</style>
<script type="text/javascript">
	function EditPro(id)
	{
		window.event.cancelBubble = true;
		$("#Detail_if").attr("src", "ProjectDetail.aspx?ID=" + id);
		$("#Detail_Div").show();

	}
	function IsDel()
	{
		window.event.cancelBubble = true;
	return confirm('确定要删除吗!!');
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid">
<ol class="breadcrumb">
  <li><a href="/">首页</a></li>
  <li><a href="/Plat/Blog/">能力中心</a></li>
  <li class="active"><a href="/Plat/Blog/Project.aspx">项目管理</a></li>
</ol>
</div>
<div>
<div id="head">
  <h4>我的项目</h4>
  <ul class="prolist_ul">
	<asp:Repeater runat="server" ID="ProList_Rep" OnItemCommand="ProList_Rep_ItemCommand" OnItemDataBound="ProList_Rep_ItemDataBound">
	  <ItemTemplate>
		<li class="pro_info_li" ondblclick="location='/Plat/Blog/?Pro=<%#Eval("ID") %>'" title="双击进入项目">
		  <div class="pro_info_op_div" style="text-align:right;padding-right:10px;"> <span class="glyphicon glyphicon-cog"  title="修改" onclick="EditPro(<%#Eval("ID") %>);"></span>
			<asp:LinkButton ID="Del_Link" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del" OnClientClick="return IsDel();"> <span class="glyphicon glyphicon-trash" title="删除"></span> </asp:LinkButton>
		  </div>
		  <div><span>项目名称：<%#Eval("Name") %></span></div>
		  <div><span>开始日期：<%#Convert.ToDateTime(Eval("StartDate")).ToString("yyyy年MM月dd日") %></span></div>
		  <div><span>结束日期：<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy年MM月dd日") %></span></div>
		  <div><span>创 建 人：<%#GetUName(Eval("UserID"))%></span></div>
		  <div><span>负 责 人：<%#GetUName(Eval("LeaderIDS")) %></span></div>
		</li>
	  </ItemTemplate>
	</asp:Repeater>
	<li style="border: 1px #CCC dashed;" title="创建项目" data-toggle="modal" data-target="#add_Content">
	  <div class="box_head">
		<div style="width: 80px; text-align: center; margin: auto;color: #ccc;"> <span class="glyphicon glyphicon-plus" style="font-size: 2em; "></span>
		  <div class="box_title">创建项目</div>
		</div>
	  </div>
	</li>
  </ul>
</div>
<div id="content">
  <h4>已完成项目</h4>
  <ul class="prolist_ul">
	<asp:Repeater runat="server" ID="Repeater1" OnItemCommand="ProList_Rep_ItemCommand">
	  <ItemTemplate>
		<li class="pro_info_li" ondblclick="location='/Plat/Blog/?Pro=<%#Eval("ID") %>'" title="双击进入项目">
		  <div class="pro_info_op_div" style="text-align:right;padding-right:10px;"> <span class="glyphicon glyphicon-cog"  title="修改" onclick="EditPro(<%#Eval("ID") %>);"></span>
			<asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del" OnClientClick="return IsDel();"> <span class="glyphicon glyphicon-trash" title="删除"></span> </asp:LinkButton>
		  </div>
		  <div><span>项目名称：<%#Eval("Name") %></span></div>
		  <div><span>开始日期：<%#Convert.ToDateTime(Eval("StartDate")).ToString("yyyy年MM月dd日") %></span></div>
		  <div><span>结束日期：<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy年MM月dd日") %></span></div>
		  <div><span>创 建 人：<%#GetUName(Eval("UserID"))%></span></div>
		  <div><span>负 责 人：<%#GetUName(Eval("LeaderIDS")) %></span></div>
		</li>
	  </ItemTemplate>
	</asp:Repeater>
  </ul>
</div>
<div style="clear:both;"></div>
<div style="display: none;" class="hidden_div"> <a href="javascript:;" data-toggle="modal" data-target="#myModal" id="Model_Btn"></a> <a href="javascript:;" data-toggle="modal" data-target="#fileup_div" id="FileUP_Btn"></a> <a href="javascript:;" data-toggle="modal" data-target="#forward_div" id="Forward_Btn"></a>
  <asp:HiddenField runat="server" ID="UserInfo_Hid" />
</div>
</div>
<div class="modal fade" id="add_Content">
<div class="modal-content" style="height:100%;border-radius:0px;">
  <div id="add_head">
	<p style="margin-left:15px; margin-top:20px;font-weight:bold; ">新建项目<span  data-dismiss="modal" class="glyphicon glyphicon-remove" style="color:#CCC; float:right; margin-right:10px; "></span></p>
  </div>
  <hr />
  <div id="add_body">
	<table >
	  <tr>
		<td class="line"><span class="important">*</span>项目名称:</td>
		<td class="line"><asp:TextBox runat="server" CssClass="form-control" ID="Name"></asp:TextBox></td>
	  </tr>
	  <tr>
		<td class="line"><span class="important">*</span>负 责 人:</td>
		<td class="line"><input type="text" id="LeaderIDS_T" class="form-control"/>
		  <input type="button" value="选择" onclick="selRuser();" class="btn btn-primary" style="margin-left:5px;" />
		  <asp:HiddenField runat="server" ID="LeaderIDS_Hid" /></td>
	  </tr>
	  <tr>
		<td class="line"><span class="important">*</span>项目成员:</td>
		<td class="line"><input type="text" id="PartTakeIDS_T" class="form-control"/>
		  <input type="button" value="选择" onclick="selCuser();" class="btn btn-primary" style="margin-left:5px;"/>
		  <asp:HiddenField runat="server" ID="PartTakeIDS_Hid" /></td>
	  </tr>
	  <tr>
		<td class="line"><span class="important">*</span>开始日期:</td>
		<td class="line"><asp:TextBox class="form-control" ID="StartDate" runat="server" onclick="WdatePicker();" Style="width: 150px;"></asp:TextBox>
		  <asp:CheckBox runat="server" ID="Begin_Chk" Checked="true" />
		  立即开始</td>
	  </tr>
	  <tr>
		<td class="line"><span class="important">*</span>结束日期:</td>
		<td class="line"><asp:TextBox class="form-control" ID="EndDate" runat="server" onclick="WdatePicker();" Style="width: 150px;"></asp:TextBox></td>
	  </tr>
	  <tr>
		<td class="line"><span style="margin-left:20px;"></span>是否公开:</td>
		<td class="line"><input type="radio" name="isOpen_rad" value="1" checked="checked" />
		  <span>是</span>
		  <input type="radio" name="isOpen_rad" value="0" />
		  <span>否</span></td>
	  </tr>
	</table>
  </div>
  <hr />
  <div>
	<asp:Button runat="server" ID="Add_Btn" Text="保存" OnClick="Add_Btn_Click" CssClass="btn btn-primary" style="margin-left:30px;" />
	<input type="button" value="关闭" class="btn btn-default"  />
  </div>
</div>
</div>
<div id="select" style="position: absolute; display: none; width: 800px; background: #FFF; border: 1px solid #ddd; top: 20%; left: 20%;z-index:9999;">
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
<div id="Detail_Div" style="height: 100%; width: 610px; position: fixed; bottom: 0px; right: 0px; border-left: 1px solid #ddd; background-color: white; display: none; z-index: 1031;" onfocus="console.log('11');" onblur="console.log('22');">
<iframe id="Detail_if" style="border: none; height: 100%; width: 100%; overflow: hidden;"></iframe>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
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
function ChildSelRuser()
{
    $("#select").css("margin-top", $(document).scrollTop());
    $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#ChildReferUser");
    $("#User_IFrame")[0].contentWindow.ClearChk();
    $("#select").show();
}
function ChildSelCuser()
{
    $("#select").css("margin-top", $(document).scrollTop());
    $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#ChildCCUser");
    $("#User_IFrame")[0].contentWindow.ClearChk();
    $("#select").show();
}
function UserFunc(json, select) {
    var uname = "",uid="";
    var $child = $("#Detail_if").contents();
    for (var i = 0; i < json.length; i++) {
        uname += json[i].UserName + ",";
        uid += json[i].UserID + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    if (select == "ReferUser") {
        $("#LeaderIDS_T").val(uname);//主负责人
        $("#LeaderIDS_Hid").val(uid);
    }
    else if (select == "CCUser") {
        $("#PartTakeIDS_T").val(uname);//参与人员
        $("#PartTakeIDS_Hid").val(uid);
    }
    else if (select == "ChildReferUser")
    {
        $child.find("#LeaderIDS_L").text(uname);
        $child.find("#LeaderIDS_Hid").val(uid);
    }
    else if (select == "ChildCCUser")
    {
        $child.find("#ParterIDS_L").text(uname);
        $child.find("#ParterIDS_Hid").val(uid);
    }
    $("#select").hide();
}
function HideMe() {
    $("#Detail_Div").fadeOut("fast");
}
</script>
</asp:Content>