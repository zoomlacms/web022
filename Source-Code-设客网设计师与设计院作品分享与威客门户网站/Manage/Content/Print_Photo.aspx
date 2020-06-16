<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_Print_Photo, App_Web_tln5ra1b" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>发布管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td align="center">
			<asp:DataList ID="dlPic" runat="server" DataKeyField="P_ID" RepeatColumns="5" Width="100%">
				<ItemTemplate>
					<table cellpadding="0" cellspacing="0" border="0" width="80px">
						<tr>
							<td align="center">
								<table cellpadding="2" cellspacing="0" border="1">
									<tr>
										<td>
											<asp:Image ID="Image1" Width="160PX" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "P_PrintUrl")%>' />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
							   客户：<font color="red"><%#getname(DataBinder.Eval(Container.DataItem, "P_UserID").ToString())%></font> 订购
							</td>
						</tr>
						<tr>
						<td>
						<a href='/manage/Shop/Orderlistinfo.aspx?id=<%#Eval("P_PID")%>'>订单详细</a>
						</td>
						</tr>
						<tr>
						<td>
						[<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" >下载打印图片</asp:LinkButton>]<br />[<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">下载客户图片</asp:LinkButton>]
						</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:DataList>
		</td>
	</tr>
	<tr class="tdbg">
		<td align="center">
			共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>&nbsp;
			<asp:Label ID="Toppage" runat="server" Text=""></asp:Label>
			<asp:Label ID="Nextpage" runat="server" Text=""></asp:Label>
			<asp:Label ID="Downpage" runat="server" Text=""></asp:Label>
			<asp:Label ID="Endpage" runat="server" Text=""></asp:Label>
			页次：<asp:Label ID="Nowpage" runat="server" Text=""></asp:Label>/<asp:Label ID="PageSize"
				runat="server" Text=""></asp:Label>页
			<asp:Label ID="pagess" runat="server" Text=""></asp:Label>个/页 转到第<asp:DropDownList
				ID="DropDownList1" runat="server" AutoPostBack="True">
			</asp:DropDownList>
			页
		</td>
	</tr>
</table>
</asp:Content>