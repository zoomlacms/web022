<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Background_AddBK, App_Web_wbsf4hqz" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>设置背景</title>
    <style type="text/css">
        .bg-panel-top {}
        .bg-panel-body {padding:10px;}
        .preset-list-section-list{list-style:none;margin:0;padding:0;}
        .preset-list-section-list .preset-list-item {display:inline-block;width:49%;cursor:pointer;margin-bottom:18px;}
        .preset-list-item .thumbnail{padding:2px;border:1px solid #fff;}
        .section-wrapper {display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="panel panel-default">
        <div class="panel-body" style="padding:0px;"><div class="bg-panel-top">
       <div class="text-center" style="padding-bottom:20px;">
          <hr class="divider-long" />
          <div class="control-section-divider labeled">设置背景</div>
          <hr class="divider-long" />
          <div class="ui-buttonset" style="padding-top:10px;">
            <input type="radio" id="radio1" name="bk_rad" value="color" class="ui-helper-hidden-accessible"><label for="radio1" class="ui-button ui-widget ui-state-default ui-button-text-only ui-corner-left" role="button" aria-disabled="false" aria-pressed="false"><span class="ui-button-text">小图背景</span></label>
            <input type="radio" id="radio2" name="bk_rad" value="image" checked="checked" class="ui-helper-hidden-accessible"><label for="radio2" class="ui-button ui-widget ui-state-default ui-button-text-only" role="button" aria-disabled="false" aria-pressed="false"><span class="ui-button-text">背景图片</span></label>
            <input type="radio" id="radio3" name="bk_rad" value="video" class="ui-helper-hidden-accessible"><label for="radio3" class="ui-button ui-widget ui-state-default ui-button-text-only ui-corner-left" role="button" aria-disabled="false" aria-pressed="false"><span class="ui-button-text">背景视频</span></label>
        </div>
      </div>
  </div>
  <div class="bg-panel-body">
      <div class="sections tab-content">
          <div id="colorTab" class="section-wrapper live-comps tab-pane">
              <div class="section-header">
                  <div class="title-line">
                      <div class="title">小图背景</div>
                  </div>
              </div>
               <ul class="preset-list-section-list">
                        <asp:Repeater runat="server" ID="RPTMinImg" EnableViewState="false">
                            <ItemTemplate>
                                <li class="preset-list-item" data-type="minimg" data-url="<%#Eval("Path") %>"><div class="thumbnail"><img src="<%#Eval("Path") %>" /></div></li>
                            </ItemTemplate>
                        </asp:Repeater>
               </ul>
             <div class="clearfix"></div>
          </div>
          <div id="imageTab" class="section-wrapper live-comps tab-pane active">
              <div class="section-header">
                  <div class="title-line">
                     <div class="title">背景图片</div>
                  </div>
                  <ul class="preset-list-section-list">
                        <asp:Repeater runat="server" ID="RPTImg" EnableViewState="false">
                            <ItemTemplate>
                                <li class="preset-list-item" data-type="image" data-url="<%#Eval("Path") %>"><div class="thumbnail"><img src="<%#Eval("Path") %>" /></div></li>
                            </ItemTemplate>
                        </asp:Repeater>
                 </ul>
              <div class="clearfix"></div>
              </div>
          </div>
          <div id="videoTab" class="section-wrapper live-comps tab-pane">
              <div class="section-header">
                  <div class="title-line">
                      <div class="title">背景视频</div>
                  </div>
              </div>
               <ul class="preset-list-section-list">
                    <li class="preset-list-item" data-type="video" data-post="/Design/res/bkvideo/dreamscapes.jpg" data-url="/Design/res/bkvideo/dreamscapes.mp4"><div class="thumbnail"><img src="/Design/res/bkvideo/dreamscapes.jpg" /></div></li>
                   <li class="preset-list-item" data-type="video"  data-post="/Design/res/bkvideo/file.jpg" data-url="/Design/res/bkvideo/file.mp4"><div class="thumbnail"><img src="/Design/res/bkvideo/file.jpg" /></div></li>
               </ul>
          </div>
      </div>
  </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/Design/JS/Plugs/jqueryUI/jquery-ui-1.9.2.custom.min.js"></script>
    <link href="/Design/JS/Plugs/jqueryUI/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
    <link href="/Design/res/css/edit/common.css" rel="stylesheet" />
    <script>
        var bgmodel = { type: "", url: "", post: "" };
        $(function () {
            $(".ui-buttonset").buttonset();
            $("input[name=bk_rad]").click(function () {
                $(".tab-pane").removeClass("active");
                $("#" + this.value + "Tab").addClass("active");
            });
            $(".preset-list-item").click(function () {
                var $li = $(this);
                bgmodel.type = $li.data("type");
                bgmodel.url = $li.data("url");
                bgmodel.post = $li.data("post");
                parent.page.SetBackGround(bgmodel)
                parent.CloseComDiag();
            });
        })
    </script>
</asp:Content>