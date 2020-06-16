<%@ page language="C#" autoeventwireup="true" inherits="test_MailConfig, App_Web_qf403px0" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Plat/Common/EmailNav.ascx" TagPrefix="uc1" TagName="EmailNav" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>邮箱配置</title><style>.Messge_nav { margin-bottom: 10px; margin-top: 10px; }</style></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li><a href="/Plat/Blog/">首页</a></li>
        <li><a href="/Plat/EMail/">邮件</a></li>
        <li class="active">邮箱配置[<a href="javascript:;" onclick="ShowAdd();">添加邮箱</a>]</li>
    </ol>
    <uc1:EmailNav runat="server" ID="EmailNav" />
    <div class="clearfix"></div>
    <ZL:ExGridView runat="server" ID="EGV" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" 
        AllowPaging="true" PageSize="10" EnableTheming="False" GridLines="None" EmptyDataText="您尚未配置邮箱!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
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
            <asp:TemplateField HeaderText="名称">
                <ItemTemplate>
                    <%#Eval("Alias") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="POP" DataField="POP" />
            <asp:BoundField HeaderText="SMTP" DataField="SMTP" />
            <asp:TemplateField HeaderText="邮箱名">
                <ItemTemplate>
                    <%#Eval("ACount") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建时间">
                <ItemTemplate>
                    <%#Eval("CDate") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                 <ItemTemplate>
                     <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Edit2">修改</asp:LinkButton>
                 </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Dels" runat="server" Text="批量删除" OnClick="Dels_Click" CssClass="btn btn-primary" OnClientClick="return confirm('确定要删除吗?');" />
    <div id="configdiv" style="display:none;">
        <asp:HiddenField runat="server" ID="CurID_Hid" />
        <table class="table table-bordered">
            <tr><td>名称</td><td><asp:TextBox runat="server" ID="Alias_T" CssClass="form-control" MaxLength="20" />(20个字符内)</td></tr>
            <tr><td style="width:120px;">邮箱POP</td><td>
               <asp:TextBox runat="server" ID="POP_T" class="form-control" />
                <div id="poplist" class="btn btn-group">
                    <button type="button" class="btn btn-default" data-pop="pop3.163.com">163</button>
                    <button type="button" class="btn btn-default" data-pop="pop.exmail.qq.com">QQ企业</button>
                    <button type="button" class="btn btn-default" data-pop="pop.sina.cn">新浪</button>
                    <button type="button" class="btn btn-default" data-pop="pop.139.com">139</button>
                    <button type="button" class="btn btn-default" data-pop="pop.tom.com">Tom</button>
                </div></td></tr>
             <tr><td style="width:120px;">邮箱SMTP</td><td>
               <asp:TextBox runat="server" ID="SMTP_T" class="form-control" />
                <div id="smtplist" class="btn btn-group">
                    <button type="button" class="btn btn-default" data-smtp="smtp.163.com">163</button>
                    <button type="button" class="btn btn-default" data-smtp="smtp.exmail.qq.com">QQ企业</button>
                    <button type="button" class="btn btn-default" data-smtp="smtp.sina.cn">新浪</button>
                    <button type="button" class="btn btn-default" data-smtp="smtp.139.com">139</button>
                    <button type="button" class="btn btn-default" data-smtp="smtp.tom.com">Tom</button>
                </div></td></tr>
            <tr><td>邮箱帐户</td><td><asp:TextBox runat="server" ID="Acount_T" CssClass="form-control" /></td></tr>
            <tr><td>邮箱密码</td><td><asp:TextBox runat="server" ID="Passwd_T" TextMode="Password" CssClass="form-control"/></td></tr>
            <tr><td>天数</td><td><asp:TextBox runat="server" ID="Days_T" CssClass="form-control"/>(接收多少天内的邮件)</td></tr>
            <tr><td></td><td><asp:Button runat="server" ID="Save_Btn" Text="添加" OnClientClick="return CheckSave()" OnClick="Save_Btn_Click" CssClass="btn btn-primary" />
                <input type="button" onclick="CloseDiag();" value="关闭" class="btn btn-default" /></td></tr>
        </table>
    </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript">
        function BindEvent() {
            $("#poplist button").click(function () {
                $("#POP_T").val($(this).data("pop"));
            });
            $("#smtplist button").click(function () {
                $("#SMTP_T").val($(this).data("smtp"));
            });
        }
        var diag = new ZL_Dialog();
        diag.content = "configdiv";
        function ShowAdd() {
            diag.title = "添加邮箱";
            $("#Save_Btn").val("添加");
            $("#CurID_Hid").val("");
            diag.ShowModal();
            BindEvent();
        }
        function ShowEdit() {
            diag.title = "修改邮箱";
            $("#Save_Btn").val("修改");
            diag.ShowModal();
            BindEvent();
        }
        function CloseDiag() {
            $("#" + diag.id).modal("hide");
        }
        function CheckSave() {
            var pop = $("#POP_T").val();
            var smtp = $("#SMTP_T").val();
            if (!ZL_Regex.isPop(pop) || !ZL_Regex.isPop(smtp)) {
                alert("POP或SMTP服务器格式不正确");
                return false;
            }
            if (ZL_Regex.isEmpty($("#Alias_T").val())) {
                alert("名称不能为空！");
                return false;
            }
            if (!ZL_Regex.isEmail($("#Acount_T").val())) {
                alert("邮箱格式不正确！");
                return false;
            }
            if ($("#Passwd_T").val().replace(/ /g, "") == "") {
                alert("密码不能为空！");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>