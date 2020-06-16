<%@ page language="C#" autoeventwireup="true" inherits="Plat_Group_CompDetail, App_Web_wmzrct11" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUps" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>公司详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Comp_Content" class="container-fluid">
        <div id="Comp_Head">
            <ol class="breadcrumb"><li><a href="/">首页</a></li><li><a href="/Plat/Blog/">能力中心</a></li><li class="active">公司信息</li><div class="clearfix"></div></ol>
        </div>
        <div id="Comp_Body">
            <table class="table table-bordered table-hover table-striped">
                <tr>
                    <td class="menu">公司名称：</td>
                    <td><asp:TextBox runat="server" onkeydown="return GetEnterCode('focus','CreateTime_T');" ID="CompName_T" CssClass="form-control text_md"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="menu">创建人：</td>
                    <td><asp:TextBox runat="server"  ID="CompUser_T" CssClass="form-control text_md" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="menu">创建时间：</td>
                    <td>
                        <asp:TextBox runat="server" ID="CreateTime_T" onkeydown="return GetEnterCode('focus','UrlCompLog');" CssClass="form-control text_md"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="menu">公司LOGO：</td>
                    <td>
                        <ZL:SFileUps ID="SFiles_Up" runat="server" />
                    </td>
                </tr>
                <tr>
                     <td class="menu">公司网址：</td>
                     <td><asp:TextBox runat="server" ID="CompHref_T" CssClass="form-control text_md" /></td>
                </tr>
                <tr>
                    <td class="menu">公司备注：</td>
                    <td>
                        <asp:TextBox runat="server" ID="CompDesc_T" onkeydown="return GetEnterCode('focus','TxtCompType');" CssClass="form-control text_md"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="menu">公司状态：</td>
                    <td><asp:TextBox runat="server" ID="CompStatus_T" onkeydown="return GetEnterCode('click','BtnSave');"  CssClass="form-control text_md"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <asp:Button ID="BtnSave" CausesValidation="false" runat="server" ToolTip="保存修改" Text="修改信息" OnClick="BtnSave_Click" CssClass="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择修改项');return false;}else{return confirm('你确定要修改选中内容吗？')}" /></td>
                </tr>
            </table>   
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<style type="text/css">
#Comp_Body {margin-top:15px;}
.menu{ text-align:right; width:100px;}  
#img_D{margin-left:30px;} 
</style>
    <script type="text/javascript">

        $().ready(function () {
            var compName = document.getElementById("CompName_T");
            compName.focus();
        });
        $("#up").click(function () {
            $("#photo").click();
        });
        $("#photo").click(function () {
            var la = document.getElementById("label");
            if (la.textContent == "") {
                alert("请先上传");
            } else {
                document.getElementById("img_D").style.display = "block";
                var img = document.getElementById("img");
                img.src = la.textContent;
                document.getElementById("label").style.display = "none";
            }
        });
        $("#close").click(function () {
            document.getElementById("img_D").style.display = "none";
        });
        function checkFile() {
            var filename = $("#File_Up").val();
            if (filename != "") {
                var checkex = ["jpg", "png", "gif", "ico"];
                var exname = filename.substr(filename.lastIndexOf(".")+1, filename.length - filename.lastIndexOf(".") + 1);
                for (var i = 0; i < checkex.length; i++) {
                    if (checkex[i] == exname)
                        return true;
                }
                alert("图片格式不正确！");
            } else {
                alert("没有选择图片！");
            }
            return false;
        }
    </script>
</asp:Content>
