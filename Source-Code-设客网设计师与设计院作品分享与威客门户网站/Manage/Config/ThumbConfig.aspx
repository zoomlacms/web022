<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Config_ThumbConfig, App_Web_zol0bvcz" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Content.js"></script>
    <title>缩略图配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr >
      <td class="td_l" ><%:lang.LF("上传图片默认宽度") %>：</td>
      <td >
          <asp:TextBox ID="iwidth" runat="server" class="form-control text_md"></asp:TextBox>
          <span class="pull-left" style="line-height:32px; margin-left:5px;">像素&nbsp;&nbsp;设为0时，将以高度为准按比例缩小。 </span>
      </td>
    </tr>
    <tr >
      <td ><%:lang.LF("上传图片默认高度") %>：</td>
      <td >
          <asp:TextBox ID="iheight" runat="server" class="form-control text_md"></asp:TextBox>
          <span class="pull-left" style="line-height:32px; margin-left:5px;">像素&nbsp;&nbsp;设为0时，将以宽度为准按比例缩小。都为0时，则为原图大小。</span>
      </td>
    </tr>
    <tr>
    <td>传图水印：</td>
    <td><div><img id="iLogo_img" class="preview_img" style="width:110px;height:110px;" onerror="this.src='/Images/nopic.gif';"/><div class="file-panel" style="height: 0px;"><span class="editpic" title="编辑"></span><span class="cancel" title="删除"></span></div></div>
        <asp:TextBox runat="server" id="iLogo_url" type="text" class="form-control text_300"/><button type="button" class="btn btn-info" onclick="SelPic({ 'name': 'iLogo_url','type':'single' });">选择图片</button></td>
    </tr>
    <tr>
    <td>编图水印：</td>
    <td>
        <ul data-id="txt_waterimgs" id="ul_waterimgs" class="preview_img_ul"></ul>
        <div class="clearfix"></div>
        <div>
            <input type="button" class="btn btn-info" value="选择图片" onclick="SelPic({ 'name': 'waterimgs' });" />
            <textarea runat="server" id="txt_waterimgs" style="display:none;"></textarea>
        </div>
    </td>
    </tr>
    <tr>
      <td ><%:lang.LF("是否开启水印") %>：</td>
      <td >
            <input runat="server" type="checkbox" id="Isuse" class="switchChk" checked="checked" />
    </tr>
    <tr  style="display:none">
      <td ><%:lang.LF("缩略图算法") %>：</td>
      <td >
          <asp:RadioButtonList ID="RadioButtonList1" runat="server">
              <asp:ListItem Value="1" Selected="True">常规算法：宽度和高度都大于0时，直接缩小成指定大小，其中一个为0时，按比例缩小</asp:ListItem>
              <asp:ListItem Value="2">裁剪法：宽度和高度都大于0时，先按最佳比例缩小再裁剪成指定大小，其中一个为0时，按比例缩小。</asp:ListItem>
              <asp:ListItem Value="3">补充法：在指定大小的背景图上附加上按最佳比例缩小的图片。 </asp:ListItem>
          </asp:RadioButtonList>
      </td>
    </tr>
    <tr >
      <td ><%:lang.LF("水印类型") %>：</td>
      <td >
          <asp:RadioButtonList ID="waterType" runat="server" RepeatColumns="2">
              <asp:ListItem Selected="True" Value="1">图片水印</asp:ListItem>
              <asp:ListItem Value="2">文字水印</asp:ListItem>
          </asp:RadioButtonList>
      </td>
    </tr>
    <tbody id="tu"> 
      <tr >
        <td ><%:lang.LF("水印图片透明度") %>：</td>
        <td >
            <asp:TextBox ID="iAlp" runat="server" Width="50" CssClass="from-control pull-left"></asp:TextBox>
            <span class="pull-left" style="line-height:32px; margin-left:5px;">%，0为完全透明，100为完全不透明</span>
        </td>
      </tr>
    </tbody>
    <tr>
        <td ><%:lang.LF("水印文字") %>：<br />
          <span class="rd_green">水印文字不宜超过15个字符</span></td>
        <td ><asp:TextBox ID="waterWord" runat="server" CssClass="form-control pull-left" Width="200"></asp:TextBox></td>
      </tr>
    <tr >
        <td ><%:lang.LF("文字字体") %>：<br /></td>
        <td style="height: 23px;">
            <asp:DropDownList ID="WordType" CssClass="form-control" Width="150" runat="server">
                <asp:ListItem>宋体</asp:ListItem>
                <asp:ListItem>楷体</asp:ListItem>
                <asp:ListItem>新宋体</asp:ListItem>
                <asp:ListItem>黑体</asp:ListItem>
                <asp:ListItem>隶书</asp:ListItem>
                <asp:ListItem>幼圆</asp:ListItem>
                <asp:ListItem>Andale Mono</asp:ListItem>
                <asp:ListItem>Arial</asp:ListItem>
                <asp:ListItem>Arial Black</asp:ListItem>
                <asp:ListItem>Book Antiqua</asp:ListItem>
                <asp:ListItem>Century Gothic</asp:ListItem>
                <asp:ListItem>Comic Sans MS</asp:ListItem>
                <asp:ListItem>Courier New</asp:ListItem>
                <asp:ListItem>Georgia</asp:ListItem>
                <asp:ListItem>Impact</asp:ListItem>
                <asp:ListItem>Tahoma</asp:ListItem>
                <asp:ListItem>Times New Roman</asp:ListItem>
                <asp:ListItem>Trebuchet MS</asp:ListItem>
                <asp:ListItem>Script MT Bold</asp:ListItem>
                <asp:ListItem>Stencil</asp:ListItem>
                <asp:ListItem>Verdana</asp:ListItem>
                <asp:ListItem>Lucida Console</asp:ListItem>
              </asp:DropDownList>
        </td>
      </tr>
    <tr >
        <td ><%:lang.LF("字体样式") %>：<br /></td>
        <td style=" height: 23px;">
            <asp:DropDownList ID="WordStyle" CssClass="form-control" Width="150" runat="server">
                <asp:ListItem Value="1">正常</asp:ListItem>
                <asp:ListItem Value="2">斜体</asp:ListItem>
                <asp:ListItem Value="3">加粗</asp:ListItem>
                <asp:ListItem Value="4">删除线</asp:ListItem>
                <asp:ListItem Value="5">下划线</asp:ListItem>
            </asp:DropDownList>
        </td>
      </tr>
    <tr >
        <td class="style3" ><%:lang.LF("文字大小") %>：<br /></td>
        <td >
            <asp:TextBox ID="WordSize" runat="server" CssClass="form-control pull-left" Width="200"></asp:TextBox>
            <span class="pull-left" style="line-height:32px; margin-left:5px;">请输入数字</span>
        </td>
      </tr>
    <tr >
        <td ><%:lang.LF("文字颜色") %>：<br /></td>
        <td style="height: 23px;">
            <script type="text/javascript">
                function SelectColor(t, clientId) {
                    var url = "/Common/SelectColor.aspx?d=f&t=6";
                    var old_color = (document.getElementById(clientId).value.indexOf('#') == 0) ? '&' + document.getElementById(clientId).value.substr(1) : '&' + document.getElementById(clientId).value;
                    if (document.all) {
                        var color = showModalDialog(url + old_color, '', "dialogWidth:18.5em; dialogHeight:16.0em; status:0");
                        if (color != null) {
                            document.getElementById(clientId).value = color;
                        } else {
                            document.getElementById(clientId).focus();
                        }
                    } else {
                        var color = window.open(url + '&' + clientId, "hbcmsPop", "top=200,left=200,scrollbars=yes,dialog=yes,modal=no,width=300,height=260,resizable=yes");
                    }
                }
            </script>
            <asp:TextBox ID="txt_dfg" CssClass="form-control pull-left" Width="200" name="txt_dfg" runat="server"></asp:TextBox>
            <img onclick="SelectColor(this,'txt_dfg');"src="/images/Rect.gif" align="absmiddle" style="border-width: 0px; cursor: pointer" />
        </td>
      </tr>
    <tr >
      <td ><%:lang.LF("坐标起点位置") %>：</td>
      <td style=" height: 23px;">
          <asp:DropDownList ID="localP" runat="server" class="form-control pull-left" Width="150">
              <asp:ListItem Value="1">左上</asp:ListItem>
              <asp:ListItem Value="2">左中</asp:ListItem>
              <asp:ListItem Value="3">左下</asp:ListItem><asp:ListItem Value="4">上中</asp:ListItem>
              <asp:ListItem Value="5">中</asp:ListItem>
              <asp:ListItem Value="6">下中</asp:ListItem>
              <asp:ListItem Value="7">右上</asp:ListItem>
              <asp:ListItem Value="8">右中</asp:ListItem>
              <asp:ListItem Value="9">右下</asp:ListItem>
       <%--       <asp:ListItem Value="10">自定义</asp:ListItem>--%>
          </asp:DropDownList>
      </td>
    </tr>
    <tr  runat="server" id="oox" >
      <td ><%:lang.LF("坐标位置") %>：坐标起点位置设置为手动设置时才有效。 </td>
      <td style="height: 23px;"> X：
        <asp:TextBox ID="PX" runat="server" Width="50"></asp:TextBox>
        像素 填写的数据必须是数字！设为手动才可启用改参数<br />
        Y：<asp:TextBox ID="PY" runat="server" Width="50"></asp:TextBox><span>像素 填</span> </td>
    </tr>
  </table>
  <asp:Button ID="Button1" runat="server" Text="保存设置" OnClick="Button1_Click" class="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        //-------------上传
        $(function () {
            BindAttachEvent();
            InitImgs({ "name": "waterimgs" });
            $("#iLogo_img").attr("src", $("#iLogo_url").val());
            $("#iLogo_url").change(function () {
                $("#iLogo_img").attr("src", $("#iLogo_url").val());
            });
        });
        //以下封装入ZL_Images
        //初始化,如果pval中带了list,则以其list为准
        function InitImgs(pval) {
            $text = $("#txt_" + pval.name);
            $imgul = $("#ul_" + pval.name);
            var list = JSON.parse($text.val() == "" ? "[]" : $text.val());
            if (!list || list.length < 1) { return; }
            var tlp = "<li class='margin_l5'><img src='@src' class='preview_img'/><div class='file-panel' style='height: 0px;'><span class='editpic' title='编辑'></span><span class='cancel' title='删除'></span></div></li>";
            for (var i = 0; i < list.length; i++) {
                if (list[i].url == "") continue;
                if ($imgul.length > 0) {
                    $imgul.append(tlp.replace("@src", list[i].url));
                }
            }
            BindAttachEvent();
        }
        function PageCallBack(action, vals, pval) {
            if (vals == "") return;
            switch (action) {
                case "cutpic":
                    $("img[src]").each(function () {
                        var url = $(this).attr("src").split('?')[0];
                        if (url == vals)
                        { this.src = url + "?" + Math.random(); }
                    });
                    break;
                default:
                    if (pval.type == "single") {
                        $("#" + pval.name).val(vals.split('|')[0]);
                        $("#" + pval.name).change();
                    }
                    else {
                        AddAttach(null, { _raw: vals }, pval);
                        BindAttachEvent();//后期看是否移入common
                    }
                    break;
            }
            CloseComDiag();
        }
        function BindAttachEvent() {
            //先清除有事件再绑定,以避免重绑
            $(".preview_img_ul li .cancel").unbind("click");
            $(".preview_img_ul li .editpic").unbind("click");
            $(".preview_img").unbind("click");
            //---------------
            $(".preview_img_ul li").mouseenter(function () {
                $btns = $(this).find(".file-panel");
                $btns.stop().animate({ height: 30 });
            }).mouseleave(function () {
                $btns = $(this).find(".file-panel");
                $btns.stop().animate({ height: 0 });
            });
            $(".preview_img_ul li .cancel").click(function () {
                var $li = $(this).closest("li");
                var $text = $("#" + $li.closest("ul").data("id"));
                var name = $li.find("img").attr("src");
                $li.remove();
                var list = JSON.parse($text.val() == "" ? "[]" : $text.val());
                $text.val(RemoveAttach(name, list));
            });
            $(".preview_img_ul li .editpic").click(function () {
                $li = $(this).closest("li");
                var url = $li.find("img").attr("src");
                ShowCutImg("ipath=" + url);
            });
            $(".preview_img").click(function () {//允许点击预览大图
                PreViewImg(this.src);
            });
        }
        function AddAttach(file, ret, pval) {
            if (ret._raw == "") return;
            //if (pval.field == "down") { AddAttach_down(file, ret, pval); return; }
            //仅用于组图
            var tlp = "<li class='margin_l5'><img src='@src' class='preview_img'/><div class='file-panel' style='height: 0px;'><span class='editpic' title='编辑'></span><span class='cancel' title='删除'></span></div></li>";
            var $text = $("#txt_" + pval.name), imgarr = ret._raw.split('|');
            var list = JSON.parse($text.val() == "" ? "[]" : $text.val());
            $imgul = $("#ul_" + pval.name);
            if (pval.isGroup) {//标识是否是图片排序返回的数据(需初始化数据)
                $imgul.html(""); $text.val("");
            }
            for (var i = 0; i < imgarr.length; i++) {
                if (imgarr[i] == "") continue;
                if ($imgul.length > 0) {
                    $imgul.append(tlp.replace("@src", imgarr[i]));
                }
                imgarr[i] = imgarr[i].replace(pval.uploaddir, "");
                var json = { url: imgarr[i], desc: (pval.descs ? pval.descs[i] : "") };
                list.push(json);
            }
            $text.val(JSON.stringify(list));
            BindAttachEvent();
            CloseComDiag();
        }
        function RemoveAttach(name, list) {//需要移除的图片名,全图片字符串
            name = name.split('?')[0];
            if (!list || list.length < 1) { return; }
            for (var i = 0; i < list.length; i++) {
                if (list[i].url == name)
                {
                    list.splice(i,1);
                }
            }
            return JSON.stringify(list);
        }
        function ShowCutImg(param) {
            comdiag.maxbtn = false;
            ShowComDiag("/Plugins/PicEdit/CutPic.aspx?" + param, "图片编辑");
        }
        function SelPic(pval) {
            comdiag.maxbtn = false;
            ShowComDiag("/Common/SelFiles.aspx?pval=" + JSON.stringify(pval), "选择图片");
        }
    </script>
</asp:Content>