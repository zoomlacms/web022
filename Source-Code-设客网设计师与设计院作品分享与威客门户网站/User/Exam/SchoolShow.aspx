<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Default.master" inherits="User_Exam_SchoolShow, App_Web_nzoqprnw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>学校浏览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
    <li>您现在的位置：<a title="网站首页" href="/">逐浪CMS</a></li>
    <li><a href="/User/">用户中心</a></li>
    <li><a href="ClassManage.aspx">班级管理</a></li>
    <li class="active">学校浏览</li>
    </ol>
</div>
<div class="container btn_green">
<table class="table table-striped table-bordered table-hover">
    <tr>
        <td class="td_m text-right">学校名称:</td>
        <td>
            <asp:Label ID="SchoolName_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">所属省市:</td>
        <td>
            <asp:Label ID="SchoolAddress_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校类型:</td>
        <td>
            <asp:Label id="SchoolType_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校性质:</td>
        <td>
            <asp:Label ID="SchoolDis_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校微标:</td>
        <td>
            <asp:Label ID="SchoolIcon_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校信息:</td>
        <td>
            <asp:Label ID="SchoolInfo_L" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<div class="text-center"><a href="ClassManage.aspx" class="btn btn-primary">返回列表</a></div>
</div>
</asp:Content>


