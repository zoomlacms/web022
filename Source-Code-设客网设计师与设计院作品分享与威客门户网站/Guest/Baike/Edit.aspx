<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Baike/Baike.master" clientidmode="Static" inherits="Guestbook_BaikeEdit, App_Web_mas3ijli" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>编辑词条-<%:Call.SiteName %>百科</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<ol class="breadcrumb margin_top10">
    <li>您的位置：<a href="/">网站首页</a></li>
    <li><a href="/Baike" target="_self">百科中心</a></li>
    <li class="active">创建词条</li>
</ol>
<div class="baike_tips">欢迎您进入词条创建页！开始创建前，建议您参考<a href="#">编辑指南</a>，学习如何创建一个高质量的词条。 </div>
<div class="baike_tit">
<h1><asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF">百科</asp:Label></h1>
<span><a href="#">如何为感兴趣的词条贡献有意义的内容？</a></span>
</div>
<div>
<div class="tip"><span style="color: #3171af;">所属分类</span></div>
<div class="list-group catediv" id="catediv1">
<asp:Repeater runat="server" ID="RPT1">
<ItemTemplate>
<a href="javascript:;" class="list-group-item" data-id="<%#Eval("GradeID") %>"><%#Eval("GradeName") %>
<%#Convert.ToInt32(Eval("ChildCount"))>0?"<span class='glyphicon glyphicon-chevron-right'></span>":"" %>
</a>
</ItemTemplate>
</asp:Repeater>
</div>
<div class="list-group catediv" id="catediv2"></div>
<div class="list-group catediv" id="catediv3"></div>
<asp:HiddenField runat="server" ID="Cate_Hid" />
<asp:HiddenField runat="server" ID="txtBtype_Hid" />
<asp:TextBox runat="server" ID="txtBtype" CssClass="form-control text_md"></asp:TextBox>
<a href="#">什么是所属分类?</a>
</div>
<div>     
<div id="inputShowSummaryDiv" style="padding: 0 0 10px; display: none;">
<div id="canEditSummary" style="display: none">
</div>
<div id="cardSummary">
</div>
</div>
<div id="inputShowMainInfoDiv" style="display: none;">
<div id="canEditMainInfo">
</div>
<div id="inputMainInfoDivContent">
</div>
</div>
<div style="position: relative">
<div id="loading">
</div>
<asp:TextBox runat="server" TextMode="MultiLine" ID="code" name="message" style="height:300px;"></asp:TextBox>
<%=Call.GetUEditor("code",2) %>
<div class="tip">(不超过20000字，如有疑问请查看<a href="#">使用帮助</a>)</div>
<span class="gray">
    <input type="hidden" id="partContentNum" name="partContentNum" value="11092">
    <input type="hidden" id="curPicNum" name="curPicNum" value="13">
    <script type='text/javascript'>
        var g_pcNum = G("partContentNum").value;
        function setPicNum() {
            if (window.editor) { editor.maxPicNum = G("curPicNum").value; }
        }
    </script>
