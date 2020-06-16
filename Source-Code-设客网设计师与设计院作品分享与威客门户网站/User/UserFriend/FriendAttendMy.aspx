<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserFriend_FriendAttendMy, App_Web_k2x0q1ci" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../UserZone/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlMessage.ascx" TagName="WebUserControlMessage" TagPrefix="uc1" %>
<%@ Register Src="../UserFriend/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>关注我的人</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="User/UserZone/Default.aspx">我的好友</a></li>
        <li class="active">关注我的人</li> 
    </ol>
</div>
<div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop2" runat="server" />
    <uc3:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <uc1:WebUserControlMessage ID="WebUserControlMessage1" runat="server" />
</div>
<div class="container btn_green">
    <div class="us_topinfo" style="margin-top: 10px;">
        <asp:DataList ID="DataList1" CssClass="table table-bordered" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%" DataKeyField="UserID">
            <ItemTemplate>
                <table class="table table-bordered table-striped">
                    <tr>
                        <td align="center">
                            <font color="#000066"><strong>
									<%#GetName(Eval("UserID").ToString()) %>
								</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Image ID="Image1" runat="server" Height="68px" Width="72px" ImageUrl='<%#GetPic(Eval("UserID").ToString()) %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">[<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">加为好友</asp:LinkButton>]
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <span class="center-block text-center">共<asp:Label ID="Allnum" runat="server"
            Text=""></asp:Label>&nbsp;
			<asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                Text="" />页
			<asp:Label ID="pagess" runat="server" Text="" />个/页 转到第<asp:DropDownList ID="DropDownList1"
                runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            页
        </span>
    </div>
</div>
</asp:Content>
