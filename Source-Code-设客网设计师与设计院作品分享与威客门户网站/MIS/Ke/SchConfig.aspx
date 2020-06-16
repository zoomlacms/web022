<%@ page language="C#" autoeventwireup="true" inherits="test_test, App_Web_tbedsbxg" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<title>基本设置</title>
<style type="text/css">
.table>tbody>tr>td{padding:0px;}
.item{cursor:pointer;height:120px;}
.hid{display:none;}
.content{height:85px; width: 100%;resize:none;text-align:center;border:none;}
.itemhead{height: 30px;line-height: 30px; width: 100%; background-color: rgba(0, 0, 0, 0.50); text-align: right; padding-right: 5px; color:white;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/">逐浪CMS</a></li>
        <li><a href="/User/">用户中心</a></li>
        <li><a href="ConfigList.aspx">配置列表</a></li>
        <li class="active">添加配置</li> 
    </ol>
</div>
    <div class="container btn_green">
    <table class="table table-bordered table-striped">
        <tr><td class="td_m">学校名称:</td>
            <td>
                <asp:TextBox runat="server" ID="SchoolName_T" CssClass="form-control text_md"/>
            </td></tr>
        <tr><td>学期名称:</td><td><asp:TextBox runat="server" ID="TermName_T" CssClass="form-control text_md" /></td></tr>
        <tr><td>课数配置:</td><td>
            <span>每周天数:</span>
            <asp:DropDownList runat="server" ID="WeekDay_DP" onchange="Render();">
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3">3</asp:ListItem>
                <asp:ListItem Text="4">4</asp:ListItem>
                <asp:ListItem Text="5" Selected="True">5</asp:ListItem>
                <asp:ListItem Text="6">6</asp:ListItem>
                <asp:ListItem Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <span>上午节数:</span>
            <asp:DropDownList runat="server" ID="Moring_DP" onchange="Render();">
                <asp:ListItem Text="0">0</asp:ListItem>
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3">3</asp:ListItem>
                <asp:ListItem Text="4" Selected="True">4</asp:ListItem>
                <asp:ListItem Text="5">5</asp:ListItem>
                <asp:ListItem Text="6">6</asp:ListItem>
                <asp:ListItem Text="7">7</asp:ListItem>
            </asp:DropDownList>
            <span>下午节数:</span>
            <asp:DropDownList runat="server" ID="Afternoon_DP" onchange="Render();">
                <asp:ListItem Text="0">0</asp:ListItem>
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3" Selected="True">3</asp:ListItem>
                <asp:ListItem Text="4">4</asp:ListItem>
            </asp:DropDownList>
            <span>晚上节数:</span>
            <asp:DropDownList runat="server" ID="Evening_DP" onchange="Render();">
                <asp:ListItem Text="0" Selected="True">0</asp:ListItem>
                <asp:ListItem Text="1">1</asp:ListItem>
                <asp:ListItem Text="2">2</asp:ListItem>
                <asp:ListItem Text="3">3</asp:ListItem>
                <asp:ListItem Text="4">4</asp:ListItem>
            </asp:DropDownList>
            </td></tr>
        <tr><td>学校类型:</td><td>
            <label><input type="radio" name="schoolType_rad" value="小学" />小学</label>
            <label><input type="radio" name="schoolType_rad" value="中学" checked="checked" />中学</label>
            <label><input type="radio" name="schoolType_rad" value="院校" />院校</label>
            <label>安排早晚自学:<asp:CheckBox runat="server" ID="StudySelf_Chk" /></label>
            <label>有自主选修课程:<asp:CheckBox runat="server" ID="SelectCourse_Chk" /></label>
        </td></tr>
    </table>
    <table id="maintable" class="table table-bordered">
        <thead style="text-align:center;"><tr><td class="td_s"></td><td>星期一</td><td>星期二</td><td>星期三</td><td>星期四</td><td>星期五</td><td>星期六</td><td>星期日</td></tr></thead>
        <tbody id="courseTable"></tbody>
    </table>    
    <div class="text-center">
        <asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-primary" OnClientClick="return CheckData();" OnClick="Save_Btn_Click" />
        <a href="ConfigList.aspx" class="btn btn-primary">返回</a>
    </div>
</div>
   <asp:HiddenField runat="server" ID="Json_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ICMS/ZL_EDU.js"></script>
    <script>
        var table = $("#courseTable");
        var config = JSON.parse($("#Json_Hid").val());
        var items = JSON.parse(config.items);//单元格Json
        $(function () {
            InitTable();
        })
        function CheckData() {
            if ($("#SchoolName_T").val().trim() == "") {
                alert("学校名称不能为空!")
                return false;
            }
            return SaveConfig();
        }
    </script>
</asp:Content>