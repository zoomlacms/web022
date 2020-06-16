<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Template_TemplateSetOfficial, App_Web_mq0353cm" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js"></script>    
<title>方案列表</title> </asp:Content><asp:Content runat="server" ContentPlaceHolderID="Content"><ol class="breadcrumb navbar-fixed-top" id="breadcrumb">
<li><a href="<%=CustomerPageAction.customPath2 %>>/Main.aspx">工作台</a></li>
<li><a href="<%=CustomerPageAction.customPath2 %>Config/SiteOption.aspx">系统设置</a></li>
<li class="active">从云端下载方案<a href="AddtemplateSet.aspx"> [发布当前站点方案] </a><a href="TemplateSet.aspx"> [返回本地方案列表] </a><a href="#" data-toggle="modal" data-target="#myModal1"> [使用前必读]</a></li>
</ol>
<h3 class="text-center" id="temp_title"><i class="fa fa-cloud-download"></i>云台方案列表<span>(注意：一旦启用新模板方案会覆盖原站点栏目与数据，使用前请先备份！)</span></h3>
<div class="template">
<ul class="list-unstyled">
<ZL:ExRepeater runat="server" ID="RPT" PageSize="14" PagePre="<li class='text-center'>" PageEnd="</li>" >
<ItemTemplate><li class="padding5">
<div class="Template_box Template_box2">
<div class="tempthumil tempthumil2">
<a href="DownTemplate.aspx?proname=<%#Eval("Project") %>" title="点击下载模板">
<img onmouseover="this.style.border='1px solid #9ac7f0';" onmouseout="this.style.border='1px solid #eee';" alt="<%#Eval("Project") %>" onerror="this.onerror=null;this.src='/Images/nopic.gif'" src='<%=serverdomain %>/Template/<%#Eval("TempDirName") %>/view.jpg'></a></div>
<span class="pull-right"><a href="DownTemplate.aspx?proname=<%#Eval("Project") %>" title="下载模板"><i class="fa fa-cloud-download"></i></a><a href='<%=serverdomain %>/Template/<%#Eval("TempDirName") %>/Bview.jpg' class="lightbox" title="大图预览"><i class="fa fa-search-plus"></i></a></span>
<span class="pull-left"><a href="DownTemplate.aspx?proname=<%#Eval("Project") %>" title="<%#Eval("Project") %>"><%#Eval("Project") %></a></span>
<ul class="list-unstyled text-center">
<li class="col-xs-6"><i class="fa fa-user"></i> <%#Eval("Author") %></li>
<li class="col-xs-6"><i class="fa fa-rmb"></i> 免费</li> 
</ul>
</div>
</li>
</ItemTemplate>    
<FooterTemplate>
<div class="clearfix"></div>
</FooterTemplate> </ZL:ExRepeater>
</ul>
</div> 
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h4 class="modal-title" style="font-family:'Microsoft YaHei'" id="myModalLabel">免费云方案下载</h4>
</div>
<div class="modal-body">
<p style="line-height:24px;">
为了让人人都建好网站，我们免费提供模板方案。<br />
可从云端免费下载云方案，每个方案均是一个完整的网站，包括完整的模板、栏目结构、标签及模型等等。<br />
因是完整网站方案下载并需要校验版本信息，需您稍候几分钟，请耐心等待！
</p>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div></asp:Content><asp:Content runat="server" ContentPlaceHolderID="ScriptContent"><script>
$(document).ready(function () {
	base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
	$(".lightbox").lightbox({
		fitToScreen: true,
		imageClickClose: false
	});
});
</script>
</asp:Content>