<%@ page language="C#" autoeventwireup="true" inherits="User_Exam_AddLargeQuestion, App_Web_cwcutwox" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加大型试题</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a href="/user">用户中心</a></li>
<li><a href="LargeQuestionManage.aspx">大题管理</a></li>
<li class="active">添加大题</li>
</ol>
</div>
<div class="container">
<table class="table table-striped table-bordered table-hover">
<tbody id="Tabs0">
<tr>
<td class="td_l">考点名称:</td>
<td>
<asp:DropDownList ID="ddlKnow" CssClass="form-control text_md" runat="server"></asp:DropDownList>
</td>
</tr>
<tr>
<td>试题标题:</td>
<td>
<asp:TextBox ID="txtP_title" runat="server" CssClass="form-control text_md" />
<span class="rd_red">*</span>
<asp:RequiredFieldValidator ID="RV1" runat="server" ErrorMessage="试题标题不能为空!" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtP_title" />
<asp:HiddenField ID="hfC_Id" runat="server"  />
</td>
</tr>
<tr>
<td>难度:</td>
<td>
<div style="width: auto; float: left">
<asp:RadioButtonList ID="rblDiff" runat="server" RepeatDirection="Horizontal" Height="22px"
Width="277px">
<asp:ListItem Selected="True" Value="1">基础</asp:ListItem>
<asp:ListItem Value="2">容易</asp:ListItem>
<asp:ListItem Value="3">中等</asp:ListItem>
<asp:ListItem Value="4">偏难</asp:ListItem>
<asp:ListItem Value="5">极难</asp:ListItem>
</asp:RadioButtonList>
</div>
</td>
</tr>
<tr>
<td>分数:</td>
<td><asp:TextBox ID="txtDefaSocre" runat="server" Text="5" CssClass="form-control text_xs"></asp:TextBox></td>
</tr>
<tr>
<td>题型:</td>
<td>
<asp:DropDownList ID="ddlType" runat="server" CssClass="form-control text_md">
<asp:ListItem Value="0">单选题</asp:ListItem>
<asp:ListItem Value="1">多选题</asp:ListItem>
<asp:ListItem Value="2">填空题</asp:ListItem>
<asp:ListItem Value="3">解析题</asp:ListItem>
</asp:DropDownList>
</td>
</tr>
<tr>
<td>题目:</td>
<td>
<asp:TextBox ID="Qids_T" Enabled="false" runat="server" CssClass="form-control text_300" TextMode="MultiLine" Height="150"></asp:TextBox>
<button class="btn btn-primary" type="button" onclick="SelQuestion()">选择题目</button>
</td>
</tr>
<tr class="tdbg" id="shumi">
<td>说明：</td>
<td><asp:TextBox runat="server" ID="shuming"  CssClass="form-control text_md" cols="40" rows="6" ></asp:TextBox></td>
</tr>
<tr>
<td></td>
<td><asp:Button ID="Save_B" runat="server" CssClass="btn btn-primary" OnClick="Save_B_Click" Text="保存试题" /></td>
</tr>
</tbody>
</table>
</div>
<asp:HiddenField ID="Qids_Hid" runat="server" />
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script>
function SelQuestion() {
ShowComDiag("/User/Exam/SelQuestion.aspx?type=1&islage=1&selids=," + $("#Qids_Hid").val() + ",", "选择题目")
}
function GetQuestion(qids,qtitle) {
$("#Qids_T").val(qtitle);
$("#Qids_Hid").val(qids);
CloseComDiag();
}
</script>
</asp:Content>

