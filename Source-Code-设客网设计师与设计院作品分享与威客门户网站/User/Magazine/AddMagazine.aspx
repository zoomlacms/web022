<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Magazine_AddMagazine, App_Web_r4h241m2" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>我的电子杂志</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="zone"></div>
    <div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="AddMagazine.aspx">电子杂志</a></li>
		<div class="clearfix"></div>
    </ol></div>
    <div class="container">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td class="text-center">我的电子杂志
                </td>
            </tr>
            <tr>
                <td style="height: 50px">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 561px">你可以制作属于自己的电子杂志了，你可以从<a href="AddMagazPic.aspx" style="color: Red">创建一个电子杂志</a>开始</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div style="float: left">
            <%=con%>
            <asp:DataList runat="server" ID="DL_MagaPic" RepeatColumns="4" OnItemCommand="DL_MagaPic_ItemCommand">
                <ItemTemplate>
                    <table class="table table-bordered table-striped table-hover">
                        <tr>
                            <td align="center"><a href="MagazContent.aspx?id=<%#Eval("id") %>"><%#Eval("MagName") %>&nbsp;</a></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <a href="MagazContent.aspx?id=<%#Eval("id") %>">
                                    <image style="width: 100px; height: 100px;" src='<%#GetPic(Eval("MagPic").ToString())%>'></image>
                                    &nbsp;&nbsp;&nbsp;&nbsp;</a><br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <a href="AddMagazPic.aspx?id=<%# Eval("id") %>">修改</a>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Scan" CommandArgument='<%# Eval("id") %>'><%#GetScan(Eval("id").ToString()) %></asp:LinkButton>
                                <asp:Label Enabled="false" ID="Prompt" runat="server"><%#GetScans(Eval("id").ToString()) %></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
