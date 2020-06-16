<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_PunchManage, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>打卡领取奖励</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">打卡奖励</li>
</ol>
</div>
<div class="container">
<div align="center" style="width: 200px; height: 200px; line-height: 200px">
<asp:LinkButton ID="su" CssClass="btn btn-primary" runat="server" PostBackUrl="~/User/Info/PunchManage.aspx?menu=sub">打卡领取奖励</asp:LinkButton>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function oper(val) {
            if (val == -1) {
                alert("对不起,您今天已打卡");
            }
            if (val == 0) {  //系统设置为不奖励
                alert("对不起,该系统设置为不奖励");
            }
            if (val > 1) {
                alert("成功");
            }
            if (val == -2) {
                alert("打卡失败");
            }
        }
    </script>
</asp:Content>
