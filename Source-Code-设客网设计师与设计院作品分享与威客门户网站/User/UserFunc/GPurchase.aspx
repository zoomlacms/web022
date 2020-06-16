<%@ page language="C#" autoeventwireup="true" inherits="User_GroupPurchase, App_Web_jaigsi5h" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>升级会员组</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="GPurchase"></div>
    <asp:HiddenField runat="server" ID="Name_Hid" Value="银币|余额|文币" />
<%ZoomLa.Common.function.WriteErrMsg("该页面关闭访问");%>
    <div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%:Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active" title="升级会员组"><a href="<%=Request.RawUrl %>">升级会员组</a></li>
    </ol>
</div>
<div class="container btn_green">
    <h2 runat="server" id="title_h"></h2>
    <div runat="server" id="datadiv" visible="false">
        <asp:Repeater runat="server" ID="RPT">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li class="gpitem">
                    <label>
                        <input type="radio" name="id_rad" value="<%#Eval("GroupID") %>" />
                        <span id="gpname"><%#Eval("GroupName") %></span>
                        <span id="price"><%#GetPrice() %></span></label>
                </li>
            </ItemTemplate>
            <FooterTemplate></ul></FooterTemplate>
        </asp:Repeater>
        <div class="r_gray">您当前的会员级别是<span runat="server" class="r_green_mid" id="gpname_now"></span>准备升级为<span id="gpname_target" class="r_green_mid"></span>需要支付：<span id="gpprice" class="r_green_mid"></span></div>
        <asp:Button runat="server" ID="Save_Btn" Text="确定购买" CssClass="btn btn-primary" OnClientClick="return CheckData();" OnClick="Save_Btn_Click" />
    </div>
    <div runat="server" id="emptydiv" visible="false">
        <div class='alert alert-danger' role='alert'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span><span class='sr-only'>提示:</span>
            <span>你当前的会员组为:</span><span runat="server" class="r_green_mid" id="gpname_now2"></span>没有可升级的会员组！</div>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script> 
        $(function () {
            $(":radio[name=id_rad]").click(function () {
                ChangeRad(this);
            });
            $(":radio[name=id_rad]").eq(0).click();
        })
        function CheckData() {
            var $rad = $(":radio[name=id_rad]:checked");
            if ($rad.length < 1) {
                alert("请先选定需要升级的会员!");
                return false;
            }
            return confirm("你确定要升级会员组吗?");
        }
        var curName = "<%:CurName%>";
        function ChangeRad(obj) {
            $li = $(obj).closest("li");
            var gpname = $li.find("#gpname").text(); 
            var price = $li.find("#price").text();
            $("#gpname_target").text(gpname);
            $("#gpprice").text(price + curName);
        }
    </script>
</asp:Content>