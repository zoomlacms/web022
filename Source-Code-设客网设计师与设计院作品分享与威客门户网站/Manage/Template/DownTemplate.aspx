<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Template_DownTemplate, App_Web_mq0353cm" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>方案列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField ID="hfIsExist" runat="server" />
    <table style="width: 100%; margin: 0 auto;" cellpadding="2" cellspacing="1" class="table table-striped table-bordered">
        <tr align="center" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td colspan="2" class="spacingtitle">
                <asp:Label ID="LblTitle" runat="server" Text="下载方案" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    [<asp:Literal ID="tempname" runat="server"></asp:Literal>]模版下载中请耐心等待片刻…
                <br />
                    <div id="gallery">
                        <div class="pull-left">
                            <asp:Literal ID="tempimg" runat="server"></asp:Literal></div>
                        <div id="DownTips" class="bs-example pull-left" style="width: 50%; display: none;">
                            <div class="alert alert-success fade in">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h4>恭喜！模版下载完成</h4>
                                <p>是否立即前往网站参数配置页面进行设置</p>
                                <p>
                                    <button type="button" onclick="jump()" class="btn btn-info">前往设置</button>
                                    <asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Text="返回" OnClick="Button2_Click" />
                                </p>
                            </div>
                        </div>
                        <!-- /example -->
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server">
                    <asp:Literal ID="installstart" runat="server"></asp:Literal>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <div id="downimg" style="margin-top: 20px; width: 50%;">
                    <div class="progress progress-striped active">
                        <div id="downTempDiv" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            <span id="downTempSpan" class="sr-only" style="position: relative;"></span>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
    <script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
            $(".lightbox").lightbox({
                fitToScreen: true,
                imageClickClose: false
            });
        });
        var wida = 0;
        var interval;
        var actionArr = "getTempP";//下载模板
        function PostToCS(a, v) {
            $.ajax({
                type: "Post",
                url: "DownTemplate.aspx",
                data: { action: a, value: v },
                success: function (data) {
                    $("#downTempDiv").css("width", data + "%");
                    $("#downTempSpan").text(data + "%");
                    if (data == 100) {
                        clearInterval(interval);
                        $("#DownTips").show();
                    }
                },
                error: function (data) {
                }
            });
        }
        //调用其开始循环获取
        function beginCheck(request) { interval = setInterval(function () { PostToCS(request, '') }, 1000); }
        //完成,可以开始安装
        //跳转
        function jump() {
            window.location.href = "<%= customPath2%>Config/SiteOption.aspx?prodirName=<%=prodirName%>";
        }
    </script>
</asp:Content>
