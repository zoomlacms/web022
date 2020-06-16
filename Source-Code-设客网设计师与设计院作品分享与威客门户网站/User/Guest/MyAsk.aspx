<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Guest_MyAsk, App_Web_1km2w3h4" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>提问列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="ask"></div>
    <div class="container margin_t10">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">提问列表</li>
		<div class="clearfix"></div>
    </ol>
    </div>
    <div class="container">
    <div class="us_seta">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td style="width: 70%;">我的提问</td>
                <td style="width: 30%;">
                    <select id="switch" onchange="switchChange(this)" class="form-control">
                        <option value="0">全部提问</option>
                        <option value="2">已解决提问</option>
                        <option value="1">待解决提问</option>
                    </select></td>
            </tr>
            <asp:Repeater ID="Repeater_ask" runat="server" OnItemDataBound="Repeater_ask_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td style="width: 50%; padding-left: 10px;">
                            <a href='/Guest/Ask/Interactive.aspx?ID=<%# Eval("ID")%>' target="_blank"><%# Eval("Qcontent")%></a><br />
                            <label runat="server" id="count"></label>
                            个回答 | <%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%>
                        </td>
                        <td style="width: 30%; padding-left: 10px;">
                            <label runat="server" id="lbstatus"></label>
                        </td>
                        <%--<td style="width:30%; padding-left:10px;"><label id="txtView" runat="server"><asp:LinkButton ID="lbUpdate" CommandName="Update" Text="处理" runat="server"></asp:LinkButton></label>  </td>--%>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="2" class="text-center">
                    <span>
                        共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        条信息 <asp:LinkButton runat="server" ID="First" OnClick="First_Click">首页</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="Prev" OnClick="Prev_Click">上一页</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="Next" OnClick="Next_Click">下一页</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="Last" OnClick="Last_Click">尾页</asp:LinkButton>
                        页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged" Width="30px">10</asp:TextBox>
                        条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListPage_SelectedIndexChanged">
                        </asp:DropDownList>页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
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
            if (type == 0 || type == 1 || type == 2) {
                document.getElementById("switch").value = type;
            }
        }
        function switchChange(obj) {
            location.href = "?type=" + obj.value;
        }
    </script>
</asp:Content>
