//console.log("一个好网站，需要什么样的内核，才能支撑永续发展？\n一个好平台，需要什么样的技术，才能打通数据运维？\n专注技术，做坚强的WEB与移动开发内核；\n为匠者生，做中国互联网的鲁班和建筑师！\n");
//console.log("北京+上海+南昌10年研发团队 企业歌曲：http://zoomla.cn/corp/music");
//console.log("Zoomla!逐浪CMS官方下载：http://zoomla.cn/pub");

function disBtn(o, t) {
    if (typeof (o) == "string") { o = document.getElementById(o); }
    if (arguments.length == 1) { setTimeout(function () { o.disabled = true; $(o).css("color", "#808080"); }, 50); }
    else if (arguments.length == 2) { var color = $(o).css("color"); setTimeout(function () { o.disabled = true; $(o).css("color", "#808080"); }, 50); setTimeout(function () { o.disabled = false; $(o).css("color", color); }, t); }
}
function GetEnterCode(a, id) {
    if (event.keyCode == 13) {
        switch (a) { case "click": $("#" + id).trigger("click"); break; case "focus": $("#" + id).focus(); break; }
        return false;
    }
    else { return true; }
}
function getParam(paramName) {
    paramValue = ""; isFound = false; if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = decodeURI(this.location.search).substring(1, this.location.search.length).split("&"); i = 0; while (i < arrSource.length && !isFound) {
            if (arrSource[i].indexOf("=") > 0) { if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) { paramValue = arrSource[i].split("=")[1]; isFound = true; } }
            i++;
        }
    }
    return paramValue;
}
//获取#后的信息
function getParam2() {
    var index = location.href.indexOf("#");
    var r = "";
    if (index > -1) {
        r = location.href.substring((index + 1), location.href.length);
    }
    return r;
}
function setCookie(name, value) {
    var today = new Date()
    var expires = new Date()
    expires.setTime(today.getTime() + 1000 * 60 * 60 * 24 * 365)
    document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString() + ";path=/"
}
function getCookie(cookie_name) {
    var allcookies = document.cookie; var cookie_pos = allcookies.indexOf(cookie_name); if (cookie_pos != -1) {
        cookie_pos += cookie_name.length + 1; var cookie_end = allcookies.indexOf(";", cookie_pos); if (cookie_end == -1) { cookie_end = allcookies.length; }
        var value = unescape(allcookies.substring(cookie_pos, cookie_end));
    }
    return value;
}
function GetRanPass(length, special) {
    var iteration = 0; var password = ""; var randomNumber; if (special == undefined) { var special = false; }
    while (iteration < length) {
        randomNumber = (Math.floor((Math.random() * 100)) % 94) + 33; if (!special) {
            if ((randomNumber >= 33) && (randomNumber <= 47)) { continue; }
            if ((randomNumber >= 58) && (randomNumber <= 64)) { continue; }
            if ((randomNumber >= 91) && (randomNumber <= 96)) { continue; }
            if ((randomNumber >= 123) && (randomNumber <= 126)) { continue; }
        }
        iteration++; password += String.fromCharCode(randomNumber);
    }
    return password;
}
function GetRandomNum(Min, Max) { var Range = Max - Min; var Rand = Math.random(); return (Min + Math.round(Rand * Range)); }
function GetExName(fname) { var s = fname.lastIndexOf(".") + 1; return fname.substring(s, fname.length).replace(/" "/g, "").toLowerCase(); }
function GetFname(fname, num) {
    var result = fname; if (fname.indexOf("/") > -1 || fname.indexOf("\\") > -1)
    { fname = fname.replace("\\", "/"); var s = fname.lastIndexOf("/") + 1; result = fname.substring(s, fname.length); }
    if (num && num > 1 && result.length > num) result = result.substring(0, (num - 1)) + ".."; return result;
}
function IsImage(fname) {
    var ex = GetExName(fname);
    return (ex == "png" || ex == "jpg" || ex == "gif" || ex == "bmp")
}
function GetCurSize() {
    var w = (document.body.clientWidth || document.documentElement.clientWidth); var result = ""; if (w >= 1170)
        result = "lg"; else if (w >= 970)
            result = "md"; else if (w >= 750)
                result = "sm"; else
                result = "xs"; return result;
}
function HideColumn(value, cls, id) {
    if (!cls || cls == "") cls = "hidden-xs hidden-sm"; if (!id) id = "EGV"; var arr = value.split(','); for (var i = 0; i < arr.length; i++) {
        $("#" + id + " tr").each(function ()
        { $(this).find("td:eq(" + arr[i] + ")").addClass(cls); $(this).find("th:eq(" + arr[i] + ")").addClass(cls); });
    }
}
function SetEditor(ids, wp, mw) { var idsArr = ids.split(','); if (!wp) wp = 0.7; if (!mw) mw = 400; var width = (document.body.clientWidth || document.documentElement.clientWidth) * wp; if (width < mw) width = mw; for (var i = 0; i < idsArr.length; i++) { var id = idsArr[i]; var uu = UE.getEditor(id); uu.destroy(); var editor = new UE.ui.Editor({ initialFrameWidth: width }); editor.render(id); } }
function SetTxt(ids) { if (ids && ids != "") { var idsArr = ids.split(','); for (var i = 0; i < idsArr.length; i++) { console.log(idsArr[i]); $("#" + idsArr[i]).css("width", "80%"); } } }
function SetEditorByClass(wp, mw, cs) {
    if (!wp) wp = 0.65; if (!mw) mw = 400; if (!cs) cs = ".ueditor"; var width = (document.body.clientWidth || document.documentElement.clientWidth) * wp; if (width < mw) width = mw; ueArr = $(cs); for (var i = 0; i < ueArr.length; i++) {
        if (ueArr[i].id == "" || ueArr[i].id == undefined) { continue; }
        $(ueArr[i]).removeClass("form-control"); var uu = UE.getEditor(ueArr[i].id); uu.destroy(); var editor = new UE.ui.Editor({ initialFrameWidth: width }); editor.render(ueArr[i].id);
    }
}
var Num = 0; var nn = 0; function help_show(helpid) {
    Num++; var newDiv = document.createElement('div'); var str = "<div id='help_content'  style='z-index:999;'></div><div id='help_hide'  style='z-index:999;'><a onclick='help_hide(Num)' style='width:20px;color:#666' title='关闭'><span class='glyphicon glyphicon-remove'></span></a></div> "; newDiv.innerHTML = str; newDiv.setAttribute("Id", "help_div" + Num); nn = Num - 1
    jQuery("#help").append(newDiv); help_hide(nn); jQuery("#help_content").load("/manage/help/" + helpid + ".html", function () { jQuery("#help").show(); });
}
function help_hide(Num) { jQuery("#help_div" + Num).remove(); }
function DealwithUploadPic(path, id) {
    if (parent.document.getElementById(id)) { parent.document.getElementById(id).value = path; }
    else { document.getElementById(id).value = path; }
}
function DealwithUploadImg(path, id) { document.getElementById(id).src = path; }
function ConverToInt(val, def) {
    if (!def) def = 0;
    if (!val || val == "") { val = def; return val; }
    val = val + "";
    val = val.replace(/ /g, "").replace("px", "").replace("em", "");
    val = parseInt(val);
    if (isNaN(val)) { val = def; }
    return val;
}
//选择用户
function ShowSelUser(select) {
    var url = "/Mis/OA/Mail/SelGroup.aspx?type=AllInfo#" + select;
    userDiag.maxbtn = false;
    ShowComDiag(url, "选择会员");
}
function UserFunc(list, select)
{
    Def_UserFunc(list, select);
}
function Def_UserFunc(list, select) {
    var uname = "", uid = "";
    for (var i = 0; i < list.length; i++) {
        uname += list[i].UserName + ",";
        uid += list[i].UserID + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    $("#" + select + "_T").val(uname);
    $("#" + select + "_T").text(uname);
    $("#" + select + "_Hid").val(uid);
    if (comdiag != null) { CloseComDiag(); }
}
//用于用户角色等,以后此作为标准
function Def_RoleFunc(list, select) {
    var names = "", ids = "";
    for (var i = 0; i < list.length; i++) {
        ids += list[i].id + ",";
        names += list[i].name + ",";
    }
    if (ids && ids != "") ids = ids.substring(0, ids.length - 1);
    if (names && names != "") names = names.substring(0, names.length - 1);
    $("#" + select + "_T").val(names);
    $("#" + select + "_T").text(names);
    $("#" + select + "_Hid").val(ids);
    if (comdiag != null) { CloseComDiag(); }
}
//---------------下拉选择模板Html
function Tlp_toggleChild(obj, id) {
    var $parent = $(obj).closest('ul');
    if ($(obj).find('span').hasClass('glyphicon glyphicon-folder-open'))
        $(obj).find('span').removeClass('glyphicon-folder-open').addClass('glyphicon-folder-close');
    else
        $(obj).find('span').removeClass('glyphicon-folder-close').addClass('glyphicon-folder-open');

    $parent.find("[data-pid='" + id + "']").toggle();
}
function Tlp_initTemp() {
    $(".Template_files").append($("#templist_ul").html());
    $(".Template_btn button").click(function () {//绑定点击事件
        $(this).next().toggle();
    });
    $(".Template_btn button").focusout(function () {//按钮失去焦点则所有下拉隐藏
        $(".Template_files").hide();
    });
    $(".Template_files").mouseover(function () {//当鼠标停留在下拉列表时解除按钮失去焦点事件
        $(this).prev().unbind('focusout');
    });
    $(".Template_files").mouseleave(function () {//当鼠标离开时重绑定按钮失去焦点事件
        $(this).prev().bind('focusout', function () {
            $(".Template_files").hide();
        });
    });
    $(".Template_files").each(function (i, v) {
        var $parent = $(v).closest('.btn-group');
        var $hid = Tlp_GetHidden($parent);
        if ($hid.val() != "")
        {
            $parent.find('button').html($hid.val() + " <span class='pull-right'><span class='caret'></span></span>");
        }
    });
}
function Tlp_SetValByName(name, val) {
    var obj = $("#" + name + "_body").find("ul")[0];
    Tlp_SetVal(obj, val);
}
function Tlp_SetVal(obj, val) {
    var $parent = $(obj).closest('.btn-group');
    $parent.find('button').html(val + " <span class='pull-right'><span class='caret'></span></span>");
    $hid = Tlp_GetHidden($parent);
    $hid.val(val);
    $parent.find('ul').hide();
}
function Tlp_GetHidden($parent) {
    var $hid;
    if ($parent.data("bind")) {
        $hid = $("#" + $parent.data("bind") + "_hid");
    }
    else {
        $hid = $parent.find('input[type="hidden"]');
    }
    return $hid;
}
function Tlp_EditHtml(url, name) {
    var $hid = $("#" + name + "_hid");
    location = (url + $hid.val());
}
function Tlp_ShowSel(name) {
    var url = siteconf.path + "Template/TemplateList.aspx?OpenerText=" + name + "&FilesDir=";
    comdiag.maxbtn = false;
    ShowComDiag(url, "选择模板");
}
//------------------模板Html End;
//公用弹窗
var comdiag = null;
function ShowComDiag(url, title) {
    comdiag.maxbtn = false;
    comdiag.title = title;
    comdiag.url = url;
    comdiag.backdrop = true;
    comdiag.ShowModal();
}
function CloseComDiag() {
    comdiag.CloseModal();
}
//---------初始
$(function () {
    if (window.ZL_Dialog) { comdiag = new ZL_Dialog(); }
})
//母版页中加入配置列文件
//----------------
var ArrCommon =
     {
         DelByID: function (arr, id) {
             for (var i = 0; i < arr.length; i++) {
                 if (arr[i].id == id) {
                     for (var j = i; j < (arr.length - 1) ; j++) {
                         arr[j] = arr[j + 1];
                     }
                     arr.pop();
                 }
             }
         },//DelByID End;
         GetModelByID: function (arr, id) {
             for (i = 0; i < arr.length; i++) {
                 if (id == arr[i].id) return arr[i];
             }
         }
     }