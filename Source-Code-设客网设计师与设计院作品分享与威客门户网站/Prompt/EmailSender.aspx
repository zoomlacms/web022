<%@ page language="C#" autoeventwireup="true" inherits="Common_EmailSender, App_Web_0glw4r2n" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<html><head>
<title>
邮件发送
</title>  
<link href="../User/css/default1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/Common.js"></script> 
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<style>
*{ padding:0; margin:0; }
.inquiryPro{ font-size:12px; line-height:20px;}
.inquiryPro img{ float:left; margin-right:5px; }
 
</style>
<script>
    function ActionSec(obj) {
        //obj -1未放匿名发送时未登录,0发送失败,1为成功   
        if (obj == 0) {
            alert("发送失败!");
        }
        if (obj == 1) {
            alert("发送成功!");
        }
        if (obj == -1) {
            alert("邮件发送失败！系统未开放匿名发送邮件，请登录后再试！");
            window.location.href = "/User/";
        }
    }
</script>
</head>
<body style=" overflow:hidden; ">
<div class="r_navigation">
    您现在的位置：<span id="YourPosition"><span><a title="网站首页" href="/">网站首页</a></span><span> &gt;&gt; </span><span>邮件订阅</span></span>
</div>
<form id="from1" runat="server">

<div id="showMsg" runat="server"></div>
<div  > 
<table style="width:800px;">
 <tr align="left">
        <td colspan="2" class="spacingtitle">
            <strong>邮件订阅</strong>
        </td>
    </tr>

<tr class="tdbg">
<tr class="tdbg"><td  class="tdbgleft" align="right">From：</td><td><input id="SeEmail" runat="server" /></td></tr>

<tr class="tdbg"><td  class="tdbgleft" align="right">To：</td><td><input id="toEmail" runat="server" ></input></td></tr>
<td class="tdbgleft" style="width: 20%" align="right">标题:</td><td  style="width: 80%" ><input id="Title"  runat="server" /> </td></tr>
<%=Session["shopli"]%>
<asp:HiddenField ID="shopids" runat="server" /> 
<tr class="tdbg"><td  class="tdbgleft" align="right">内容：</td><td > 
 <table width="100%"> 
 <tr><td>
<textarea id="con" runat="server" style="height:300px"   > </textarea>
 </td></tr>
 </table>
    <%=Call.GetUEditor("con") %>
 </td></tr>
<tr><td colspan="2"  align="center"><asp:Button ID="send"  runat="server" OnClick="send_Click" Text="发送邮件" /></td></tr>
</table>
 </div>
<%--<input type="button"  runat="server" onclick="call()" value="发送邮件">
--%>
</form>
<script type="text/javascript">
    function getval(n, val) {
        if (document.getElementById("ckShop" + n).checked) {
            document.getElementById("shopids").value +=val + "|";
        }
        else {
            var str = document.getElementById("shopids").value.split('|');
            var strs="";
            if (str != "") {

                for (var i = 0; i < str.length; i++) {

                    if (str[i] != "")
                     {  
                    if (val == str[i]) {
                       // strs = strs+ "";
                    }
                    else {
                        strs =strs+ str[i] + "|";
                    }
                    }
                }
        }
         document.getElementById("shopids").value= strs; 
      }
    }
//    function getval(n, val) {
//        document.getElementById("shopids1").value += "id" + n + "=" + val + "|";
//    }
//    function call() {
//     $.ajax({
//      type: "POST",
//    url: "/common/emailsender.aspx",
//      data: "title=邮件主题&con=邮件内容",
//          success: function (msg) {
//              switch (msg) {
//                   case "0": alert("邮件发送失败"); break;
//                     case "1": alert("邮件发送成功"); break;
//                   case "2": alert("邮件发送失败！系统未开放匿名发送邮件，请登录后再试"); break;
//                    default: alert("邮件发送失败"); break;
//             }
//            },
//            error: function (msg) {
//              alert("邮件发送失败！系统未开放匿名发送邮件请登录后再试");
//           }
//       });
//    }
</script>
</body></html>