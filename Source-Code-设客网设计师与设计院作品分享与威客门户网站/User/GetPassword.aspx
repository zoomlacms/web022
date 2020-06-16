<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.User_GetPassword, App_Web_odweewxl" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>找回密码-<%:Call.SiteName %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <center style="background: url(http://code.zoomla.cn/user_login.jpg); background-position: center; left: 0; top: 0; right: 0; bottom: 0; position: absolute; background-repeat: no-repeat; background-size: cover;">
        <div class="user_mimenu">
            <div class="navbar navbar-fixed-top" role="navigation">
                <button type="button" class="btn btn-default" id="mimenu_btn">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="user_mimenu_left">
                    <ul class="list-unstyled">
                        <li><a href="/" target="_blank">首页</a></li>
                        <li><a href="/Home" target="_blank">能力</a></li>
                        <li><a href="/Index" target="_blank">社区</a></li>
                        <li><a href="/Ask" target="_blank">问答</a></li>
                        <li><a href="/Guest" target="_blank">留言</a></li>
                        <li><a href="/Baike" target="_blank">百科</a></li>
                        <li><a href="/Office" target="_blank">OA</a></li>
                    </ul>
                </div>
                <div class="navbar-header">
                    <button class="navbar-toggle in" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">移动下拉</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
            </div>
        </div>
        <div class="user_login">
            <h3><span class="glyphicon glyphicon-refresh"></span>输入用户名请求密码重设邮件！</h3>
            <ul class="list-unstyled">
                <asp:Panel ID="PnlStep1" runat="server" Visible="false">
                    <li>
                        <i class="fa fa-envelope"></i>
                        <asp:TextBox ID="TxtUserName" placeholder="输入会员名" runat="server" CssClass="form-control text_max" />
                        <asp:RequiredFieldValidator ID="ValrTxtUserName" runat="server" ValidationGroup="find" ErrorMessage="输入会员名!" ControlToValidate="TxtUserName" Display="dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></li>
                    <li class="margin_t5">
                        <i class="fa fa-qrcode"></i>
                        <div class="form-group" id="trVcodeRegister" runat="server">
                            <asp:TextBox ID="VCode" MaxLength="6" placeholder="验证码" runat="server" CssClass="form-control text_x" autocomplete="off"></asp:TextBox>
                            <img id="VCode_img" title="点击刷新验证码" class="code" style="height: 34px;" />
                            <input type="hidden" id="VCode_hid" name="VCode_hid" />
                        </div>
                    </li>
                    <li class="text-center">
                        <asp:Button ID="BtnStep1" runat="server" ValidationGroup="find" CssClass="btn btn-info" Text="下一步" OnClick="BtnStep1_Click" />
                        <a href="/User/Login.aspx" class="btn btn-default" style="margin-top: 10px">返回登录</a>
                    </li>
                </asp:Panel>
                <asp:Panel ID="PnlStep2" runat="server" Visible="false">
                    <li>密码提示问题：<asp:Literal ID="LitQuestion" runat="server"></asp:Literal></li>
                    <li>密码提s示答案：<asp:TextBox ID="TxtAnswer" runat="server" CssClass="form-control"></asp:TextBox></li>
                    <asp:Button ID="BtnStep2" runat="server" Text="完成" OnClick="BtnStep2_Click" CssClass="btn btn-primary" />
                </asp:Panel>
                <asp:Panel ID="PnlStep3" runat="server" Visible="false">
                    <li>新密码：<asp:TextBox ID="TxtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox></li>
                    <li>确认新密码：<asp:TextBox ID="TxtConfirmPassword" runat="server" TextMode="Password" Width="148px" CssClass="form-control"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValTxtConfirmPassword" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword" Display="Dynamic" Type="String" Operator="Equal" runat="server" ErrorMessage="两次密码输入不一致！"></asp:CompareValidator>
                        <asp:Button ID="BtnStep3" runat="server" Text="修改密码" OnClick="BtnStep3_Click" CssClass="btn btn-primary" />
                    </li>
                </asp:Panel>
            </ul>
        </div>
    </center>

    <div class="container margin_t5">
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-md-offset-4">
</div>
</div>
</div>
    <script src="/JS/ZL_ValidateCode.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#TxtUserName").focus();
            $("#VCode").ValidateCode();
        });
        $("#mimenu_btn").click(function (e) {
            if ($(".user_mimenu_left").width() > 0) {
                $(".user_mimenu_left ul").fadeOut(100);
                $(".user_mimenu_left").animate({ width: 0 }, 200);
            }
            else {
                $(".user_mimenu_left").animate({ width: 150 }, 300);
                $(".user_mimenu_left ul").fadeIn();
            }
        });
</script>
</asp:Content> 
