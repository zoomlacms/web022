<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_AddModelxml, App_Web_54finohp" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Flex管理系统</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr id="mapimg">
            <td colspan="2" height="100%">
                <div style="z-index:1;height: 610px">
                    <asp:Image ID="Image1" runat="server" />
                </div>
                <div style="z-index: 0; height: 610px">
                    <iframe id="mapIframe" marginheight="1" marginwidth="1" src="page.aspx?id=<%=Request.QueryString["id"] %>" frameborder="0" width="800px" height="500px" scrolling="no" style="overflow: hidden;" allowtransparency="true"></iframe>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="float: left; width: 100%;">
                    <input type="button" class="btn btn-primary" value='新建编辑区域' id="btnNew" title="新建图片区域" onclick="newMap()">
                    <input type="button" class="btn btn-primary" value='新建文字区域' id="Button1" title="新建文字区域" onclick="newtxtMap()">
                    <input type="button" class="btn btn-primary" value='新建模板区域' id="Button4" title="新建模板区域" onclick="newMBMap()">
                </div>
                <div style="float: left; width: 100%; height: 20px"></div>
                <div style="float: left; width: 100%;">
                    <asp:Button ID="Button5" runat="server" class="btn btn-primary" Text="上一步" OnClick="Button5_Click" />
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="确定" OnClientClick="getconent();return false;" />
                    <input type="button" class="btn btn-primary" value='取消' onclick="window.close();">
                    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" Style="display: none" />
                    <input type="hidden" id="HiddenField1" name="HiddenField1" />
                </div>
            </td>
        </tr>
    </table>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

    <script language="JavaScript">
        var oControl;
        var oSeletion;
        var sRangeType;
        var oMap = null;
        var sSrc = "";
        var sUseMap = "";
        var sWidth = "";
        var sHeight = "";
        var aHref = new Array();
        var aTarget = new Array();
        var aCoords = new Array();
        var aLeft = new Array();
        var aTop = new Array();
        var aWidth = new Array();
        var aHeight = new Array();
        var aMapName = new Array();
        var sBody = "";

        var mapList = "";
        if (sUseMap != "") {
            sUseMap = sUseMap.toUpperCase();
            var oAllMap = opener.document.body.getElementsByTagName("MAP");
            for (var i = 0; i < oAllMap.length; i++) {
                aMapName[i] = oAllMap[i].name.toUpperCase();
                if (("#" + aMapName[i]) == sUseMap) {
                    oMap = oAllMap[i];
                }
            }
        }

        sBody = "<img id='SOURCEIMAGE' border=0 src='" + sSrc + "' width='" + sWidth + "' height='" + sHeight + "'>";
        if (oMap) {
            for (var i = 0; i < oMap.areas.length; i++) {
                aHref[i] = oMap.areas(i).href;
                aTarget[i] = oMap.areas(i).target;
                aCoords[i] = oMap.areas(i).coords;
                var a = aCoords[i].split(",");
                aLeft[i] = parseInt(a[0]);
                aTop[i] = parseInt(a[1]);
                aWidth[i] = parseInt(a[2]) - aLeft[i];
                aHeight[i] = parseInt(a[3]) - aTop[i];
                sBody += "<img id='myIMAGE" + i + "' border=1 src='/Images/space.gif' style='position:absolute;left:" + aLeft[i] + "px;top:" + aTop[i] + "px;width:" + aWidth[i] + "px;height:" + aHeight[i] + "px;zIndex:" + (i + 1) + "'>";
            }
        }


        // 初始化
        function doInit() {
            mapIframe.document.designMode = "On";
            mapIframe.document.open();
            mapIframe.document.write("<head><style>body,a,table,td {font-size:9pt;font-family:'宋体,Verdana,Arial';Color:#000000;};body{background-color:transparent}</style></head><body MONOSPACE>");
            mapIframe.document.body.innerHTML = sBody;
            mapIframe.document.body.contentEditable = "true";

            mapIframe.document.ondblclick = new Function("return dblClick(mapIframe.event);");
            mapIframe.document.execCommand("2D-Position", true, true);
            //mapIframe.document.execCommand("MultipleSelection", true, true);
            mapIframe.document.execCommand("LiveResize", true, true);
            mapIframe.document.close();
        }

        // 双击修改链接属性
        var objLink = new Object();
        function dblClick(event) {
            var e = event.srcElement;
            if (e) {
                if ((e.tagName == "IMG") && (e.id != "SOURCEIMAGE")) {
                    if (e.id.indexOf("model") > -1) {

                        var sID = e.id;
                        var nID = parseInt(sID.substr(7));
                        objLink.Href = aHref[nID];
                        objLink.Target = aTarget[nID];


                        window.open('editpic.Aspx?action=edit&tid=<%=Request.QueryString["id"]%>&editid=' + e.id, '添加模版', 'toolbar=no,width=500,height=300');

                        //var arr = showModalDialog("editpic.Aspx?action=edit&tid=<%=Request.QueryString["id"]%>&editid=" + e.id, window, "dialogWidth:500px;dialogHeight:300px;help:no;scroll:no;status:no");
                        //	            if (arr) {
                        //	                aHref[nID] = arr[0];
                        //	                aTarget[nID] = arr[1];
                        //	            }
                    }
                }
            }
            return false;
        }

        // 新建图片区域
        function newMap() {
            var n = aHref.length;
            var maxid = 0;
            var dd = document.getElementById("mapIframe").contentDocument
            var formarr = dd.body.childNodes;
            for (var ii = 0; ii < formarr.length; ii++) {
                try {
                    var ssid = formarr.item(ii).id;
                    if (ssid.indexOf('pic') > -1) {
                        var picname = ssid.replace('pic', '');
                        //alert(picname);
                        if (n < Number(picname)) {
                            n = Number(picname);
                        }
                    }
                }
                catch (Error)
                { }
            }
            n = n + 1;
            aHref[n] = "";
            aTarget[n] = "";
            mapIframe.document.body.innerHTML += "<img id='pic" + n + "' border=2 src='/Images/Flex/bq.png' style='border-color:blue;position:absolute;zIndex:" + (n + 1) + ";width:100;height:100;left:200;top:300'>";
            mapIframe.scrollBy(0, 0);
            mapIframe.focus();
        }

        // 新建模板区域
        function newMBMap() {
            var n = aHref.length;
            var dd = document.getElementById("mapIframe").contentDocument
            var formarr = dd.body.childNodes;
            for (var ii = 0; ii < formarr.length; ii++) {
                try {
                    var ssid = formarr.item(ii).id;
                    if (ssid.indexOf('model') > -1) {
                        var picname = ssid.replace('model', '');
                        //alert(picname);
                        if (n < Number(picname)) {
                            n = Number(picname);
                        }
                    }
                }
                catch (Error)
                { }
            }
            n = n + 1;
            aHref[n] = "";
            aTarget[n] = "";
            mapIframe.document.body.innerHTML += "<img id='model" + n + "' border=2 src='/Images/Flex/show.png' style='border-color:yellow;position:absolute;zIndex:" + (n + 1) + ";width:100;height:100;left:200;top:300'>";
            mapIframe.scrollBy(0, 0);
            mapIframe.focus();
        }




        // 新建文字区域
        function newtxtMap() {
            var n = aHref.length;
            var dd = document.getElementById("mapIframe").contentDocument
            var formarr = dd.body.childNodes;
            for (var ii = 0; ii < formarr.length; ii++) {
                try {
                    var ssid = formarr.item(ii).id;
                    if (ssid.indexOf('text') > -1) {
                        var picname = ssid.replace('text', '');
                        //alert(picname);
                        if (n < Number(picname)) {
                            n = Number(picname);
                        }
                    }
                }
                catch (Error)
                { }
            }
            n = n + 1;
            aHref[n] = "";
            aTarget[n] = "";
            mapIframe.document.body.innerHTML += "<img id='text" + n + "' border=2 src='/Images/space.gif' style='border-color:red;position:absolute;zIndex:" + (n + 1) + ";width:100;height:20;left:200;top:300'>";
            mapIframe.scrollBy(0, 0);
            mapIframe.focus();
        }


        // 取自动递增热点名
        function getAutoMapName() {
            var b = true;
            var n = 0;
            var s = ""
            while (b) {
                n++;
                s = "AutoMap" + n;
                if (isValidMapName(s)) {
                    b = false;
                }
            }
            return s;

        }

        // 判断是否为不存在的名称
        function isValidMapName(str) {
            str = str.toUpperCase();
            for (var i = 0; i < aMapName.length; i++) {
                if (aMapName[i] == str) {
                    return false;
                }
            }
            return true;
        }

        //转换URL地址:新加的
        function getUrl(url) {
            var eTemp;

            sTemp = url.substr(url.lastIndexOf("/") + 1, url.length);
            return sTemp;
        }
        //转换ImgURL地址:新加的
        function getImgUrl(url) {
            var eTemp;

            sTemp = url.substring(url.lastIndexOf("/editor/") + 1, url.length);
            sTemp = "/" + sTemp;
            return sTemp;
        }

        function $(obs) {
            if (document.all) {
                return document.getElementById(obs)
            }
            else {
                return eval(obs)
            }
        }

        function getconent() {
            var doc;
            if (document.all) {//IE
                doc = document.frames["mapIframe"].document.body.innerHTML;
            } else {//Firefox
                doc = document.getElementById("mapIframe").contentDocument.body.innerHTML;
            }

            $('HiddenField1').value = doc;
            $('HiddenField1').value = doc;
            $('HiddenField1').value = doc;
            $('HiddenField1').value = doc;

            document.getElementById("Button3").click();

            //alert($('HiddenField1').value);
            return doc;
        }

        function getconentimg() {
            var doc;
            if (document.all) {//IE
                doc = document.getElementById("imgsrc");
            } else {//Firefox
                doc = document.getElementById("imgsrc");
            }
            return doc;
        }


        function SetWinHeight(obj) {
            var win = obj;
            if (document.getElementById) {
                if (win && !window.opera) {
                    if (win.contentDocument && win.contentDocument.body.offsetHeight) {
                        win.height = win.contentDocument.body.offsetHeight;
                        win.width = win.contentDocument.body.offsetWidth;
                    }
                    else if (win.Document && win.Document.body.scrollHeight) {
                        win.height = win.Document.body.scrollHeight;
                        win.width = win.Document.body.scrollWidth;
                    }
                }
            }
        }

    </script>
    <script event="onclick" for="Ok" language="JavaScript">
        var b = false;
        for (var i = 0; i < aHref.length; i++) {
            var obj = mapIframe.document.getElementById("myIMAGE" + i);
            if (obj) {
                b = true;
            }
        }

        if (b) {
            var html = "";
            for (var i = 0; i < aHref.length; i++) {
                var obj = mapIframe.document.getElementById("myIMAGE" + i);
                if (obj) {
                    var nLeft = parseInt(obj.style.left);
                    var nTop = parseInt(obj.style.top);
                    var nWidth = parseInt(obj.style.width);
                    var nHeight = parseInt(obj.style.height);
                    var nRight = nLeft + nWidth;
                    var nBottom = nTop + nHeight;
                    //	alert(getUrl(aHref[i]));//URL 调试
                    html += "<area shape='rect' href='" + getUrl(aHref[i]) + "' coords='" + nLeft + "," + nTop + "," + nRight + "," + nBottom + "' onmouseover=MouseOverMap(" + nLeft + "," + nTop + "," + nRight + "," + nBottom + ") onmouseout=MouseOutMap() >";
                }
            }

            if (oMap) {
                oMap.innerHTML = html;
            } else {
                sUseMap = getAutoMapName();
                oControl.useMap = "#" + sUseMap;
                mapList += "<map name='" + sUseMap + "'>" + html + "</map>";
                //alert(mapList);
                //opener.document.getElementById("node_image_edit").innerHTML += mapList;
                //opener.appendHTML("<map name='"+sUseMap+"'>"+html+"</map>");
            }
        } else {
            if (oMap) {
                oMap.outerHTML = "";
            }
            oControl.useMap = "";
        }
        oControl.width = mapIframe.SOURCEIMAGE.width;
        oControl.height = mapIframe.SOURCEIMAGE.height;
        //	mapIframe.document.getElementById("SOURCEIMAGE").src=sSrc;
        //alert(oMap.outerHTML);
        /////opener.document.getElementById("node_image").value = opener.document.getElementById("node_image_edit").innerHTML;
        //alert(opener.document.getElementById("node_image_edit").innerHTML);
        window.returnValue = null;
        window.close();
    </script>
    <script language="JavaScript">
        doInit();
    </script>

</asp:Content>
