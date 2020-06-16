<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Default.master" inherits="User_UserZone_School_SchoolList, App_Web_1lgvjq1q" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>学校列表</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/UserFriend/Default.aspx">我的好友</a></li>
        <li class="active">班级信息</li>
    </ol>
</div>
<div class="container btn_green"> 
<uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
</div>
<div class="container btn_green u_cnt">
<div class="us_topinfo">
<div>
	<a href="mySchoolList.aspx">我的班级 </a>&gt;&gt; 学校列表<hr />
</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="center">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="right">
						国家：
					</td>
					<td align="left">
						<asp:DropDownList ID="ddlCountry" runat="server" DataTextField="Country" DataValueField="Country"
							AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
						</asp:DropDownList>
					</td>
					<td>
						<asp:Panel ID="Panel1" runat="server">
							<table>
								<tr>
									<td align="right">
										省份：
									</td>
									<td align="left">
										<asp:DropDownList ID="ddlProvince" runat="server" DataTextField="Province" DataValueField="Province">
										</asp:DropDownList>
									</td>
								</tr>
							</table>
						</asp:Panel>
					</td>
					<td align="right">
						学校类型：
					</td>
					<td align="left">
						<asp:DropDownList ID="ddlSchoolType" runat="server">
							<asp:ListItem Value="0" Selected="true">不限</asp:ListItem>
							<asp:ListItem Value="1">小学</asp:ListItem>
							<asp:ListItem Value="2">中学</asp:ListItem>
							<asp:ListItem Value="3">大学</asp:ListItem>
							<asp:ListItem Value="4">其他</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td align="right">
						学校性质：
					</td>
					<td align="left">
						<asp:DropDownList ID="ddlVisage" runat="server">
							<asp:ListItem Value="0" Selected="true">不限</asp:ListItem>
							<asp:ListItem Value="1">公办</asp:ListItem>
							<asp:ListItem Value="2">私立</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan="8">
						<asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="查  询" OnClick="Button1_Click" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<asp:DataList ID="dlClassRoom" Width="100%" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
				<HeaderTemplate>
					<strong>学校列表</strong>
				</HeaderTemplate>
				<ItemTemplate>
					<a href='RoomList.aspx?schoolid=<%# DataBinder.Eval(Container.DataItem, "ID")%>'>
						<%# DataBinder.Eval(Container.DataItem, "SchoolName")%></a>
				</ItemTemplate>
			</asp:DataList>
		</td>
	</tr>
	<tr>
		<td align="center">
			共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>&nbsp;
			<asp:Label ID="Toppage" runat="server" Text=""></asp:Label>
			<asp:Label ID="Nextpage" runat="server" Text=""></asp:Label>
			<asp:Label ID="Downpage" runat="server" Text=""></asp:Label>
			<asp:Label ID="Endpage" runat="server" Text=""></asp:Label>
			页次：<asp:Label ID="Nowpage" runat="server" Text=""></asp:Label>/<asp:Label ID="PageSize"
				runat="server" Text=""></asp:Label>页
			<asp:Label ID="pagess" runat="server" Text=""></asp:Label>个/页 转到第<asp:DropDownList
				ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
			</asp:DropDownList>
			页
		</td>
	</tr>
</table>
</div> 
</div> 
</asp:Content>