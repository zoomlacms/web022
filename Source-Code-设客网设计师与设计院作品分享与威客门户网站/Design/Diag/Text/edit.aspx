<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Text_edit, App_Web_mah1lmpa" masterpagefile="~/Design/Master/Edit.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>文本组件</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
   <div class="panel panel-primary">
       <div class="panel-heading"><i class="fa fa-font"></i><span class="marginl5">文本修改</span></div>
       <div class="panel-body" style="padding-left:0px;padding-right:0px;padding-top:0px;">
           <hr class="divider-long"/>
           <div class="control-section-divider labeled">样式设置</div>
           <hr class="divider-long"/>
           <div class="setting-row">
               <div><label class="row-title">字体大小(px)</label></div>
               <div id="font_slider" class="slider_min"></div>
               <input type="text" id="font_t" class="inputer min" />
           </div>
           <hr class="divider-long"/>
           <div class="setting-row">
               <div><label class="row-title">字体颜色</label></div>
               <input type="text" id="color_t" class="form-control text_150">
           </div>
		   <hr class="divider-long"/>
		   <div class="setting-row">
				<div><label class="row-title">文字内容</label></div>
				<input type="text" id="content_t" class="form-control">
		   </div>
           <hr class="divider-long"/>
           <div class="setting-row">
               <div><label class="row-title">文本对齐</label></div>
               <div id="align_body" class="ui-buttonset">
                   <input type="radio" id="align1" name="align_rad" value="left" class="ui-helper-hidden-accessible"><label for="align1" class="ui-button ui-widget ui-state-default ui-button-text-only ui-corner-left ui-state-active" role="button" aria-disabled="false" aria-pressed="true"><span class="ui-button-text">居左</span></label>
                   <input type="radio" id="align2" name="align_rad" value="center" class="ui-helper-hidden-accessible"><label for="align2" class="ui-button ui-widget ui-state-default ui-button-text-only" role="button" aria-disabled="false" aria-pressed="false"><span class="ui-button-text">居中</span></label>
                   <input type="radio" id="align3" name="align_rad" value="right" class="ui-helper-hidden-accessible"><label for="align3" class="ui-button ui-widget ui-state-default ui-button-text-only ui-corner-right" role="button" aria-disabled="false" aria-pressed="false"><span class="ui-button-text">居右</span></label>
               </div>
           </div>
           <hr class="divider-long" />
           <div class="setting-row" data-group="indent">
                <div ><label class="row-title">是否缩进</label></div>
                <div id="indent_body" class="ui-buttonset">
                   <input type="radio" name="indent_rad" id="indent1" value="no" class="ui-helper-hidden-accessible"><label for="indent1" class="ui-button ui-widget ui-state-default ui-button-text-only ui-corner-left ui-state-active" role="button" aria-disabled="false" aria-pressed="true"><span class="ui-button-text"><i class="fa fa-dedent fa-rotate-180"></i></span></label>
                   <input type="radio" name="indent_rad" id="indent2" value="yes" class="ui-helper-hidden-accessible"><label for="indent2" class="ui-button ui-widget ui-state-default ui-button-text-only" role="button" aria-disabled="false" aria-pressed="false"><span class="ui-button-text"><i class="fa fa-outdent "></i></span></label>
               </div>
           </div>
       </div>
   </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        $(function () {
            $(".ui-buttonset").buttonset();
            //先设定值,再绑事件,避免重复触发
            $("#font_t").val(StyleHelper.ConverToInt(editor.dom.css("font-size")));
            $("#color_t").val(editor.dom.css("color"));
            {
                var val = editor.dom.css("text-align"); if (val == "start") { val = "left"; }
                StyleHelper.setRadVal("align_rad", val);
                val = StyleHelper.ConverToInt(editor.dom.css("text-indent")) == 0 ? "no" : "yes";
                StyleHelper.setRadVal("indent_rad", val);
            }
			//文本值
            $("#content_t").val(editor.model.dataMod.text);
            //绑定事件,字体,颜色,位置,缩进
			$("#content_t").change(function () {
			    editor.model.dataMod.text = $(this).val();
			    editor.scope.$digest();
			})
            $("#font_slider").slider({
                range: "min", min: 1, max: 150, value: 15,
                slide: function (event, ui) {
                    $("#font_t").val(ui.value);
                    editor.dom.css("font-size", ui.value + "px");
                }
            });
            $("#color_t").ColorPickerSliders({
                size: 'sm', placement: 'right', swatches: false, sliders: false, hsvpanel: true, previewformat: "hex",
                onchange: function (container, color) {
                    editor.dom.css("color", color.tiny.toHexString());
                }
            });
            $("#align_body input[name=align_rad]").click(function () {
                editor.dom.css("text-align", this.value);
            });
            $("#indent_body input[name=indent_rad]").click(function () {
                var val = "0px";
                if (this.value == "yes") { val = "2em";}
                editor.dom.css("text-indent", val);
            });
        })
    </script>
</asp:Content>
