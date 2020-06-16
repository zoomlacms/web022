<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Magazine_AddMagazPic, App_Web_r4h241m2" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的电子杂志</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="AddMagazine.aspx">电子杂志</a></li>
        <li class="active">创建电子杂志</li>
		<div class="clearfix"></div>
    </ol>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">创建电子杂志
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">杂志名称： </td>
                <td class="style2">
                    <asp:TextBox ID="txtCategName" class="form-control" runat="server"></asp:TextBox><span style="color: #FF0000">(必填)</span><br />
                </td>
            </tr>
            <tr>
                <td style="width: 380px;" align="right">杂志类别： </td>
                <td>
                    <asp:RadioButtonList runat="server" ID="magazineclass" RepeatDirection="Horizontal" AutoPostBack="true">
                        <asp:ListItem Value="娱乐" Selected="True">娱乐</asp:ListItem>
                        <asp:ListItem Value="风景">风景</asp:ListItem>
                        <asp:ListItem Value="体育">体育</asp:ListItem>
                        <asp:ListItem Value="新闻">新闻</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="right">杂志介绍：</td>
                <td>
                    <asp:TextBox runat="server" ID="TB_Introduction" class="form-control" TextMode="MultiLine" Height="50px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">背景音乐：</td>
                <td>
                    <asp:TextBox ID="musicurl" runat="server" class="form-control" Text="http://"></asp:TextBox>输入网络上mp3、wma文件地址。</td>
            </tr>
            <tr>
                <td align="right">是否开放游客浏览：</td>
                <td>
                    <asp:RadioButtonList ID="isOpen" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

            <tr>
                <td align="right">设置杂志背景：</td>
                <td style="position: relative">选择背景图片:<asp:DropDownList ID="DrpItemIcon" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DrpItemIcon_SelectedIndexChanged" />
                    <asp:Label ID="bgTip" runat="server" Visible="false">“/ClientBin/mediaBG/”目录有异或此目录暂无背景图</asp:Label>
                    <span style="position: absolute; width: 140px; heigth: 140px">
                        <img runat="server" src="" id="bgImg" alt="背景图片预览" style="width: 140px; heigth: 140px" />
                    </span>循环方向
                    <asp:RadioButtonList ID="isRepeat" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Value="0">不循环</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">循环</asp:ListItem>
                        <asp:ListItem Value="2">x轴循环</asp:ListItem>
                        <asp:ListItem Value="3">y轴循环</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="butEnter" runat="server" Text="保 存" CssClass="btn btn-primary" OnClick="butEnter_Click" />
                    <asp:Button ID="Button1" runat="server" Text="取 消" CssClass="btn btn-primary" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
