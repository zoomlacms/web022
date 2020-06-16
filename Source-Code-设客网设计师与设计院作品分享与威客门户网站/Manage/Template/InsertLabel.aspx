<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.InsertLabel, App_Web_mq0353cm" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<html>
<head id="Head1" runat="server">
<title>动态标签编辑器-<%=Server.HtmlEncode(Request.QueryString["n"])%></title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/App_Themes/V3.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
    .ilabel_input{width:70px;}
    .label_diag_width{width:350px;}
    .ilabel span{font-size:14px;}
    #form1 table td{border-top:0px;}
    .model_body{overflow:auto;}
    #labelbody table td{width:50%;}
</style>
</head>
<body>
    <form runat="server" id="form1">
        <asp:Label ID="LabelName" runat="server" style="display:none;"></asp:Label>
        <table class="table ilabel boder0">
            <tr>
                <td>
                    <div>
                        <div>
                            <asp:Label ID="labelintro" Visible="false" runat="server">无标签说明</asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="labelbody" runat="server"></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
            
        </table>
        <script type="text/javascript">
            function submitdate(){
                var lbltype="<%= LabelType %>";
                var returnstr;
                if(lbltype=="1")
                    returnstr = "{ZL.Source id=\"" + document.getElementById("<% =LabelName.ClientID %>").innerHTML + "\"";
                else if(lbltype=="21")//扩展日期格式转换，不需要返回值
                    returnstr = "{ZL:ConverToWeek(时间为空自动输出当前星期)";
                else
                    returnstr = "{ZL.Label id=\"" + document.getElementById("<% =LabelName.ClientID %>").innerHTML + "\"";
            var oSpanArr = document.getElementsByTagName('SPAN');
            for (var i = 0; i < oSpanArr.length; i++) {
                if (oSpanArr[i].getAttribute("stype") == "0") {
                    var pvalue = document.getElementById(oSpanArr[i].getAttribute("sid")).value;
                    if(pvalue != "" && i > 0)
                        returnstr += " " + oSpanArr[i].getAttribute("sid") + "=\"" + pvalue + "\"";
                }
                if (oSpanArr[i].getAttribute("stype") == "1") {
                    var txt = $("#h" + oSpanArr[i].getAttribute("sid")).val();
                    returnstr += " " + oSpanArr[i].getAttribute("sid") + "=\"" + txt+ "\"";   
                }
            }
            returnstr= returnstr + " /}";
            parent.PasteValue(returnstr);
            //if(window.showModalDialog != null)
            //{
            //    window.returnValue = returnstr + " /}";
            //}
            //else
            //{
            //    var pre = window.opener.document.getElementById('textContent').value.substr(0, window.opener.start);
            //    var post = window.opener.document.getElementById('textContent').value.substr(window.opener.end);
            //    window.opener.document.getElementById('textContent').value = pre + returnstr + " /}" + post;
            //}        
            parent.closeCuModal();
        }
            function selectchecked(objid) {
                var hid = objid.name;
                var hidid = hid.slice(1, hid.length);
                var hidobj = $("#h" + hidid);
                if ($(objid).attr("checked")) {
                    if (hidobj.val().length == 0) {
                        hidobj.val($(objid).val());
                    } else {
                        var htxt = hidobj.val();
                        htxt += "$" + $(objid).val();
                        hidobj.val(htxt);
                    } 
                } else {
                    var hgtxt = hidobj.val();
                    var hgsub = hgtxt.replace("$" + $(objid).val() + "", "").replace(""+$(objid).val() + "$", "").replace("" + $(objid).val() + "", "");
                    hidobj.val(hgsub);
                }
            }
            $().ready(function(){
                $(":input[type=text]").addClass("form-control");
                $(":input[type=text]").addClass("ilabel_input");
                parent.setdiagTitle("标签名称："+$("#LabelName").text());
            })
        </script>

    </form>
</body>
</html>