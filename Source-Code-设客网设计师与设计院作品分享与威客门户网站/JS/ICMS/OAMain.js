function showLeftMenu(url) {
    ShowMain("/Mis/OA/Menu/LeftMenu.aspx?leftul=" + url);
}
function showRightCnt(url) { 
    var rifr = top.document.getElementById("main_right");
    rifr.src = url;
}
function ShowMain(lurl, rurl) {//优先加载右边iframe
    var rifr = top.document.getElementById("main_right");
    var lifr = top.document.getElementById("main_left");
    if (rifr && rurl != "") {
        rifr.src = rurl;
    } else { location = rurl; }
    if (lifr && lurl != "") {
        if (lurl.indexOf("#") == 0) {
            lurl = lurl.substring(1, lurl.length);//页面需改为直接用#切换
            lifr.src = "/Mis/OA/Menu/LeftMenu.aspx?leftul=" + lurl;
        }
        else {
            lifr.src = lurl;
        }
    }
    AutoHeight();//后期放到default中绑定
}
function AutoHeight() {
    var ifr = top.document.getElementById("main_right");
    if (!ifr) return;
    var iframeHeight = $(ifr).contents().height();
    $(ifr).height(iframeHeight + 'px');
}
//--------------
$(function () {
    AutoHeight();
})
