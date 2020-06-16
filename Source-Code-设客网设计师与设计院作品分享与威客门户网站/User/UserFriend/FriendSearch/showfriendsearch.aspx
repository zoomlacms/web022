<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="showfriendsearch, App_Web_x3jrugup" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>添加好友</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserZone/Default.aspx">我的空间</a></li>
        <li class="active">添加好友</li>
    </ol>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table width="80%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td rowspan="2" style="width: 110px;" align="right">&nbsp;
                        </td>
                        <td align="left">&nbsp;
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="80%">
                    <tr>
                        <td>选择好友分组：
                            <asp:DropDownList ID="Friendg" runat="server" DataTextField="GroupName" DataValueField="ID" CssClass="form-control"></asp:DropDownList>
                            <asp:Button ID="joinbtn" CssClass="btn btn-primary" runat="server" Text="加为好友" OnClick="joinbtn_Click" />
                            <asp:Button ID="btnCan" CssClass="btn btn-primary" runat="server" Text="取消" OnClientClick='window.parent.hidePopWin(true);' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
