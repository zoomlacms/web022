<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.ChangAnswer, App_Web_222g3wpa" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
<title>修改密码提示</title> 
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a></li>
       <li><a href="/User/" title="会员中心">会员中心</a></li>
        <li><a href="/User/ChangPSW.aspx" title="修改密码">修改密码</a></li>
        </ol>
</div>
<div class="container m715-50">
	  <div class="us_seta btn_green" style="margin-top:10px;">
          <table class="table table-striddped table-bordered table-hover">
              <tr>
                  <td class="td_l text-right">密码提示问题：</td>
                  <td><asp:TextBox ID="TxtQuestion" runat="server" CssClass="form-control text_300" TextMode="Password" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtQuestion"
                runat="server" ErrorMessage="密码提示问题！" CssClass="color_red" Display="Dynamic" /></td>
              </tr>
              <tr>
                  <td class="td_l text-right">新密码提示答案：</td>
                  <td><asp:TextBox ID="TxtNewAnswer" runat="server" CssClass="form-control text_300" TextMode="Password" /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtQuestion"
                runat="server" ErrorMessage="密码提示问题！" CssClass="color_red" Display="Dynamic" /></td>
              </tr>
              <tr>
                  <td class="td_l text-right">确认密码提示答案：</td>
                  <td><asp:TextBox ID="TxtNewAnswer2" runat="server" CssClass="form-control text_300" TextMode="Password" /><asp:CompareValidator ID="CompareValidator2" ControlToValidate="TxtNewAnswer2" ControlToCompare="TxtNewAnswer"
                ErrorMessage="两次输入的密码提示答案不一致！" CssClass="color_red" runat="server" /></td>
              </tr>
              <tr>
                  <td colspan="2" class="text-center">
                      <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-primary" Text="修改" OnClick="BtnSubmit_Click" />
                      <asp:Button ID="BtnCancle" runat="server" CssClass="btn btn-primary" Text="取消" OnClick="BtnCancle_Click" ValidationGroup="BtnCancel" />
                      </td>
                  </tr>

          </table>     
	  </div>
</div>
</asp:Content>