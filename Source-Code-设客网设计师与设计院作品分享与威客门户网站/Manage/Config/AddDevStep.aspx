<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_AddDevStep, App_Web_zol0bvcz" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>添加开发计划流程</title>
    <script src="../../JS/ajaxrequest.js" type="text/javascript"></script>
    <script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
       <style type="text/css">
    .divstyle
    {
        background-color:White;
        border-color:#9AC7F0;
        border-style:solid;
        width:131px; 
        CURSOR: move; 
        HEIGHT: 102px; 
        LEFT: 6px; 
        z-index:1;
     }
     .newdivs
     {
        Z-INDEX: 2;  
      }
    </style>
    <script type="text/javascript">
        var ajax = new AJAXRequest();
        var over = false; var down = false; var divleft; var divtop; var n; var mousX; var mousY; var divs; var divdown = false;var bigdivleft;var bigdivtop;var w = 10000;var ismove = false;
        function closediv(x) {
            var del = document.getElementById("plane" + x);
            var delcode = del.getAttribute("code");
            if (confirm("确定要删除？")) {
                if (delcode == null) {
                    document.body.removeChild(del);
                }
                else {
                    ajax.get("ajaxreturn.aspx?code=" + delcode + "&action=del",
                function (ajb) {
                    document.body.removeChild(del);
                });
                }
            }
            else { }
        }  //document.all['plane' + x].style.visibility = 'hidden'; } 
        function closediv1(x) {
            var del = document.getElementById("plane" + x);
            var delcode = x;
            if (confirm("确定要删除？")) {
                if (delcode == null) {
                    document.body.removeChild(del);
                }
                else {
                    ajax.get("ajaxreturn.aspx?code=" + delcode + "&action=del",
                function (ajb) {
                    var pri = ajb.responseText;
                    alert(pri);
                    document.body.removeChild(del);
                });
                }
                location.reload(true);
            }
            else { }
        }
        
        function down1(m) {
            n = m; down = true; divleft = event.clientX - parseInt(m.style.left); divtop = event.clientY - parseInt(m.style.top)
        }
        
        function move() { if (down) { n.style.left = event.clientX - divleft; n.style.top = event.clientY - divtop; } }
        
        function creatdivlable(obj,i,z) {
            w = w + 1;
            divdown = true;
            divs = document.createElement('div');
            divs.style.position = "absolute";
            divs.className = "divstyle";
            divs.id="plane"+w;
            mousX = event.clientX;
            mousY = event.clientY;
            divs.style.top = mousX + "px";
            divs.style.left = mousY + "px";
            divs.style.display = "none";
            divs.setAttribute("onmousedown", "Drag1(this)");
            divs.innerHTML = "<div  style='height:10px;width:131px;position:absolute;background-color:#9AC7F0'><img src='../../Images/12493942650.gif' style='cursor:pointer' onclick='closediv(" + w + ")' align='right' /> </div><br />" + obj + "<a href='#' onclick='showdiv(" + i + "," + w + ")'>编辑</a><a href='#' onclick='orderbydiv(" + w + ")'>  运行顺序</a><br/><div id='Lable" + w + "'></div><div id='orderid" + w + "'></div>";
            document.body.appendChild(divs);
            document.onmouseup = divmove;
        }
        
        function divmove() {
            if (ismove) {
                if (divdown) {
                    divs.style.left = event.clientX - 10 + "px";
                    divs.style.top = event.clientY - 10 + "px";
                    divs.style.display = "";
                    divdown = false;
                }
            }
            else {
                divdown = false;
            }
        }
        var tid = 0;
        function ShowTabs(cid) {
            if (cid == 0) {
                var s = document.getElementById("TabTitle0");
                s.className = "titlemouseover";
                var s1 = document.getElementById("Tabs0");
                s1.style.display = "";
                var d = document.getElementById("TabTitle1");
                d.className = "tabtitle";
                var d1 = document.getElementById("Tabs1");
                d1.style.display = "none";
                var adddiv1 = document.getElementById("addsql");
                adddiv1.style.display = "none";
            } else if (cid == 1) {
                var s = document.getElementById("TabTitle0");
                s.className = "tabtitle";
                var s1 = document.getElementById("Tabs0");
                s1.style.display = "none";
                var d = document.getElementById("TabTitle1");
                d.className = "titlemouseover";
                var d1 = document.getElementById("Tabs1");
                d1.style.display = ""; 
            }
        }
        function showdiv(act, di) {//显示编辑对话框
            var code = document.getElementById("plane" + di).getAttribute("code");
            
            ajax.get("ajaxreturn.aspx?id=" + act + "&divs=" + di + "&action=edit&code=" + code,
            function (ajb) {
               var pri = ajb.responseText;
               var newdiv = document.createElement("div");
               newdiv.id = 'newdivs';
               newdiv.className = "newdivs";
               newdiv.style.position = "absolute";
               newdiv.style.top = "280px";
               newdiv.style.left = "300px";
               newdiv.innerHTML = pri;
               document.body.appendChild(newdiv);
           })
       }
       function save(j, f) {//对保存的操作
           var tablename = document.getElementById("TB_TabName").value;
           var code = document.getElementById("plane" + f).getAttribute("code");
           ajax.get("ajaxreturn.aspx?id=" + j + "&action=save&Divid=<%=DevID %>&tablename=" + tablename + "&code=" + code,
           function (ajb) {
               var pri = ajb.responseText;
               price = pri.split('|');
               var divss = document.getElementById("plane" + f);
               var lab = document.getElementById("Lable" + f);
               lab.innerHTML= price[0];
               //divss.insertAdjacentHTML("beforeEnd", "<br/>" + price[0]);
               divss.setAttribute("code", price[1]);
           })
           var can = document.getElementById("newdivs");
           document.body.removeChild(can);
       }
       function cancel() {//对取消的操作
           var can = document.getElementById("newdivs");
           document.body.removeChild(can);
       }
       function showadd(v) {
           var addsql = document.getElementById("addsql");
           if (v == 0) {
               addsql.style.display = "";
           }
           else if (v == 1) {
               var txtd = document.getElementById("TextBox1");
               txtd.value = "";
               var txttitle = document.getElementById("txttitle");
               txttitle.value = "";
               addsql.style.display = "none";
           }
           else if (v == 2) {
               var txtd = document.getElementById("TextBox1");
               txtd.value = "";
               var txttitle = document.getElementById("txttitle");
               txttitle.value = "";
           }
       }
       function savesql() {//对自定义sql语句保存的操作
           var txt1 = document.getElementById("txttitle").value;
           var txt2 = document.getElementById("TextBox1").value;
           var txt3 = encodeURI(txt1);
           if (txt1 != "") {
               ajax.get("ajaxreturn.aspx?id=0&action=savesql&Divid=<%=DevID %>&titel=" + txt3 + "&setsql=" + txt2,
           function (ajb) {
               var pri = ajb.responseText;
               price = pri.split('|');
               w = w + 1;
               var divs1 = document.createElement("div");
               divs1.id = "plane" + w;
               divs1.className = "divstyle";
               divs1.style.position = "absolute";
               divs1.style.top = "180px";
               divs1.style.left = "400px";
               divs1.setAttribute("onmousedown", "Drag1(this)");
               divs1.setAttribute("code", price[1]);
               divs1.innerHTML = "<div style='height:10px;width:131px;position:absolute;background-color:#9AC7F0'><img src='../../Images/12493942650.gif' style='cursor:pointer' onclick='closediv(" + w + ")' align='right' /> </div><br />" + txt1 + "<br><a href='#' onclick='showdiv(0," + w + ")'>编辑</a><a href='#' onclick='orderbydiv(" + w + ")'>  运行顺序</a><div id='orderid" + w + "'></div>";
               document.body.appendChild(divs1);
//               $("#udef").before('<div style="cursor:move;background-color:Gray;border-bottom-style:solid;border-bottom-color:White"  onmousedown="creatdivlable(' + "'" + txt1 + "','1','')" + '">' + txt1 + "</div>");
           });
           }
       }
       function orderbydiv(di) {//显示选择排序的的操作
           ajax.get("ajaxreturn.aspx?di=" + di + "&action=order",
        function (ajb) {
            var pri = ajb.responseText;
            var newdiv = document.createElement("div");
            newdiv.id = 'newdivs';
            newdiv.className = "newdivs";
            newdiv.style.position = "absolute";
            newdiv.style.top = "280px";
            newdiv.style.left = "300px";
            newdiv.innerHTML = pri;
            document.body.appendChild(newdiv);
        });
    }
    function saveorder(ds) {//对保存排序的操作
        var tablename = document.getElementById("TB_TabName").value;
        var divss = document.getElementById("plane" + ds);
        var code = divss.getAttribute("code");
        ajax.get("ajaxreturn.aspx?code=" + code + "&action=saveorder&Divid=<%=DevID %>&di=" + tablename,
           function (ajb) {
               var pri = ajb.responseText;
               var orderid = document.getElementById("orderid" + ds);
               orderid.innerHTML=pri;
           })
        var can = document.getElementById("newdivs");
        document.body.removeChild(can);
    }


    function Drag(o, i) {   //鼠标拖动div层(之前已有的div)
        var target = document.getElementById("D_Showdivs");
        var e = window.event || e;
        var _x = e.offsetX || e.layerX;
        var _y = e.offsetY || e.layerY;
        o.style.filter = 'Alpha(opacity=70)';
        o.style.opacity = '0.7';
        document.onmousemove = function (e) {
            var e = window.event || e;
            o.style.left = e.clientX - _x - target.offsetLeft - (i % 7) * 144 + 'px';
            var j = parseInt(i / 7);
            o.style.top = e.clientY - _y - target.offsetTop - j * 120 + 'px';
            o.style.cursor = "move";
        } 
        document.onmouseup = function (e) {
            document.onmousemove = null;
            o.style.filter = o.style.opacity = '';
            o.style.cursor = "default";
        }
    }
    function Drag1(o) {         //鼠标拖动div层
        var target = document.getElementById("D_Showdivs");
        var e = window.event || e;
        var _x = e.offsetX || e.layerX;
        var _y = e.offsetY || e.layerY;
        o.style.filter = 'Alpha(opacity=70)';
        o.style.opacity = '0.7';
        document.onmousemove = function (e) {
            var e = window.event || e;
            o.style.left = e.clientX - _x  + 'px';
            o.style.top = e.clientY - _y  + 'px';
            o.style.cursor = "move";
        }
        document.onmouseup = function (e) {
            document.onmousemove = null;
            o.style.filter = o.style.opacity = '';
            o.style.cursor = "default";
        }
    } 
    </script>
