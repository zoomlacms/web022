<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.PrintMaskList, App_Web_tln5ra1b" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>输出列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
	<tr>
		<td>
			<asp:DataList ID="dlMask" runat="server" RepeatColumns="6" Width="100%">
			<ItemTemplate>
			<table class="table table-striped table-bordered table-hover">
			<tr>
			<td><%#getimg(DataBinder.Eval (Container.DataItem,"Name").ToString() )%>  </td>
			</tr>
			</table>
			</ItemTemplate>
			</asp:DataList>
		</td>
	</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckImg() {
            window.open('../../Common/ShowFlash.aspx', 'newWin', 'modal=yes,width=570,height=80,resizable=yes,scrollbars=yes');
        }
</script>
</asp:Content>