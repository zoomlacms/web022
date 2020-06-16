<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="UserReg_Move4, App_Web_roe1s0x4" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlUserInfoTop.ascx" TagName="WebUserControlUserInfoTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>个人信息管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/Userzone/Default.aspx">我的空间</a></li>
        <li class='active'>上传照片</li>
    </ol>
</div> 
<div class="container btn_green"> 
        <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
        <uc1:WebUserControlUserInfoTop ID="WebUserControlUserInfoTop1" runat="server" />
</div> 
<div class="container btn_green"> 
    <div class="us_topinfo" style="overflow: hidden;">
        <table class="table table-bordered">
            <tr>
                <td valign="top">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <td colspan="2">* 照片必须为BMP，JPG，PNG或GIF格式 </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <table>
                                    <tr>
                                        <td align="center"><strong>形象照片：</strong></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="imgHead" ImageUrl="~/Images/" Width="100" Height="105" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="viewid" runat="server">
                                                <object id="paizhao" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                                                    height="225" width="405" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">
                                                    <param name="_cx" value="11642" />
                                                    <param name="_cy" value="9737" />
                                                    <param name="FlashVars" value="" />
                                                    <param name="Movie" value="/Plugins/CutPic/CutPic.swf" />
                                                    <param name="Src" value="/Plugins/CutPic/CutPic.swf" />
                                                    <param name="WMode" value="transparent" />
                                                    <param name="Play" value="-1" />
                                                    <param name="Loop" value="-1" />
                                                    <param name="Quality" value="High" />
                                                    <param name="SAlign" value="" />
                                                    <param name="Menu" value="-1" />
                                                    <param name="Base" value="" />
                                                    <param name="AllowScriptAccess" value="" />
                                                    <param name="Scale" value="ShowAll" />
                                                    <param name="DeviceFont" value="0" />
                                                    <param name="EmbedMovie" value="0" />
                                                    <param name="SWRemote" value="" />
                                                    <param name="MovieData" value="" />
                                                    <param name="SeamlessTabbing" value="1" />
                                                    <param name="Profile" value="0" />
                                                    <param name="ProfileAddress" value="" />
                                                    <param name="ProfilePort" value="0" />
                                                    <script type="text/javascript "> if (navegiator . mimeTypes && navigator . mimeTypes["application/x-shockwave-flash"] { document . write('<embed src="/Plugins/CutPic/CutPic.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"   type="application/x-shockwave-flash" width="405" height="225" name="paizhao"> </embed>')}
                                                    </script>

                                                </object>
                                            </div>
                                            <div id="fileUp" runat="server">
                                                <input id="File1" runat="server" type="file" />
                                                <asp:Button ID="Button1" runat="server" Text="上传" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                            </div>
                                            <asp:Button ID="pzBtn" Text="拍照" CssClass="btn btn-primary" runat="server" OnClick="pzBtn_Click" />
                                            <asp:Button ID="scBtn" Text="上传" CssClass="btn btn-primary" runat="server" OnClick="scBtn_Click" />

                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table>
                                    <tr>
                                        <td align="center"><strong>生活照片 1：</strong></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="imgPic1" ImageUrl="~/Images/nopic.gif" Width="225" Height="160px" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="File2" runat="server" type="file" />
                                            <asp:Button ID="Button2" runat="server" Text="上传" OnClick="Button2_Click" CssClass="btn btn-primary" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center">
                                <table>
                                    <tr>
                                        <td align="center"><strong>生活照片 2：</strong></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="imgPic2" Width="225" ImageUrl="/Images/nopic.gif" Height="160px" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="File3" runat="server" type="file" />
                                            <asp:Button ID="Button3" runat="server" Text="上传" OnClick="Button3_Click" CssClass="btn btn-primary" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table>
                                    <tr>
                                        <td align="center"><strong>生活照片 3：</strong></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="imgPic3" ImageUrl="~/Images/nopic.gif" Width="225" Height="160px" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="File4" runat="server" type="file" />
                                            <asp:Button ID="Button4" runat="server" Text="上传" CssClass="btn btn-primary" OnClick="Button4_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center">
                                <table>
                                    <tr>
                                        <td align="center"><strong>生活照片 4：</strong></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="imgPic4" ImageUrl="~/Images/nopic.gif" Width="225" Height="160px" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="File5" runat="server" type="file" />
                                            <asp:Button ID="Button5" runat="server" Text="上传" CssClass="btn btn-primary" OnClick="Button5_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="errLabel" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="nextButton" CssClass="btn btn-primary" runat="server" Text="提交" OnClick="nextButton_Click1" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
	</div> 
</asp:Content>
