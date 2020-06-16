<%@ page language="C#" autoeventwireup="true" inherits="Common_NodeList, App_Web_czxwn4p5" enableEventValidation="false" viewStateEncryptionMode="Never" %><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>节点选取</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/dist/css/font-awesome.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
    <style type="text/css">
        *{font-family:'Microsoft YaHei';} 
    </style>
    <script type="text/javascript">
        function ShowChild(obj) {
            $obj = $(obj);//event.srcElement || 
            $obj.siblings("ul").toggle();
            //$obj.parent().parent().find("ul:eq(0)").toggle();
        }
        function ChkChild(obj) {
            $(obj).parent().parent().find("input[name=nodeChk]").each(function () { this.checked = obj.checked; });
        }
        function GetResult() {
            var nodeArr = [];
            $("[name=nodeChk]:checked").each(function () {
                var node = { nodeid: $(this).val(), nodename: $(this).data("name") };
                nodeArr.push(node);
            });
           return nodeArr;
        }
        function ReturnResult(nodeArr) {
            switch ("<%=Source%>") {
                case "content":
                    parent.PageCallBack("pushcon", nodeArr);//文章推送
                    break;
                default:
                    parent.DealResult(nodeArr);
                    break;
            }
        }
        function checkAll() {
            $("[name=nodeChk]").each(function (i, j) {
                j.checked = $("#AllCheck")[0].checked;
            });
        }
        //给父页面调用
        function SureFunc() {
            ReturnResult(GetResult());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="node_div" style="min-height:300px;">
            <asp:Literal runat="server" ID="NodeHtml_Lit" EnableViewState="false"></asp:Literal>
        </div>
        <div runat="server" id="opdiv" style="position: fixed; border-radius: 3px; padding: 5px;top:2px;left:200px;display:none;"><!-- box-shadow: 0 4px 20px 1px rgba(0,0,0,0.2);-->
            <input type="button" id="sure_Btn" value="确定" class="btn btn-primary" onclick="ReturnResult(GetResult());" />
        </div>
    </form>
</body>
</html>