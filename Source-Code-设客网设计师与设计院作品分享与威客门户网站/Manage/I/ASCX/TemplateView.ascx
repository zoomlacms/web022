<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_TemplateView, App_Web_qant4ybz" %>
<div class="template">
    <%--<div class="template_title"><h4>黄页样式:</h4></div>--%>
    <ul class="list-unstyled">
    <asp:Repeater runat="server" ID="Temp_RPT" >
    <ItemTemplate>
    <li class="padding5">
    <div data-tlpname="<%#Eval("TemplateUrl") %>" data-tlpid="<%#Eval("TemplateID") %>" class="Template_box">
    <div class="tempthumil"><a href="javascript:;" onclick="CheckTlp(this,'<%#Eval("TemplateID") %>','<%#Eval("TemplateUrl") %>')" title="点击进入模板管理"><img onmouseover="this.style.border='1px solid #9ac7f0';" onerror="this.src='/UploadFiles/nopic.gif'" onmouseout="this.style.border='1px solid #eeeeee';" alt="点击进入模板管理" style="width: 100%;" src="<%#Eval("TemplatePic") %>"></a></div>             
    <span class="pull-left"><a href="javascript:;"><%#Eval("TemplateTitle") %></a></span>
    </span>
    <div class="clearfix"></div>
    </div>        
    </li>
    </ItemTemplate>    
    </asp:Repeater>
    </ul>
</div>
<asp:HiddenField ID="TempleID_Hid" runat="server" />
<asp:HiddenField ID="TempleUrl_Hid" runat="server" />
<script>
    //选中模板样式
    function CheckTlp(obj, name, tlp) {
        $('.Template_box').removeClass('tlp_active');
        var $box = $(obj).closest(".Template_box");
        $box.addClass("tlp_active");
        $("#TempleID_Hid").val(name);
        $("#TempleUrl_Hid").val(tlp);
        if (OnTemplateViewCheck)//模板选择事件
        { OnTemplateViewCheck(tlp) }
    }
    //初始选择样式
    function initTlp() {
        if ($("#TempleID_Hid").val() != "")
            $("[data-tlpid='" + $("#TempleID_Hid").val() + "']").addClass("tlp_active");
        //else {
        //    $("[data-tlpid]:first").addClass("tlp_active");
        //    $("#TempleID_Hid").val($("[data-tlpid]:first").data('tlpid'));
        //    $("#TempleUrl_Hid").val($("[data-tlpid]:first").data('tlpname'));
        //}
    }
    $().ready(function () {
        initTlp();
    });
</script>