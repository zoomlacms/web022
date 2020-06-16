<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_Sentiment, App_Web_acot4puy" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
 <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>舆情监测</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="ani_icon text-center"> 
<div><i class="fa fa-rocket animated homeb201503"></i></div> 
<h1 class="animated homeb201505">舆情监测-做信息时代的主人</h1>
</div>
<div class="ani_func text-center">
<ul class="list-inline">
<li><a href="SenConfig.aspx" class="btn btn-primary">系统配置</a></li>
<li><a href="DataList.aspx" class="btn btn-primary">监测报表</a></li>
<li><a href="DataList.aspx" class="btn btn-primary">监测报告</a></li>
</ul>
</div> 
<script>
    $().ready(function () {
        setInterval("$('.ani_func').fadeIn()", 3000);
    })
</script>        

</asp:Content> 
