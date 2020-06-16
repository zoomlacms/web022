<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Product.ProductMove, App_Web_qq1xfqnx" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>内容批量移动</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
	    <tr align="center">
            <td colspan="2" class="spacingtitle">
                批量移动商品到其他节点</td>
        </tr>
        <tr>
            <td class="text-right">                    
                商品ID：</td>
            <td>
                <asp:TextBox ID="TxtContentID" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtContentID"
                    ErrorMessage="商品ID不能为空"></asp:RequiredFieldValidator></td>
         </tr>
         <tr>
            <td style="width: 20%" align="right">                    
                目标节点：</td>
            <td>
                <asp:DropDownList ID="DDLNode" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
            </td>
         </tr>
         <tr>
            <td class="text-center" colspan="2">                    
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="批量处理" OnClick="Button1_Click" />
                <input name="Cancel" type="button" class="btn btn-primary" id="BtnCancel" value="取消" onclick="location.href = 'ProductManage.aspx'" />
            </td>            
         </tr>
	</table>
</asp:Content>