</head>
<body onmousemove="move()" onmouseup=down=false>
<form id="form1" runat="server"  >
 <div class="r_navigation">
    后台管理 &gt;&gt; 扩展功能 &gt;&gt; 数据维护 &gt;&gt;<a href="DevelopmentCenter.aspx">开发中心</a>&gt;&gt;添加流程</div>

<table class="border" width="100%" cellpadding="2" cellspacing="1">
<tr>
	<td class="spacingtitle" colspan="2" align="center">
		添加流程
	</td>
</tr>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
	<td class="tdbgleft" style="width: 200px" >
		<strong>流程名称：</strong>
	</td>
	<td  >
		<asp:TextBox ID="TxtStepName" maxlength="200"  style="width:156px;" runat="server" ></asp:TextBox><font color="red">*</font>
		<span id="RequiredFieldValidator1" style="color:Red;visibility:hidden;">流程名称不能为空</span>
	</td>
</tr> 
<%--<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
	<td class="tdbgleft">
		<strong>执行语句：</strong>
	</td> 
	<td>
		<asp:TextBox ID="TxtSql" runat="server" TextMode="MultiLine" class="l_input" Style="width: 780px; height: 170px;"></asp:TextBox>
	</td>
</tr>--%>

<tr class="tdbg">
            <td align="center" style="height: 410px" width="165px" valign="top">
                <div id="Tab1_header" style=" width:165px;">
                    <table width="165px" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center">
                            <td id="TabTitle0" runat="server" align="center" class="titlemouseover" onclick="ShowTabs(0)">
                                常用任务
                            </td>
                            <td id="TabTitle1" runat="server" align="center" class="tabtitle" onclick="ShowTabs(1)">
                                自定义任务
                            </td>
                        </tr>
                    </table>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 96%">
                                <tbody id="Tabs0" runat="server">
                                    <tr align="center">
                                        <td>
                                            <div style="width:161px;height:200px;float:left; border: 1px solid #000">
    <div style="cursor:move;background-color:Gray;border-bottom-style:solid;border-bottom-color:White"  onmousedown="creatdivlable('删除指定表的所有内容','1','<%=DevID %>')" >删除指定表的所有内容</div>
    <div style="cursor:move;background-color:Gray;border-bottom-style:solid;border-bottom-color:White" onmousedown="creatdivlable('测试2')">测试2</div>
    <div style="cursor:move;background-color:Gray;border-bottom-style:solid;border-bottom-color:White" onmousedown="creatdivlable('测试3')">测试3</div>
    <div style="cursor:move;background-color:Gray;border-bottom-style:solid;border-bottom-color:White" onmousedown="creatdivlable('测试4')">测试4</div>
    </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs1" runat="server" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: center; height: 410px" id="udef">
                                            <label runat="server" id="lbshow"></label>
                                            <div style="width:165px;float:left"><a href="#" onclick="showadd(0)">添加执行sql语句</a></div>                                                    <asp:Label ID="LblSourceField" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
            <td><div id="D_Showdivs" style="width:100%;height:410px;background-color:White; position:relative" onmousemove=ismove=true onmouseout=ismove=false> <asp:Literal runat="server" ID="L_showdiv"></asp:Literal></div></td>
        </tr>
