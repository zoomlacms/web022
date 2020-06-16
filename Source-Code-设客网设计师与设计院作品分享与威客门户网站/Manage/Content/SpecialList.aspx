<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.Web.Site.Content.SpecialList, App_Web_tln5ra1b" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>选择专题</title>
    <script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function category() { alert("你选择的是专题类别，请选择专题！"); }
        function SetSpec(specname, specid) {
            parent.UpdateSpe(specname, specid);
        }
    </script>
    <style type="text/css">
        * {
            font-family: 'Microsoft YaHei';
        }
        
        #node_div ul li {
            list-style-type: none;
        }
    </style>
    <script type="text/javascript">
        function ShowChild() {
            $obj = $(event.srcElement);
            $obj.parent().parent().find("ul:eq(0)").toggle();
        }
        function ChkChild(obj) {
            $(obj).parent().find(".nodechk").each(function () { this.checked = obj.checked; });
        }
        function GetResult() {
            var vs = [];
            $(".nodechk:checked").each(function () {
                vs.push({ id: $(this).val(), name: $(this).data("name") })
            });
            return JSON.stringify(vs);
        }
        function ReturnResult(r) {//支持window.open与frame引用
            if (opener) {
                opener.DealResult(r);
            }
            else {
                parent.DealResult(r);
            }
        }
        function checkAll() {
            $(".nodechk").each(function (i, j) {
                j.checked = $("#AllCheck")[0].checked;
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="node_div">
            <asp:Literal runat="server" ID="NodeHtml_Lit" EnableViewState="false"></asp:Literal>
        </div>
        <div>
            <asp:TreeView ID="tvNav" runat="server" ExpandDepth="0" ShowLines="True" EnableViewState="false"
                NodeIndent="10" ImageSet="Simple2" Width="294px">
                <NodeStyle BorderStyle="None" />
            </asp:TreeView>
        </div>
        <br />
        <br />
        
    </form>
</body>
</html>
