<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_Release, App_Web_q5rpj2um" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>发布页面</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Mycontent.aspx?NodeID=<%= Request.QueryString["NodeID"]%>">投稿管理</a></li>
<li class="active">批量添加</li>
</ol>
</div>
<div class="container">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div visible="false" runat="server">
<table width="50%" border="0" cellpadding="0" cellspacing="1" class="border" align="center">
<tr align="center">
<td>全选<asp:CheckBox ID="CheckBox2" runat="server"
OnCheckedChanged="CheckBox2_CheckedChanged" /></td>
<td><strong>字段名</strong></td>
<td><strong>字段别名</strong></td>
<td><strong>是否批量添加</strong></td>
</tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr align="center">
<td>
<asp:CheckBox ID="CheckBox1" runat="server" /></td>
<td><%#Eval("FieldName")%></td>
<td><%#Eval("FieldAlias")%></td>
<td><%# GetIslotsize(Eval("Islotsize", "{0}"))%></td>
</tr>
</ItemTemplate>
</asp:Repeater>
</table>
</div>
<div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
<table class="commtable addtable table table-striped table-bordered table-hover">
<asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
</table>
<table class="table table-bordered">
<tr>
<td style="text-align: center; padding-bottom: 15px; padding-top: 20px;" class="btn_green">
<asp:Label ID="lblstr" runat="server"></asp:Label>
<asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="立刻提交" OnClientClick="gettxt()" OnClick="Button1_Click" />
<input type="button" value="重置" class="btn btn-primary" onclick="$('form1').reset()" />
<input type="button" id="BtnBack" class="btn btn-primary" value="返　回" onclick="back()" />
</td>
</tr>
</table>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="HiddenField2" runat="server" />
<asp:HiddenField ID="HiddenField3" runat="server" />
<asp:HiddenField ID="HiddenField4" runat="server" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function addRow() {
            var row = document.getElementById("HiddenField1").value;
            var ModelID = document.getElementById("HiddenField2").value;
            var NodeID = document.getElementById("HiddenField3").value;
            var num = Number(row) + 1;
            window.location.href = 'Release.aspx?ModelID=' + ModelID + '&NodeID=' + NodeID + '&row=' + num;
        }
        function delRow() {
            var row = document.getElementById("HiddenField1").value;
            var ModelID = document.getElementById("HiddenField2").value;
            var NodeID = document.getElementById("HiddenField3").value;
            var num = Number(row) - 1;
            window.location.href = 'Release.aspx?ModelID=' + ModelID + '&NodeID=' + NodeID + '&row=' + num;
        }
        function back() {
            var NodeID = document.getElementById("HiddenField3").value;
            window.location.href = 'MyContent.aspx?NodeID=' + NodeID;
        }
        function gettxt() {
            var rows = Number(document.getElementById("HiddenField1").value);
            var bool = false;
            for (var i = 0; i < rows; i++) {
                var txt = document.getElementById("txt_" + i + "_Title").value;
                if (txt != "" && txt != null) {
                    bool = true;
                }
            }
            if (!bool) {
                alert('至少输入一个标题！');
                return;
            }
        }
        function OverImg(a) {
            if (a.src.indexOf('add') > -1)
                a.src = a.src.replace('add', 'add2');
            if (a.src.indexOf('dec') > -1)
                a.src = a.src.replace('dec', 'dec2');
        }
        function OutImg(a) {
            if (a.src.indexOf('add') > -1)
                a.src = a.src.replace('add2', 'add');
            if (a.src.indexOf('dec') > -1)
                a.src = a.src.replace('dec2', 'dec');
        }
    </script>
    <style>
        td {
            text-align: center;
        }
    </style>
</asp:Content>
