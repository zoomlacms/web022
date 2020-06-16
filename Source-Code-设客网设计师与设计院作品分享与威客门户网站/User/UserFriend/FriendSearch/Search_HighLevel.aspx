<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserFriend_FriendSearch_Search_HighLevel, App_Web_riwa1axa" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="../../UserZone/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="ControlPageLink.ascx" TagName="ControlPageLink" TagPrefix="uc3" %>
<%@ Register Src="~/User/UserFriend/WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>搜索好友</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserZone/Default.aspx">我的空间</a></li>
        <li class="active">搜索好友</li>
    </ol>
</div>
<div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop2" runat="server" />
    <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
</div>
<div class="container btn_green">
    <table class="table table-bordered" style="margin-top: 10px;">
        <tr>
            <td valign="top" width="100px">
                <uc3:ControlPageLink ID="ControlPageLink1" runat="server"></uc3:ControlPageLink>
            </td>
            <td valign="top">
                <div>
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td>
                                <asp:Panel ID="quickPanel" runat="server" Width="100%">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr class="gridtitle">
                                            <td colspan="2">搜索你心目中的理想对象
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">我要找：
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="sex1" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="1">男朋友</asp:ListItem>
                                                    <asp:ListItem Value="0">女朋友</asp:ListItem>
                                                    <asp:ListItem Value="-1" Selected="True">普通朋友</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">年 龄：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAge1" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>
                                                ~
                                                    <asp:TextBox ID="txtAge2" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>岁
                                                    <asp:RangeValidator ID="ageRange" runat="server" ControlToValidate="txtAge1" Display="Dynamic" ErrorMessage="年龄必须在18岁到100之间" MaximumValue="100" MinimumValue="18" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                                                <asp:RangeValidator ID="ageRange0" runat="server" ControlToValidate="txtAge2" Display="Dynamic" ErrorMessage="年龄必须在18岁到100之间" MaximumValue="100" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">所在地：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
                                                <span id="contactTip">*请选择 Ta 的工作所在地省份</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">身 高：</td>
                                            <td>
                                                <asp:TextBox ID="Staturetxt1" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>
                                                ~
                                                    <asp:TextBox ID="Staturetxt2" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>厘米
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">体 重：</td>
                                            <td>
                                                <asp:TextBox ID="Avoirtxt1" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>
                                                ~
                                                    <asp:TextBox ID="Avoirtxt2" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>公斤
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">学 历：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlBachelor" Width="177px" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">收 入：
                                            </td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control" ID="ddlMonth" Width="177px" runat="server"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">住 房：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlHome" CssClass="form-control" Width="177px" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">购 车：</td>
                                            <td>
                                                <asp:DropDownList ID="CarDropDownList" CssClass="form-control" Width="177px" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">婚 况：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlMarry" CssClass="form-control" Width="177px" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">照 片：</td>
                                            <td>
                                                <asp:CheckBox ID="ChBPhoto" runat="server" />有照片
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <asp:LinkButton ID="IsNother" runat="server" OnClick="IsNother_Click">显示高级搜索条件</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="HighFactor" runat="server" Visible="false">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td align="right">籍 贯：</td>
                                            <td>
                                                <asp:DropDownList ID="nation1" Width="177px" CssClass="form-control" runat="server" OnSelectedIndexChanged="nation1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                                <asp:DropDownList ID="nation2" Width="177px" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">行 业：</td>
                                            <td>
                                                <asp:DropDownList ID="Hang" CssClass="form-control" Width="177px" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">职 业：
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlWork" Width="177px" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">血 型：
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlBlood" Width="177px" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">星 座：
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList6" Width="177px" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="不限" />
                                                    <asp:ListItem Value="白羊座" />
                                                    <asp:ListItem Value="金牛座" />
                                                    <asp:ListItem Value="双子座" />
                                                    <asp:ListItem Value="巨蟹座" />
                                                    <asp:ListItem Value="狮子座" />
                                                    <asp:ListItem Value="处女座" />
                                                    <asp:ListItem Value="天秤座" />
                                                    <asp:ListItem Value="天蝎座" />
                                                    <asp:ListItem Value="射手座" />
                                                    <asp:ListItem Value="魔羯座" />
                                                    <asp:ListItem Value="水瓶座" />
                                                    <asp:ListItem Value="双鱼座" />
                                                </asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">宗 教：</td>
                                            <td>
                                                <asp:DropDownList ID="xinyang" Width="177px" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">民 族：</td>
                                            <td>
                                                <asp:DropDownList ID="Nationtxt" Width="177px" CssClass="form-control" runat="server"></asp:DropDownList></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">是否要孩子：</td>
                                            <td>
                                                <asp:DropDownList ID="NeedchildDropDownList" Width="177px" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">是否有子女：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlChild" Width="177px" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td align="right">会员昵称：</td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="HoneyName" runat="server"></asp:TextBox>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="Button1" runat="server" Text="搜索" OnClick="Button1_Click" CssClass="btn btn-primary" />
                            </td>
                        </tr>
                        <tr class="gridtitle">
                            <td colspan="2">真爱搜索(对VIP会员开放)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td align="right">性 别：
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="sex2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                                                    <asp:ListItem>女朋友</asp:ListItem>
                                                    <asp:ListItem>男朋友</asp:ListItem>
                                                    <asp:ListItem Selected="true">不分性别</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">所在地：
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="TrueLove1" Width="177px" CssClass="form-control" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="TrueLove1_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="TrueLove2" Width="177px" CssClass="form-control" runat="server" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">真爱群落：</td>
                                            <td>知性群落 灵性群落 探索群落 温暖群落 智慧群落</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr class="gridtitle">
                            <td colspan="2">特色搜索</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel1" runat="server">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td align="right">性 别：
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="sex3" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                                                    <asp:ListItem Value="0">女朋友</asp:ListItem>
                                                    <asp:ListItem Value="1">男朋友</asp:ListItem>
                                                    <asp:ListItem Value="-1" Selected="true">不分性别</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">所在地：
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="feature1" Width="177px" CssClass="form-control" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="feature1_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="feature2" Width="177px" CssClass="form-control" runat="server" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">生肖：
                                            </td>
                                            <td>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=1<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">鼠</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=2<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">牛</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=3<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">虎</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=4<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">兔</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=5<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">龙</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=6<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">蛇</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=7<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">马</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=8<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">羊</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=9<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">猴</a>
                                                <a href="Search_HighLevelResult.aspx?&shengxiao=10<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">鸡</a> <a href="Search_HighLevelResult.aspx?&shengxiao=11<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">狗</a> <a href="Search_HighLevelResult.aspx?&shengxiao=12<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">猪</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">体 形：
                                            </td>
                                            <td>
                                                <a href="Search_HighLevelResult.aspx?&Somato=1<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">清瘦</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=2<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">偏瘦</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=3<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">匀称</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=4<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">有点胖</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=5<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">比较胖</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=6<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">苗条</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=7<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">丰满</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=8<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">强壮</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=9<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">魁梧</a>
                                                <a href="Search_HighLevelResult.aspx?&Somato=10<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">其他</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">血 型：
                                            </td>
                                            <td>
                                                <a href="Search_HighLevelResult.aspx?&Blood=1<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">A型</a>
                                                <a href="Search_HighLevelResult.aspx?&Blood=2<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">B型</a>
                                                <a href="Search_HighLevelResult.aspx?&Blood=3<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">AB型</a>
                                                <a href="Search_HighLevelResult.aspx?&Blood=4<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">O型</a>
                                                <a href="Search_HighLevelResult.aspx?&Blood=5<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">其他</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">年 龄：
                                            </td>
                                            <td>
                                                <a href="Search_HighLevelResult.aspx?&age=1<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">情窦初开</a>
                                                <a href="Search_HighLevelResult.aspx?&age=2<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">花样年华</a>
                                                <a href="Search_HighLevelResult.aspx?&age=3<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">风华正茂</a>
                                                <a href="Search_HighLevelResult.aspx?&age=4<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">人到中年</a>
                                                <a href="Search_HighLevelResult.aspx?&age=5<%=GetFeature(sex3,feature1,feature2)%>" style="color: Green">夕阳正红</a>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function refpage(ret) {
            if (typeof (ret) != "undefined") {
                window.location.href = "Search_HighLevel.aspx#here";
            }
        }
    </script>
    <script type="text/javascript" src="../../Command/common.js"></script>
    <script type="text/javascript" src="../../Command/subModal.js"></script>
</asp:Content>
