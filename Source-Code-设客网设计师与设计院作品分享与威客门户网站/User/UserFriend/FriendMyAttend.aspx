<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserFriend_FriendMyAttend, App_Web_yzngnbbv" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../UserZone/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlMessage.ascx" TagName="WebUserControlMessage" TagPrefix="uc1" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc3" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我关注的人</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserZone/Default.aspx">我的好友</a></li>
        <li class="active">我关注的人</li> 
    </ol>
</div>
    <div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop2" runat="server" />
    <uc3:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <uc1:WebUserControlMessage ID="WebUserControlMessage1" runat="server" />
</div>
<div class="container btn_green">
    <div class="us_topinfo" style="margin-top: 10px;">
        <table class="table table-bordered table-striped table-hover">
            <tr>
                <td>
                    <ZL:ExGridView ID="gvGroup" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="ID" CellPadding="4" GridLines="Horizontal">
                        <Columns>
                            <asp:TemplateField HeaderText="好友分组">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnGroup" runat="server" Text='<%# Bind("GroupName") %>' OnClick="lbtnGroup_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </ZL:ExGridView>
                </td>
                <td>
                    <asp:HiddenField ID="HiddenUserID" runat="server" />
                    <div style="margin-bottom:10px;">
                        好友搜索：<asp:TextBox ID="FriendName" CssClass="form-control text_md" runat="server"></asp:TextBox>
                        <asp:Button ID="search" runat="server" CssClass="btn btn-primary" Text="搜索" />
                    </div>
                    <asp:DataList ID="DataList1" CssClass="table table-bordered" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%" DataKeyField="ID">
                        <ItemTemplate>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td align="center">
                                        <font color="#000066"><strong>
                                        <%#Eval("UserName").ToString() %></strong></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Image ID="Image1" runat="server" Height="68px" Width="72px" ImageUrl='<%#GetPic(Eval("FriendID").ToString())%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">[<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删 除</asp:LinkButton>]
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="text-center" >
                        共
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                            Text="" />
                        页
                        <asp:Label ID="pagess" runat="server" Text="" />个/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页
                    </div>
                </td>
            </tr>
        </table>
        <ul>
            <li style="width: 120px; float: left; text-align: center;"></li>
            <li style="width: 70%; height: 30px; text-align: right; margin-right: 10px"></li>
            <li style="width: 70%;"></li>
            <li style="height: 30px; text-align: center;"></li>
        </ul>
    </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
