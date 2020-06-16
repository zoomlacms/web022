<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_StockAdd, App_Web_p5upeauk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li><a href="StockList.aspx">库存管理</a></li>
        <li class="active"><%= str %></li> 
    </ol>
</div>
<div class="container btn_green">
    <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
</div>
    <div class="container margin_t10 btn_green">
        <table class="table table-striped table-bordered table-hover">
            <tr align="center">
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="添加入库出库单"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="34%" height="22"><strong>选择单据类型：</strong></td>
                <td width="66%" valign="middle">
                    <asp:RadioButtonList ID="stocktyle" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="RK" Selected="true" onclick="ttname(this.value);">入库</asp:ListItem>
                        <asp:ListItem Value="CK" onclick="ttname(this.value);">出库</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField ID="stockid" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="34%" height="22"><strong>单据编号：</strong></td>
                <td height="22" valign="middle">&nbsp;<asp:Label ID="danjuhao" runat="server" Text=""></asp:Label>
                    <asp:HiddenField ID="danjuhaos" runat="server" />
                    <asp:HiddenField ID="danjuhaobak" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="34%" height="22"><strong>商品选择：</strong></td>
                <td height="22" valign="middle">
                    <asp:DropDownList CssClass="form-control" ID="productid" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="34%" height="22"><strong>商品数量：</strong></td>
                <td height="22" valign="middle">
                    <asp:TextBox ID="Pronum" CssClass="form-control" runat="server">0</asp:TextBox>
                    *<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Pronum"
                        ErrorMessage="商品数量必须是整数!" Type="Integer"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td width="34%"><strong>录入时间：</strong></td>
                <td valign="middle">
                    <asp:TextBox ID="calendars" CssClass="form-control" runat="server" onclick="WdatePicker()"></asp:TextBox>
                    <asp:Image ID="Image1" runat="server" ImageUrl="../../App_Themes/AdminDefaultTheme/images/Calendar.gif" ToolTip="鼠标点击左边输入框出现时间选择框" /></td>
            </tr>
            <tr>
                <td width="34%"><strong>录 入 者：</strong></td>
                <td valign="middle">
                    <asp:TextBox ID="adduser" runat="server" CssClass="form-control"></asp:TextBox>
                    *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adduser"
                        ErrorMessage="录入者不能为空!"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td width="34%" height="22"><strong>备&nbsp; &nbsp; 注：</strong></td>
                <td valign="middle">
                    <asp:TextBox ID="stockcontent" CssClass="form-control" TextMode="MultiLine" runat="server" Height="91px" style="max-width:480px;"></asp:TextBox></td>
            </tr>

            <tr class="tdbg">
                <td colspan="5" align="center">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="添加" OnClick="Button1_Click" />&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script>
        function ttname(value) {
            document.getElementById("danjuhaos").value = value + document.getElementById("danjuhaobak").value;
            document.getElementById("danjuhao").innerHTML = document.getElementById("danjuhaos").value
        }
    </script>
</asp:Content>