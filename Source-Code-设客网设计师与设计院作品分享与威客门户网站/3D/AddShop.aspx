<%@ page language="C#" autoeventwireup="true" inherits="_3d_AddShop, App_Web_hpzxj4xz" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>店铺管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
    <table class="table table-striped table-bordered table-hover">
          <tr><td style="width:120px;">用户名：</td><td><asp:DropDownList runat="server" ID="user_DP"></asp:DropDownList></td></tr>
          <tr><td>店铺名：</td><td><asp:TextBox runat="server" ID="shopName_T"></asp:TextBox></td></tr>
          <tr><td>店铺图片：</td><td>
              <asp:TextBox runat="server" ID="shopImg_T" style="width:300px"></asp:TextBox> </td></tr>
          <tr><td>位置X轴：</td><td><asp:TextBox runat="server" ID="posX_T" MaxLength="5" style="width:50px"></asp:TextBox></td></tr>
          <tr><td>位置Y轴：</td><td><asp:TextBox runat="server" ID="posY_T" MaxLength="5" style="width:50px"></asp:TextBox></td></tr>
          <tr><td>操作：</td><td>
              <asp:Button runat="server" ID="sure_Btn" Text="确定" OnClick="sure_Btn_Click" class="btn btn-primary"/></td></tr>
    </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>