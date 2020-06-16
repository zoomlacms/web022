<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="Friendsearch_quick, App_Web_riwa1axa" enableeventvalidation="true" enableviewstatemac="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../../UserZone/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="ControlPageLink.ascx" TagName="ControlPageLink" TagPrefix="uc3" %>
<%@ Register Src="~/User/UserFriend/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>搜索好友</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserZone/Default.aspx">我的空间</a></li>
        <li class="active">搜索好友</li>
    </ol>
    <uc2:WebUserControlTop ID="WebUserControlTop2" runat="server" />
    <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <table class="table table-bordered" style="margin-top: 10px;">
        <tr>
            <td valign="top" width="100px">
                <uc3:ControlPageLink ID="ControlPageLink1" runat="server"></uc3:ControlPageLink>
            </td>
            <td valign="top">
                <div>
                    <asp:Panel ID="quickPanel" runat="server">
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
                                <td align="center" colspan="3">
                                    <b>查询添加好友</b></td>
                            </tr>
                            <tr>
                                <td align="right" style="vertical-align:middle">会员名： </td>
                                <td align="left">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td align="center" height="50px">
                                    <asp:Button ID="quick2btn" CssClass="btn btn-primary" runat="server" Text="快速搜索" OnClick="quick2btn_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Label ID="Label1" runat="server" ForeColor="#ff0000" Font-Size="13" Text=""></asp:Label>
                    <asp:Panel ID="quickresultPanel" runat="server" Width="100%" Visible="false">
                        <table class="table table-striped table-bordered table-hover" runat="server" id="thisViewTable">
                            <tr>
                                <td>
                                    <asp:DataList ID="DataList1" runat="server" Width="100%">
                                        <ItemTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="18%"></td>
                                                    <td width="82%">
                                                        <a href="#">
                                                            <%#Eval("UserName") %>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" height="143">
                                                        <a href="../User/Usershow.aspx?userid=<%#DataBinder.Eval(Container.DataItem,"UserID") %>">
                                                            <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" ImageUrl='<%#Eval("UserPic") %>' /></a></td>
                                                    <td valign="top">
                                                </tr>
                                                <tr>
                                                    <td height="10" align="center"></td>
                                                    <td align="right">
                                                        <a href="javascript:void();" onclick="javascript: window.open('addFriend.aspx?sID=<%#DataBinder.Eval(Container.DataItem,"UserID") %>', 'newwindow', 'height=500, width=800, top=200, left=150, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');">加为好友</a></td>

                                                </tr>
                                                <tr>
                                                    <td height="1" colspan="2" align="center" bgcolor="#CC6600"></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="pageMessageLB" runat="server" Text=""></asp:Label>
                                    <asp:LinkButton ID="FristPage" runat="server" Text="首页" OnClick="FristPage_Click"></asp:LinkButton>
                                    <asp:LinkButton ID="TopPage" runat="server" OnClick="TopPage_Click" Text=" 上一页"></asp:LinkButton>
                                    <asp:LinkButton ID="NextPage" runat="server" OnClick="NextPage_Click" Text=" 下一页"></asp:LinkButton>
                                    <asp:LinkButton ID="LastPage" runat="server" OnClick="LastPage_Click" Text="尾页"></asp:LinkButton>
                                    <asp:Label ID="pageMessageLB1" runat="server" Text=""></asp:Label>
                                    <asp:DropDownList ID="DropPage" runat="server" AutoPostBack="true" OnTextChanged="DropPage_TextChanged">
                                    </asp:DropDownList>
                                    页
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Command/common.js"></script>
    <script type="text/javascript" src="/Command/subModal.js"></script>
    <script>
        function refpage(ret) {
            if (typeof (ret) != "undefined") {
                window.location.href = "Friendsearch_quick.aspx";
            }
        }
    </script>
</asp:Content>
