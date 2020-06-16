<%@ page language="C#" autoeventwireup="true" inherits="Manage_User_UserManage, App_Web_3vlddosr" title="会员管理" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head" EnableViewState="false">
<title>会员管理</title>
<style>
.order_img {display:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li><li><a href='AdminManage.aspx'>用户管理</a></li><li><a href='UserManage.aspx'>会员管理</a><a href='AddUser.aspx' class='reds'>[添加会员]</a></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" class="padding5">
            <div class="input-group" style="float:left;">
		        <asp:DropDownList ID="OrderType_DP" runat="server" CssClass="form-control" style="width:120px;border-right:none;" AutoPostBack="true" OnSelectedIndexChanged="OrderType_DP_SelectedIndexChanged">
                  <asp:ListItem Value="Uid" Selected="True">用户ID</asp:ListItem>
		          <asp:ListItem Value="Addtime">注册时间顺序</asp:ListItem>
		          <asp:ListItem Value="descAddtime">注册时间倒序</asp:ListItem>
                    <asp:ListItem Value="AuthTime">最近登录</asp:ListItem>
                    <asp:ListItem Value="ActiveTime">最近活跃</asp:ListItem>
                    <asp:ListItem Value="EditPassTime">最近修改密码</asp:ListItem>
		        </asp:DropDownList>
		        <strong id="strtime" runat="server" visible="false">
		        <asp:TextBox ID="sTime_T" runat="server" style="border-right:none;width:180px;border-radius:0px;" placeholder="起始日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
		        <asp:TextBox ID="eTime_T" runat="server" style="width:180px;border-radius:0px;" placeholder="终止日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
		        </strong> <strong id="strgroup" runat="server" visible="true">
		        <asp:DropDownList ID="ddlGroup" runat="server" Width="150" DataTextField="GroupName" DataValueField="GroupID" CssClass="form-control"></asp:DropDownList>
		        </strong> <span class="input-group-btn" style="float:left;">
		        <asp:LinkButton runat="server" ID="Button1" OnClick="Button1_Click1" CssClass="btn btn-default"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
		        </span> 
            </div>
            	<div class="input-group" style="width: 280px;margin-left:5px;float:left;">
		        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Style="width: 90px;border-right:none;">
		          <asp:ListItem Selected="True" Value="UserName">会员名</asp:ListItem>
		          <asp:ListItem Value="UserID">ID</asp:ListItem>
		          <asp:ListItem Value="Email">Email</asp:ListItem>
		        </asp:DropDownList>
		        <asp:TextBox ID="IDName" runat="server" CssClass="form-control" style="width:150px;border-right:none;"></asp:TextBox>
		        <span class="input-group-btn">
		        <asp:LinkButton runat="server" ID="Button2" OnClick="Button2_Click" CssClass="btn btn-default"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
		        </span> </div>
	          <asp:DropDownList ID="ProvinceDP" runat="server" CssClass="form-control" Width="150" AutoPostBack="true" Visible="false"></asp:DropDownList>
        </div> 
</ol>
<div class="border" style="display: none">
<ul>
  <li>
	<div style="display: none"> 选择等级：
	  <asp:DropDownList ID="SelectGroup" runat="server" DataValueField="GroupID" DataTextField="OtherName" CssClass="x_input"></asp:DropDownList>
	  <asp:Button ID="Rank" runat="server" Text="设置等级" CssClass="btn btn-primary" OnClick="Rank_Click" />
	</div>
  </li>
</ul>
</div>
<div>
<table id="EGV" class="table table-striped table-bordered table-hover" >
  <tr>
	<td class="td_s"></td>
	<td><asp:LinkButton runat="server" ID="ID_A" CommandArgument="AscID" OnClick="OrderBtn_Click">ID<i class='glyphicon glyphicon-arrow-up order_img'></i></asp:LinkButton></td>
	<td>会员名</td>
    <td>真实姓名</td>
	<td>工号</td>
	<td>会员组</td>
	<td><asp:LinkButton runat="server" ID="Purse_A" CommandArgument="Purse" OnClick="OrderBtn_Click">资金<i class='glyphicon glyphicon-arrow-up order_img'></i></asp:LinkButton></td>
	<td><asp:LinkButton runat="server" ID="Addtime_A" CommandArgument="Addtime" OnClick="OrderBtn_Click">注册时间<i class='glyphicon glyphicon-arrow-up order_img'></i></asp:LinkButton></td>
	<td><asp:LinkButton runat="server" ID="point_A" CommandArgument="point" OnClick="OrderBtn_Click">积分<i class='glyphicon glyphicon-arrow-up order_img'></i></asp:LinkButton></td>
	<td><asp:LinkButton runat="server" ID="LoginTimes_A" CommandArgument="LoginTimes" OnClick="OrderBtn_Click">登录次数<i class='glyphicon glyphicon-arrow-up order_img'></i></asp:LinkButton></td>
	<td><asp:LinkButton runat="server" ID="AuthTime_A" CommandArgument="AscAuthTime" OnClick="OrderBtn_Click">最后登录时间<i class='glyphicon glyphicon-arrow-up order_img'></i></asp:LinkButton></td>
	<td>状态</td>
	<td>聚合认证</td>
	<td>操作</td>
  </tr>
  <ZL:Repeater runat="server" ID="RPT" PageSize="10" PagePre="<tr><td><label class='allchk_l'><input type='checkbox' id='AllID_Chk'>全选</label></td><td colspan='13'><div class='text-center'>" PageEnd="</div></td></tr>">
	<ItemTemplate>
	  <tr ondblclick="location='UserInfo.aspx?id=<%# Eval("UserID") %>';">
		<td><input type="checkbox" name="idchk" value='<%# Eval("UserID") %>' /></td>
		<td><%#Eval("UserID") %></td>
		<td><a href="UserInfo.aspx?id=<%# Eval("UserID") %>"><%#Eval("UserName") %></a></td>
        <td><%#Eval("Permissions") %></td>
		<td><%#Eval("WorkNum") %></td>
		<td><a href="UserManage.aspx?GroupID=<%#Eval("GroupID") %>"><%# GetGroupName(Eval("GroupID","{0}")) %></a></td>
		<td><%#Eval("Purse","{0:F2}") %></td>
		<td><%#Eval("RegTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
		<td><%#Eval("UserExp","{0:F2}") %></td>
		<td><%#Eval("LoginTimes") %></td>
		<td><%#Eval("LastLoginTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
		<td><%#GetStatus(Eval("Status","{0}")) %></td>
		<td><%#GetState(Eval("State","{0}")) %></td>
		<td><a href='UserModify.aspx?UserID=<%# Eval("UserID")%>&tabs=Tabs4'>权限</a> <a href='UserConfirm.aspx?uid=<%#Eval("UserID") %>&IsConfirm=<%#Eval("IsConfirm") %>'><%# GetConfirm(Eval("GroupID").ToString())%></a> <a href="javascript:void(0)" onclick="javascript:window.open('../../Space/Default.aspx?id=<%# Eval("UserID")%>')"></a> <a href='CertificateAuditInfo.aspx?UserID=<%# Eval("UserID")%>'>证件</a></td>
	  </tr>
	</ItemTemplate>
	<FooterTemplate></FooterTemplate>
  </ZL:Repeater>
</table>
</div>
  <div style="height: 10px;"></div>
  <asp:DropDownList ID="UserGroup_DP" CssClass="form-control" Width="150" runat="server" DataValueField="GroupID" DataTextField="GroupName"> </asp:DropDownList>
  <div class="btn-group">
          <asp:Button ID="btnLock" runat="server" Text="批量锁定" OnClick="btnLock_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-primary" />
    <asp:Button ID="btnNormal" runat="server" Text="批量解锁" OnClick="btnNormal_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-primary" />
    <asp:Button ID="GroupMove" runat="server" Text="批量移动" OnClick="GroupMove_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-primary" />
    <asp:Button ID="RenoVate" runat="server" Text="刷新用户" CssClass="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" OnClick="RenoVate_Click" />
    <asp:Button ID="Approve" runat="server" Text="认证用户" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-primary" OnClick="Approve_Click" />
    <asp:Button ID="ApproveFailure" runat="server" Text="取消认证" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-primary" OnClick="ApproveFailure_Click" />
         <asp:Button ID="btnDel" runat="server" Text="批量删除" OnClick="btnDel_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" class="btn btn-primary" />
    <asp:Button ID="Export" runat="server" Text="Excel导出" CssClass="btn btn-primary" OnClick="Export_Click" />
    <input class="btn btn-primary" type="button" onclick="inputuserinfo()" value="Excel导入" />
  </div>
  <asp:HiddenField ID="Search_Hid" runat="server" />
  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    $().ready(function () {
        $("#AllID_Chk").click(function () {//EGV 全选
            selectAllByName(this, "idchk");
        });

    })
    var diag = new ZL_Dialog();
    function inputuserinfo() {//Excel导入
        diag.title = "导入会员";
        diag.url = "InputUser.aspx";
        diag.maxbtn = false;
        diag.ShowModal();
    }
    function CloseDiaog() {
        diag.CloseModal();
    }
    function IsSelectedId() {
        var chkArr = $("#EGV").find("input[type=checkbox]:checked");
        if (chkArr.length > 0)
            return true;
        else
            return false;
    }
    function ShowOrderIcon(id) {
        $("#" + id).find(".order_img").show();
    }
    function displayToolbar() {
        var dr = document.getElementById("search");
        if (dr.style.display == "none") {
            dr.style.display = "block";
            $("#Search_Hid").val("1");
        }
        else {
            $("#Search_Hid").val("0");
            dr.style.display = "none";
        }
    }
    function open_title() {
        diag.title = "添加会员";
        diag.url = "AddUser.aspx";
        diag.maxbtn = false;
        diag.ShowModal();
    }
    $().ready(function ()
    {
        var searchFlag = $("#Search_Hid").val();
        if (searchFlag && searchFlag == "1") {
            displayToolbar();
        }
        $("#sel_btn").click(function (e) {
            if ($("#sel_box").css("display") == "none") {
                $(this).addClass("active");
                $("#sel_box").slideDown(300);
            }
            else {
                $(this).removeClass("active");
                $("#sel_box").slideUp(200);
            }
        });
    });
    HideColumn("5,6,7,8,9,10,11,12");
    
</script>
</asp:Content>