<tr class="tdbgbottom">
	<td colspan="2"> 
		<asp:HiddenField ID="HdnStepId" runat="server" />
		<asp:Button ID="EBtnSubmit"  Text="保 存" class="C_input"   runat="server" 
            onclick="EBtnSubmit_Click" />
		&nbsp;&nbsp;
		<input name="Cancel" type="button"  id="Cancel" class="C_input"  value="取 消" onclick="window.location.href='DevelopmentCenter.aspx';" />
	</td>
</tr>
</table>
<div id="addsql" style="display:none" >
<table width="100%" style="height:220px;margin:auto;" border="0" cellpadding="0" cellspacing="1" class="border"
    id="crt1" name="crt1">
    <tr class="title">
        <td colspan="2">
            请输入标准T-SQL语句查询
        </td>
    </tr>
    <tr class="tdbg">
    <td colspan="2">步骤名称：<input id="txttitle" type="text" style="width:300px" align="left" class="x_input" /></td>
    </tr>
    <tr class="tdbg">
        <td colspan="2">
            <div style="margin: 5px;">
                输入您要执行SQL语句：<br />
                <textarea id="TextBox1" class="x_input" style="width: 780px; height: 170px;" ></textarea>
                <br />
                <input id="btnSql1" value="确定" type="button" class="C_input" onclick="savesql()"/>
                <input id="btnSql2" value="取消" type="button" class="C_input" onclick="showadd(1)" />
                <input id="btnClr" value="清空" type="button" class="C_input" onclick="showadd(2)" />
            </div>
            <asp:HiddenField ID="HiddenField1" Value="" runat="server" />
        </td>
    </tr>
</table></div>
</form>
</body>
</html>
