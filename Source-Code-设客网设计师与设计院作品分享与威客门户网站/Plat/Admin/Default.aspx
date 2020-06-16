<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_Default, App_Web_ilbgbtjb" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.oaul { margin-top: 5px; }
.oaul li { float: left; display: inline-block; cursor: pointer; list-style-type: none; margin-right: 10px; }
.app{padding:5px;}
.cdiv { height:100%; text-align:center; padding-top:35%; }
.cdiv span { color: white; font-size: 1.5em; }
</style>
<title>管理中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">能力中心</a></li>
<li><a href="/Plat/Admin/">管理中心</a></li>
</ol>
<div class="container-fluid">
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #FE7906;" title="用户管理" class="cdiv" onclick="location='UserManage.aspx';">
            <span class="glyphicon glyphicon-folder-open" style="margin-right: 10px;"></span><br /> <span>用户管理</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #004B9B;" title="角色权限" class="cdiv" onclick="location='UserRole.aspx';">
            <span class="glyphicon glyphicon-file" style="margin-right: 10px;"></span><br /> <span>角色权限</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #74B512;" class="cdiv" title="公司信息" onclick="location='/Plat/Group/CompDetail.aspx';">
            <span class="glyphicon glyphicon-folder-close" style="margin-right: 10px;"></span><br /> <span>公司信息</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #A43AE3;" class="cdiv" title="部门管理" onclick="location='/Plat/Admin/GroupAdmin.aspx';">
            <span class="glyphicon glyphicon-book" style="margin-right: 10px;"></span><br /> <span>部门管理</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #22AFC2;" class="cdiv" title="文库管理">
            <span class="glyphicon glyphicon-hdd" style="margin-right: 10px;"></span><br /> <span>文库管理</span>
        </div>
    </div>
</div>
<script>
    $().ready(function () {
        $(".app").height($(".app").width());
        window.onresize = function () {
            $(".app").height($(".app").width());
        }
    });
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    
</asp:Content>