<%@ page language="C#" autoeventwireup="true" inherits="User_ChangeMP, App_Web_kh00etpl" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>修改手机</title>
<style>
#sendCodeBtn{ width:100px;} 
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="ChangeMP"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
    <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li class="active">修改手机</li> 
</ol>
</div>
<div runat="server" id="Login" class= "us_seta" style="position: absolute; top: 40%; left: 40%" visible="false">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="Second" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:Button ID="sure" runat="server" Text="确定" OnClick="sure_Click" /></td>
        </tr>
    </table>
</div>
<div runat="server" id="DV_show">
    <div class="container">
        <div class="us_seta btn_green">
            <asp:Panel ID="panel1" runat="server" Visible="true" Width="100%">
                <table align="center" border="0" class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="text-align: center; width: 40%" class="auto-style1"><strong>
                            <asp:Label ID="Label2" runat="server" Text="原手机号："></asp:Label></strong></td>
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <asp:TextBox ID="TextBox1" ClientIDMode="Static" runat="server" Visible="false" CssClass="form-control text_md"></asp:TextBox>                     
                            <input type="text" id="sendCodeBtn" class="btn btn-primary" data-loading-text="正在发送" value="发送验证码" onclick="postToCS('sendCode', this);" title="点击后过20秒才能再次发送" />
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="^1[(0-9)]{10}$" ControlToValidate="TextBox1" ErrorMessage="按照手机号规则输入" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; width: 40%"><strong>请输入验证码：</strong></td>
                        <td>
                            <asp:TextBox ID="codeText" runat="server" CssClass="form-control text_md" />
                            <span style="color: Red">*</span>
                            
                            <script type="text/javascript">
                                function disButton(obj) {
                                    var time = 20000;//20秒
                                    setTimeout(function () { obj.disabled = true; }, 50);
                                    var a = setInterval(
                                        function () {
                                            time = time - 1000;
                                            obj.value = +time / 1000 + "秒";
                                        }, 1000);
                                    setTimeout(function () { obj.disabled = false; clearInterval(a); obj.value = "发送验证码"; }, time);
                                }
                                function postToCS(a, obj) {
                                    var mob = document.getElementById("TextBox1").value;
                                    $.ajax({
                                        type: "Post",
                                        url: "ChangeMP.aspx",
                                        data: { action: a, Mobile: mob, },
                                        success: function (data) { disButton(obj); alert(data); },
                                        error: function () { alert("发送失败"); }
                                    });
                                }
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; width: 40%" colspan="2">
                            <asp:Button ID="nextBtn" runat="server" CssClass="btn btn-primary" Text="下一步" OnClick="nextBtn_Click" />
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="保存" OnClick="Button1_Click" Visible="false" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="panel2" runat="server" Width="100%" Visible="false">
                <table align="center" border="0" class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="text-align: center; width: 40%" class="auto-style1"><strong>新手机号：</strong></td>
                        <td>
                            <asp:TextBox ID="tbMobile" runat="server" CssClass="form-control text_md" />
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="^1[(0-9)]{10}$" ControlToValidate="tbMobile" ErrorMessage="按照手机号规则输入" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; width: 40%" colspan="2">
                            <asp:Button ID="BtnSubmit" runat="server" Text="提交" class="btn btn-primary" OnClick="BtnSubmit_Click" />
                            <input type="text" class="btn btn-primary" data-loading-text="正在发送" value="发送验证码" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <div style="width: 100%; text-align: center; margin-top: 10px">
                <div style="width: 100%; text-align: center"></div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
