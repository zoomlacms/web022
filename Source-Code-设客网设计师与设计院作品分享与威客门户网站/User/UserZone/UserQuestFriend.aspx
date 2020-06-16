<%@ page language="C#" autoeventwireup="true" inherits="User_Guild_UserQuestFriend, App_Web_222g3wpa" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>找朋友</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="zone"></div>
    <div class="container margin_t5">
        <ol class="breadcrumb">
            <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
            <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
            <li class="active">找朋友</li>
        </ol>
    </div>
    <div class="container btn_green">
        <div>
        <table class="table table-hover padding0">
            <tr>
                <td>
                    <a href="/User/UserFriend/Default.aspx">我的好友</a>
                </td>
                <td>
                    <a href="UserQuestFriend.aspx">查找好友</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="content">
        <table style="width: 569px; height: 175px;" class="table table-hover table-bordered padding0">
            <tr>
                <td colspan="2">
                    <%--<img src="#" width="24" height="23" align="absmiddle" />--%>
                    <font color="#336699"><strong class="f14">模糊查找</strong></font>
                </td>
            </tr>
            <tr>
                <td class="text-right">性别：
                </td>
                <td>
                    <select name="sex" id="sex" runat="server" class="form-control text_150">
                        <option value="3">所有</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="text-right">年龄范围：
                </td>
                <td>
                    <select class="form-control text_150" name="age" id="age" runat="server">
                        <option value="0">全部</option>
                        <option value="1">18以下</option>
                        <option value="2">18-25</option>
                        <option value="3">25-33</option>
                        <option value="4">33-45</option>
                        <option value="5">45以上</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="text-right">地区：
                </td>
                <td>
                    <asp:DropDownList ID="province" runat="server" CssClass="form-control text_150" AutoPostBack="true" OnSelectedIndexChanged="province_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:DropDownList ID="city" runat="server" CssClass="form-control text_150">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="text-right">&nbsp;
                </td>
                <td>
                    <span class="btmbian">
                        <asp:Button ID="btnSecher" runat="server" CssClass="btn btn-primary" Text="查找" OnClick="btnSecher_Click" />
                    </span>
                </td>
            </tr>
        </table>

        <br />
        <br />
        <table style="width: 569px; height: 165px;" class="table table-bordered table-hover padding0">
            <tr>
                <td colspan="2">
                    <%--<img src="../images/ico_search1.gif" width="24" height="23" align="absmiddle" />--%>
                    <font color="#336699"><strong>精确查找</strong></font>
                </td>
            </tr>
            <tr>
                <td class="text-right">对方昵称：
                </td>
                <td>
                    <input name="username" type="text" id="username" size="40" maxlength="20" class="form-control text_150" runat="server" />
                    <span class="btmbian">
                        <asp:Button ID="btnFirendUserName" runat="server" Text="查找" CssClass="btn btn-primary" OnClick="btnFirendUserName_Click"></asp:Button>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="text-right">对方会员ID号：
                </td>
                <td>
                    <input name="userid" type="text" class="form-control text_150" id="userid" maxlength="10" runat="server" />
                    <asp:Button ID="Button1" runat="server" Text="查找" CssClass="btn btn-primary" OnClick="Button1_Click"></asp:Button>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" MaximumValue="99999" MinimumValue="1" Type="Integer" ErrorMessage="请输入数字" ControlToValidate="userid">
                    </asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
    </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
