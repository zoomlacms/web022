<%@ page language="C#" autoeventwireup="true" inherits="Plat_Mail_NetMessageDail, App_Web_qf403px0" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Plat/Common/EmailNav.ascx" TagPrefix="uc1" TagName="EmailNav" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>阅读信息</title>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mainDiv">
    <ol class="breadcrumb">
        <li><a href="/Plat/Blog/">首页</a></li>
        <li><a href="/Plat/Mail/">邮件</a></li>
        <li class="active">阅读信息</li>
    </ol>
    <uc1:EmailNav runat="server" ID="EmailNav" />
    <div style="margin-top: 10px;">
  <table class="table table-bordered table-striped">
	<tr>
	  <td style="width:120px" class="text-right">发件人：</td>
	  <td><asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">收件人：</td>
	  <td><asp:Label ID="LblIncept" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">邮件主题：</td>
	  <td><asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">创建时间：</td>
	  <td><asp:Label ID="LblSendTime" runat="server" Text="Label"></asp:Label></td>
	</tr>
	<tr>
	  <td class="text-right">邮件内容：</td>
	  <td><asp:Literal runat="server" ID="txt_Content"></asp:Literal></td>
	</tr>
	<tr>
	  <td class="text-right">附件：</td>
	  <td id="publicAttachTD">
          <ul>
            <asp:Literal runat="server" ID="Attach_L"></asp:Literal>
          </ul>
	  </td>
	</tr>
	<tr>
	  <td class="text-right">操作：</td>
	  <td><asp:Button ID="BtnReply" runat="server" Text="回复" CssClass="btn btn-primary" OnClick="BtnReply_Click" /></td>
	</tr>
  </table>
</div>
</div>
    <style type="text/css">
        .fileli{cursor:pointer;padding-top:5px;border:1px solid #fff;}
        .fileli:hover{border:1px solid #428bca;}
    </style>
    <script type="text/javascript">
        $().ready(function () {
            $(".fileli").click(function () {
                PreView($(this).data("vpath"), $(this).data("fname"));
            });
        });
        var diag = new ZL_Dialog();
        function PreView(vpath,fname)
        {
            diag.title = fname;
            diag.url = "/PreView.aspx?vpath=" + vpath;
            diag.ShowModal();
        }
    </script>
</asp:Content>

