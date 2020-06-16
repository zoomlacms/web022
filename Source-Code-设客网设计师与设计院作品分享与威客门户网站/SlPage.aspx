 <%@ page language="C#" autoeventwireup="true" inherits="SlPage, App_Web_pk13pou2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html >
<head id="Head1" runat="server">
<title><%=GetTitle()%></title>
<link href="../../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
    <script src="JS/jquery-1.9.1.min.js"></script>
 <script type="text/javascript" src="/JS/Silverlight.js"></script>
<script type="text/javascript">
    function onSilverlightError(sender, args) {
        var appSource = "";
        if (sender != null && sender != 0) {
            appSource = sender.getHost().Source;
        }

        var errorType = args.ErrorType;
        var iErrorCode = args.ErrorCode;

        if (errorType == "ImageError" || errorType == "MediaError") {
            return;
        }

        var errMsg = "Silverlight 应用程序中未处理的错误 " + appSource + "\n";

        errMsg += "代码: " + iErrorCode + "    \n";
        errMsg += "类别: " + errorType + "       \n";
        errMsg += "消息: " + args.ErrorMessage + "     \n";

        if (errorType == "ParserError") {
            errMsg += "文件: " + args.xamlFile + "     \n";
            errMsg += "行: " + args.lineNumber + "     \n";
            errMsg += "位置: " + args.charPosition + "     \n";
        }
        else if (errorType == "RuntimeError") {
            if (args.lineNumber != 0) {
                errMsg += "行: " + args.lineNumber + "     \n";
                errMsg += "位置: " + args.charPosition + "     \n";
            }
            errMsg += "方法名称: " + args.methodName + "     \n";
        }

        // 引发新错误(errMsg);
    }
</script>
   
    <style type="text/css">
        #silverlightControlHost
        {
            margin-top: 0px;
        }
    </style>
</head>
<body style=" background:<%= getUrl()%>" onLoad="top.window.focus()" onkeydown="movepage()"> 
    <form id="form1" runat="server" style="height:auto;">
          <embed  src="" runat="server" id="Music" height="0px" width="0px" />
   <div id="maga_tit"> <h1>  <%=GetTitle() %></h1>
   </div>
    <div id="silverlightControlHost">
        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2" width="1158px" height="700px">
		  <param name="source" value="ClientBin/SilverlightClient.xap"/>
		  <param name="onError" value="onSilverlightError" />
		  <param name="background" value="white" />
		  <param name="minRuntimeVersion" value="3.0.40818.0" />
            <param name="autoUpgrade" value="true" />
		  <param name="initParams" value='gFile=<%=Request["Content"] %>, gHeaderPage=albumPictures, gNum=<%=Request["Num"] %>, gLocation=web' />
		  <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=3.0.40818.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="获取 Microsoft Silverlight" style="border-style:none"/>
		  </a>
	    </object><iframe id="_sl_historyFrame" style="display:none;height:0px;width:0px;border:0px"></iframe></div>
    </form>

</body>
</html>
