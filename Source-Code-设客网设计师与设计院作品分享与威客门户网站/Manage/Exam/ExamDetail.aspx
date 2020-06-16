<%@ page language="C#" autoeventwireup="true" inherits="User_Questions_ExamDetail, App_Web_bsieufqv" enableviewstatemac="false" validaterequest="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/Plugins/Ueditor/ueditor.config.js" charset="utf-8"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js" charset="utf-8"></script>
<title>试卷批阅</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%--    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a href="/user">用户中心</a></li>
        <li><a href="QuestionManage.aspx">试题管理</a></li>
        <li class="active">评阅试卷</li>
    </ol>--%>
    <div class="panel panel-primary">
        <div class="panel-heading"><i class="fa fa-file-text-o"></i>
            <span class="margin_l5"><asp:Label runat="server" ID="PName_L"></asp:Label></span>
            <span><i class="glyphicon glyphicon-time"></i><span id="time_sp" class="margin_l5" data-time="0"></span></span>
        </div>
        <div class="panel-body">
            <asp:Repeater runat="server" ID="MainRPT" EnableViewState="false" OnItemDataBound="MainRPT_ItemDataBound">
                <ItemTemplate>
                    <div  style="margin-top:5px;">
                        <%#ZoomLa.BLL.Helper.StrHelper.ConvertIntegral(Container.ItemIndex+1) +"．"+Eval("QName")+"（有"+Eval("QNum")+"小题,共"+Eval("TotalScore")+"分）" %>
                    </div>
                    <asp:Repeater runat="server" ID="RPT" EnableViewState="false">
                        <ItemTemplate>
                            <div class="item" data-id="<%#Eval("p_id") %>" id="item_<%#Eval("p_id") %>">
                               <div class="content">
                                  <span><%#Container.ItemIndex+1+"．"+Eval("P_Title") %></span><%#GetContent() %>
                               </div>
                               <div class="submit">
                                  <ul class="submitul"><%#GetSubmit() %></ul><div class="clearfix"></div>
                               </div>
                               <div class="remark_div margin_t5">
                                   <div class="panel panel-info">
                                       <div class="panel-heading">
                                           <i class="fa fa-file-text-o"></i><span class="margin_l5">教师批阅</span>
                                           <a href="QuestView.aspx?ID=<%#Eval("Qid") %>" target="_blank" class="margin_l5">查看解析</a>
                                       </div>
                                       <div class="panel-body">
                                           <div>
                                               <label><input type="radio" value="1" <%#Eval("IsRight").ToString().Equals("1")?"checked=checked":"" %> name="isright_<%#Eval("ID") %>" />正确</label>
                                               <label><input type="radio" value="2" <%#Eval("IsRight").ToString().Equals("2")?"checked=checked":"" %> name="isright_<%#Eval("ID") %>" />错误</label>
                                               <%#GetScoreHtml() %>
                                           </div>
                                           <div>
                                               <div id="remark_<%#Eval("ID") %>" contenteditable='true' class='answerdiv remark'><%#Eval("Remark") %></div>
                                           </div>
                                       </div>
                                   </div>
                               </div><!--remark_div end-->
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="panel-footer text-center" >
             <asp:Button runat="server" ID="Submit_Btn" CssClass="btn btn-primary" Text="提交" OnClick="Submit_Btn_Click" OnClientClick="return PreMark();" />
             <a href="Papers_System_Manage.aspx" class="btn btn-primary">返回</a>
        </div>
    </div>
<div>
</div>
<div>
    <asp:HiddenField runat="server" ID="QuestDT_Hid" EnableViewState="false" />
    <asp:HiddenField runat="server" ID="Answer_Hid" EnableViewState="false" />
    <asp:HiddenField runat="server" ID="Remark_Hid" EnableViewState="false" />
</div>
<div id="answer_ue_div" style="display:none;">
    <textarea id="editor" style="height: 120px;"></textarea>
    <div id="ue_foot" style="text-align:center;padding:5px;">
        <input type="button" value="确定" class="btn btn-primary" onclick="LoadContent();" />
        <input type="button" value="关闭" class="btn btn-default" onclick="$('#answer_ue_div').hide();" />
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Plugins/Ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/getKfContent.js"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<script src="/JS/jquery-ui.min.js"></script>
<style type="text/css">
    label {font-weight:normal;}
    .item {border:1px solid #ddd; padding-left:20px;padding-top:5px;text-align:left;}
    .opitem:hover {color:#ff6a00;}
    .submitul li {float:left;margin-left:20px;}
    .answerdiv {border:1px dashed #ddd;height:50px;color:green;width:100%;padding:5px;height:80px;overflow:auto;}
    .answersp {border-bottom:1px solid #286090;padding:5px 15px 3px 15px; color:green;}
    .answersp p {display:inline;}
    #answer_ue_div {width:500px;position:absolute;top:300px;right:30%;border:1px solid #ddd;box-shadow:0 4px 20px 1px rgba(0,0,0,0.2);background:#ffffff;cursor:move;}
</style>
<script>
    var ue, $curAnswer, boundary = "|||", action = "<%=Action%>",exTime= parseInt("<%=ExTime%>"); force = <%=ExTime>0?"true":"false"%>;
    $(function () {
         ue = UE.getEditor('editor', {
            toolbars: [[
                'bold', 'italic', 'underline', '|', 'fontsize', '|', 'kityformula'
            ]],
            elementPathEnabled: false,wordCount: false
         });
         $("#answer_ue_div").draggable(
              { handle: '#ue_foot,#edui1_toolbarbox' });
         $(".remark").click(function () {
             $curAnswer = $(this);
             SetContent($curAnswer);
             $("#answer_ue_div").show();
         });
    })
    $(window).scroll(function(){
        var scrollTop = $(this).scrollTop();//已滚动多少
        var nowTop=$("#answer_ue_div").css("top");
        $("#answer_ue_div").css("top",scrollTop+300);
    });
</script>
<script src="/JS/ICMS/ZL_Exam_Paper.js"></script>
</asp:Content>