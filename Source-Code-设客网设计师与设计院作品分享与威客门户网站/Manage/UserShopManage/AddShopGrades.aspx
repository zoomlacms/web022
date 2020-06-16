<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_AddShopGrades, App_Web_e1atrdhs" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加商铺等级</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td width="100%" align="center" class="title" colspan="2">
                <asp:Literal ID="LTitle" runat="server" Text="添加等级"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="20%" align="left">等级名称</td>
            <td width="80%" align="left">
                <asp:TextBox ID="GradeName" runat="server" class="form-control" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="GradeName"
                    ErrorMessage="等级名称不能为空!"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td width="20%" align="left">等级别名</td>
            <td width="20%" align="left">
                <asp:TextBox ID="TxtOtherName" runat="server" class="form-control" Width="145px"></asp:TextBox>
                等级别名不为空时将替换等级名称</td>
        </tr>
        <tr>
            <td width="20%" align="left">等级类型</td>
            <td width="80%" align="left">
                <asp:RadioButtonList ID="GradeType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">购物等级</asp:ListItem>
                    <asp:ListItem Value="1">卖家等级</asp:ListItem>
                    <asp:ListItem Value="2">商户等级</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td width="20%" align="left" style="height: 8px">等级图片</td>
            <td width="80%" align="left" style="height: 8px">
                <asp:TextBox ID="TxtGradeimg" runat="server" class="form-control" MaxLength="20" Width="123px"></asp:TextBox>
                <asp:Image ID="ImgGradeimg" runat="server" ImageUrl="/Images/levelIcon/b_1.gif" />
                &lt;=<asp:DropDownList ID="DrpGradeimg" runat="server"></asp:DropDownList>
                图标存放在~/Images/levelIcon/目录下
            </td>
        </tr>
        <tr>
            <td width="20%" align="left">图片数量</td>
            <td width="80%" align="left">
                <asp:TextBox ID="Imgnum" runat="server" class="form-control" Width="145px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td width="20%" align="left">积分</td>
            <td width="80%" align="left">
                <asp:TextBox ID="TxtCommentNum" class="form-control" runat="server" Width="145px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td width="20%" align="left">等级状态</td>
            <td width="80%" align="left">
                <asp:RadioButtonList ID="IsTrue" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
                    <asp:ListItem Value="0">停用</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td width="100%" align="center" colspan="2">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <input id="Cancel" class="btn btn-primary" name="Cancel" onclick="window.location.href = 'ShopGrade.aspx';" type="button" value="取消" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function ChangeImgItemIcon(icon) {
            document.getElementById("<%= ImgGradeimg.ClientID %>").src = "/Images/levelIcon/" + icon;
        }
        function ChangeTxtItemIcon(icon) {
            document.getElementById("<%= TxtGradeimg.ClientID %>").value = icon;
        }
    </script>
</asp:Content>
