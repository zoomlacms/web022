<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Guest_AskComment, App_Web_1km2w3h4" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的评论</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="ask"></div>
    <div class="container margin_t10">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的评论</li>
		<div class="clearfix"></div>
    </ol>
    </div>
<div class="container">
    <div class="us_seta">
        <table class="table table-striped table-bordered table-hover">
            <tr class="title">
                <td>问题</td>
                <td>答案</td>
                <td>评论内容</td>
                <td>评论时间</td>
            </tr>
            <asp:Repeater ID="Rep_comment" runat="server" OnItemDataBound="Rep_comment_ItemDataBound">
                <ItemTemplate>
                    <tr >
                        <td style="padding-left: 10px; line-height: 22px;">
                            <label runat="server" id="lbAsk"></label>
                        </td>
                        <td style="padding-left: 10px;">
                            <label runat="server" id="lbAsw"></label>
                        </td>
                        <td style="padding-left: 10px;"><%#Eval("Content") %></td>
                        <td style="padding-left: 10px;"><%#Eval("AddTime") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="4">
                    <ul>
                        <li style="width: 98.5%; float: left; line-height: 28px; text-align: center;">共
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            条信息
                            <asp:LinkButton runat="server" ID="First" OnClick="First_Click">首页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Prev" OnClick="Prev_Click">上一页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Next" OnClick="Next_Click">下一页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Last" OnClick="Last_Click">尾页</asp:LinkButton>
                            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                                Text="" />页
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged"
                                Width="22px" Height="22">10</asp:TextBox>
                            条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server"
                                AutoPostBack="True" OnSelectedIndexChanged="DropDownListPage_SelectedIndexChanged">
                            </asp:DropDownList>
                            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                                ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
</div> 
</asp:Content>
