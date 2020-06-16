<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Guest_BaikeContribution, App_Web_1km2w3h4" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的词条贡献</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="baike"></div>
    <div class="container margin_t10">
<ol class="breadcrumb">
	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li class="active">我的词条贡献</li>
	<div class="clearfix"></div>
</ol>
    </div>
<div class="container">
<div class="us_seta">
    <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td>基本情况</td>
        </tr>
        <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg">
            <td>
                <ul>
                    <li style="float: left; text-align: center; margin-left: 20px;">提交版本<br />
                        <%=GetBasic("1") %></li>

                    <li style="float: left; text-align: center; margin-left: 20px;">通过版本<br />
                        <%=GetBasic("2") %></li>

                    <li style="float: left; text-align: center; margin-left: 20px;">通过率<br />
                        <%=GetBasic("3") %></li>
                </ul>
            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td style="width: 70%;">我的词条信息</td>
            <td style="width: 30%;">
                <select id="switch" onchange="switchChange(this)" style="width: 100px;">
                    <option value="0">已通过版本</option>
                    <option value="1">待审核版本</option>
                    <option value="2">未通过版本</option>
                </select></td>
        </tr>
        <asp:Repeater ID="Repeater_baike" runat="server" OnItemDataBound="Repeater_baike_ItemDataBound">
            <ItemTemplate>
                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg">
                    <td style="width: 70%; padding-left: 10px; line-height: 22px;">
                        <a href='/Guest/Baike/Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>' target="_blank"><%# Eval("Tittle")%></a><br />
                        [<%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%>]
                    </td>
                    <td style="width: 30%;">
                        <label runat="server" id="lbstatus"></label>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td colspan="2" class="text-center">
                <span>共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条信息
                    <asp:LinkButton runat="server" ID="First" OnClick="First_Click">首页</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="Prev" OnClick="Prev_Click">上一页</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="Next" OnClick="Next_Click">下一页</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="Last" OnClick="Last_Click">尾页</asp:LinkButton>
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                    Text="" />页
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
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    window.onload = function () {
        var type = location.href.split("type=")[1];
        if (type == 0 || type == 1 || type == 2 || type == 3) {
            document.getElementById("switch").value = type;
        }
    }
    function switchChange(obj) {
        location.href = "?type=" + obj.value;
    }
</script>
</asp:Content>
