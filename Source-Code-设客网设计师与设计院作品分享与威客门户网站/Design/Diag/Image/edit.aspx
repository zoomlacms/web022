<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Image_edit, App_Web_d2zszc4l" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/Plugs/angular.min.js"></script>
    <link href="/Design/res/css/edit/common.css" rel="stylesheet" />
    <title>图片设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <div class="panel panel-primary">
       <div class="panel-heading"><i class="fa fa-image"></i><span class="marginl5">图片设置</span></div>
       <div class="panel-body" style="padding-left:0px;padding-right:0px;padding-top:0px;">
           <hr class="divider-long"/>
           <div class="control-section-divider labeled">图片样式</div>
           <hr class="divider-long"/>
           <div class="setting-row">
               <div><label class="row-title">上传图片</label></div>
               <asp:FileUpload runat="server" ID="SFile_UP" style="display:inline-block;" />
               <asp:Button runat="server" ID="SFile_Btn" CssClass="btn btn-primary" Text="上传" OnClick="SFile_Btn_Click" />
           </div>
           <hr class="divider-long"/>
           <div class="setting-row">
               <div><label class="row-title">手动输入</label></div>
               <asp:TextBox runat="server" ID="imgurl_t" class="form-control"></asp:TextBox>
           </div>
       </div>
   </div>
    <asp:HiddenField runat="server" ID="imgurl_hid" Value="" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        var editor = { id: "<%:Request.QueryString["ID"]%>", dom: null, model: null, scope: null};
        $(function () {
            editor.model = top.page.compList.GetByID(editor.id);
            editor.dom = editor.model.instance;
            $("#imgurl_t").val(editor.model.dataMod.src);
            $("#imgurl_t").blur(function () {
                updateUrl(this.value);
            });
            var url = $("#imgurl_hid").val();
            if (url != "") {
                $("#imgurl_t").val(url);
                updateUrl(url);
            }
        })
        function updateUrl(url) {
            editor.model.dataMod.src = url;
            parent.editor.scope.$digest();
        }
    </script>
</asp:Content>