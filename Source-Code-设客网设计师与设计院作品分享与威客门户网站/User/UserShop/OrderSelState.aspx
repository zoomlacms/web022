<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="manage_Shop_OrderSelState, App_Web_0de2lc5g" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>无效订单处理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">无效订单处理</li>
    </ol>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td width="35%">请选择状态：<asp:HiddenField ID="hforderid" runat='server' />
            </td>
            <td>
                <asp:DropDownList ID="ddstate" CssClass="form-control" runat='server' AutoPostBack="True" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                    <asp:ListItem Value="0">等待确认</asp:ListItem>
                    <asp:ListItem Value="1">订单有效</asp:ListItem>
                    <asp:ListItem Value="2">订单无效</asp:ListItem>
                </asp:DropDownList><span id="tips" style="color: Red" runat="server"></span>
            </td>
        </tr>
        <tr>
            <td style="line-height: 119px">原因：</td>
            <td>
                <asp:TextBox ID="txtRemark" CssClass="form-control" style="max-width:400px;" runat="server" TextMode="MultiLine" Height="119px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>短信发送：</td>
            <td>
                <input id="nock" runat="server" type="checkbox" onclick="onchan()" />手机短信和E_Mail通知</td>
        </tr>
        <tbody id="con">
            <tr>
                <td>通知内容：</td>
                <td>
                    <asp:TextBox ID="txtContent" runat="server" class=" form-control" style="max-width:400px;" TextMode="MultiLine" Height="106px"></asp:TextBox>
                    <font color="red">{$UserName}订货人姓名;{$SiteName}网站名称;{$Remark}为上面的备注信息; {$OrderCode}为订单号;{$DeliveryUser}送货员;{$DeliUserMobile}送货手机</font>
                </td>
            </tr>
        </tbody>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btn" runat="server" Text="保存" OnClick="btn_Click" class="btn btn-primary" /><span id="sptip" runat="server" style="color: Red"></span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function onchan() {
            if (document.getElementById("nock").checked) {
                document.getElementById("con").style.display = "";
            } else {
                document.getElementById("con").style.display = "none";
            }
        }
    </script>
</asp:Content>