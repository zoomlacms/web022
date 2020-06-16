<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Add_Papers_System, App_Web_nzoqprnw" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>编辑试卷</title>
<script type="text/javascript" src="/JS/OAKeyWord.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a href="/user">用户中心</a></li>
<li><a href='Papers_System_Manage.aspx'>试卷管理</a></li>
<li class="active"><%=Label2.Text %></li>
</ol>
</div>
<div class="container">
<asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
<table class="table table-striped table-bordered table-hover">
<tr>
<td class="td_l" align="right">
试卷名称：
</td>
<td class="bqright">
<asp:TextBox ID="txtPaperName" runat="server" class="form-control text_md" /><span class="rd_red">*</span>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
ErrorMessage="试卷名不能为空!" ForeColor="Red" ControlToValidate="txtPaperName"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
试卷类型：
</td>
<td class="bqright">
<asp:DropDownList ID="ddRtyle" runat='server' CssClass="form-control text_md">
<asp:ListItem Value="1" Selected="True">考试</asp:ListItem>
<asp:ListItem Value="2">练习</asp:ListItem>
<asp:ListItem Value="3">作业</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="Label4" runat="server" Text="出题方式："></asp:Label>
&nbsp;
</td>
<td class="bqright">
<asp:DropDownList ID="ddType" runat='server' CssClass="form-control text_md">
<asp:ListItem Value="1" Selected="True">固定试卷(手工)</asp:ListItem>
<asp:ListItem Value="2">固定试卷(随机)</asp:ListItem>
<asp:ListItem Value="3" >随机试卷</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
<tr class="tdbg">
<td align="right">
所属类别：
</td>
<td>
<asp:DropDownList ID="ddlC_ClassId" runat="server" CssClass="form-control text_md">
</asp:DropDownList>
</td>
</tr>
<tr>
<td class="text-right">关键字：</td>
<td>
    <div id="OAkeyword"></div>
    <asp:TextBox ID="TagKey_T" runat="server" style="display:none;"  CssClass="form-control text_300"></asp:TextBox> 
    <button type="button" onclick="ShowKeyWords()" class="btn btn-primary btn-sm">选择关键字</button>
    <span class="rd_green">(使用空格键或回车键分隔关键字，每个关键字长度不超过5个)</span>
</td>
</tr>
<tr>
<td align="right">
考试时间：
</td>
<td class="bqright">
<asp:TextBox ID="txtTime" runat="server" class="form-control text_md" Text="0"></asp:TextBox><span>分钟</span>
<span class="rd_green">(为0不限时间,否则到时自动提交)</span>
</td>
</tr>
<tr>
<td align="right">
有效时间：
</td>
<td class="bqright">
<asp:TextBox ID="txtBegionTime" runat="server" class="form-control text_md"   onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' });"></asp:TextBox>
<span>至</span>
<asp:TextBox ID="txtEndTime" runat="server" class="form-control text_md"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' });"></asp:TextBox>
</td>
</tr>
<tr>
<td align="right">
说明：
</td>
<td class="bqright">
<asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" class="form-control tarea_l"></asp:TextBox>
</td>
</tr>
<tr class="tdbgbottom">
<td></td>
<td>
<asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存试卷" OnClick="EBtnSubmit_Click" runat="server" />
<a href="Papers_System_Manage.aspx" class="btn btn-primary">返回列表</a>
</td>
</tr> 
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        #option_ul li{margin-top:3px;}
        #OAkeyword{ max-width:460px; height:36px; border:1px solid #ccc; display:inline-block;min-width:300px;padding-top:3px;}
        .tabinput{ border:none; padding-left:5px; height:30px; line-height:30px;}
        .radius{margin:2px;margin-top:20px;height:24px; line-height:24px; background:#eee; border:1px solid #ddd;border-radius:3px;padding:3px;float:none!important;}
        #errormes{z-index:9999;}
    </style>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script>
        var tabarr = [];
        $(function () {
            InitKeyWord($("#TagKey_T").val());
        });
        function InitKeyWord(value) {
            tabarr = [];
            $("#OAkeyword").html('');
            if ($("#OAkeyword").length > 0) {
                $("#OAkeyword").tabControl({
                    maxTabCount: 5,
                    tabW: 80,
                    onAddTab: function (value) {
                        tabarr.push(value);
                        console.log(tabarr);
                    },
                    onRemoveTab: function (removeval) {
                        for (var i = 0; i < tabarr.length; i++) {
                            if (tabarr[i] == removeval) {
                                tabarr.splice(i, 1);
                                break;
                            }
                        }
                    }
                }, value);
            }//关键词
        }
        function ShowKeyWords() {
            comdiag.reload = true;
            comdiag.maxbtn = false;
            comdiag.width = "none";
            ShowComDiag("/Common/SelKeyWords.aspx?type=3", "选择关键字");
        }
        function GetKeyWords(keystr) {
            tabarr = tabarr.concat(keystr.split(','));
            var values = "";
            var length = tabarr.length <= 5 ? tabarr.length : 5;
            for (var i = 0; i < length; i++) {
                if (IsDis(values, tabarr[i]))
                { values += tabarr[i] + ","; }
            }
            InitKeyWord(values);
            CloseComDiag();
        }
        //判断重复
        function IsDis(arrstr, value) {
            for (var i = 0; i < tabarr.length; i++) {
                if (("," + arrstr).indexOf("," + value + ",") > -1) {
                    return false;
                }
            }
            return true;
        }
    </script>
</asp:Content>