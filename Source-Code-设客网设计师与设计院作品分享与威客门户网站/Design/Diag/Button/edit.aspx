<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Button_edit, App_Web_11ydzawi" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="/Design/res/css/edit/common.css" rel="stylesheet" />
    <title>按钮设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="panel panel-primary">
       <div class="panel-heading"><i class="fa fa-image"></i><span class="marginl5">按钮设置</span></div>
       <div class="panel-body" style="padding-left:0px;padding-right:0px;padding-top:0px;">
           <hr class="divider-long"/>
           <div class="control-section-divider labeled">按钮样式</div>
           <hr class="divider-long"/>
           <div class="setting-row">
               <div><label class="row-title">按钮文本</label></div>
               <input type="text" id="value_t" class="form-control" />
           </div>
       </div>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        var editor = { id: "<%:Request.QueryString["ID"]%>", dom: null, model: null, scope: parent.editor.scope };
        $(function () {
            editor.model = top.page.compList.GetByID(editor.id);
            editor.dom = editor.model.instance;
            $("#value_t").val(editor.model.dataMod.value);
            $("#value_t").blur(function () {
                editor.model.dataMod.value = this.value;
                editor.scope.$digest();
            });
        });
    </script>
</asp:Content>