</span>
</div>
<input id="lemmaclass" name="lemmaclass" value="法国,政坛,总统,法兰西第五共和国" type="hidden">
<script>            var templateGuide = templateGuide || {}; templateGuide.textEditType = 'part'</script>
<div class="btn"><input type="hidden" value=" 提 交 " name="editlemma"></div>
<div class="other_items">
<div class="tip"><span style="color: #3171af;">参考资料</span><a href="#">如何使用参考资料 </a></div>
<div><asp:TextBox runat="server" ID="txtReference" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox></div>
<div><span style="color: #3171af;">扩展阅读</span><span>(不超过1000字)</span></div>
<div><asp:TextBox runat="server" ID="txtExtend" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox></div>
<div>
<p>请在提交编辑前确认以下事项:</p>
<span>
逐浪百科所有内容均需具有可靠来源能供读者查证。缺乏来源依据的内容会对读者造成误导。为保证这一原则，请您为编辑的内容提供参考资料以供查证。 
逐浪百科不欢迎任何形式的广告宣传。有关个人、公司或产品的宣传稿件，或者内容中含有推销或宣传的内容，都将被删除。 
感谢您在逐浪百科参与分享知识，亿万网友将因您的贡献而获益。
</span>
</div>
<div class="text-center">
<asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="btn btn-primary" OnClick="btnSubmit_Click"  OnClientClick="getCode()"/>
<input type="button" id="btnshow" class="btn btn-primary" value="预览" onclick="show()" />
</div>
<div style="display: none;" id="divSupplyment"><asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine" Height="120"></asp:TextBox></div>
<div class="clearfix"></div>        
</div>
</div>
</div>
<script type="text/javascript">
function show() {
getCode();
var s = document.getElementById("code").value;
var tittle = document.getElementById("lblTittle").innerHTML;
var d = document.getElementById("txtReference").value;
var f = document.getElementById("txtBtype").value;
var g = document.getElementById("txtExtend").value;
//alert(g);
window.open("Details.aspx?soure=show&tittle=" + tittle + "&codes=" + s + "&btype=" + f + "&extend=" + g + "&refer=" + d, 'newwindow', "");
}
</script>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
<input type="hidden" name="pretitle" value="" />
<input type="hidden" name="prelemma" value="" />
<input type="hidden" name="pretag" value="" />
<input type="hidden" name="prepic" value="" />
<input type="hidden" name="preref" value="" />
<input type="hidden" name="preview" value="preview">
<input type="hidden" name="preBeforeLemma" id="preBeforeLemma" value="">
<input type="hidden" name="preEndLemma" id="preEndLemma" value="">
<input type="hidden" name="preFlag" id="preFlag" value="">
<input type="hidden" value="" name="preExtData" />
<input type="hidden" value="" name="preSummaryImgId" />
<input type="hidden" value="" name="preSummaryImgInfo" />
<input type="hidden" name="preSummarySummary" value="" />
<input type="hidden" name="preExtDataType" value="" />
<div id="refData4Preview" style="display: none">
</div>
<br clear="all">
    <style type="text/css">
        .catediv { width:200px;height:400px;overflow-y:auto;display:inline-block;}
    </style>
<%--    <script src="/JS/Bkcommon.js" type="text/javascript"></script>
    <script src="/JS/Bkcore.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        function getCode() {
            var code = document.getElementById("code");
            var content = $(document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body).html();
            document.getElementById("code").value = content;
        }
    </script>
    <script>
        $(function () {
            $("#catediv1 a").click(function () {
                var id = $(this).data("id");
                $("#catediv2").html(""); $("#catediv3").html("");
                SelCate(id, 2);
            });
            CateBind();
        })
        function CateBind()
        {
            $(".catediv a").click(function () {
                var id = $(this).data("id");
                $("#txtBtype_Hid").val(id);
                $("#txtBtype").val($(this).text());
            })
        }
        function SelCate(gid, layer) {
            var $obj = $("#catediv" + layer);
            var liTlp = " <a href='javascript:;' class='list-group-item' data-id='@GradeID'>@GradeName"
                    + "@ChildCount</a>";
            var childTlp = "<span class='glyphicon glyphicon-chevron-right'</span>";
            $obj.html("");
            var gradelist = JSON.parse($("#Cate_Hid").val());
            for (var i = 0; i < gradelist.length; i++) {
                if (gradelist[i].ParentID == gid) {
                    var tlp = liTlp.replace("@GradeID", gradelist[i].GradeID).replace("@GradeName", gradelist[i].GradeName);
                    tlp = tlp.replace("@ChildCount", gradelist[i].ChildCount > 0 ? childTlp : "");
                    $obj.append(tlp);
                }
            }
            if (layer == 2) {
                $("#catediv2 a").click(function () {
                    var id = $(this).data("id");
                    $("#catediv3").html("");
                    SelCate(id, 3);
                });
            }
            CateBind();
        }
    </script>
</asp:Content>