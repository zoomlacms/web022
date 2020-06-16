<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserZone_School_MySchoolList, App_Web_xjbv5oad" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的班级</title> 
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
<div class="container u_cnt">
<div class="us_topinfo">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" style="width: 85%">
			<table width="95%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
                        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="没有相关信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" >	 		 
							<Columns>
								<asp:TemplateField HeaderText="学校" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# GetSchool(DataBinder.Eval(Container.DataItem, "SchoolID").ToString()) %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="班级" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<a href='ShowRoom.aspx?Roomid=<%# DataBinder.Eval(Container.DataItem, "RoomID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "RoomName")%>
										</a>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="身份" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
									ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:Label ID="Label2" runat="server" Text='<%# GetStatusType(DataBinder.Eval(Container.DataItem, "RoomID").ToString()) %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="状态" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
									ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:Label ID="Label3" runat="server" Text='<%# GetType(DataBinder.Eval(Container.DataItem, "CreateUser").ToString()) %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="进入" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
									ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<a href='ShowRoom.aspx?Roomid=<%# DataBinder.Eval(Container.DataItem, "RoomID")%>'>进入班级</a>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						<PagerStyle HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center"  />
        </ZL:ExGridView>
					</td>
				</tr>				 
			</table>
		</td>
		<td valign="top" style="width: 15%">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left">
						<a href="SchoolList.aspx">加入班级</a>
					</td>
				</tr>
				<tr>
					<td align="left">
						<a href="SchoolFellow.aspx">查找我的同学</a>
					</td>
				</tr>
				<tr>
					<td align="left">
						<a href="AddRessList.aspx">我的通讯录</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
</div>
</asp:Content>