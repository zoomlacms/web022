<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageSend, App_Web_rarj43kt" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>发送短消息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="pub"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Message.aspx">消息中心</a></li>
<li class="active">发送短消息</li>
<div class="clearfix"></div>
</ol>
<div class="btn-group">
<a href="MessageSend.aspx" class="btn btn-primary">新消息</a>
<a href="Message.aspx" class="btn btn-primary">收件箱</a>
<a href="MessageOutbox.aspx" class="btn btn-primary">发件箱</a>
<a href="MessageDraftbox.aspx" class="btn btn-primary">草稿箱</a>
<a href="MessageGarbagebox.aspx" class="btn btn-primary">垃圾箱</a>
<a href="Mobile.aspx" class="btn btn-primary">手机短信</a>
</div>
<div style="margin-top: 10px;">
<div class="us_seta">
<table class="table table-striped table-bordered table-hover">
<tr>
<td colspan="2" class="text-center">发送网站短消息</td>
</tr>
<tr>
<td align="right" width="25%">收件人：</td>
<td width="75%" align="left">
<asp:TextBox ID="TxtInceptUser"  runat="server" Width="333px" class="form-control"></asp:TextBox>
<asp:HiddenField ID="HiddenUser" runat="server" />
<button type="button" onclick="showdiv('div_share')" class="btn btn-primary">选择</button>
</td>
</tr>
<tr>
<td align="right">主题：</td>
<td align="left">
<asp:TextBox ID="TxtTitle" runat="server" Width="300px" class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="短消息主题不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">内容：</td>
<td align="left">
<asp:TextBox ID="EditorContent" runat="server" Rows="10" TextMode="MultiLine" CssClass="form-control" Height="400px"></asp:TextBox>
<asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td colspan="2" align="center">
<asp:HiddenField ID="HdnMessageID" runat="server" />
&nbsp;
<asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" class="btn btn-primary" />&nbsp;
<asp:Button ID="Button1" runat="server" Text="存草稿" class="btn btn-primary" OnClick="Button1_Click" />&nbsp;
<asp:Button ID="BtnReset" runat="server" Text="清除" class="btn btn-primary" OnClick="BtnReset_Click" />
</td>
</tr>
</table>
<div align="center"></div>
</div>
<div id="div_share" class="panel panel-primary" style="display: none; position: absolute; z-index: 1000;">
<div class="panel-heading">
<span class="glyphicon glyphicon-remove pull-right" onclick="hidediv()" title="关闭"></span>
<h3 class="panel-title">选择会员</h3>
</div>
<div class="panel-body">
<iframe id="main_right" style="z-index: 1000; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: auto;" name="main_right" src="/MIS/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
</div>
</div>
<div class="alert alert-success">
提示：系统支持以MessageSend.aspx?userid=[用户ID]（或username=[用户名]）&title=[发送主题]&content[发送内容]方式GET将内容传值发送，如：MessageSend.aspx?userid=2&title=默认主题&content=默认内容。
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script>
        var flag = "";
        var uid = "";
        var cuid = "";
        function showdiv(div_id, f) {
            $("#main_right").attr("src", "/MIS/OA/Mail/SelUser.aspx?SUID=" + uid);
            flag = f;
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight - 400) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: h, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function showdiv1(div_id) {
            $("#main_right").attr("src", "/MIS/OA/Mail/SelUser.aspx?Type=1&UID=" + uid + "&CUID=" + cuid);
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight - 800) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: h, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        //组名外加[],用户名则不加，用,隔开
        function seluser(groupJson, userJson) {
            var n = "";
            uid = "";
            //for (var i = 0; i < groupJson.length; i++)
            //{
            //    n += "[" + groupJson[i].Gname + "],";
            //}
            for (var i = 0; i < userJson.length; i++) {
                n += userJson[i].Uname + ",";
                uid += userJson[i].Uid + ",";
            }
            n = n.substring(0, n.length - 1);
            uid = uid.substring(0, uid.length - 1);
            $("#TxtInceptUser").val(n);
            $("#HiddenUser").val(uid);
        }
        function seluser1(groupJson, userJson) {
            var n = "";
            cuid = "";
            //for (var i = 0; i < groupJson.length; i++)
            //{
            //    n += "[" + groupJson[i].Gname + "],";
            //}
            for (var i = 0; i < userJson.length; i++) {
                n += userJson[i].Uname + ",";
                cuid += userJson[i].Uid + ",";
            }
            cuid = cuid.substring(0, cuid.length - 1);
            n = n.substring(0, n.length - 1);
            $("#TextBox1").val(n);
            $("#HiddenCCUser").val(cuid);
        }
        function hidediv() {
            $("#div_share").hide("fast");
        }
    </script>
</asp:Content>
