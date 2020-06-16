<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.PostPurse, App_Web_mgwepmrc" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>赠送金额</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li>
        <li class="active">赠送金额</li> 
    </ol>
</div>
<div class="container">
    <div id="manageinfo" class="us_seta">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td style="width: 20%" align="right">会员金额：</td>
                <asp:HiddenField ID="rblExp" runat="server" Value="3" />
                <td>
                    <asp:Label ID="lblCoin" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 20%" align="right">赠送会员 ：</td>
                <td>
                    <asp:TextBox ID="UserName2" CssClass="form-control text_md" runat="server" Value=""></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%" align="right">赠送会员邮箱 ：</td>
                <td>
                    <asp:TextBox ID="UserEmail" CssClass="form-control text_md" runat="server" Value=""></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="UserEmail" Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 20%" align="right">金额：</td>
                <td>
                    <asp:TextBox ID="TxtScore" CssClass="form-control text_md" runat="server" Text=""></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^([0-9]+(\.(\d*)|0)?)|(0(\.\d+){1})$" ControlToValidate="TxtScore" ErrorMessage="只能输入数字"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 20%" align="right">备注：</td>
                <td>
                    <asp:TextBox ID="TxtDetail" runat="server" Rows="10" TextMode="MultiLine" CssClass="form-control text_md" Height="60px"></asp:TextBox></td>
            </tr>
            <tr class="tdbgbottom btn_green">
                <td colspan="2" align="center">
                    <asp:HiddenField ID="Hdn_t" runat="server" />
                    <asp:HiddenField ID="HdnUserID" runat="server" />
                    <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="执 行" OnClick="EBtnSubmit_Click" runat="server" />
                    <asp:Button ID="Button1" CssClass="btn btn-primary" Text="取 消" runat="server" CausesValidation="false" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span class="glyphicon glyphicon-info-sign" style="color:#5bc0de;margin-right:5px;"></span>提示：您可以使用PostPurse.aspx?Uname=admin&emial=aaa@126.com&num=10&con=content的方法进行GET传递。
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>