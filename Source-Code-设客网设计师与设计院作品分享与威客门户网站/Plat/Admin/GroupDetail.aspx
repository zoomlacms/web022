<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_GroupDetail, App_Web_ilbgbtjb" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
 <title>部门详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb" style="margin-bottom:10px;">
<li><span class="glyphicon glyphicon-home" style="color: black; margin-right: 5px;"></span><a title="首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="管理中心" href="/Plat/Admin/">管理中心</a></li>
<li><a href="/Plat/Admin/GroupAdmin.aspx">部门管理</a></li>
<li class="active">
  <asp:Label runat="server" ID="GName_L"></asp:Label>
  <a href="javascript:;" style="margin-left:10px;color:red;" onclick="selCuser();">[添加成员]</a> <a href="javascript:;" style="margin-left:3px;color:red;" onclick="selRuser();">[添加管理员]</a> </li>
</ol>
<ul class="nav nav-tabs">
<li><a href="#tab0" data-toggle="tab" onclick="location='GroupDetail.aspx?<%:"ID="+Gid+"&MType=0" %>';">成员信息</a></li>
<li><a href="#tab0" data-toggle="tab" onclick="location='GroupDetail.aspx?<%:"ID="+Gid+"&MType=1" %>';">部门管理员</a></li>
<li><a href="#tab1" data-toggle="tab">部门信息</a></li>
</ul>
  <div class="tab-content" style="margin-top:5px;">
    <div id="tab0" class="tab-pane active">
      <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
	class="table table-striped table-bordered table-hover" EmptyDataText="该部门尚无成员!!"
	OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
        <asp:TemplateField HeaderText="<input type='checkbox' id='chkAll' />">
          <ItemTemplate>
            <input type="checkbox" name="idChk" value="<%#Eval("UserID") %>" />
          </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="成员名" DataField="TrueName" />
        <%--            <asp:BoundField HeaderText="职务" DataField=""/>--%>
        <asp:BoundField HeaderText="手机" DataField="Mobile" />
        <asp:TemplateField HeaderText="操作">
          <ItemTemplate>
            <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('你确定要移除吗!');" ToolTip="移除"> <span class="glyphicon glyphicon-trash" style="color:#7D98A1;"></span></asp:LinkButton>
            <a href="#" title="编辑"><span class="glyphicon glyphicon-pencil" style="color: #7D98A1;"></span></a> </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
      </ZL:ExGridView>
      <div style="margin-top: 10px;">
        <asp:Button runat="server" ID="BatRemove_Btn" Text="批量移除" CssClass="btn btn-primary" OnClick="BatRemove_Btn_Click" />
        <asp:Button runat="server" ID="BatAdd_Btn" OnClick="BatAdd_Btn_Click" Style="display: none;" />
      </div>
    </div>
    <div id="tab1" class="tab-pane">
      <table class="table table-bordered table-striped table-hover">
        <tr>
          <td style="width:120px;">部门名：</td>
          <td><asp:TextBox runat="server" ID="GName_T" CssClass="form-control" /></td>
        </tr>
        <tr>
          <td>创建人：</td>
          <td><asp:Label runat="server" ID="CUser_L"></asp:Label></td>
        </tr>
        <tr>
          <td>创建日期：</td>
          <td><asp:Label runat="server" ID="CDate_L"></asp:Label></td>
        </tr>
        <tr>
          <td>操作：</td>
          <td><asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click" CssClass="btn btn-primary" /></td>
        </tr>
      </table>
    </div>
  </div>
  <asp:HiddenField runat="server" ID="ManageIDS_Hid" />
  <asp:HiddenField runat="server" ID="MemberIDS_Hid" />
  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
$("#chkAll").click(function () { selectAllByName(this, 'idChk'); });
$().ready(function () { $(".nav-tabs li:eq(<%:MType%>)").addClass("active"); });
    var diag = new ZL_Dialog();
    function selRuser() {
        diag.title = "选择管理员";
        diag.maxbtn = false;
        diag.url = "/Plat/Common/SelUser.aspx?Type=AllInfo#ReferUser";
        diag.ShowModal();
    }
    function selCuser() {
        diag.title = "选择成员";
        diag.url = "/Plat/Common/SelUser.aspx?Type=AllInfo#CCUser";
        diag.maxbtn = false;
        diag.ShowModal();
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
	//$("#ManageIDS_T").val(uname);//管理员
	$("#ManageIDS_Hid").val(uid);
}
if (select == "CCUser") {
   //$("#MemberIDS_T").val(uname);//组成员
	$("#MemberIDS_Hid").val(uid);
}
diag.CloseModal();
$("#BatAdd_Btn").click();
}
</script>
</asp:Content>