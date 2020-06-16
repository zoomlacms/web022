<%@ page language="C#" autoeventwireup="true" inherits="User_PrintServer_ShowImage, App_Web_tkhpbss1" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的作品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5"> 
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a title="我的作品" href="<%=Request.RawUrl %>"> 我的作品</a></li>
    </ol>
</div>
<div class="container">
    <div class="s_bright">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td align="center">&nbsp;<table width="300px">
                    <tr>
                        <td>
                            <asp:Label ID="labCount" runat="server"></asp:Label>
                        </td>
                        <td id="tdUp" runat="server" align="center"></td>
                        <td id="tdDown" runat="server" align="center"></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <img src="<%=ImgUrl%>" />
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>