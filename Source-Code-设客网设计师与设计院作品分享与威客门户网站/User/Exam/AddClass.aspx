<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_AddClass, App_Web_nzoqprnw" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
        <title>编辑班级</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField runat="server" ID="classid_Hid" />
    <div class="container margin_t5">
         <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/">逐浪CMS</a></li>
        <li><a href="/User/">用户中心</a></li>
        <li><a href="ClassManage.aspx">班级管理</a></li>
        <li class="active">编辑班级</li> 
        </ol>
</div>
    <div class="container btn_green">
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tabs0">
            <tr>
                <td class="td_m text-right">
                    班级名称:
                </td>
                <td>
                    <asp:TextBox ID="ClassName_T" runat="server" class="form-control text_300" ></asp:TextBox>
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="td_l text-right"><strong>所属学校:</strong></td>
                <td>
                    <asp:TextBox ID="SchoolName_T" runat="server" CssClass="form-control text_300"></asp:TextBox>
                    <button type="button" onclick="ShowSchool()" class="btn btn-primary">填写或选择学校</button>
                </td>
            </tr>
            <tr>
            <td class="text-right"><strong>班级年级:</strong></td>
                <td>
                    <asp:DropDownList ID="GradeList_Drop" CssClass="form-control text_300" runat="server" DataTextField="GradeName" DataValueField="GradeID"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="text-right"><strong>最大人数:</strong></td>
                <td>
                    <asp:TextBox ID="ClassNum_T" Text="100" runat="server" CssClass="form-control text_x int"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right"><strong>是否毕业:</strong></td>
                <td>
                    <input type="checkbox" class="switchChk" runat="server" id="IsDone_Check" />
                </td>
            </tr>
            <tr>
                <td class="text-right">班级微标:</td>
                <td>
                    <asp:TextBox ID="ClassIcon_T" runat="server" CssClass="form-control text_300"></asp:TextBox>
                    <span class="spanl_30" style="margin-right:5px;"><span id="imgIcon"></span><=</span>
                     <button type="button" onclick="ShowIcon()" class="btn btn-primary">图片地址或奥森图标</button>
                </td>
            </tr>
            <tr>
                <td class="text-right">班级宣言:</td>
                <td>
                    <asp:TextBox ID="ClassDeailt_T" runat="server" CssClass="form-control text_300" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加班级" runat="server" OnClientClick="return CheckData();" OnClick="EBtnSubmit_Click" />
                &nbsp;
                <a href="ClassManage.aspx" class="btn btn-primary">返回列表</a>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript">
        var typediag = new ZL_Dialog();
        function Openwin() {
            typediag.title = "选择分类";
            typediag.url = "SelectCourse.aspx";
            typediag.ShowModel();
        }
        $(function () {
            ZL_Regex.B_Num('.int');
        });
        function CheckData() {
            if ($("#SchoolList_Drop option:checked").val() == "0") { alert("请选择学校!"); return false; }
            if ($("#ClassName_T").val().trim() == "") { alert("班级名称不能为空!"); $("#ClassName_T").focus();return false;}
            return true;
        }
        function ShowIcon() {
            comdiag.ajaxurl = "/Common/icon.html";
            comdiag.title = "选择奥森图标";
            comdiag.ShowModal();
        }
        function LoadIcon() {
            $("[name=glyphicon]").click(function () {
                $("#ClassIcon_T").val($(this).prev().prev().attr("class"));
                $("#imgIcon").attr("class", $(this).prev().prev().attr("class"));
                CloseComDiag();
            });
        }
        //选择学校
        function ShowSchool() {
            typediag.url = "SelSchool.aspx";
            typediag.title = "选择学校";
            typediag.reload = true;
            typediag.width = "none";
            typediag.ShowModal();
        }
        function CloseDiag() {
            typediag.CloseModal();
        }
        function GetSchoolName(name) {
            $("#SchoolName_T").val(name);
            typediag.CloseModal();
        }
    </script>
</asp:Content>