<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_SetSecondPwd, App_Web_kh00etpl" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>支付密码设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="SetSecondPwd"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">支付密码<a href="SetSecondPwd.aspx">[设置支付密码]</a></li>
    </ol>
</div>
    <div class="container btn_green u_cnt">
        <div class="us_seta" style="margin-top: 5px; width: 100%;" runat="server" id="DV_Set" visible="false">
            <div class="us_topinfo"><font color="red">初次使用请先设置支付密码：</font></div>
            <table align="center" border="0" class="table table-striped table-bordered table-hover">
                <tr>
                    <td align="center" width="40%"><strong>密 码：</strong></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" CssClass="form-control text_md" />
                        <font style="color: Red">*</font>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ValidationExpression="[\S]{6,}" ErrorMessage="密码至少6位" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" SetFocusOnError="false" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="40%"><strong>确认密码：</strong></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control text_md" />
                        <font style="color: Red">*</font>
                        <asp:CompareValidator ID="CompareValidator2" ControlToValidate="TextBox2" ControlToCompare="TextBox1" ErrorMessage="两次输入的密码不一致！" runat="server" /></td>
                </tr>
                <tr align="center">
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="保存"
                            class="btn btn-primary" OnClick="Button1_Click" />
                        &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="取消" ValidationGroup="BtnCancel"
                class="btn btn-primary" OnClick="Button2_Click" /></td>
                </tr>
            </table>
        </div>
        <div class="us_seta" style="margin-top: 5px; width: 100%;" runat="server" id="DV_show">
            <table align="center" border="0" class="table table-striped table-bordered table-hover">
                <tr>
                    <td align="center" width="40%"><strong>原 密 码：</strong></td>
                    <td>
                        <asp:TextBox ID="TxtOldPassword" runat="server" CssClass="form-control text_md" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td align="center" width="40%"><strong>新 密 码：</strong></td>
                    <td>
                        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="form-control text_md" />
                        <font style="color: Red">*</font>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server"
                            ControlToValidate="TxtPassword" ValidationExpression="[\S]{6,}" ErrorMessage="密码至少6位"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="ReqTxtPassword" runat="server" ControlToValidate="TxtPassword"
                            SetFocusOnError="false" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="40%"><strong>确认密码：</strong></td>
                    <td>
                        <asp:TextBox ID="TxtPassword2" runat="server" TextMode="Password" CssClass="form-control text_md" />
                        <font style="color: Red">*</font>

                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtPassword2" ControlToCompare="TxtPassword" ErrorMessage="两次输入的密码不一致！" runat="server" /></td>
                </tr>
                <tr align="center">
                    <td align="center" colspan="2">
                        <asp:Button ID="BtnSubmit" runat="server" Text="修改" OnClick="BtnSubmit_Click" class="btn btn-primary" />
                        &nbsp;&nbsp;
            <asp:Button ID="BtnCancle" runat="server" Text="取消" OnClick="BtnCancle_Click" ValidationGroup="BtnCancel" class="btn btn-primary" /></td>
                </tr>
            </table>
            <div style="width: 100%; text-align: center; margin-top: 10px">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
