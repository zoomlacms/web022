<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.UserZone.Pic.UpPic, App_Web_531cuqzm" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>上传相片</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="CategList.aspx">我的相册</a></li>
        <li class="active">上传相片 <strong><%=name %></strong></li>
		<div class="clearfix"></div>
    </ol>
    <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
    <br />
    <table class="table table-bordered" style="margin-top:10px;">
        <tr>
            <td colspan="2" class="text-center">上传相片<%=name %></td>
        </tr>
        <tr>
            <td>
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td rowspan="2">你可以上传JPG，JPEG，<br />
                            GIF，PNG或BMP文件，<br />
                            每个文件大小可以到3M。 </td>
                        <td>
                            <input id="UpPic1" type="file" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="UpPic2" type="file" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3">你需要对你上传的内容负责，<br />
                            请勿上传未经授权、涉及他人<br />
                            隐私、色情、暴力血腥及违反<br />
                            国家法律法规的照片或图片。 </td>
                        <td>
                            <input id="UpPic3" type="file" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="UpPic4" type="file" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>
                            <input id="UpPic5" type="file" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="上传" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="取消" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
