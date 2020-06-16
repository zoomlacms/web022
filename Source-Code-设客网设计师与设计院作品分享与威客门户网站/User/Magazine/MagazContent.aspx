<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Magazine_MagazContent, App_Web_r4h241m2" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>杂志内容</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="AddMagazine.aspx">电子杂志</a></li>
        <li class="active">杂志内容</li>
    </ol>
    <div>
        <table class=" table table-bordered">
            <tr>
                <td class="text-center"><span>杂志名称： <%=name %> </span></td>
            </tr>
            <tr>
                <td class="text-center">
                    <label id="ViewLab" runat="server" text="Label">浏览</label>
                    <asp:Button ID="BT_Upload" runat="server" Text="上传图片" CssClass="btn btn-primary" OnClick="BT_Upload_Click" />
                    <asp:Button runat="server" ID="delet" Text="删除本杂志" CssClass="btn btn-primary" OnClientClick="return confirm('确定要删除吗？');" OnClick="delet_Click" />
                    <asp:Label runat="server" ID="L_Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList runat="server" ID="DL_ShowMaga" Width="100%" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="DL_ShowMaga_ItemCommand">
                        <ItemTemplate>
                            <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <td class="text-center"><%#Eval("name").ToString().Replace("\\","")%></td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <label onmouseover="showmenu(event,'<%#ShowDivStr(Eval("Path").ToString())%>')">
                                            <image style="width: 100px; height: 100px;" src='<%#GetPic(Eval("Path").ToString())%>'></image>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("name") %>' OnClientClick="return confirm('确实要删除此图片吗？');">删除</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <span>共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>&nbsp;张图片
                        <asp:Label ID="Toppage" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Nextpage" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Downpage" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Endpage" runat="server" Text=""></asp:Label>
                        页次：
                        <asp:Label ID="Nowpage" runat="server" Text=""></asp:Label>
                        /
                        <asp:Label ID="PageSize" runat="server" Text=""></asp:Label>页
                        <asp:Label ID="pagess" runat="server" Text=""></asp:Label>个/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>页
                    </span>
                </td>
            </tr>
        </table>
        <div class="us_topinfo" style="overflow: hidden; width: 98%"></div>
    </div>
</asp:Content>