<%@ page language="C#" autoeventwireup="true" inherits="Common_ContentList, App_Web_czxwn4p5" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
    <title>节点选取</title>
    <style type="text/css">
        a{text-decoration:none;}
        li a{color:green;font-size:14px;}
        td a{font-size:14px;color:black;}
        a:hover{text-decoration:underline;}
        *{font-family:'Microsoft YaHei';}
        #node_div ul li{list-style-type:none;}
        .flolt_L{float:left;}
        .contentstyle{margin-left:60px;width:350px;height:350px;display:none;}
        .contentTable{width:100%;color:brown;border:1px solid #ddd;}
    </style>
    <script type="text/javascript">
        function ShowChild() {
            $obj = $(event.srcElement);
            $obj.parent().parent().find("ul:eq(0)").toggle();
        }
        function ChkChild(obj) {
            $(obj).parent().find("input[name=nodeChk]").each(function () { this.checked = obj.checked; });
        }
        function GetResult() {
            var vs = "";
            $("#node_div input[name=nodeChk]:checked").each(function () { vs += $(this).val() + ","; });
            return vs;
        }
        function ReturnResult(r) {//支持window.open与frame引用
            if (opener) {
                opener.opener.DealResult(r);
            }
            else {
                window.parent.parent.DealResult(r);
            }
        }
        function showContent(data) {
            $("#User_IFrame").show();
            $("#User_IFrame").attr("src", data);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="node_div" class="flolt_L">
            <asp:Literal runat="server" ID="NodeHtml_Lit" EnableViewState="false"></asp:Literal>
        </div>
        <iframe runat="server" id="User_IFrame" class="flolt_L contentstyle" src="" frameborder="0"></iframe>
        <ZL:ExGridView CssClass="contentTable" runat="server" ID="Egv" AutoGenerateColumns="false" EmptyDataText="无内容">
            <Columns>
                <asp:TemplateField HeaderText="内容标题">
                    <ItemTemplate>
                        <a href='javascript:ReturnResult(<%#Eval("GeneralID") %>)'><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
        <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    </form>
</body>
</html>