<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_UserShopManage_AddModel, App_Web_e1atrdhs" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>模型设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td class="text-center" colspan="2"><asp:Literal ID="LTitle" runat="server" Text="添加商品模型"></asp:Literal></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="width: 35%"><strong>商品模型名称：</strong></td>
      <td><asp:TextBox ID="TxtModelName" class="form-control" runat="server" Width="156" MaxLength="200" />
        <font color="red">*</font>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">内容模型名称不能为空</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>创建的数据表名：</strong></td>
      <td><asp:Label ID="LblTablePrefix" runat="server" Text="ZL_S_" />
        <asp:TextBox ID="TxtTableName" class="form-control" runat="server" Width="120" MaxLength="50" />
        <font color="red">*</font>
        <asp:RegularExpressionValidator ID="ValeTableName" runat="server" ControlToValidate="TxtTableName" ErrorMessage="只允许输入字母、数字或下划线" ValidationExpression="^[\w_]+$" SetFocusOnError="true" Display="Dynamic" /></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>项目名称：</strong> <br />
        例如：文章、软件、图片、商品 </td>
      <td><asp:TextBox ID="TxtItemName" class="form-control" runat="server" Width="156" MaxLength="20" />
        <font color="red">*</font>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtItemName" ErrorMessage="RequiredFieldValidator">项目名称不能为空</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>项目单位：</strong> <br />
        例如：篇、个、张、件 </td>
      <td><asp:TextBox ID="TxtItemUnit" class="form-control" runat="server" Width="156" MaxLength="20" />
        <font color="red">*</font>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtItemUnit" ErrorMessage="RequiredFieldValidator">项目单位不能为空</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>项目图标：</strong> <br />
        图标存放在~/Images/ModelIcon/目录下 </td>
      <td><asp:TextBox ID="TxtItemIcon" class="form-control" Text="Default.gif" runat="server" Width="156" MaxLength="20" />
        <asp:Image ID="ImgItemIcon" runat="server" ImageUrl="~/Images/ModelIcon/Default.gif" />
        <=
        <asp:DropDownList ID="DrpItemIcon" runat="server" /></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>模型描述：</strong></td>
      <td><asp:TextBox ID="TxtDescription" class="form-control" runat="server" TextMode="MultiLine" Width="365px" Height="43px" /></td>
    </tr>
    <tr>
      <td colspan="2"><asp:HiddenField ID="HdnModelId" runat="server" />
        <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />
        &nbsp;&nbsp;
        <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消" onclick="window.location.href='ManageModel.aspx';" /></td>
    </tr>
  </table>
  <script type="text/javascript">
    function ChangeImgItemIcon(icon)
    {
        document.getElementById("<%= ImgItemIcon.ClientID %>").src = "../../Images/ModelIcon/"+icon;
    }
    function ChangeTxtItemIcon(icon)
    {
        document.getElementById("<%= TxtItemIcon.ClientID %>").value = icon;
    }
    </script>
</asp:Content>
