<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.AddContentpage, App_Web_q5rpj2um" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加内容</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.speDiag{width:500px;}
.specDiv{width:110px;padding-left:5px;}
.specDiv .spec{border:solid 1px #ccc;margin:5px;}
.specDiv .specname{text-align:left;padding-left:5px;display:inline-block}
.specDiv span{display:inline-block;float:right;line-height:20px;}
.tabinput{ border:none; padding-left:5px; height:30px; line-height:30px;}
.radius{margin:2px;height:24px; line-height:24px; background:#eee; border:1px solid #ddd;border-radius:3px;padding:3px;}
#OAkeyword{ max-width:460px; height:36px; border:1px solid #ccc; display:inline-block;min-width:300px;padding-top:3px;}
#Keywords {display: none;}
.fd_td_l { width:120px;}
.cmdgroup { display:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class=" margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Mycontent.aspx?NodeID=<%=  this.NodeID%>">投稿管理</a></li>
<li class="active"><asp:Label runat="server" ID="Title_L"></asp:Label></li> 
</ol> 
</div>
<div class="">       
<div class="tab-pane active" id="ConInfo">
<table id="mainTable" class="table table-bordered table_padding0 addcontent_modeltale" >
<tr>
<td style="overflow-x:hidden;" class="col-sm-1 col-xs-1 text-right"><asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label>&nbsp;&nbsp;</td>
<td class="col-sm-11 col-xs-11">
<asp:TextBox ID="txtTitle" style="background:url(/Images/bg1.gif) repeat-x;" CssClass="form-control m715-50" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')"  runat="server"></asp:TextBox>
<span class="vaild_tip">*</span>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="标题不能为空" ForeColor="Red" Display="Dynamic" />
<span id="span_txtTitle" name="span_txtTitle"></span>
<asp:HiddenField ID="ThreadStyle" runat="server" />
<div id="duptitle_div" class="alert alert-warning" style="position: absolute;margin-left:315px;display:none;">
<ul id='duptitle_ul'></ul>
</div>
</td>
</tr>
<tbody id="Sys_Fied" runat="server" style="display:none;">
<tr hidden>
<td class="text-right"><asp:Label ID="py" runat="server" Text="拼音缩写"></asp:Label>&nbsp;&nbsp;</td>
<td>
<asp:TextBox ID="PYtitle" CssClass="form-control m715-50" runat="server" />
</td>
</tr>
<tr id="spec_tr" hidden>
<td class="text-right">所属专题&nbsp;&nbsp;</td>
<td>
<div class="specDiv"></div>
<span id="specbtn_span"><asp:Literal ID="SpecInfo_Li" runat="server"></asp:Literal></span>
<asp:HiddenField ID="Spec_Hid" runat="server" />
</td>
</tr>
<tr runat="server" hidden>
<td class="tdbgleft" align="right"> 
<asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
&nbsp;
</td>
<td>                             
<div id="OAkeyword"></div>
<asp:TextBox ID="Keywords" runat="server" CssClass="form-control" /><span class="rd_green">(使用空格键或回车键分隔关键字,每个关键字长度不超过10个,每个中文计两个字符)</span>  
</td>                        
</tr>
<tr runat="server" hidden>
<td class="text-right"><asp:Label ID="Label4" runat="server" Text="副标题"></asp:Label>&nbsp;&nbsp;</td>
<td>
<asp:TextBox ID="Subtitle" CssClass="form-control m715-50" runat="server"></asp:TextBox>
</td>
</tr>
</tbody>
<asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
<tr id="attPic" runat="server" hidden>
<td class="text-right">主编辑器扩展图</td>
<td style="height:80px;">
<ul id="ThumImg_ul" class="preview_img_ul">
</ul>
<div class="clearfix"></div>
<select name="selectpic" id="selectpic" onchange="ShowPic(this.value)" class="form-control text_300">
<option value="" selected="selected">不指定附属图片</option>
</select>
</td>
</tr>
<tr id="CreateHTML" runat="server">
<td class="text-right">
<asp:Label ID="Label1" runat="server" Text="生成"></asp:Label>&nbsp;
</td>
<td>
<asp:CheckBox ID="quickmake" runat="server" Checked="false" Text="是否立即生成" />&nbsp;
</td>
</tr>
<tr><td></td><td>
<asp:HiddenField runat="server" ID="RelatedIDS_Hid" />
<asp:HiddenField runat="server" ID="nodename" />
<asp:Button runat="server" CssClass="btn btn-primary" ID="EBtnSubmit" Text="添加项目" OnClick="EBtnSubmit_Click" />
<asp:Button runat="server" CssClass="btn btn-primary" ID="DraftBtn" Text="存为草稿" OnClick="DraftBtn_Click" />
<a href="ContentManage.aspx?NodeID=<%=NodeID %>" class="btn btn-primary">返回列表</a>
<%--  <a href="javascript:;" id="toTop" onclick="pageScroll();"><i class="glyphicon glyphicon-upload"></i>Top</a>--%>
</td></tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
  var zlconfig = {
		updir: "<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>",
		duptitlenum: "<%=ZoomLa.Components.SiteConfig.SiteOption.DupTitleNum%>",
		modelid: "<%=ModelID%>"
	};
</script>
<script type="text/javascript" src="/JS/OAKeyWord.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/ICMS/tags.json"></script>
<script type="text/javascript" src="/JS/ZL_Content.js"></script>
<script>
    $().ready(function () {
        Tlp_initTemp();
    });
    //智能模板选择事件
    function OnTemplateViewCheck(value) {
        $("#TxtTemplate_hid").val(value);
    }
    //function CheckTlp(obj, name) {
    //    $('.Template_box').removeClass('tlp_active');
    //    var $box = $(obj).closest(".Template_box");
    //    $box.addClass("tlp_active");
    //    $("#TxtTemplate_hid").val(name);
    //}
</script>
</asp:Content>
