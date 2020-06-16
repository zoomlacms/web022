<%@ page language="C#" autoeventwireup="true" inherits="Plat_Mail_NetMessageRead, App_Web_qf403px0" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Plat/Common/EmailNav.ascx" TagPrefix="uc1" TagName="EmailNav" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title><asp:Literal runat="server" ID="Title_L">收件箱</asp:Literal></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li><a href="/Plat/Blog/">首页</a></li>
        <li><a href="/Plat/Email/">邮件</a></li>
        <li class="active">收件箱</li>
    </ol>
    <uc1:EmailNav runat="server" ID="EmailNav" />
    <span runat="server" id="remind_span">正在接收来自:<span id="acount_t"></span>的邮件<span>共有:</span><span id="totalcount_t"></span>封,当前正在接收第<span id="curcount_t">1</span>封</span>
    <div class="clearfix"></div>
    <ZL:ExGridView runat="server" ID="EGV" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" OnPageIndexChanging="EGV_PageIndexChanging"
         AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" EmptyDataText="当前没有邮件!!">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <%#Eval("ID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <a href="MailDetail.aspx?ID=<%#Eval("ID") %>"><%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发件人">
                <ItemTemplate>
                    <%#Eval("Sender") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发件时间">
                <ItemTemplate>
                    <%#Eval("MailDate","{0:yyyy年MM月dd日 HH:mm}")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建时间">
                <ItemTemplate>
                    <%#Eval("CDate") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Dels" Text="批量删除" CssClass="btn btn-primary" OnClick="Dels_Click" runat="server" OnClientClick="return confirm('确定要删除吗?');" />
    <asp:Button ID="DownMail_Btn" Text="下载邮件" CssClass="btn btn-primary" runat="server" OnClick="DownMail_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        #remind_span {display: none;}
        #EGV tr td {text-align: left;}
    </style>
    <script type="text/javascript">
        var interal;
        function BeginCheck() {
            interal = setInterval(GetProgress, 1000);
        }
        function GetProgress() {
            $.post("Default.aspx", { action: "getprogress" }, function (data) {
                if (data != "") {
                    console.log(data);
                    switch (data) {
                        case "1":
                            location = location;
                        case "2":
                            $("#remind_span").show();
                            $("#remind_span").text("邮件日期已过期,停止更新之后的邮件");
                            clearInterval(interal);
                            break;
                        case "":
                            clearInterval(interal);
                            break;
                        default:
                            $("#remind_span").show();
                            var json = { mail: data.split('|')[0], count: data.split('|')[1], cur: data.split('|')[2] }
                            $("#acount_t").text(json.mail);
                            $("#totalcount_t").text(json.count);
                            $("#curcount_t").text(json.cur);
                            break;
                    }
                }
            });
        }
        function HasTask() {
            $.post("Default.aspx", { action: "hastask" }, function (data) {
                if (data == "1") {
                    BeginCheck();
                }
            });
        }
        $().ready(function () {
            HasTask();
        });
    </script>
</asp:Content>

