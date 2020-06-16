<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.UserZone.Pic.UpPic, App_Web_r4h241m2" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>上传相片</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="AddMagazine.aspx">电子杂志</a></li>
        <li class="active">上传杂志图片</li>
    </ol>
    <table class="table table-bordered">
        <tr>
            <td colspan="2" class="text-center">
                上传杂志<font color="red"><%=name %></font>的图片
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table class="table table-bordered table-hover table-striped">
                    <tr>
                        <td rowspan="2">你可以上传JPG，JPEG，<br />
                            GIF，PNG或BMP文件，<br />
                            每个文件大小可以到3M。 </td>
                        <td>
                            <input id="UpPic1" type="file" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>
                            <input id="UpPic2" type="file" runat="server" /></td>
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
                            <input id="UpPic4" type="file" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="UpPic5" type="file" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="text-center" colspan="2">
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="上传" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="取消" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
