<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Guest_BaikeDraft, App_Web_1km2w3h4" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>草稿箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="baike"></div>
<div class="container margin_t10">   
<ol class="breadcrumb">
	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li class="active">词条草稿箱 </li>
	<div class="clearfix"></div>
</ol>
    </div> 
<div class="container">
<div class="us_seta">
<table class="table table-bordered table-striped table-hover">
    <tr class="title">
        <td>词条</td>
        <td>添加时间</td>
    </tr>
    <asp:Repeater ID="Repeater_baike" runat="server">
        <ItemTemplate>
            <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg">
                <td style="width: 70%; line-height: 22px; padding-left: 10px;">
                    <a href='/Guest/Baike/Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>' target="_blank"><%# Eval("Tittle")%></a>
                </td>
                <td style="width: 26%; padding-left: 10px;"><%--<label runat="server" id="lbstatus"></label>--%><%#Convert.ToDateTime(Eval("EditTime")).ToString("yyyy-MM-dd")%></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr>
        <td colspan="2" class="text-center">
            <span>共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条信息
                    <asp:LinkButton runat="server" ID="First" OnClick="First_Click">首页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Prev" OnClick="Prev_Click">上一页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Next" OnClick="Next_Click">下一页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Last" OnClick="Last_Click">尾页</asp:LinkButton>
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged"
                        Width="30px">10</asp:TextBox>
                条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server"
                    AutoPostBack="True" OnSelectedIndexChanged="DropDownListPage_SelectedIndexChanged">
                </asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                    ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span>
        </td>
    </tr>
</table>
</div>
</div>
</asp:Content>